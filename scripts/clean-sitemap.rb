#!/usr/bin/env ruby
# Clean the Jekyll sitemap and add the translated URLs advertised by each page's hreflang tags.
require "rexml/document"
require "rexml/xpath"
require "uri"

sitemap_path = File.join(Dir.pwd, "_site", "sitemap.xml")
abort "Sitemap not found: #{sitemap_path}" unless File.file?(sitemap_path)

doc = REXML::Document.new(File.read(sitemap_path))
root = doc.root
root.add_namespace("xhtml", "http://www.w3.org/1999/xhtml")

removed = []
REXML::XPath.each(doc, "//*[local-name()='url']") do |url_node|
  loc = REXML::XPath.first(url_node, "./*[local-name()='loc']")
  next unless loc

  uri_path = URI.parse(loc.text).path
  excluded =
    uri_path.start_with?("/go/") ||
    uri_path == "/google2ce7494526b53621.html" ||
    uri_path == "/page2/" ||
    uri_path.match?(%r{^/page\d+/?$}) ||
    ["/tags/", "/categories/"].include?(uri_path)

  if excluded
    removed << uri_path
    url_node.parent.delete_element(url_node)
  end
end

# Product lastmod values are build-time timestamps, not reliable content-edit dates.
REXML::XPath.each(doc, "//*[local-name()='url']") do |url_node|
  loc = REXML::XPath.first(url_node, "./*[local-name()='loc']")
  next unless loc && URI.parse(loc.text).path.start_with?("/products/")

  REXML::XPath.each(url_node, "./*[local-name()='lastmod']") do |lastmod|
    url_node.delete_element(lastmod)
  end
end

# Read hreflang alternates from the final generated HTML. This is deliberately done
# after Jekyll and jekyll-sitemap have finished, so the plugin cannot overwrite them.
translations = {}
Dir.glob(File.join(Dir.pwd, "_site", "**", "*.html")).each do |html_path|
  next if html_path.include?("/preview/")

  html = File.read(html_path)
  alternates = {}

  html.scan(/<link\b[^>]*\brel=["']alternate["'][^>]*>/i).each do |tag|
    href = tag[/\bhref=["']([^"']+)["']/i, 1]
    lang = tag[/\bhreflang=["']([^"']+)["']/i, 1]
    next unless href && lang

    alternates[lang.downcase] = href
  end

  next unless alternates["en"] && alternates.keys.any? { |lang| %w[de es fr].include?(lang) }

  # A translation group is identified by its complete language-to-URL mapping.
  key = alternates.sort.to_h
  translations[key.values_at("en", "de", "es", "fr").compact.join("|")] = key
end

abort "No translated hreflang groups found in generated HTML" if translations.empty?

translated_urls = translations.values.flat_map do |alternates|
  alternates.reject { |lang, _| lang == "x-default" }.values
end.uniq

# Remove existing entries for translated URLs before rebuilding each group with
# reciprocal hreflang links. Non-translated sitemap entries remain untouched.
REXML::XPath.each(doc, "//*[local-name()='url']") do |url_node|
  loc = REXML::XPath.first(url_node, "./*[local-name()='loc']")
  next unless loc && translated_urls.include?(loc.text)

  url_node.parent.delete_element(url_node)
end

translations.each_value do |alternates|
  alternates.each do |lang, href|
    next if lang == "x-default"

    url_node = root.add_element("url")
    url_node.add_element("loc").text = href

    alternates.each do |alternate_lang, alternate_href|
      next if alternate_lang == "x-default"

      link = REXML::Element.new("xhtml:link")
      link.add_attributes(
        "rel" => "alternate",
        "hreflang" => alternate_lang,
        "href" => alternate_href
      )
      url_node.add_element(link)
    end

    default_href = alternates["x-default"] || alternates["en"]
    if default_href
      link = REXML::Element.new("xhtml:link")
      link.add_attributes(
        "rel" => "alternate",
        "hreflang" => "x-default",
        "href" => default_href
      )
      url_node.add_element(link)
    end
  end
end

# Guard important recently published articles against accidental sitemap omission.
expected_paths = [
  "/reznex-review/",
  "/esp32-p4-weather-station/"
]
present_paths = REXML::XPath.match(doc, "//*[local-name()='url']/*[local-name()='loc']").map do |loc|
  URI.parse(loc.text).path
end
missing_paths = expected_paths - present_paths
abort "Sitemap validation failed; expected URLs missing: #{missing_paths.join(', ')}" unless missing_paths.empty?

%w[de es fr].each do |lang|
  abort "Sitemap validation failed: no #{lang} URLs were generated" unless translations.values.any? { |group| group.key?(lang) }
end

File.write(sitemap_path, doc.to_s)
puts "Sitemap cleanup: removed #{removed.length} URLs"
puts "Multilingual sitemap: generated #{translated_urls.length} localized URLs across #{translations.length} translation groups"
puts removed
