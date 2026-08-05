module Jekyll

  class ProductCategoryPage < Page

    def initialize(site, base, dir, category)

      @site = site
      @base = base
      @dir  = dir
      @name = "index.html"

      process(@name)

      read_yaml(
        File.join(base, "_layouts"),
        "product-category.html"
      )

      self.data["title"] = category
      self.data["category"] = category
      self.data["permalink"] = "/products/#{Jekyll::Utils.slugify(category)}/"

    end

  end

  class ProductCategoryGenerator < Generator

    safe true
    priority :normal

    def generate(site)

      return unless site.collections["products"]

      categories =
        site.collections["products"].docs
            .map { |p| p.data["category"] }
            .compact
            .uniq
            .sort

      categories.each do |category|

        site.pages << ProductCategoryPage.new(
          site,
          site.source,
          "products/#{Jekyll::Utils.slugify(category)}",
          category
        )

      end

    end

  end

end
