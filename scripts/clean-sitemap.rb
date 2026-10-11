#!/usr/bin/env ruby
# Post-process the generated Jekyll sitemap to keep only useful canonical URLs.
require "rexml/document"
require "rexml/xpath"
require "uri"

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

File.write(path, doc.to_s)
puts "Sitemap cleanup: removed #{removed.length} URLs"
puts removed
