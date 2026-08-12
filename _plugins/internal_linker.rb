# ============================================================================
# Embedded Nerd - Internal Link Engine
# ============================================================================
#
# Version 1.0
#
# Automatic internal links for Jekyll 3.10
#
# Features:
#   - Processes posts and HTML pages
#   - Uses _data/internal_links.yml
#   - Maximum links per destination
#   - Prevents self-links
#   - Protects existing links
#   - Protects code/pre/script/style
#   - Ignores CSS, JS, XML and other non-HTML files
#   - Does not modify layouts, menus or footers
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

    # ------------------------------------------------------------------------
    # Process a Jekyll document/page
    # ------------------------------------------------------------------------

    def self.process(document)

      site = document.site

      # ----------------------------------------------------------------------
      # Only HTML output
      # ----------------------------------------------------------------------

      output_ext =
        if document.respond_to?(:output_ext)
          document.output_ext.to_s.downcase
        else
          ""
        end

      return unless output_ext == ".html"

      # ----------------------------------------------------------------------
      # Configuration
      # ----------------------------------------------------------------------

      config = site.data["internal_links"]

      return unless config.is_a?(Hash)

      settings = config["settings"] || {}

      return if settings["enabled"] == false

      links = config["links"] || {}

      return if links.empty?

      # ----------------------------------------------------------------------
      # Content
      # ----------------------------------------------------------------------

      content = document.content.to_s

      return if content.empty?

      # ----------------------------------------------------------------------
      # Current URL
      # ----------------------------------------------------------------------

      current_url =
        normalize_url(document.url)

      # ----------------------------------------------------------------------
      # Build linking rules
      # ----------------------------------------------------------------------

      rules = []

      links.each do |link_id, item|

        next unless item.is_a?(Hash)

        url = item["url"].to_s.strip

        next if url.empty?

        keywords = Array(item["keywords"])

        max_links =
          (
            item["max_links_per_page"] ||
            settings["default_max_links_per_page"] ||
            1
          ).to_i

        next if max_links <= 0

        keywords.each do |keyword|

          keyword = keyword.to_s.strip

          next if keyword.empty?

          rules << {
            id: link_id.to_s,
            url: url,
            keyword: keyword,
            max_links: max_links
          }

        end
      end

      return if rules.empty?

      # Longer keywords first.
      #
      # Example:
      # "ESP32 DevKit" before "ESP32"
      #
      rules.sort_by! do |rule|
        -rule[:keyword].length
      end

      # ----------------------------------------------------------------------
      # Link counters
      # ----------------------------------------------------------------------

      link_counts = Hash.new(0)

      total_created = 0

      # ----------------------------------------------------------------------
      # Temporarily protect elements that must never be modified.
      # ----------------------------------------------------------------------

      protected_content = []

      protected_pattern =
        /<(#{PROTECTED_TAGS.join("|")})(?:\s[^>]*)?>.*?<\/\1>/im

      content =
        content.gsub(protected_pattern) do |match|

          index = protected_content.length

          protected_content << match

          "__EMBEDDED_NERD_PROTECTED_#{index}__"

        end

      # ----------------------------------------------------------------------
      # Process HTML text nodes only.
      #
      # The pattern >TEXT< prevents us from changing HTML attributes.
      # ----------------------------------------------------------------------

      content =
        content.gsub(/>([^<]+)</) do

          text = Regexp.last_match(1)

          rules.each do |rule|

            break if
              link_counts[rule[:id]] >= rule[:max_links]

            # Never link to the current page.
            next if
              normalize_url(rule[:url]) == current_url

            pattern = /
              (?<![\w-])
              (#{Regexp.escape(rule[:keyword])})
              (?![\w-])
            /ix

            new_text =
              text.sub(pattern) do

                matched_text =
                  Regexp.last_match(1)

                link_counts[rule[:id]] += 1

                total_created += 1

                escaped_url =
                  rule[:url].gsub('"', '&quot;')

                %(<a href="#{escaped_url}">#{matched_text}</a>)

              end

            text = new_text

          end

          ">#{text}<"

        end

      # ----------------------------------------------------------------------
      # Restore protected content
      # ----------------------------------------------------------------------

      protected_content.each_with_index do |original, index|

        placeholder =
          "__EMBEDDED_NERD_PROTECTED_#{index}__"

        content =
          content.gsub(
            placeholder,
            original
          )

      end

      # ----------------------------------------------------------------------
      # Update document
      # ----------------------------------------------------------------------

      if total_created > 0

        document.content = content

        Jekyll.logger.info(
          "Internal Linker:",
          "#{document.url} -> #{total_created} link(s) created"
        )

      end

    end

    # ------------------------------------------------------------------------
    # Normalize URL
    # ------------------------------------------------------------------------

    def self.normalize_url(url)

      value = url.to_s.strip

      value = value.split("#").first

      value = value.split("?").first

      value = "/" if value.empty?

      value = "/#{value}" unless value.start_with?("/")

      value = value.chomp("/")

      return "/" if value.empty?

      "#{value}/"

    end

  end
end


# ============================================================================
# Jekyll 3.10 hooks
# ============================================================================

Jekyll::Hooks.register :posts, :post_render do |post|

  EmbeddedNerd::InternalLinker.process(post)

end


Jekyll::Hooks.register :pages, :post_render do |page|

  EmbeddedNerd::InternalLinker.process(page)

end
