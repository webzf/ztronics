# ============================================================================
# Embedded Nerd - Internal Link Engine
# ============================================================================
#
# Jekyll 3.10 compatible
#
# Uses :pre_render so modifications are included in the final HTML.
#
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
      # Only process actual content files.
      # ----------------------------------------------------------------------

      ext =
        if document.respond_to?(:extname)
          document.extname.to_s.downcase
        else
          ""
        end

      return unless %w[.md .markdown .html .htm].include?(ext)


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
      # Build rules
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


      # Longer phrases first.
      rules.sort_by! do |rule|
        -rule[:keyword].length
      end


      # ----------------------------------------------------------------------
      # Counters
      # ----------------------------------------------------------------------

      link_counts = Hash.new(0)

      total_created = 0


      # ----------------------------------------------------------------------
      # Protect HTML blocks
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
      # Protect Markdown links
      #
      # Example:
      #
      # [MPU6050](...)
      #
      # must never become:
      #
      # [<a href="...">MPU6050</a>](...)
      # ----------------------------------------------------------------------

      markdown_links = []


      content =
        content.gsub(
          /!?\[[^\]]+\]\([^)]+\)/
        ) do |match|

          index = markdown_links.length

          markdown_links << match

          "__EMBEDDED_NERD_MARKDOWN_LINK_#{index}__"

        end


      # ----------------------------------------------------------------------
      # Protect fenced code blocks
      # ----------------------------------------------------------------------

      code_blocks = []


      content =
        content.gsub(
          /```.*?```/m
        ) do |match|

          index = code_blocks.length

          code_blocks << match

          "__EMBEDDED_NERD_CODE_BLOCK_#{index}__"

        end


      # ----------------------------------------------------------------------
      # Protect inline code
      # ----------------------------------------------------------------------

      inline_code = []


      content =
        content.gsub(
          /`[^`\n]+`/
        ) do |match|

          index = inline_code.length

          inline_code << match

          "__EMBEDDED_NERD_INLINE_CODE_#{index}__"

        end


      # ----------------------------------------------------------------------
      # Replace keywords
      # ----------------------------------------------------------------------

      rules.each do |rule|

        break if
          link_counts[rule[:id]] >= rule[:max_links]


        # Never link a page to itself.
        next if
          normalize_url(rule[:url]) == current_url


        pattern =
          /
            (?<![\w-])
            (#{Regexp.escape(rule[:keyword])})
            (?![\w-])
          /ix


        remaining =
          rule[:max_links] -
          link_counts[rule[:id]]


        remaining.times do

          break if
            link_counts[rule[:id]] >= rule[:max_links]


          match_found = false


          content =
            content.sub(pattern) do

              match_found = true


              matched_text =
                Regexp.last_match(1)


              link_counts[rule[:id]] += 1

              total_created += 1


              escaped_url =
                rule[:url].gsub('"', '&quot;')


              %(<a href="#{escaped_url}">#{matched_text}</a>)

            end


          break unless match_found

        end

      end


      # ----------------------------------------------------------------------
      # Restore inline code
      # ----------------------------------------------------------------------

      inline_code.each_with_index do |original, index|

        placeholder =
          "__EMBEDDED_NERD_INLINE_CODE_#{index}__"


        content =
          content.gsub(
            placeholder,
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore code blocks
      # ----------------------------------------------------------------------

      code_blocks.each_with_index do |original, index|

        placeholder =
          "__EMBEDDED_NERD_CODE_BLOCK_#{index}__"


        content =
          content.gsub(
            placeholder,
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore Markdown links
      # ----------------------------------------------------------------------

      markdown_links.each_with_index do |original, index|

        placeholder =
          "__EMBEDDED_NERD_MARKDOWN_LINK_#{index}__"


        content =
          content.gsub(
            placeholder,
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore HTML protected elements
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
      # Save modified content
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
    # URL normalization
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


      value =
        "/#{value}" unless value.start_with?("/")


      value =
        value.chomp("/")


      return "/" if value.empty?


      "#{value}/"

    end

  end
end


# ============================================================================
# Jekyll 3.10 hooks
# ============================================================================

Jekyll::Hooks.register :posts, :pre_render do |post|

  EmbeddedNerd::InternalLinker.process(post)

end


Jekyll::Hooks.register :pages, :pre_render do |page|

  EmbeddedNerd::InternalLinker.process(page)

end9
