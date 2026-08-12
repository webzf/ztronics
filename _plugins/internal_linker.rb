# ============================================================================
# Embedded Nerd - Internal Link Engine
# ============================================================================
#
# V1
#
# Creates automatic internal links inside Jekyll post/page content.
#
# Features:
#   - Processes _posts
#   - Processes real HTML pages
#   - Uses _data/internal_links.yml
#   - Maximum links per destination
#   - Prevents self-links
#   - Protects existing <a> links
#   - Protects <code>, <pre>, <script>, <style>
#   - Does not touch layouts, menus or footers
#   - Reports links created during build
#
# Future:
#   - Automatic product_id integration
#   - Related articles
#   - Orphan-page detection
#   - Link recommendations
#   - Link-density analysis
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
    # Main processor
    # ------------------------------------------------------------------------

    def self.process(document)

      site = document.site

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
      # Only process HTML content.
      # ----------------------------------------------------------------------

      output_ext =
        if document.respond_to?(:output_ext)
          document.output_ext.to_s
        else
          ""
        end

      return unless output_ext == ".html"


      # ----------------------------------------------------------------------
      # Content before layout.
      #
      # This is the important difference from post_render.
      # We are modifying only the article/page content.
      # ----------------------------------------------------------------------

      content = document.content.to_s

      return if content.empty?


      # ----------------------------------------------------------------------
      # Current URL
      # ----------------------------------------------------------------------

      current_url =
        normalize_url(document.url)


      # ----------------------------------------------------------------------
      # Build rules
      # ----------------------------------------------------------------------

      rules = []


      links.each do |link_id, item|

        next unless item.is_a?(Hash)

        url =
          item["url"].to_s.strip

        next if url.empty?


        keywords =
          Array(item["keywords"])


        max_links =
          (
            item["max_links_per_page"] ||
            settings["default_max_links_per_page"] ||
            1
          ).to_i


        next if max_links <= 0


        keywords.each do |keyword|

          keyword =
            keyword.to_s.strip

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


      # ----------------------------------------------------------------------
      # Longer phrases first.
      #
      # Example:
      #
      # ESP32 DevKit
      #
      # is matched before:
      #
      # ESP32
      # ----------------------------------------------------------------------

      rules.sort_by! do |rule|
        -rule[:keyword].length
      end


      # ----------------------------------------------------------------------
      # Link counters
      # ----------------------------------------------------------------------

      link_counts =
        Hash.new(0)

      total_created = 0


      # ----------------------------------------------------------------------
      # Protect entire HTML elements that must never be modified.
      # ----------------------------------------------------------------------

      protected_content = []


      protected_pattern =
        /<(#{PROTECTED_TAGS.join("|")})(?:\s[^>]*)?>.*?<\/\1>/im


      content =
        content.gsub(protected_pattern) do |match|

          index =
            protected_content.length

          protected_content << match

          "__EMBEDDED_NERD_PROTECTED_#{index}__"

        end


      # ----------------------------------------------------------------------
      # Process only HTML text nodes.
      #
      # This prevents keywords inside HTML attributes from being modified.
      # ----------------------------------------------------------------------

      content =
        content.gsub(/>([^<]+)</) do

          text =
            Regexp.last_match(1)


          rules.each do |rule|

            break if
              link_counts[rule[:id]] >= rule[:max_links]


            # ----------------------------------------------------------------
            # Never link a page to itself.
            # ----------------------------------------------------------------

            next if
              normalize_url(rule[:url]) == current_url


            # ----------------------------------------------------------------
            # Match complete words/phrases.
            # ----------------------------------------------------------------

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


            text =
              new_text

          end


          ">#{text}<"

        end


      # ----------------------------------------------------------------------
      # Restore protected elements.
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
      # Update content.
      # ----------------------------------------------------------------------

      if total_created > 0

        document.content =
          content


        Jekyll.logger.info(
          "Internal Linker:",
          "#{document.url} -> #{total_created} link(s) created"
        )

      end

    end


    # ------------------------------------------------------------------------
    # Normalize URLs.
    # ------------------------------------------------------------------------

    def self.normalize_url(url)

      value =
        url.to_s.strip


      value =
        value.split("#").first


      value =
        value.split("?").first


      value =
        "/" if value.empty?


      unless value.start_with?("/")
        value =
          "/#{value}"
      end


      value =
        value.chomp("/")


      return "/" if value.empty?


      "#{value}/"

    end

  end
end


# ============================================================================
# Jekyll Hooks
# ============================================================================

# ----------------------------------------------------------------------------
# Posts
# ----------------------------------------------------------------------------

Jekyll::Hooks.register :posts, :post_convert do |post|

  EmbeddedNerd::InternalLinker.process(post)

end


# ----------------------------------------------------------------------------
# Pages
#
# We process only HTML pages.
# CSS, JS, XML and other generated files are ignored by output_ext.
# ----------------------------------------------------------------------------

Jekyll::Hooks.register :pages, :post_convert do |page|

  EmbeddedNerd::InternalLinker.process(page)

end
