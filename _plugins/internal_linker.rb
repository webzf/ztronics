# ============================================================================
# Embedded Nerd - Internal Link Engine
# ============================================================================
# Jekyll 3.10 compatible
#
# Features:
#   - Automatic internal links in editorial content
#   - Posts are automatically included
#   - _pages can opt in through layout or internal_links: true
#   - Product/category/utility pages are excluded
#   - H1-H6 are never modified
#   - Existing links are never modified
#   - Markdown links are protected
#   - Code blocks are protected
#   - Inline code is protected
#   - HTML code/pre/script/style are protected
#   - Self-links are prevented
#   - Maximum links per destination
# ============================================================================

module EmbeddedNerd
  module InternalLinker

    # ------------------------------------------------------------------------
    # HTML elements that must never receive automatic links.
    # ------------------------------------------------------------------------

    PROTECTED_TAGS = %w[
      a
      h1
      h2
      h3
      h4
      h5
      h6
      code
      pre
      script
      style
    ].freeze


    # ------------------------------------------------------------------------
    # Editorial layouts.
    #
    # These layouts are allowed to receive automatic internal links.
    # ------------------------------------------------------------------------

    EDITORIAL_LAYOUTS = %w[
      single
      post
      article
      tutorial
    ].freeze


    # ------------------------------------------------------------------------
    # Main processor.
    # ------------------------------------------------------------------------

    def self.process(document)

      site = document.site


      # ----------------------------------------------------------------------
      # Only process Markdown and HTML content.
      # ----------------------------------------------------------------------

      ext =
        if document.respond_to?(:extname)
          document.extname.to_s.downcase
        else
          ""
        end

      return unless %w[
        .md
        .markdown
        .html
        .htm
      ].include?(ext)


      # ----------------------------------------------------------------------
      # Only process editorial content.
      # ----------------------------------------------------------------------

      return unless editorial_document?(document)


      # ----------------------------------------------------------------------
      # Load configuration.
      # ----------------------------------------------------------------------

      config =
        site.data["internal_links"]

      return unless config.is_a?(Hash)


      settings =
        config["settings"] || {}


      return if settings["enabled"] == false


      links =
        config["links"] || {}


      return if links.empty?


      # ----------------------------------------------------------------------
      # Get document content.
      # ----------------------------------------------------------------------

      content =
        document.content.to_s


      return if content.empty?


      # ----------------------------------------------------------------------
      # Current page URL.
      # ----------------------------------------------------------------------

      current_url =
        normalize_url(document.url)


      # ----------------------------------------------------------------------
      # Build linking rules.
      # ----------------------------------------------------------------------

      rules = []


      links.each do |link_id, item|

        next unless item.is_a?(Hash)


        url =
          item["url"].to_s.strip


        next if url.empty?


        max_links =
          (
            item["max_links_per_page"] ||
            settings["default_max_links_per_page"] ||
            1
          ).to_i


        next if max_links <= 0


        Array(item["keywords"]).each do |keyword|

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
      # is processed before:
      #
      # ESP32
      # ----------------------------------------------------------------------

      rules.sort_by! do |rule|

        -rule[:keyword].length

      end


      # ----------------------------------------------------------------------
      # Counters.
      # ----------------------------------------------------------------------

      counts =
        Hash.new(0)


      total_created =
        0


      # ----------------------------------------------------------------------
      # Placeholder helper.
      # ----------------------------------------------------------------------

      placeholder =
        lambda do |type, index|

          "__EMBEDDED_NERD_#{type}_#{index}__"

        end


      # ======================================================================
      # PROTECTION PHASE
      # ======================================================================
      #
      # Important:
      #
      # We protect code blocks BEFORE Markdown headings.
      #
      # Otherwise a line such as:
      #
      # # MPU6050
      #
      # inside a code block could be treated as a real heading.
      # ======================================================================


      # ----------------------------------------------------------------------
      # 1. Protect fenced code blocks.
      # ----------------------------------------------------------------------

      code_parts =
        []


      content =
        content.gsub(
          /```.*?```/m
        ) do |match|

          index =
            code_parts.length


          code_parts << match


          placeholder.call(
            "CODE",
            index
          )

        end


      # ----------------------------------------------------------------------
      # 2. Protect indented Markdown code blocks.
      # ----------------------------------------------------------------------

      indented_code_parts =
        []


      content =
        content.gsub(
          /^(?: {4}|\t).*(?:\n|$)+/m
        ) do |match|

          index =
            indented_code_parts.length


          indented_code_parts << match


          placeholder.call(
            "INDENTED_CODE",
            index
          )

        end


      # ----------------------------------------------------------------------
      # 3. Protect Markdown headings.
      #
      # This is the important fix.
      #
      # Examples:
      #
      # # MPU6050
      # ## Using MPU6050 with ESP32
      # ### MPU6050 Wiring
      #
      # None of these can receive automatic links.
      # ----------------------------------------------------------------------

      heading_parts =
        []


      content =
        content.gsub(
          /^ {0,3}#{1,6}[ \t]+[^\n]+$/m
        ) do |match|

          index =
            heading_parts.length


          heading_parts << match


          placeholder.call(
            "HEADING",
            index
          )

        end


      # ----------------------------------------------------------------------
      # 4. Protect HTML elements.
      # ----------------------------------------------------------------------

      protected_parts =
        []


      content =
        content.gsub(
          /<(#{PROTECTED_TAGS.join("|")})(?:\s[^>]*)?>.*?<\/\1>/im
        ) do |match|

          index =
            protected_parts.length


          protected_parts << match


          placeholder.call(
            "PROTECTED",
            index
          )

        end


      # ----------------------------------------------------------------------
      # 5. Protect Markdown links.
      #
      # Example:
      #
      # [MPU6050](https://example.com)
      #
      # must remain untouched.
      # ----------------------------------------------------------------------

      markdown_parts =
        []


      content =
        content.gsub(
          /!?\[[^\]]+\]\([^)]+\)/
        ) do |match|

          index =
            markdown_parts.length


          markdown_parts << match


          placeholder.call(
            "MARKDOWN",
            index
          )

        end


      # ----------------------------------------------------------------------
      # 6. Protect inline code.
      # ----------------------------------------------------------------------

      inline_parts =
        []


      content =
        content.gsub(
          /`[^`\n]+`/
        ) do |match|

          index =
            inline_parts.length


          inline_parts << match


          placeholder.call(
            "INLINE",
            index
          )

        end


      # ======================================================================
      # LINKING PHASE
      # ======================================================================

      rules.each do |rule|

        # --------------------------------------------------------------------
        # Never create a link to the current page.
        # --------------------------------------------------------------------

        next if
          normalize_url(rule[:url]) == current_url


        # --------------------------------------------------------------------
        # Match complete words/phrases.
        # --------------------------------------------------------------------

        pattern =
          /(?<![\w-])(#{Regexp.escape(rule[:keyword])})(?![\w-])/i


        while counts[rule[:id]] < rule[:max_links]

          matched =
            false


          content =
            content.sub(pattern) do

              matched =
                true


              counts[rule[:id]] += 1


              total_created += 1


              text =
                Regexp.last_match(1)


              url =
                rule[:url].gsub(
                  '"',
                  '&quot;'
                )


              %(<a href="#{url}">#{text}</a>)

            end


          break unless matched

        end

      end


      # ======================================================================
      # RESTORATION PHASE
      # ======================================================================


      # ----------------------------------------------------------------------
      # Restore inline code.
      # ----------------------------------------------------------------------

      inline_parts.each_with_index do |original, index|

        content =
          content.gsub(
            placeholder.call("INLINE", index),
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore Markdown links.
      # ----------------------------------------------------------------------

      markdown_parts.each_with_index do |original, index|

        content =
          content.gsub(
            placeholder.call("MARKDOWN", index),
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore HTML protected elements.
      # ----------------------------------------------------------------------

      protected_parts.each_with_index do |original, index|

        content =
          content.gsub(
            placeholder.call("PROTECTED", index),
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore Markdown headings.
      # ----------------------------------------------------------------------

      heading_parts.each_with_index do |original, index|

        content =
          content.gsub(
            placeholder.call("HEADING", index),
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore indented code.
      # ----------------------------------------------------------------------

      indented_code_parts.each_with_index do |original, index|

        content =
          content.gsub(
            placeholder.call("INDENTED_CODE", index),
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore fenced code.
      # ----------------------------------------------------------------------

      code_parts.each_with_index do |original, index|

        content =
          content.gsub(
            placeholder.call("CODE", index),
            original
          )

      end


      # ======================================================================
      # SAVE
      # ======================================================================

      document.content =
        content


      # ----------------------------------------------------------------------
      # Build log.
      # ----------------------------------------------------------------------

      if total_created > 0

        Jekyll.logger.info(
          "Internal Linker:",
          "#{document.url} -> #{total_created} link(s) created"
        )

      else

        Jekyll.logger.info(
          "Internal Linker:",
          "#{document.url} -> 0 automatic links"
        )

      end

    end


    # =========================================================================
    # Determine whether a document is editorial.
    # =========================================================================

    def self.editorial_document?(document)

      # ----------------------------------------------------------------------
      # Posts are always editorial.
      # ----------------------------------------------------------------------

      if document.respond_to?(:collection)

        collection =
          document.collection


        if collection

          return true if
            collection.label.to_s == "posts"

        end

      end


      # ----------------------------------------------------------------------
      # Pages require an editorial layout or explicit opt-in.
      # ----------------------------------------------------------------------

      data =
        document.data || {}


      layout =
        data["layout"].to_s


      return true if
        EDITORIAL_LAYOUTS.include?(layout)


      # ----------------------------------------------------------------------
      # Explicit opt-in.
      #
      # Example:
      #
      # internal_links: true
      # ----------------------------------------------------------------------

      return true if
        data["internal_links"] == true


      false

    end


    # =========================================================================
    # Normalize URL.
    # =========================================================================

    def self.normalize_url(url)

      value =
        url.to_s.strip


      # Remove fragment.
      value =
        value.split("#").first


      # Remove query string.
      value =
        value.split("?").first


      # Empty URL.
      value =
        "/" if value.empty?


      # Ensure leading slash.
      value =
        "/#{value}" unless value.start_with?("/")


      # Remove trailing slash.
      value =
        value.chomp("/")


      return "/" if value.empty?


      "#{value}/"

    end

  end
end


# ============================================================================
# Jekyll 3.10 Hooks
# ============================================================================

Jekyll::Hooks.register :posts, :pre_render do |post|

  EmbeddedNerd::InternalLinker.process(post)

end


Jekyll::Hooks.register :pages, :pre_render do |page|

  EmbeddedNerd::InternalLinker.process(page)

end
