# ============================================================================
# Embedded Nerd - Internal Link Engine V2.2
# ============================================================================
#
# Jekyll 3.10 compatible
#
# ANALYSIS MODE
#
# Article -> Product
# Article -> Article
# Product -> Article
# Product -> Product
#
# No pages are modified while:
#
#   analysis_only: true
#
# ============================================================================

module EmbeddedNerd

  module InternalLinker

    # ------------------------------------------------------------------------
    # Default settings
    # ------------------------------------------------------------------------

    DEFAULT_SETTINGS = {
      "enabled" => true,
      "analysis_only" => true,

      "max_total_links_per_page" => 5,
      "max_product_links_per_page" => 2,
      "max_article_links_per_page" => 2,

      "minimum_relevance" => 60,

      "analysis_results_per_page" => 5
    }.freeze


    # ------------------------------------------------------------------------
    # IMPORTANT:
    #
    # Only these layouts are considered editorial.
    #
    # Normal _pages such as About, Contact, Products, etc. are NOT included
    # unless they explicitly contain:
    #
    #   internal_links: true
    # ------------------------------------------------------------------------

    EDITORIAL_LAYOUTS = %w[
      article
      post
      tutorial
    ].freeze


    # =========================================================================
    # MAIN PROCESSOR
    # =========================================================================

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


      # ----------------------------------------------------------------------
      # Build the graph once per build.
      # ----------------------------------------------------------------------

      graph =
        build_graph(site)


      return unless graph


      current_url =
        normalize_url(document.url)


      current =
        graph[:by_url][current_url]


      return unless current


      # ----------------------------------------------------------------------
      # Analyse current document.
      # ----------------------------------------------------------------------

      relations =
        find_relations(
          current,
          graph,
          settings,
          config
        )


      # ----------------------------------------------------------------------
      # ANALYSIS MODE
      # ----------------------------------------------------------------------

      if settings["analysis_only"]

        log_analysis(
          current,
          relations,
          settings
        )

        return

      end


      # ----------------------------------------------------------------------
      # Automatic linking will only be enabled after the graph is validated.
      # ----------------------------------------------------------------------

      log_analysis(
        current,
        relations,
        settings
      )

    end


    # =========================================================================
    # BUILD CONTENT GRAPH
    # =========================================================================

    def self.build_graph(site)

      if site.instance_variable_defined?(
        :@embedded_nerd_internal_graph
      )

        return site.instance_variable_get(
          :@embedded_nerd_internal_graph
        )

      end


      products = []

      articles = []

      by_url = {}

      by_product_id = {}


      # =======================================================================
      # PRODUCTS
      # =======================================================================

      # -----------------------------------------------------------------------
      # Products stored as normal Jekyll pages.
      # -----------------------------------------------------------------------

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


      # -----------------------------------------------------------------------
      # Products stored in collections.
      # -----------------------------------------------------------------------

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


      # =======================================================================
      # ARTICLES
      # =======================================================================

      # -----------------------------------------------------------------------
      # Posts are always articles.
      # -----------------------------------------------------------------------

      site.posts.docs.each do |post|

        article =
          build_article(post)


        add_article(
          article,
          articles,
          by_url
        )

      end


      # -----------------------------------------------------------------------
      # Normal pages are ONLY included when explicitly enabled.
      #
      # Example:
      #
      # internal_links: true
      # -----------------------------------------------------------------------

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


      # -----------------------------------------------------------------------
      # Editorial collection documents.
      #
      # Posts are already handled above.
      # -----------------------------------------------------------------------

      site.collections.each do |label, collection|

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


      # =======================================================================
      # CREATE GRAPH
      # =======================================================================

      graph = {

        products: products,

        articles: articles,

        by_url: by_url,

        by_product_id: by_product_id

      }


      site.instance_variable_set(
        :@embedded_nerd_internal_graph,
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


    # =========================================================================
    # ADD PRODUCT
    # =========================================================================

    def self.add_product(
      product,
      products,
      by_url,
      by_product_id
    )

      return if
        by_product_id.key?(product[:id])


      products << product


      by_url[
        normalize_url(product[:url])
      ] = product


      by_product_id[
        product[:id]
      ] = product

    end


    # =========================================================================
    # ADD ARTICLE
    # =========================================================================

    def self.add_article(
      article,
      articles,
      by_url
    )

      url =
        normalize_url(article[:url])


      return if
        by_url.key?(url)


      articles << article


      by_url[url] =
        article

    end


    # =========================================================================
    # BUILD PRODUCT
    # =========================================================================

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

        text: normalize_text(text),

        tokens: tokenize(text),

        tags:
          normalize_array(
            data["tags"]
          ),

        categories:
          normalize_array(
            data["categories"]
          ),

        related:
          normalize_ids(
            data["related"]
          ),

        keywords:
          product_keywords(
            data
          )

      }

    end


    # =========================================================================
    # BUILD ARTICLE
    # =========================================================================

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
          normalize_array(
            data["tags"]
          ),

        categories:
          normalize_array(
            data["categories"]
          ),

        required_hardware:
          extract_hardware_ids(
            data["required_hardware"]
          ),

        related:
          normalize_ids(
            data["related"]
          )

      }

    end


    # =========================================================================
    # FIND RELATIONS
    # =========================================================================

    def self.find_relations(
      current,
      graph,
      settings,
      config
    )

      relations = []


      # =======================================================================
      # ARTICLE
      # =======================================================================

      if current[:type] == :article

        # ---------------------------------------------------------------------
        # Article -> Product
        # ---------------------------------------------------------------------

        graph[:products].each do |product|

          score =
            article_product_score(
              current,
              product,
              config
            )


          if score >= settings[
            "minimum_relevance"
          ].to_i

            relations << {

              type: "article_to_product",

              source: current,

              target: product,

              score: score

            }

          end

        end


        # ---------------------------------------------------------------------
        # Article -> Article
        # ---------------------------------------------------------------------

        graph[:articles].each do |article|

          next if
            article[:url] == current[:url]


          score =
            article_article_score(
              current,
              article
            )


          if score >= settings[
            "minimum_relevance"
          ].to_i

            relations << {

              type: "article_to_article",

              source: current,

              target: article,

              score: score

            }

          end

        end

      end


      # =======================================================================
      # PRODUCT
      # =======================================================================

      if current[:type] == :product

        # ---------------------------------------------------------------------
        # Product -> Article
        # ---------------------------------------------------------------------

        graph[:articles].each do |article|

          score =
            product_article_score(
              current,
              article
            )


          if score >= settings[
            "minimum_relevance"
          ].to_i

            relations << {

              type: "product_to_article",

              source: current,

              target: article,

              score: score

            }

          end

        end


        # ---------------------------------------------------------------------
        # Product -> Product
        # ---------------------------------------------------------------------

        graph[:products].each do |product|

          next if
            product[:id] == current[:id]


          score =
            product_product_score(
              current,
              product
            )


          if score >= settings[
            "minimum_relevance"
          ].to_i

            relations << {

              type: "product_to_product",

              source: current,

              target: product,

              score: score

            }

          end

        end

      end


      # -----------------------------------------------------------------------
      # Highest scores first.
      # -----------------------------------------------------------------------

      relations.sort_by! do |relation|

        -relation[:score]

      end


      relations

    end


    # =========================================================================
    # ARTICLE -> PRODUCT
    # =========================================================================

    def self.article_product_score(
      article,
      product,
      config
    )

      score = 0


      # -----------------------------------------------------------------------
      # REQUIRED HARDWARE
      #
      # This is the strongest possible relationship.
      # -----------------------------------------------------------------------

      if article[:required_hardware].include?(
        product[:id]
      )

        score += 100

        return 100

      end


      # -----------------------------------------------------------------------
      # Exact product keyword.
      # -----------------------------------------------------------------------

      product[:keywords].each do |keyword|

        normalized_keyword =
          normalize_text(keyword)


        next if
          normalized_keyword.empty?


        if article[:text].include?(
          normalized_keyword
        )

          score += 45

          break

        end

      end


      # -----------------------------------------------------------------------
      # Shared tags.
      # -----------------------------------------------------------------------

      score +=
        shared_values_score(
          article[:tags],
          product[:tags],
          5
        )


      # -----------------------------------------------------------------------
      # Shared categories.
      # -----------------------------------------------------------------------

      score +=
        shared_values_score(
          article[:categories],
          product[:categories],
          8
        )


      # -----------------------------------------------------------------------
      # Token similarity.
      # -----------------------------------------------------------------------

      score +=
        token_similarity(
          article[:tokens],
          product[:tokens]
        )


      [score, 100].min

    end


    # =========================================================================
    # ARTICLE -> ARTICLE
    # =========================================================================

    def self.article_article_score(
      article_a,
      article_b
    )

      score = 0


      # -----------------------------------------------------------------------
      # Shared hardware.
      # -----------------------------------------------------------------------

      shared_hardware =
        (
          article_a[:required_hardware] &
          article_b[:required_hardware]
        )


      score +=
        shared_hardware.length * 30


      # -----------------------------------------------------------------------
      # Shared tags.
      # -----------------------------------------------------------------------

      score +=
        shared_values_score(
          article_a[:tags],
          article_b[:tags],
          6
        )


      # -----------------------------------------------------------------------
      # Shared categories.
      # -----------------------------------------------------------------------

      score +=
        shared_values_score(
          article_a[:categories],
          article_b[:categories],
          8
        )


      # -----------------------------------------------------------------------
      # Token similarity.
      # -----------------------------------------------------------------------

      score +=
        token_similarity(
          article_a[:tokens],
          article_b[:tokens]
        )


      [score, 100].min

    end


    # =========================================================================
    # PRODUCT -> ARTICLE
    # =========================================================================

    def self.product_article_score(
      product,
      article
    )

      article_product_score(
        article,
        product,
        {}
      )

    end


    # =========================================================================
    # PRODUCT -> PRODUCT
    # =========================================================================

    def self.product_product_score(
      product_a,
      product_b
    )

      score = 0


      # -----------------------------------------------------------------------
      # Explicit related relationship.
      # -----------------------------------------------------------------------

      if product_a[:related].include?(
        product_b[:id]
      )

        score += 80

      end


      if product_b[:related].include?(
        product_a[:id]
      )

        score += 80

      end


      # -----------------------------------------------------------------------
      # Shared categories.
      # -----------------------------------------------------------------------

      score +=
        shared_values_score(
          product_a[:categories],
          product_b[:categories],
          12
        )


      # -----------------------------------------------------------------------
      # Shared tags.
      # -----------------------------------------------------------------------

      score +=
        shared_values_score(
          product_a[:tags],
          product_b[:tags],
          6
        )


      # -----------------------------------------------------------------------
      # Token similarity.
      # -----------------------------------------------------------------------

      score +=
        token_similarity(
          product_a[:tokens],
          product_b[:tokens]
        )


      [score, 100].min

    end


    # =========================================================================
    # AUTOMATIC PRODUCT KEYWORDS
    # =========================================================================

    def self.product_keywords(data)

      keywords = []


      # -----------------------------------------------------------------------
      # Product ID.
      # -----------------------------------------------------------------------

      product_id =
        data["product_id"].to_s.strip


      unless product_id.empty?

        keywords << product_id

      end


      # -----------------------------------------------------------------------
      # Product title.
      # -----------------------------------------------------------------------

      title =
        data["title"].to_s.strip


      unless title.empty?

        keywords << title

      end


      # -----------------------------------------------------------------------
      # Tags.
      # -----------------------------------------------------------------------

      Array(data["tags"]).each do |tag|

        value =
          tag.to_s.strip


        unless value.empty?

          keywords << value

        end

      end


      # -----------------------------------------------------------------------
      # Optional manual keywords.
      # -----------------------------------------------------------------------

      Array(
        data["internal_link_keywords"]
      ).each do |keyword|

        value =
          keyword.to_s.strip


        unless value.empty?

          keywords << value

        end

      end


      keywords.uniq

    end


    # =========================================================================
    # REQUIRED HARDWARE
    # =========================================================================

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


    # =========================================================================
    # SHARED VALUES
    # =========================================================================

    def self.shared_values_score(
      a,
      b,
      points
    )

      (
        a & b
      ).length * points

    end


    # =========================================================================
    # TOKEN SIMILARITY
    # =========================================================================

    def self.token_similarity(
      tokens_a,
      tokens_b
    )

      return 0 if
        tokens_a.empty? ||
        tokens_b.empty?


      shared =
        (
          tokens_a & tokens_b
        )


      return 0 if
        shared.empty?


      # Generic terms have deliberately low influence.
      score =
        shared.length * 2


      [score, 20].min

    end


    # =========================================================================
    # TOKENIZER
    # =========================================================================

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
        learn
        using
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


    # =========================================================================
    # NORMALIZE TEXT
    # =========================================================================

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


    # =========================================================================
    # NORMALIZE ARRAY
    # =========================================================================

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


    # =========================================================================
    # NORMALIZE IDS
    # =========================================================================

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


    # =========================================================================
    # EDITORIAL COLLECTION DOCUMENT
    # =========================================================================

    def self.editorial_collection_document?(document)

      data =
        document.data || {}


      return true if
        data["internal_links"] == true


      layout =
        data["layout"].to_s


      EDITORIAL_LAYOUTS.include?(layout)

    end


    # =========================================================================
    # NORMALIZE URL
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
        "/#{value}" unless
          value.start_with?("/")


      value =
        value.chomp("/")


      return "/" if
        value.empty?


      "#{value}/"

    end


    # =========================================================================
    # ANALYSIS LOG
    # =========================================================================

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
        5 if limit <= 0


      Jekyll.logger.info(
        "Embedded Nerd:",
        "============================================================"
      )


      Jekyll.logger.info(
        "Embedded Nerd:",
        "Internal Link Analysis"
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
          "No relevant relationships found."
        )

      else

        relations.first(limit).each do |relation|

          Jekyll.logger.info(
            "Embedded Nerd:",
            "#{relation[:type]} | " \
            "#{relation[:target][:title]} | " \
            "score=#{relation[:score]} | " \
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
# Jekyll hooks
# ============================================================================

Jekyll::Hooks.register :posts, :pre_render do |post|

  EmbeddedNerd::InternalLinker.process(post)

end


Jekyll::Hooks.register :pages, :pre_render do |page|

  EmbeddedNerd::InternalLinker.process(page)

end


# ----------------------------------------------------------------------------
# Process product collection documents.
#
# We register a generic hook for collections because product pages may live
# inside a custom collection rather than normal site.pages.
# ----------------------------------------------------------------------------

Jekyll::Hooks.register :documents, :pre_render do |document|

  data =
    document.data || {}


  if data["layout"].to_s == "product"

    EmbeddedNerd::InternalLinker.process(document)

  elsif data["internal_links"] == true

    EmbeddedNerd::InternalLinker.process(document)

  elsif %w[
    article
    post
    tutorial
  ].include?(
    data["layout"].to_s
  )

    EmbeddedNerd::InternalLinker.process(document)

  end

end
