#!/usr/bin/env ruby
# Generate legacy language-root redirects after the complete Jekyll/Polyglot build.
require "fileutils"
require "cgi"
require "json"

site_root = ARGV.fetch(0) { abort "Usage: ruby scripts/create-language-root-redirects.rb SITE_ROOT [BASEURL]" }
site_root = File.expand_path(site_root)
baseurl = ARGV[1].to_s.strip
baseurl = "" if baseurl == "/"
baseurl = "/#{baseurl}" unless baseurl.empty? || baseurl.start_with?("/")
baseurl = baseurl.sub(%r{/+$}, "")

destination = "#{baseurl}/"
escaped_destination = CGI.escapeHTML(destination)

%w[de es fr it nl pl pt].each do |language|
  output_dir = File.join(site_root, language)
  FileUtils.mkdir_p(output_dir)

  html = <<~HTML
    <!doctype html>
    <html lang="#{language}">
      <head>
        <meta charset="utf-8">
        <meta name="robots" content="noindex,follow">
        <meta http-equiv="refresh" content="0;url=#{escaped_destination}">
        <title>Page moved | Embedded Nerd</title>
        <script>window.location.replace(#{destination.to_json});</script>
      </head>
      <body>
        <p>This language homepage has moved. <a href="#{escaped_destination}">Continue to Embedded Nerd</a>.</p>
      </body>
    </html>
  HTML

  File.write(File.join(output_dir, "index.html"), html)
  puts "Created legacy language-root redirect: /#{language}/ -> #{destination}"
end
