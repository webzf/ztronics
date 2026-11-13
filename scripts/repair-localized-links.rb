#!/usr/bin/env ruby
# Repair internal links to routes that were not actually emitted by Jekyll/Polyglot.
# Existing translations are preserved; missing translations fall back to the English
# route when it exists. Links with no valid destination are made non-clickable.
require "find"
require "nokogiri"
require "uri"

site_root = File.expand_path(ARGV[0] || "_site")
check_only = ARGV.include?("--check")
abort "Usage: ruby scripts/repair-localized-links.rb SITE_ROOT [--check]" unless File.directory?(site_root)

SITE_HOSTS = %w[embeddednerd.com www.embeddednerd.com].freeze
LANGUAGES = %w[de es fr it nl pl pt].freeze
localized_prefix = %r{\A/(#{LANGUAGES.join("|")})(?=/|\z)}

def local_uri(href)
  uri = URI.parse(href)
  return nil if uri.scheme && !%w[http https].include?(uri.scheme)
  return nil if uri.host && !SITE_HOSTS.include?(uri.host.downcase)

  uri
rescue URI::InvalidURIError
  nil
end

def output_exists?(site_root, public_path)
  path = URI::DEFAULT_PARSER.unescape(public_path.to_s)
  path = "/" if path.empty?
  path = "/#{path}" unless path.start_with?("/")
  relative = path.sub(%r{\A/}, "")
  candidates = [File.join(site_root, relative)]
  candidates << File.join(site_root, relative, "index.html") unless relative.end_with?(".html")
  candidates.any? { |candidate| File.file?(candidate) }
end

def rewrite_uri(uri, path)
  updated = uri.dup
  updated.path = path
  updated.to_s
end

changed_files = 0
rewritten_links = 0
removed_links = 0
removed_hreflang = 0
errors = []

Find.find(site_root) do |file|
  next unless file.end_with?(".html") && File.file?(file)

  original = File.read(file, encoding: "UTF-8")
  document = Nokogiri::HTML(original)
  changed = false

  document.css("a[href]").each do |anchor|
    href = anchor["href"].to_s.strip
    uri = local_uri(href)
    next unless uri

    public_path = uri.path.to_s
    next unless public_path.start_with?("/") || uri.host
    public_path = "/" if public_path.empty?

    if public_path.match?(localized_prefix)
      next if output_exists?(site_root, public_path)

      fallback_path = public_path.sub(localized_prefix, "")
      fallback_path = "/" if fallback_path.empty?

      if check_only
        errors << "#{file}: link still points to missing localized route #{public_path}"
      elsif output_exists?(site_root, fallback_path)
        anchor["href"] = rewrite_uri(uri, fallback_path)
        rewritten_links += 1
        changed = true
        puts "Fallback: #{public_path} -> #{fallback_path}"
      else
        anchor.remove_attribute("href")
        removed_links += 1
        changed = true
        puts "Removed unavailable localized link: #{public_path}"
      end
    elsif !output_exists?(site_root, public_path)
      if check_only
        errors << "#{file}: internal link points to missing route #{public_path}"
      else
        anchor.remove_attribute("href")
        removed_links += 1
        changed = true
        puts "Removed broken internal link: #{public_path}"
      end
    end
  end

  document.css('link[hreflang][href]').each do |alternate|
    uri = local_uri(alternate["href"].to_s.strip)
    next unless uri && uri.path.to_s.match?(localized_prefix)
    next if output_exists?(site_root, uri.path)

    errors << "#{file}: hreflang=#{alternate['hreflang']} points to missing #{uri.path}" if check_only
    unless check_only
      alternate.remove
      removed_hreflang += 1
      changed = true
      puts "Removed unavailable hreflang: #{uri.path}"
    end
  end

  if changed && !check_only
    File.write(file, document.to_html, mode: "w", encoding: "UTF-8")
    changed_files += 1
  end
end

if check_only
  if errors.any?
    warn "Internal link validation: FAIL"
    errors.each { |error| warn " - #{error}" }
    exit 1
  end
  puts "Internal link validation: PASS"
else
  puts "Internal link repair: #{rewritten_links} fallback(s), #{removed_links} unavailable link(s) disabled, #{removed_hreflang} missing hreflang link(s) removed across #{changed_files} file(s)."
end
