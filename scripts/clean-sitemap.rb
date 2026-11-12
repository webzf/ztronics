#!/usr/bin/env ruby
# Post-process the generated Jekyll sitemap to keep only useful canonical URLs.
require "rexml/document"
require "rexml/xpath"
require "uri"
require "set"

path = File.join(Dir.pwd, "_site", "sitemap.xml")
abort "Sitemap not found: #{path}" unless File.file?(path)

doc = REXML::Document.new(File.read(path))
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

# Product lastmod values are currently build-time timestamps rather than reliable
# content-edit timestamps. Remove them instead of publishing misleading dates.
REXML::XPath.each(doc, "//*[local-name()='url']") do |url_node|
  loc = REXML::XPath.first(url_node, "./*[local-name()='loc']")
  next unless loc && URI.parse(loc.text).path.start_with?("/products/")
  REXML::XPath.each(url_node, "./*[local-name()='lastmod']") do |lastmod|
    url_node.delete_element(lastmod)
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


# Add published translated pages that the sitemap plugin may not discover.
# Only include files whose canonical tag points to their own public URL and
# which are not explicitly marked noindex.
languages = %w[de es fr it nl pl pt]
site_root = File.join(Dir.pwd, "_site")
base_url = "https://embeddednerd.com"
existing_urls = REXML::XPath.match(doc, "//*[local-name()='url']/*[local-name()='loc']").map { |loc| loc.text.to_s }.to_set

localized_added = []

languages.each do |language|
  language_root = File.join(site_root, language)
  next unless File.directory?(language_root)

  Dir.glob(File.join(language_root, "**", "*.html")).sort.each do |html_path|
    html = File.read(html_path, encoding: "UTF-8")
    next if html.scan(/<meta\b[^>]*>/i).any? { |tag| tag.match?(/name=["']robots["']/i) && tag.match?(/content=["'][^"']*noindex/i) }

    relative = html_path.delete_prefix(site_root + File::SEPARATOR)
    route = relative.sub(/index\.html\z/, "")
    route = "/#{route}" unless route.start_with?("/")
    route = route.sub(/\.html\z/, "")
    route += "/" unless route.end_with?("/") || route.match?(/\.[a-z0-9]+\z/i)

    # Keep the same exclusions applied to the generated sitemap.
    next if route.start_with?("/go/") ||
            route == "/google2ce7494526b53621.html" ||
            route.match?(%r{^/(?:(?:de|es|fr|it|nl|pl|pt)/)?page\d+/?$}) ||
            ["/tags/", "/categories/"].include?(route) || route.match?(%r{^/(?:(?:de|es|fr|it|nl|pl|pt)/)?(?:tags|categories)/})

    canonical_tag = html.scan(/<link\b[^>]*>/i).find do |tag|
      tag.match?(/\brel=["'][^"']*canonical[^"']*["']/i)
    end
    next unless canonical_tag

    href = canonical_tag[/\bhref=["']([^"']+)["']/i, 1]
    next unless href

    canonical_uri = URI.parse(href) rescue nil
    next unless canonical_uri
    next unless canonical_uri.host == "embeddednerd.com"
    next unless canonical_uri.path == route
    next unless canonical_uri.query.nil? && canonical_uri.fragment.nil?

    url = "#{base_url}#{route}"
    next if existing_urls.include?(url)

    url_node = REXML::Element.new("url")
    loc_node = REXML::Element.new("loc")
    loc_node.text = url
    url_node.add_element(loc_node)
    doc.root.add_element(url_node)

    existing_urls << url
    localized_added << route
  end
end

# Add hreflang alternates to sitemap entries using the same published HTML
# metadata that powers the page-level language switcher and SEO tags.
# An alternate is emitted only when its URL is also present in the sitemap.
alternates_by_url = {}

Dir.glob(File.join(site_root, "**", "*.html")).sort.each do |html_path|
  html = File.read(html_path, encoding: "UTF-8")
  link_tags = html.scan(/<link\\b[^>]*>/i)

  canonical_tag = link_tags.find do |tag|
    tag.match?(/\\brel=["'][^"']*canonical[^"']*["']/i)
  end
  next unless canonical_tag

  canonical_href = canonical_tag[/\\bhref=["']([^"']+)["']/i, 1]
  next unless canonical_href

  canonical_uri = URI.parse(canonical_href) rescue nil
  next unless canonical_uri
  next unless canonical_uri.scheme == "https" && canonical_uri.host == "embeddednerd.com"
  next unless canonical_uri.query.nil? && canonical_uri.fragment.nil?

  alternates = link_tags.filter_map do |tag|
    rel = tag[/\\brel=["']([^"']+)["']/i, 1]
    next unless rel && rel.split(/\\s+/).include?("alternate")

    hreflang = tag[/\\bhreflang=["']([^"']+)["']/i, 1]
    href = tag[/\\bhref=["']([^"']+)["']/i, 1]
    next unless hreflang && href

    alternate_uri = URI.parse(href) rescue nil
    next unless alternate_uri
    next unless alternate_uri.scheme == "https" && alternate_uri.host == "embeddednerd.com"
    next unless alternate_uri.query.nil? && alternate_uri.fragment.nil?
    next unless existing_urls.include?(alternate_uri.to_s)

    { "hreflang" => hreflang, "href" => alternate_uri.to_s }
  end

  alternates_by_url[canonical_uri.to_s] = alternates.uniq { |item| [item["hreflang"], item["href"]] } unless alternates.empty?
end

unless alternates_by_url.empty?
  doc.root.add_namespace("xhtml", "http://www.w3.org/1999/xhtml")

  REXML::XPath.each(doc, "//*[local-name()='url']") do |url_node|
    loc = REXML::XPath.first(url_node, "./*[local-name()='loc']")
    next unless loc

    alternates = alternates_by_url[loc.text.to_s]
    next unless alternates

    alternates.each do |alternate|
      link_node = REXML::Element.new("xhtml:link")
      link_node.add_attribute("rel", "alternate")
      link_node.add_attribute("hreflang", alternate["hreflang"])
      link_node.add_attribute("href", alternate["href"])
      url_node.add_element(link_node)
    end
  end
end

puts "Sitemap hreflang groups added: #{alternates_by_url.length}"

puts "Sitemap localized URLs added: #{localized_added.length}"

File.write(path, doc.to_s)
puts "Sitemap cleanup: removed #{removed.length} URLs"
puts removed
