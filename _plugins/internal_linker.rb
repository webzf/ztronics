# ============================================================================
# Embedded Nerd - Internal Link Engine
# ============================================================================
#
# Automatically creates internal links in rendered HTML.
#
# V1 features:
# - Posts
# - Pages
# - Configurable keywords
# - Maximum links per destination
# - Prevents self-links
# - Protects <a>, <code>, <pre>, <script> and <style>
#
# Future:
# - Automatic product relationships
# - Related articles
# - Orphan page detection
# - Link recommendations
# - SEO linking report
# ============================================================================

module EmbeddedNerd
  module InternalLinker

    PROTECTED_TAGS = %w[
      a
      code
      pre
      script
      style
    ].freeze

    def self.process(page, site)
      return unless site.data["internal_links"]

      config = site.data["internal_links"]
      settings = config["settings"] || {}

      return if settings["enabled"] == false

      links = config["links"] || {}
      return if links.empty?

      html = page.output.to_s
      return if html.empty?

      current_url = normalize_url(page.url)

      # Protect sections where links must never be inserted.
      protected = []

      html = html.gsub(
        /<(#{PROTECTED_TAGS.join("|")})(?:\s[^>]*)?>.*?<\/\1>/im
      ) do |match|
        index = protected.length
        protected << match
        "__EMBEDDED_NERD_PROTECTED_#{index}__"
      end

      # Sort keywords by length so more specific phrases win.
      rules = []

      links.each do |id, item|
        next unless item.is_a?(Hash)

        url = item["url"].to_s
        next if url.empty?

        keywords = Array(item["keywords"])
        max_links = (
          item["max_links_per_page"] ||
          settings["default_max_links_per_page"] ||
          1
        ).to_i

        next if max_links <= 0

        keywords.each do |keyword|
          keyword = keyword.to_s.strip
          next if keyword.empty?

          rules << {
            id: id,
            url: url,
            keyword: keyword,
            max_links: max_links
          }
        end
      end

      rules.sort_by! { |rule| -rule[:keyword].length }

      link_counts = Hash.new(0)

      # Process only text outside HTML tags.
      html = html.gsub(/>([^<]+)</) do |match|
        text = Regexp.last_match(1)

        rules.each do |rule|
          break if link_counts[rule[:id]] >= rule[:max_links]

          # Never link a page to itself.
          next if normalize_url(rule[:url]) == current_url

          remaining = rule[:max_links] - link_counts[rule[:id]]
          next if remaining <= 0

          escaped_url = rule[:url].gsub('"', '&quot;')

          pattern = /
            (?<![\w-])
            (#{Regexp.escape(rule[:keyword])})
            (?![\w-])
          /ix

          text = text.sub(pattern) do
            link_counts[rule[:id]] += 1

            %(<a href="#{escaped_url}">#{Regexp.last_match(1)}</a>)
          end
        end

        ">#{text}<"
      end

      # Restore protected sections.
      protected.each_with_index do |content, index|
        html = html.gsub(
          "__EMBEDDED_NERD_PROTECTED_#{index}__",
          content
        )
      end

      page.output = html
    end

    def self.normalize_url(url)
      value = url.to_s.strip
      value = value.split("#").first
      value = value.split("?").first
      value = "/" if value.empty?

      value = "/#{value}" unless value.start_with?("/")

      value = value.chomp("/")
      value.empty? ? "/" : "#{value}/"
    end
  end
end


# ----------------------------------------------------------------------------
# Jekyll hooks
# ----------------------------------------------------------------------------

Jekyll::Hooks.register :documents, :post_render do |document|
  site = document.site

  next unless document.output_ext == ".html"

  EmbeddedNerd::InternalLinker.process(document, site)
end


Jekyll::Hooks.register :pages, :post_render do |page|
  site = page.site

  next unless page.output_ext == ".html"

  EmbeddedNerd::InternalLinker.process(page, site)
end
