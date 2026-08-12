# ============================================================================
# Embedded Nerd - Internal Link Engine
# ============================================================================
#
# V1
#
# Automatically creates internal links in rendered Jekyll content.
#
# Supported:
#   - _posts
#   - _pages
#   - configurable keywords
#   - maximum links per destination
#   - prevents self-links
#   - protects existing links
#   - protects code/pre/script/style
#   - reports links created during build
#
# Future:
#   - automatic product relationships
#   - product_id integration
#   - related articles
#   - orphan page detection
#   - internal link recommendations
#   - SEO linking report
# ============================================================================

module EmbeddedNerd
  module InternalLinker

    Jekyll.logger.info(
  "Internal Linker:",
  "PLUGIN LOADED"
)

    # ------------------------------------------------------------------------
    # Tags where automatic links must NEVER be inserted.
    # ------------------------------------------------------------------------

    PROTECTED_TAGS = %w[
      a
      code
      pre
      script
      style
    ].freeze


    # ------------------------------------------------------------------------
    # Process a Jekyll page/document.
    # ------------------------------------------------------------------------

    def self.process(page, site)

      # ----------------------------------------------------------------------
      # Load configuration
      # ----------------------------------------------------------------------

      config = site.data["internal_links"]

      unless config.is_a?(Hash)
        return
      end

      settings = config["settings"] || {}

      # Allow the system to be disabled from YAML.
      return if settings["enabled"] == false

      links = config["links"] || {}

      if links.empty?
        Jekyll.logger.warn(
          "Internal Linker:",
          "No link rules found."
        )
        return
      end


      # ----------------------------------------------------------------------
      # Only process HTML pages.
      # ----------------------------------------------------------------------

      output = page.output.to_s

      return if output.empty?

      unless output.include?("<")
        return
      end


      # ----------------------------------------------------------------------
      # Current page URL
      # ----------------------------------------------------------------------

      current_url = normalize_url(page.url)


      # ----------------------------------------------------------------------
      # Build keyword rules.
      # ----------------------------------------------------------------------

      rules = []

      links.each do |link_id, item|

        next unless item.is_a?(Hash)

        url = item["url"].to_s.strip

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
            id: link_id.to_s,
            url: url,
            keyword: keyword,
            max_links: max_links
          }

        end

      end


      # ----------------------------------------------------------------------
      # Longer keywords first.
      #
      # Example:
      #
      # "ESP32 DevKit" should be matched before "ESP32".
      # ----------------------------------------------------------------------

      rules.sort_by! do |rule|
        -rule[:keyword].length
      end


      # ----------------------------------------------------------------------
      # Count links created for each destination.
      # ----------------------------------------------------------------------

      link_counts = Hash.new(0)

      total_created = 0


      # ----------------------------------------------------------------------
      # Protect existing HTML elements.
      #
      # We temporarily replace them with placeholders.
      # This prevents automatic linking inside:
      #
      # <a>
      # <code>
      # <pre>
      # <script>
      # <style>
      # ----------------------------------------------------------------------

      protected_content = []

      protected_pattern =
        /<(#{PROTECTED_TAGS.join("|")})(?:\s[^>]*)?>.*?<\/\1>/im

      output = output.gsub(protected_pattern) do |match|

        index = protected_content.length

        protected_content << match

        "__EMBEDDED_NERD_PROTECTED_#{index}__"

      end


      # ----------------------------------------------------------------------
      # Process text nodes.
      #
      # We only modify text between HTML tags.
      # ----------------------------------------------------------------------

      output = output.gsub(/>([^<]+)</) do |match|

        text = Regexp.last_match(1)


        rules.each do |rule|

          # Maximum number of links for this destination.
          break if link_counts[rule[:id]] >= rule[:max_links]


          # Never create a link to the current page.
          next if normalize_url(rule[:url]) == current_url


          # Remaining allowed links.
          remaining =
            rule[:max_links] - link_counts[rule[:id]]

          next if remaining <= 0


          # ------------------------------------------------------------------
          # Match complete words/phrases.
          #
          # Examples:
          #
          # MPU6050      -> match
          # MPU-6050     -> match
          # ESP32        -> match
          #
          # Avoid matching inside larger words.
          # ------------------------------------------------------------------

          pattern = /
            (?<![\w-])
            (#{Regexp.escape(rule[:keyword])})
            (?![\w-])
          /ix


          # Only replace ONE occurrence at a time.
          #
          # This guarantees that max_links_per_page is respected.
          #

          new_text = text.sub(pattern) do

            matched_text = Regexp.last_match(1)

            link_counts[rule[:id]] += 1
            total_created += 1

            escaped_url =
              rule[:url].gsub('"', '&quot;')

            %(
              <a href="#{escaped_url}">#{matched_text}</a>
            ).strip

          end


          text = new_text

        end


        ">#{text}<"

      end


      # ----------------------------------------------------------------------
      # Restore protected HTML.
      # ----------------------------------------------------------------------

      protected_content.each_with_index do |content, index|

        placeholder =
          "__EMBEDDED_NERD_PROTECTED_#{index}__"

        output = output.gsub(
          placeholder,
          content
        )

      end


      # ----------------------------------------------------------------------
      # Update Jekyll output.
      # ----------------------------------------------------------------------

      if total_created > 0

        page.output = output

        Jekyll.logger.info(
          "Internal Linker:",
          "#{page.url} -> #{total_created} link(s) created"
        )

      end

    end


    # ------------------------------------------------------------------------
    # Normalize URLs for comparison.
    #
    # /products/mpu6050
    # /products/mpu6050/
    #
    # become the same URL.
    # ------------------------------------------------------------------------

    def self.normalize_url(url)

      value = url.to_s.strip

      # Remove fragment.
      value = value.split("#").first

      # Remove query string.
      value = value.split("?").first

      # Empty URL means root.
      value = "/" if value.empty?

      # Ensure leading slash.
      unless value.start_with?("/")
        value = "/#{value}"
      end

      # Remove trailing slash.
      value = value.chomp("/")

      # Root URL.
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
#
# Jekyll officially exposes :posts as a hook owner for documents in _posts.
# ----------------------------------------------------------------------------

Jekyll::Hooks.register :posts, :post_render do |post|

  EmbeddedNerd::InternalLinker.process(
    post,
    post.site
  )

end

# ============================================================================
# Jekyll Hooks - DEBUG
# ============================================================================

Jekyll::Hooks.register :posts, :post_render do |post|

  Jekyll.logger.info(
    "Internal Linker:",
    "Processing post: #{post.url}"
  )

  EmbeddedNerd::InternalLinker.process(
    post,
    post.site
  )

end


Jekyll::Hooks.register :pages, :post_render do |page|

  Jekyll.logger.info(
    "Internal Linker:",
    "Processing page: #{page.url}"
  )

  EmbeddedNerd::InternalLinker.process(
    page,
    page.site
  )

end
# ----------------------------------------------------------------------------
# Pages
#
# This covers normal Jekyll pages, including pages generated from _pages
# when they are configured as Jekyll pages.
# ----------------------------------------------------------------------------

Jekyll::Hooks.register :pages, :post_render do |page|

  EmbeddedNerd::InternalLinker.process(
    page,
    page.site
  )

end
