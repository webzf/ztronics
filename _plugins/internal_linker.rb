# ============================================================================
# Embedded Nerd - Internal Link Engine V2.1
# ============================================================================
#
# Jekyll 3.10 compatible
#
# Analysis:
#   Article -> Product
#   Article -> Article
#   Product -> Article
#   Product -> Product
#
# IMPORTANT:
#   analysis_only: true
#   No pages are modified until we validate the graph.
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
    # Only these layouts are considered editorial pages.
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

      config = site.data["internal_links"]

      return unless config.is_a?(Hash)

      settings =
        DEFAULT_SETTINGS.merge(
          config["settings"] || {}
        )

      return unless settings["enabled"]


      # Build graph once per Jekyll build.
      graph =
        build_graph(site)


      return unless graph


      current_url =
        normalize_url(document.url)


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


      # ----------------------------------------------------------------------
      # Analysis mode.
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
      # Automatic linking is deliberately NOT enabled yet.
      # We validate the graph first.
      # ----------------------------------------------------------------------

      log_analysis(
        current,
        relations,
        settings
      )

    end


    # =========================================================================
    # Build content graph
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
      # 1. FIND PRODUCTS
      # =======================================================================
      #
      # Products can live in:
      #
      #   site.pages
      #   site.collections
      #
      # We inspect both.
      # =======================================================================


      # -----------------------------------------------------------------------
      # Products from normal pages.
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
      # Products from collections.
      # -----------------------------------------------------------------------

      site.collections.each do |label, collection|

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
      # 2. FIND ARTICLES
      # =======================================================================


      # -----------------------------------------------------------------------
      # Posts.
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
      # Explicit editorial pages ONLY.
      #
      # A normal page is NOT automatically treated as an article.
      #
      # To opt in, use:
      #
      # internal_links: true
      #
      # or an editorial layout.
      # -----------------------------------------------------------------------

      site.pages.each do |page|

        data =
          page.data || {}


        next if
          data["layout"].to_s == "product"


        next unless
          editorial_page?(page)


        article =
          build_article(page)


        add_article(
          article,
          articles,
          by_url
        )

      end


      # -----------------------------------------------------------------------
      # Optional editorial collections.
      #
      # If you later create an article collection, it can participate when
      # its documents explicitly use an editorial layout.
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
      # GRAPH
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
        "Content Graph: #{products.length} products, " \
        "#{articles.length} articles"
      )


      graph

    end


    # =========================================================================
    # Add product
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
    # Add article
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
    # Build product
    # =========================================================================

    def self.build_product(document)

      data =
        document.data || {}


      id =
        data["product_id"].to_s.strip


      title =
        data["title"].to_s


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

        id: id,

        title: title,

        url: document.url,

        text: normalize_text(text),

        tokens: tokenize(text),

        tags: normalize_array(
          data["tags"]
        ),

        categories: normalize_array(
          data["categories"]
        ),

        related: normalize_ids(
          data["related"]
        ),

        keywords: product_keywords(
          data
        )
      }

    end


    # =========================================================================
    # Build article
    # =========================================================================

    def self.build_article(document)

      data =
        document.data || {}


      title =
        data["title"].to_s


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

        id: normalize_url(
          document.url
        ),

        title: title,

        url: document.url,

        text: normalize_text(text),

        tokens: tokenize(text),

        tags: normalize_array(
          data["tags"]
        ),

        categories: normalize_array(
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
    # Find relations
    # =========================================================================

    def self.find_relations(
      current,
      graph,
      settings,
      config
    )

      relations = []


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

      elsif current[:type] == :product

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


      relations.sort_by! do |relation|

        -relation[:score]

      end


      relations

    end


    # =========================================================================
    # Article -> Product
    # =========================================================================

    def self.article_product_score(
      article,
      product,
      config
    )

      score = 0


      # Strongest relation:
      # required_hardware.
      if article[:required_hardware].include?(
        product[:id]
      )

        score += 100

      end


      # Product keywords in article.
      product[:keywords].each do |keyword|

        normalized_keyword =
          normalize_text(keyword)


        next if
          normalized_keyword.empty?


        if article[:text].include?(
          normalized_keyword
        )

          score += 30

          break

        end

      end


      # Token similarity.
      score +=
        token_similarity(
          article[:tokens],
          product[:tokens]
        )


      # Shared tags.
      score +=
        shared_values_score(
          article[:tags],
          product[:tags],
          5
        )


      # Shared categories.
      score +=
        shared_values_score(
          article[:categories],
          product[:categories],
          8
        )


      [score, 100].min

    end


    # =========================================================================
    # Article -> Article
    # =========================================================================

    def self.article_article_score(
      article_a,
      article_b
    )

      score = 0


      shared_hardware =
        (
          article_a[:required_hardware] &
          article_b[:required_hardware]
        )


      score +=
        shared_hardware.length * 25


      score +=
        shared_values_score(
          article_a[:tags],
          article_b[:tags],
          8
        )


      score +=
        shared_values_score(
          article_a[:categories],
          article_b[:categories],
          10
        )


      score +=
        token_similarity(
          article_a[:tokens],
          article_b[:tokens]
        )


      [score, 100].min

    end


    # =========================================================================
    # Product -> Article
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
    # Product -> Product
    # =========================================================================

    def self.product_product_score(
      product_a,
      product_b
    )

      score = 0


      # Explicit related relationship.
      if product_a[:related].include?(
        product_b[:id]
      )

        score += 70

      end


      if product_b[:related].include?(
        product_a[:id]
      )

        score += 70

      end


      # Shared categories.
      score +=
        shared_values_score(
          product_a[:categories],
          product_b[:categories],
          15
        )


      # Shared tags.
      score +=
        shared_values_score(
          product_a[:tags],
          product_b[:tags],
          8
        )


      # Text similarity.
      score +=
        token_similarity(
          product_a[:tokens],
          product_b[:tokens]
        )


      [score, 100].min

    end


    # =========================================================================
    # Product keywords
    # =========================================================================

    def self.product_keywords(data)

      keywords = []


      product_id =
        data["product_id"].to_s.strip


      keywords << product_id unless
        product_id.empty?


      title =
        data["title"].to_s.strip


      keywords << title unless
        title.empty?


      Array(data["tags"]).each do |tag|

        value =
          tag.to_s.strip


        keywords << value unless
          value.empty?

      end


      Array(data["internal_link_keywords"]).each do |keyword|

        value =
          keyword.to_s.strip


        keywords << value unless
          value.empty?

      end


      keywords.uniq

    end


    # =========================================================================
    # Required hardware
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
    # Shared values
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
    # Token similarity
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


      score =
        shared.length * 3


      [score, 30].min

    end


    # =========================================================================
    # Tokenizer
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
    # Normalize text
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
    # Normalize array
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
    # Normalize IDs
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
    # Editorial page
    # =========================================================================

    def self.editorial_page?(page)

      data =
        page.data || {}


      # Explicit opt-in.
      return true if
        data["internal_links"] == true


      # Editorial layout.
      layout =
        data["layout"].to_s


      return true if
        EDITORIAL_LAYOUTS.include?(layout)


      false

    end


    # =========================================================================
    # Editorial collection document
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
    # Normalize URL
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
    # Analysis logging
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
