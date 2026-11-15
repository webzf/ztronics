# Keep the historical language-root URLs working without jekyll-redirect-from.
# Polyglot and jekyll-redirect-from can otherwise double-prefix these paths.
require "fileutils"
require "cgi"

Jekyll::Hooks.register :site, :post_write do |site|
  languages = %w[de es fr it nl pl pt]
  baseurl = site.config["baseurl"].to_s.sub(%r{/$}, "")
  destination = "#{baseurl}/"

  languages.each do |language|
    output_dir = File.join(site.dest, language)
    FileUtils.mkdir_p(output_dir)

    escaped_destination = CGI.escapeHTML(destination)
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
  end
end
