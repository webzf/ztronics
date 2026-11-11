#!/usr/bin/env ruby
# Validate the structure, language metadata, URLs and shared Italian UI
# for translated product pages. Uses Ruby's standard library only.

require "yaml"
require "date"

ROOT = File.expand_path("..", __dir__)
PRODUCTS_DIR = File.join(ROOT, "_products")
errors = []

def read_page(path)
  text = File.read(path, encoding: "UTF-8")
  unless text.start_with?("---\n")
    raise "Missing YAML front matter in #{path}"
  end

  parts = text.split("---", 3)
  raise "Malformed front matter in #{path}" unless parts.length == 3

  frontmatter = YAML.safe_load(parts[1], permitted_classes: [Date, Time], aliases: true) || {}
  [frontmatter, parts[2]]
end

def structure(text)
  {
    headings: text.scan(/^\#{1,6}\s+/).length,
    table_rows: text.scan(/^\|/).length,
    code_fences: text.scan(/^\x60\x60\x60/).length,
    images: text.scan(/<img\b/i).length,
    includes: text.scan(/\{%\s*include\s+/).length
  }
end

def external_urls(text)
  text.scan(%r{https?://[^\s)"'<>]+}).map { |url| url.sub(/[.,;]+\z/, "") }.uniq.sort
end

def product_files
  Dir.glob(File.join(PRODUCTS_DIR, "*.md"))
end

def parse_product(path)
  read_page(path).first
end

config = YAML.safe_load_file(File.join(ROOT, "_config.yml"), permitted_classes: [Date, Time], aliases: true) || {}
languages = Array(config["languages"])
errors << "_config.yml: languages must include it" unless languages.include?("it")

language_urls_path = File.join(ROOT, "_data", "language_urls.yml")
language_urls = YAML.safe_load_file(language_urls_path, permitted_classes: [Date, Time], aliases: true) || {}

italian_files = Dir.glob(File.join(PRODUCTS_DIR, "*.it.md"))
errors << "No Italian product pages found" if italian_files.empty?

italian_files.each do |it_path|
  slug = File.basename(it_path).sub(/\.it\.md\z/, "")
  source_path = File.join(PRODUCTS_DIR, "#{slug}.md")

  unless File.file?(source_path)
    errors << "#{it_path}: missing English source #{source_path}"
    next
  end

  begin
    it_data, it_body = read_page(it_path)
    en_data, en_body = read_page(source_path)
  rescue StandardError => e
    errors << "#{slug}: #{e.message}"
    next
  end

  product_id = it_data["product_id"].to_s
  errors << "#{it_path}: lang must be it" unless it_data["lang"] == "it"
  errors << "#{it_path}: locale must be it-IT" unless it_data["locale"] == "it-IT"
  errors << "#{it_path}: permalink must begin with /it/" unless it_data["permalink"].to_s.start_with?("/it/")
  errors << "#{it_path}: product_id does not match source" unless product_id == en_data["product_id"].to_s
  errors << "#{it_path}: available_languages must include it" unless Array(it_data["available_languages"]).include?("it")
  errors << "#{source_path}: available_languages must include it" unless Array(en_data["available_languages"]).include?("it")

  translation_key = it_data["translation_id"] || product_id
  mapped_url = language_urls.dig(translation_key, "it")
  errors << "#{slug}: _data/language_urls.yml is missing the Italian URL" unless mapped_url == it_data["permalink"]

  siblings = product_files.select do |path|
    parse_product(path)["product_id"].to_s == product_id
  end
  siblings.each do |sibling|
    data = parse_product(sibling)
    unless Array(data["available_languages"]).include?("it")
      errors << "#{sibling}: available_languages must include it for hreflang"
    end
  end

  en_structure = structure(en_body)
  it_structure = structure(it_body)
  unless en_structure == it_structure
    errors << "#{slug}: content structure differs (EN #{en_structure.inspect}; IT #{it_structure.inspect})"
  end

  unless external_urls(en_body) == external_urls(it_body)
    missing = external_urls(en_body) - external_urls(it_body)
    extra = external_urls(it_body) - external_urls(en_body)
    errors << "#{slug}: external URLs differ (missing: #{missing.join(', ')}; extra: #{extra.join(', ')})"
  end

  clean_body = it_body.gsub(/^\x60\x60\x60.*?^\x60\x60\x60\s*/m, " ")
                      .gsub(/\{%.*?%\}/m, " ")
                      .gsub(/<[^>]+>/, " ")
  english_ui = [
    /\bWhere to buy\b/i,
    /\bPurchase Considerations\b/i,
    /\bSpecifications at a glance\b/i,
    /\bIs .{1,70} Worth Buying\b/i,
    /\bCompare other (?:ESP32 )?(?:boards|touchscreen boards)\b/i,
    /\bCheck price on (?:AliExpress|Amazon)\b/i,
    /\bView Offer on AliExpress\b/i,
    /\bBuy on AliExpress\b/i
  ]
  english_ui.each do |pattern|
    errors << "#{it_path}: possible untranslated UI/content text '#{pattern.source}'" if clean_body.match?(pattern)
  end

  puts "Italian translation: #{slug} PASS"
end

required_ui = {
  "_includes/language-switcher.html" => ["Scegli la lingua", "Italiano"],
  "_includes/masthead.html" => ["Navigazione principale", "Apri la ricerca", "Apri il menu"],
  "_includes/breadcrumbs.html" => ["Percorso di navigazione", "Prodotti"],
  "_includes/sidebar-custom.html" => ["Stai scegliendo un display ESP32?", "Apri il selettore"],
  "_includes/guition-cross-sell.html" => ["Scopri il display Guition da 5 pollici"],
  "_includes/product-card.html" => ["Visualizza prodotto"],
  "_includes/footer.html" => ["Seguici", "Feed RSS", "Realizzato con"],
  "_includes/product-header.html" => ["Verifica il prezzo su AliExpress", "Acquista su Seeed Studio"],
  "_includes/guition-variant-buttons.html" => ["Con relè", "Senza relè", "Acquista su AliExpress"],
  "_includes/product-badges.html" => ["Consigliato"],
  "_includes/product-links.html" => ["Risorse"],
  "_includes/product-specifications.html" => ["Specifiche"],
  "_includes/product-related.html" => ["Potrebbe interessarti anche"],
  "_includes/product-tags.html" => ["Argomenti correlati"],
  "_includes/affiliate-disclosure.html" => ["Informativa sulla trasparenza"],
  "_includes/social-share.html" => ["Condividi su", "Copia link"],
  "_layouts/product.html" => ["Verdetto", "Punti di forza", "Aspetti da considerare"],
  "_layouts/single.html" => ["Indice dei contenuti"]
}

required_ui.each do |relative_path, phrases|
  path = File.join(ROOT, relative_path)
  unless File.file?(path)
    errors << "Missing shared UI component #{relative_path}"
    next
  end
  text = File.read(path, encoding: "UTF-8")
  phrases.each do |phrase|
    errors << "#{relative_path}: missing Italian UI phrase '#{phrase}'" unless text.include?(phrase)
  end
end

%w[_data/it/navigation.yml _data/it/footer.yml].each do |relative_path|
  errors << "Missing #{relative_path}" unless File.file?(File.join(ROOT, relative_path))
end

if errors.any?
  warn "Italian translation validation: FAIL"
  errors.each { |error| warn " - #{error}" }
  exit 1
end

puts "Italian translation validation: PASS (#{italian_files.length} product pages)"
