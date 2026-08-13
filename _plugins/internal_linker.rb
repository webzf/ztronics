# ============================================================================
# Embedded Nerd - Internal Link Engine V3.1
# ============================================================================
#
# Jekyll 3.10 compatible
#
# Relationship engine:
#
#   Article -> Product
#   Article -> Article
#   Product -> Article
#   Product -> Product
#
# V3.1:
#
#   - Relevance scoring
#   - Real link opportunity detection
#   - Existing link detection
#   - Protected HTML elements
#   - Required hardware priority
#   - Automatic product keywords
#   - Explicit internal_link_keywords support
#   - Shared article relationships
#   - Natural anchor text only
#   - No generic tag/category anchors
#   - Conservative product-to-product linking
#   - Duplicate hook protection
#   - Analysis mode
#
# Current mode:
#
#   analysis_only: true
#
# ============================================================================

module EmbeddedNerd

  module InternalLinker

    # ========================================================================
    # DEFAULT SETTINGS
    # ========================================================================

    DEFAULT_SETTINGS = {

      "enabled" => true,

      "analysis_only" => true,

      "max_total_links_per_page" => 5,

      "max_product_links_per_page" => 3,

      "max_article_links_per_page" => 2,

      "minimum_relevance" => 60,

      "analysis_results_per_page" => 5

    }.freeze


    # ========================================================================
    # ELEMENTS THAT MUST NEVER BE MODIFIED
    # ========================================================================

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
      textarea
    ].freeze


    # ========================================================================
    # EDITORIAL LAYOUTS
    # ========================================================================

    EDITORIAL_LAYOUTS = %w[
      article
      post
      tutorial
      single
    ].freeze


    # ========================================================================
    # MAIN PROCESSOR
    # ========================================================================

    def self.process(document)

      site =
        document.site


      config =
        site.data["internal_links"]


      return unless config.is_a?(Hash)


      settings =
        DEFAULT_SETTINGS.merge(
          config["settings"] || {}
        )


      return unless settings["enabled"]


      graph =
        build_graph(site)


      return unless graph


      current_url =
        normalize_url(
          document.url
        )


      current =
        graph[:by_url][current_url]


      return unless current


      relations =
        find_relations(
          current,
          graph,
          settings,
          config
        )


      log_analysis(
        current,
        relations,
        settings
      )


      # ----------------------------------------------------------------------
      # Analysis-only mode.
      #
      # No content modification happens while this is true.
      # ----------------------------------------------------------------------

      return if
        settings["analysis_only"]


      # ----------------------------------------------------------------------
      # Automatic link insertion.
      # ----------------------------------------------------------------------

      new_content =
        insert_links(
          current,
          relations,
          settings
        )


      if new_content != current[:content]

        document.content =
          new_content

      end

    end


    # ========================================================================
    # BUILD CONTENT GRAPH
    # ========================================================================

    def self.build_graph(site)

      if site.instance_variable_defined?(
        :@embedded_nerd_internal_graph_v31
      )

        return site.instance_variable_get(
          :@embedded_nerd_internal_graph_v31
        )

      end


      products = []

      articles = []

      by_url = {}

      by_product_id = {}


      # ======================================================================
      # PRODUCTS IN SITE PAGES
      # ======================================================================

      site.pages.each do |page|

        data =
          page.data || {}


        next unless
          data["layout"].to_s == "product"


        product =
          build_product(page)


        next if
          product[:id].empty?


        add_product(
          product,
          products,
          by_url,
          by_product_id
        )

      end


      # ======================================================================
      # PRODUCTS IN COLLECTIONS
      # ======================================================================

      site.collections.each do |_label, collection|

        collection.docs.each do |document|

          data =
            document.data || {}


          next unless
            data["layout"].to_s == "product"


          product =
            build_product(document)


          next if
            product[:id].empty?


          add_product(
            product,
            products,
            by_url,
            by_product_id
          )

        end

      end


      # ======================================================================
      # POSTS
      # ======================================================================

      site.posts.docs.each do |post|

        article =
          build_article(post)


        add_article(
          article,
          articles,
          by_url
        )

      end


      # ======================================================================
      # EXPLICIT EDITORIAL PAGES
      # ======================================================================

      site.pages.each do |page|

        data =
          page.data || {}


        next if
          data["layout"].to_s == "product"


        next unless
          data["internal_links"] == true


        article =
          build_article(page)


        add_article(
          article,
          articles,
          by_url
        )

      end


      # ======================================================================
      # EDITORIAL COLLECTIONS
      # ======================================================================

      site.collections.each do |label, collection|

        # Posts are already processed above.
        next if
          label.to_s == "posts"


        collection.docs.each do |document|

          data =
            document.data || {}


          next if
            data["layout"].to_s == "product"


          next unless
            editorial_collection_document?(document)


          article =
            build_article(document)


          add_article(
            article,
            articles,
            by_url
          )

        end

      end


      graph = {

        products: products,

        articles: articles,

        by_url: by_url,

        by_product_id: by_product_id

      }


      build_product_article_index(
        graph
      )


      site.instance_variable_set(
        :@embedded_nerd_internal_graph_v31,
        graph
      )


      Jekyll.logger.info(
        "Embedded Nerd:",
        "Content Graph: " \
        "#{products.length} products, " \
        "#{articles.length} articles"
      )


      graph

    end


    # ========================================================================
    # PRODUCT / ARTICLE INDEX
    # ========================================================================

    def self.build_product_article_index(graph)

      graph[:product_articles] =
        Hash.new do |hash, key|

          hash[key] = []

        end


      # ----------------------------------------------------------------------
      # Required hardware relationships.
      # ----------------------------------------------------------------------

      graph[:articles].each do |article|

        article[:required_hardware].each do |product_id|

          next if
            product_id.empty?


          next unless
            graph[:by_product_id].key?(product_id)


          unless graph[:product_articles][product_id].include?(
            article[:id]
          )

            graph[:product_articles][product_id] << article[:id]

          end

        end

      end


      # ----------------------------------------------------------------------
      # Natural product mentions inside articles.
      # ----------------------------------------------------------------------

      graph[:articles].each do |article|

        graph[:products].each do |product|

          next if
            graph[:product_articles][product[:id]].include?(
              article[:id]
            )


          next unless
            product_mentioned_in_article?(
              product,
              article
            )


          graph[:product_articles][product[:id]] << article[:id]

        end

      end

    end


    # ========================================================================
    # BUILD PRODUCT
    # ========================================================================

    def self.build_product(document)

      data =
        document.data || {}


      product_id =
        data["product_id"].to_s.strip


      title =
        data["title"].to_s.strip


      text =
        [
          title,
          data["excerpt"],
          data["description"],
          data["manufacturer"],
          Array(data["tags"]).join(" "),
          Array(data["categories"]).join(" ")
        ].compact.join(" ")


      {

        type: :product,

        id: product_id,

        title: title,

        url: document.url,

        text:
          normalize_text(text),

        tokens:
          tokenize(text),

        tags:
          normalize_array(data["tags"]),

        categories:
          normalize_array(data["categories"]),

        related:
          normalize_ids(data["related"]),

        keywords:
          product_keywords(data),

        content:
          document.content.to_s

      }

    end


    # ========================================================================
    # BUILD ARTICLE
    # ========================================================================

    def self.build_article(document)

      data =
        document.data || {}


      title =
        data["title"].to_s.strip


      content =
        document.content.to_s


      text =
        [
          title,
          data["excerpt"],
          data["description"],
          Array(data["tags"]).join(" "),
          Array(data["categories"]).join(" "),
          content
        ].compact.join(" ")


      {

        type: :article,

        id:
          normalize_url(
            document.url
          ),

        title: title,

        url: document.url,

        text:
          normalize_text(text),

        tokens:
          tokenize(text),

        tags:
          normalize_array(data["tags"]),

        categories:
          normalize_array(data["categories"]),

        required_hardware:
          extract_hardware_ids(
            data["required_hardware"]
          ),

        related:
          normalize_ids(
            data["related"]
          ),

        keywords:
          article_keywords(data),

        content:
          content

      }

    end


    # ========================================================================
    # ADD PRODUCT
    # ========================================================================

    def self.add_product(
      product,
      products,
      by_url,
      by_product_id
    )

      return if
        product[:id].empty?


      return if
        by_product_id.key?(product[:id])


      normalized_url =
        normalize_url(
          product[:url]
        )


      return if
        by_url.key?(normalized_url)


      products << product


      by_url[normalized_url] =
        product


      by_product_id[product[:id]] =
        product

    end


    # ========================================================================
    # ADD ARTICLE
    # ========================================================================

    def self.add_article(
      article,
      articles,
      by_url
    )

      url =
        normalize_url(
          article[:url]
        )


      return if
        by_url.key?(url)


      articles << article


      by_url[url] =
        article

    end


    # ========================================================================
    # FIND RELATIONS
    # ========================================================================

    def self.find_relations(
      current,
      graph,
      settings,
      config
    )

      relations = []


      minimum =
        settings[
          "minimum_relevance"
        ].to_i


      # ======================================================================
      # ARTICLE
      # ======================================================================

      if current[:type] == :article

        # ---------------------------------------------------------------------
        # ARTICLE -> PRODUCT
        # ---------------------------------------------------------------------

        graph[:products].each do |product|

          score =
            article_product_score(
              current,
              product
            )


          next if
            score < minimum


          opportunity =
            find_link_opportunity(
              current,
              product
            )


          next unless
            opportunity


          relations << {

            type: "article_to_product",

            source: current,

            target: product,

            score: score,

            opportunity: opportunity

          }

        end


        # ---------------------------------------------------------------------
        # ARTICLE -> ARTICLE
        # ---------------------------------------------------------------------

        graph[:articles].each do |article|

          next if
            normalize_url(article[:url]) ==
            normalize_url(current[:url])


          score =
            article_article_score(
              current,
              article
            )


          next if
            score < minimum


          opportunity =
            find_link_opportunity(
              current,
              article
            )


          next unless
            opportunity


          relations << {

            type: "article_to_article",

            source: current,

            target: article,

            score: score,

            opportunity: opportunity

          }

        end

      end


      # ======================================================================
      # PRODUCT
      # ======================================================================

      if current[:type] == :product

        # ---------------------------------------------------------------------
        # PRODUCT -> ARTICLE
        # ---------------------------------------------------------------------

        graph[:articles].each do |article|

          score =
            product_article_score(
              current,
              article,
              graph
            )


          next if
            score < minimum


          opportunity =
            find_link_opportunity(
              current,
              article
            )


          next unless
            opportunity


          relations << {

            type: "product_to_article",

            source: current,

            target: article,

            score: score,

            opportunity: opportunity

          }

        end


        # ---------------------------------------------------------------------
        # PRODUCT -> PRODUCT
        #
        # V3.1 is deliberately conservative.
        #
        # Only:
        #
        #   - explicit related relationship
        #   - shared article
        #
        # can create a product -> product relationship.
        # ---------------------------------------------------------------------

        graph[:products].each do |product|

          next if
            product[:id] == current[:id]


          score =
            product_product_score(
              current,
              product,
              graph
            )


          next if
            score < minimum


          opportunity =
            find_link_opportunity(
              current,
              product
            )


          next unless
            opportunity


          relations << {

            type: "product_to_product",

            source: current,

            target: product,

            score: score,

            opportunity: opportunity

          }

        end

      end


      relations.sort_by! do |relation|

        -relation[:score]

      end


      relations

    end


    # ========================================================================
    # ARTICLE -> PRODUCT
    # ========================================================================

    def self.article_product_score(
      article,
      product
    )

      # ----------------------------------------------------------------------
      # Required hardware is definitive.
      # ----------------------------------------------------------------------

      if article[:required_hardware].include?(
        product[:id]
      )

        return 100

      end


      score = 0


      # ----------------------------------------------------------------------
      # Natural product keyword mention.
      # ----------------------------------------------------------------------

      if product_keyword_match?(
        article,
        product
      )

        score += 65

      end


      # ----------------------------------------------------------------------
      # Shared tags.
      #
      # Tags influence relevance only.
      # They can NEVER become anchor text.
      # ----------------------------------------------------------------------

      score +=
        [
          shared_values_score(
            article[:tags],
            product[:tags],
            3
          ),
          10
        ].min


      # ----------------------------------------------------------------------
      # Shared categories.
      # ----------------------------------------------------------------------

      score +=
        [
          shared_values_score(
            article[:categories],
            product[:categories],
            3
          ),
          6
        ].min


      # ----------------------------------------------------------------------
      # Text similarity.
      # ----------------------------------------------------------------------

      score +=
        [
          token_similarity(
            article[:tokens],
            product[:tokens]
          ),
          8
        ].min


      [score, 100].min

    end


    # ========================================================================
    # ARTICLE -> ARTICLE
    # ========================================================================

    def self.article_article_score(
      article_a,
      article_b
    )

      score = 0


      # ----------------------------------------------------------------------
      # Shared required hardware.
      # ----------------------------------------------------------------------

      shared_hardware =
        (
          article_a[:required_hardware] &
          article_b[:required_hardware]
        )


      score +=
        [
          shared_hardware.length * 20,
          40
        ].min


      # ----------------------------------------------------------------------
      # Shared tags.
      # ----------------------------------------------------------------------

      score +=
        [
          shared_values_score(
            article_a[:tags],
            article_b[:tags],
            4
          ),
          12
        ].min


      # ----------------------------------------------------------------------
      # Shared categories.
      # ----------------------------------------------------------------------

      score +=
        [
          shared_values_score(
            article_a[:categories],
            article_b[:categories],
            4
          ),
          8
        ].min


      # ----------------------------------------------------------------------
      # Text similarity.
      # ----------------------------------------------------------------------

      score +=
        [
          token_similarity(
            article_a[:tokens],
            article_b[:tokens]
          ),
          15
        ].min


      [score, 100].min

    end


    # ========================================================================
    # PRODUCT -> ARTICLE
    # ========================================================================

    def self.product_article_score(
      product,
      article,
      graph
    )

      score = 0


      # ----------------------------------------------------------------------
      # Required hardware.
      # ----------------------------------------------------------------------

      if article[:required_hardware].include?(
        product[:id]
      )

        score += 100

      else

        # --------------------------------------------------------------------
        # Explicit/natural product mention.
        # --------------------------------------------------------------------

        if product_mentioned_in_article?(
          product,
          article
        )

          score += 65

        end


        # --------------------------------------------------------------------
        # Product/article relationship from content graph.
        # --------------------------------------------------------------------

        if graph[:product_articles][
          product[:id]
        ].include?(
          article[:id]
        )

          score += 15

        end


        # --------------------------------------------------------------------
        # Shared tags.
        # --------------------------------------------------------------------

        score +=
          [
            shared_values_score(
              product[:tags],
              article[:tags],
              3
            ),
            8
          ].min


        # --------------------------------------------------------------------
        # Shared categories.
        # --------------------------------------------------------------------

        score +=
          [
            shared_values_score(
              product[:categories],
              article[:categories],
              3
            ),
            6
          ].min

      end


      [score, 100].min

    end


    # ========================================================================
    # PRODUCT -> PRODUCT
    # ========================================================================
    #
    # V3.1 deliberately removes generic tag/category/text scoring.
    #
    # A product-to-product relationship must have a meaningful connection:
    #
    #   1. Explicit related: relationship
    #   2. Both products used/mentioned by the same article(s)
    #
    # This prevents:
    #
    #   Raspberry Pi -> unrelated product
    #   Arduino -> unrelated product
    #   Electronics -> unrelated product
    #
    # from becoming anchors.
    #
    # ========================================================================

    def self.product_product_score(
      product_a,
      product_b,
      graph
    )

      score = 0


      # ----------------------------------------------------------------------
      # Explicit related relationship.
      # ----------------------------------------------------------------------

      if product_a[:related].include?(
        product_b[:id]
      )

        score += 60

      end


      if product_b[:related].include?(
        product_a[:id]
      )

        score += 60

      end


      # ----------------------------------------------------------------------
      # Shared articles.
      # ----------------------------------------------------------------------

      articles_a =
        graph[:product_articles][
          product_a[:id]
        ]


      articles_b =
        graph[:product_articles][
          product_b[:id]
        ]


      shared_articles =
        (
          articles_a &
          articles_b
        )


      unless shared_articles.empty?

        score +=
          [
            shared_articles.length * 25,
            50
          ].min

      end


      [score, 100].min

    end


    # ========================================================================
    # PRODUCT KEYWORD MATCH
    # ========================================================================

    def self.product_keyword_match?(
      article,
      product
    )

      product[:keywords].any? do |keyword|

        value =
          normalize_text(
            keyword
          )


        next false if
          value.empty?


        normalized_article =
          article[:text]


        normalized_article.include?(
          value
        )

      end

    end


    # ========================================================================
    # PRODUCT MENTIONED IN ARTICLE
    # ========================================================================

    def self.product_mentioned_in_article?(
      product,
      article
    )

      product_keyword_match?(
        article,
        product
      )

    end


    # ========================================================================
    # FIND REAL LINK OPPORTUNITY
    # ========================================================================
    #
    # The engine ONLY creates a relationship when a natural anchor actually
    # exists in the source content.
    #
    # It NEVER uses generic tags or categories as anchors.
    #
    # ========================================================================

    def self.find_link_opportunity(
      source,
      target
    )

      return nil if
        existing_link?(
          source,
          target[:url]
        )


      keywords = []


      # ----------------------------------------------------------------------
      # Product target.
      # ----------------------------------------------------------------------

      if target[:type] == :product

        keywords =
          target[:keywords].dup

      end


      # ----------------------------------------------------------------------
      # Article target.
      #
      # Only article title + explicit keywords.
      #
      # Tags are deliberately NOT used as anchors.
      # ----------------------------------------------------------------------

      if target[:type] == :article

        keywords << target[:title]


        keywords.concat(
          target[:keywords]
        )

      end


      # ----------------------------------------------------------------------
      # Clean keywords.
      # ----------------------------------------------------------------------

      keywords =
        keywords
          .map do |keyword|

            keyword.to_s.strip

          end
          .reject do |keyword|

            keyword.empty?

          end
          .uniq
          .sort_by do |keyword|

            -keyword.length

          end


      # ----------------------------------------------------------------------
      # Find first natural occurrence.
      # ----------------------------------------------------------------------

      keywords.each do |keyword|

        opportunity =
          find_keyword_occurrence(
            source[:content],
            keyword
          )


        return opportunity if
          opportunity

      end


      nil

    end


    # ========================================================================
    # FIND KEYWORD OCCURRENCE
    # ========================================================================

    def self.find_keyword_occurrence(
      content,
      keyword
    )

      return nil if
        content.to_s.empty?


      return nil if
        keyword.to_s.empty?


      # ----------------------------------------------------------------------
      # Protect HTML elements.
      # ----------------------------------------------------------------------

      protected_pattern =
        /<(#{PROTECTED_TAGS.join("|")})(?:\s[^>]*)?>.*?<\/\1>/im


      masked_content =
        content.gsub(
          protected_pattern
        ) do |match|

          " " * match.length

        end


      # ----------------------------------------------------------------------
      # Protect Markdown links.
      # ----------------------------------------------------------------------

      markdown_pattern =
        /!?\[[^\]]+\]\([^)]+\)/


      masked_content =
        masked_content.gsub(
          markdown_pattern
        ) do |match|

          " " * match.length

        end


      # ----------------------------------------------------------------------
      # Escape keyword.
      # ----------------------------------------------------------------------

      escaped =
        Regexp.escape(
          keyword
        )


      # ----------------------------------------------------------------------
      # Natural word boundary.
      # ----------------------------------------------------------------------

      pattern =
        /(?<![\w\-])#{escaped}(?![\w\-])/i


      match =
        pattern.match(
          masked_content
        )


      return nil unless
        match


      {
        keyword: match[0],

        index: match.begin(0),

        length: match[0].length
      }

    end


    # ========================================================================
    # INSERT LINKS
    # ========================================================================

    def self.insert_links(
      current,
      relations,
      settings
    )

      content =
        current[:content].to_s


      return content if
        content.empty?


      total =
        0


      product_links =
        0


      article_links =
        0


      used_targets = []


      # ----------------------------------------------------------------------
      # Highest relevance first.
      # ----------------------------------------------------------------------

      relations.each do |relation|

        break if
          total >= settings[
            "max_total_links_per_page"
          ].to_i


        target_url =
          normalize_url(
            relation[:target][:url]
          )


        next if
          used_targets.include?(
            target_url
          )


        # ---------------------------------------------------------------------
        # Product limit.
        # ---------------------------------------------------------------------

        if relation[:type].include?(
          "product"
        )

          next if
            product_links >= settings[
              "max_product_links_per_page"
            ].to_i

        else

          # -------------------------------------------------------------------
          # Article limit.
          # -------------------------------------------------------------------

          next if
            article_links >= settings[
              "max_article_links_per_page"
            ].to_i

        end


        # ---------------------------------------------------------------------
        # Recalculate opportunity because content changes after each link.
        # ---------------------------------------------------------------------

        opportunity =
          find_link_opportunity(
            {
              content: content
            }.merge(current),
            relation[:target]
          )


        next unless
          opportunity


        keyword =
          opportunity[:keyword]


        escaped_keyword =
          Regexp.escape(
            keyword
          )


        href =
          target_url.gsub(
            '"',
            "&quot;"
          )


        # ---------------------------------------------------------------------
        # Replace only safe natural occurrence.
        # ---------------------------------------------------------------------

        pattern =
          /(?<![\w\-\[])#{escaped_keyword}(?![\w\-])/i


        replacement =
          %(<a href="#{href}">#{keyword}</a>)


        new_content =
          replace_first_safe_occurrence(
            content,
            pattern,
            replacement
          )


        next if
          new_content == content


        content =
          new_content


        used_targets << target_url


        total += 1


        if relation[:type].include?(
          "product"
        )

          product_links += 1

        else

          article_links += 1

        end

      end


      content

    end


    # ========================================================================
    # SAFE FIRST OCCURRENCE REPLACEMENT
    # ========================================================================

    def self.replace_first_safe_occurrence(
      content,
      pattern,
      replacement
    )

      protected_parts = []


      # ----------------------------------------------------------------------
      # Protect HTML elements.
      # ----------------------------------------------------------------------

      protected_pattern =
        /<(#{PROTECTED_TAGS.join("|")})(?:\s[^>]*)?>.*?<\/\1>/im


      working =
        content.gsub(
          protected_pattern
        ) do |match|

          placeholder =
            "__EN_PROTECTED_#{protected_parts.length}__"


          protected_parts << match


          placeholder

        end


      # ----------------------------------------------------------------------
      # Protect Markdown links.
      # ----------------------------------------------------------------------

      markdown_parts = []


      working =
        working.gsub(
          /!?\[[^\]]+\]\([^)]+\)/
        ) do |match|

          placeholder =
            "__EN_MARKDOWN_#{markdown_parts.length}__"


          markdown_parts << match


          placeholder

        end


      # ----------------------------------------------------------------------
      # Protect inline code.
      # ----------------------------------------------------------------------

      inline_parts = []


      working =
        working.gsub(
          /`[^`\n]+`/
        ) do |match|

          placeholder =
            "__EN_INLINE_#{inline_parts.length}__"


          inline_parts << match


          placeholder

        end


      # ----------------------------------------------------------------------
      # Replace only one occurrence.
      # ----------------------------------------------------------------------

      replaced =
        working.sub(
          pattern,
          replacement
        )


      return content if
        replaced == working


      # ----------------------------------------------------------------------
      # Restore Markdown links.
      # ----------------------------------------------------------------------

      markdown_parts.each_with_index do |original, index|

        replaced =
          replaced.gsub(
            "__EN_MARKDOWN_#{index}__",
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore inline code.
      # ----------------------------------------------------------------------

      inline_parts.each_with_index do |original, index|

        replaced =
          replaced.gsub(
            "__EN_INLINE_#{index}__",
            original
          )

      end


      # ----------------------------------------------------------------------
      # Restore protected HTML.
      # ----------------------------------------------------------------------

      protected_parts.each_with_index do |original, index|

        replaced =
          replaced.gsub(
            "__EN_PROTECTED_#{index}__",
            original
          )

      end


      replaced

    end


    # ========================================================================
    # EXISTING LINK DETECTION
    # ========================================================================

    def self.existing_link?(
      source,
      target_url
    )

      content =
        source[:content].to_s


      return false if
        content.empty?


      normalized =
        normalize_url(
          target_url
        )


      # ----------------------------------------------------------------------
      # HTML href with trailing slash.
      # ----------------------------------------------------------------------

      escaped =
        Regexp.escape(
          normalized
        )


      html_pattern =
        /href\s*=\s*["']#{escaped}["']/i


      return true if
        content.match?(
          html_pattern
        )


      # ----------------------------------------------------------------------
      # Markdown link with trailing slash.
      # ----------------------------------------------------------------------

      markdown_pattern =
        /\]\(\s*#{escaped}(?:[#?][^)]*)?\s*\)/i


      return true if
        content.match?(
          markdown_pattern
        )


      # ----------------------------------------------------------------------
      # Without trailing slash.
      # ----------------------------------------------------------------------

      no_slash =
        normalized.chomp("/")


      return false if
        no_slash.empty?


      escaped_no_slash =
        Regexp.escape(
          no_slash
        )


      html_no_slash =
        /href\s*=\s*["']#{escaped_no_slash}["']/i


      return true if
        content.match?(
          html_no_slash
        )


      markdown_no_slash =
        /\]\(\s*#{escaped_no_slash}(?:[#?][^)]*)?\s*\)/i


      return true if
        content.match?(
          markdown_no_slash
        )


      false

    end


    # ========================================================================
    # PRODUCT KEYWORDS
    # ========================================================================
    #
    # IMPORTANT:
    #
    # Tags and categories are NOT anchors.
    #
    # Only:
    #
    #   - product_id
    #   - title
    #   - explicit internal_link_keywords
    #
    # are allowed to become product anchors.
    #
    # ========================================================================

    def self.product_keywords(data)

      keywords = []


      # ----------------------------------------------------------------------
      # Product ID.
      # ----------------------------------------------------------------------

      product_id =
        data["product_id"].to_s.strip


      keywords << product_id unless
        product_id.empty?


      # ----------------------------------------------------------------------
      # Product title.
      # ----------------------------------------------------------------------

      title =
        data["title"].to_s.strip


      keywords << title unless
        title.empty?


      # ----------------------------------------------------------------------
      # Explicit custom keywords.
      # ----------------------------------------------------------------------

      Array(
        data["internal_link_keywords"]
      ).each do |keyword|

        value =
          keyword.to_s.strip


        keywords << value unless
          value.empty?

      end


      # ----------------------------------------------------------------------
      # Clean duplicates.
      # ----------------------------------------------------------------------

      keywords
        .uniq
        .sort_by do |keyword|

          -keyword.length

        end

    end


    # ========================================================================
    # ARTICLE KEYWORDS
    # ========================================================================
    #
    # Article title is the default natural anchor.
    #
    # Optional:
    #
    # internal_link_keywords:
    #   - "I2C scanner"
    #   - "scan I2C devices"
    #
    # ========================================================================

    def self.article_keywords(data)

      keywords = []


      title =
        data["title"].to_s.strip


      keywords << title unless
        title.empty?


      Array(
        data["internal_link_keywords"]
      ).each do |keyword|

        value =
          keyword.to_s.strip


        keywords << value unless
          value.empty?

      end


      keywords
        .uniq
        .sort_by do |keyword|

          -keyword.length

        end

    end


    # ========================================================================
    # REQUIRED HARDWARE
    # ========================================================================

    def self.extract_hardware_ids(value)

      return [] unless
        value.is_a?(Array)


      value.map do |item|

        if item.is_a?(Hash)

          item["id"].to_s.strip

        else

          item.to_s.strip

        end

      end.reject do |id|

        id.empty?

      end

    end


    # ========================================================================
    # EDITORIAL COLLECTION
    # ========================================================================

    def self.editorial_collection_document?(document)

      data =
        document.data || {}


      return true if
        data["internal_links"] == true


      EDITORIAL_LAYOUTS.include?(
        data["layout"].to_s
      )

    end


    # ========================================================================
    # SHARED VALUES
    # ========================================================================

    def self.shared_values_score(
      a,
      b,
      points
    )

      (
        a & b
      ).length * points

    end


    # ========================================================================
    # TOKEN SIMILARITY
    # ========================================================================

    def self.token_similarity(
      tokens_a,
      tokens_b
    )

      return 0 if
        tokens_a.empty? ||
        tokens_b.empty?


      shared =
        (
          tokens_a &
          tokens_b
        )


      return 0 if
        shared.empty?


      [
        shared.length * 2,
        20
      ].min

    end


    # ========================================================================
    # TOKENIZER
    # ========================================================================

    def self.tokenize(text)

      stopwords = %w[

        the
        and
        or
        for
        with
        this
        that
        from
        into
        using
        use
        used
        are
        is
        to
        of
        a
        an
        in
        on
        our
        your
        how
        what
        can
        will
        be

        tutorial
        guide
        project
        projects
        display
        code
        example
        learn

        common
        popular
        embedded
        electronics
        device
        devices

      ]


      normalize_text(text)
        .scan(
          /[a-z0-9][a-z0-9_-]{2,}/
        )
        .reject do |word|

          stopwords.include?(word)

        end
        .uniq

    end


    # ========================================================================
    # NORMALIZE TEXT
    # ========================================================================

    def self.normalize_text(value)

      value.to_s
        .downcase
        .gsub(
          /[^a-z0-9_\-\s]/,
          " "
        )
        .gsub(
          /\s+/,
          " "
        )
        .strip

    end


    # ========================================================================
    # NORMALIZE ARRAY
    # ========================================================================

    def self.normalize_array(value)

      Array(value)
        .map do |item|

          normalize_text(item)

        end
        .reject do |item|

          item.empty?

        end
        .uniq

    end


    # ========================================================================
    # NORMALIZE IDS
    # ========================================================================

    def self.normalize_ids(value)

      Array(value)
        .map do |item|

          if item.is_a?(Hash)

            item["id"].to_s.strip

          else

            item.to_s.strip

          end

        end
        .reject do |item|

          item.empty?

        end

    end


    # ========================================================================
    # NORMALIZE URL
    # ========================================================================

    def self.normalize_url(url)

      value =
        url.to_s.strip


      value =
        value.split("#").first


      value =
        value.split("?").first


      value =
        "/" if
          value.empty?


      value =
        "/#{value}" unless
          value.start_with?("/")


      value =
        value.chomp("/")


      return "/" if
        value.empty?


      "#{value}/"

    end


    # ========================================================================
    # ANALYSIS LOG
    # ========================================================================

    def self.log_analysis(
      current,
      relations,
      settings
    )

      limit =
        settings[
          "analysis_results_per_page"
        ].to_i


      limit =
        5 if
          limit <= 0


      Jekyll.logger.info(
        "Embedded Nerd:",
        "============================================================"
      )


      Jekyll.logger.info(
        "Embedded Nerd:",
        "Internal Link Analysis V3.1"
      )


      Jekyll.logger.info(
        "Embedded Nerd:",
        "#{current[:type].to_s.upcase}: #{current[:title]}"
      )


      Jekyll.logger.info(
        "Embedded Nerd:",
        "URL: #{current[:url]}"
      )


      if relations.empty?

        Jekyll.logger.info(
          "Embedded Nerd:",
          "No linkable relationships found."
        )

      else

        relations.first(limit).each do |relation|

          anchor =
            relation[:opportunity][:keyword]


          Jekyll.logger.info(
            "Embedded Nerd:",
            "#{relation[:type]} | " \
            "#{relation[:target][:title]} | " \
            "score=#{relation[:score]} | " \
            "anchor=\"#{anchor}\" | " \
            "#{relation[:target][:url]}"
          )

        end

      end


      Jekyll.logger.info(
        "Embedded Nerd:",
        "============================================================"
      )

    end

  end

end


# ============================================================================
# JEKYLL HOOKS
# ============================================================================
#
# Important:
#
# :posts handles posts.
# :pages handles pages.
# :documents handles collection documents.
#
# Posts are explicitly skipped inside :documents so they are not processed
# twice.
#
# ============================================================================


Jekyll::Hooks.register :posts, :pre_render do |post|

  EmbeddedNerd::InternalLinker.process(
    post
  )

end


Jekyll::Hooks.register :pages, :pre_render do |page|

  EmbeddedNerd::InternalLinker.process(
    page
  )

end


Jekyll::Hooks.register :documents, :pre_render do |document|

  data =
    document.data || {}


  # --------------------------------------------------------------------------
  # Posts are already handled by the :posts hook.
  # --------------------------------------------------------------------------

  if document.respond_to?(:collection) &&
     document.collection &&
     document.collection.label.to_s == "posts"

    next

  end


  # --------------------------------------------------------------------------
  # Products.
  # --------------------------------------------------------------------------

  if data["layout"].to_s == "product"

    EmbeddedNerd::InternalLinker.process(
      document
    )


  # --------------------------------------------------------------------------
  # Explicitly enabled documents.
  # --------------------------------------------------------------------------

  elsif data["internal_links"] == true

    EmbeddedNerd::InternalLinker.process(
      document
    )


  # --------------------------------------------------------------------------
  # Editorial layouts.
  # --------------------------------------------------------------------------

  elsif EmbeddedNerd::InternalLinker::EDITORIAL_LAYOUTS.include?(
    data["layout"].to_s
  )

    EmbeddedNerd::InternalLinker.process(
      document
    )

  end

end
