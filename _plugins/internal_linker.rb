# ============================================================================
# Embedded Nerd - Internal Link Engine
# ============================================================================
# Jekyll 3.10 compatible
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
    # Page layouts that are considered editorial content.
    #
    # Product/category/utility pages are deliberately excluded.
    # ------------------------------------------------------------------------

    EDITORIAL_LAYOUTS = %w[
      single
      post
      article
      tutorial
    ].freeze


    # ------------------------------------------------------------------------
    # Main processor
    # ------------------------------------------------------------------------

    def self.process(document)

      site = document.site

      # ----------------------------------------------------------------------
      # Only process real Markdown/HTML content.
      # ----------------------------------------------------------------------

      ext =
        if document.respond_to?(:extname)
          document.extname.to_s.downcase
        else
          ""
        end

      return unless %w[.md .markdown .html .htm].include?(ext)


      # ----------------------------------------------------------------------
      # Decide whether this document is editorial content.
      # ----------------------------------------------------------------------

      unless editorial_document?(document)

        return

      end


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


      # Longer phrases have priority.
      #
      # Example:
      # "ESP32 DevKit" is checked before "ESP32".
      #

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
      # Protect HTML blocks.
      # ----------------------------------------------------------------------

      protected_parts =
        []


      placeholder =
        lambda do |type, index|

          "__EMBEDDED_NERD_#{type}_#{index}__"

      end


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
      # Protect Markdown links.
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
      # Protect fenced code blocks.
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
      # Protect inline code.
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


      # ----------------------------------------------------------------------
      # Create automatic links.
      # ----------------------------------------------------------------------

      rules.each do |rule|

        # Never link a page to itself.
        next if
          normalize_url(rule[:url]) == current_url


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
      # Restore fenced code.
      # ----------------------------------------------------------------------

      code_parts.each_with_index do |original, index|

        content =
          content.gsub(
            placeholder.call("CODE", index),
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
      # Restore protected HTML.
      # ----------------------------------------------------------------------

      protected_parts.each_with_index do |original, index|

        content =
          content.gsub(
            placeholder.call("PROTECTED", index),
            original
          )

      end


      # ----------------------------------------------------------------------
      # Save modified content.
      # ----------------------------------------------------------------------

      document.content =
        content


      # ----------------------------------------------------------------------
      # Logging.
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
    # Determine whether a document is editorial content.
    # =========================================================================

    def self.editorial_document?(document)

      # ----------------------------------------------------------------------
      # Posts are always editorial content.
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
      # Pages need an editorial layout.
      # ----------------------------------------------------------------------

      data =
        document.data || {}


      layout =
        data["layout"].to_s


      return true if
        EDITORIAL_LAYOUTS.include?(layout)


      # ----------------------------------------------------------------------
      # Explicit opt-in for an _pages article.
      #
      # Add this to a page when needed:
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

end
