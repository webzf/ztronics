module Jekyll

  class ProductCategoryPage < Page

    def initialize(site, base, dir, category)

      @site = site
      @base = base
      @dir = dir
      @name = "index.html"

      process(@name)

      self.content = ""

      self.data = {
        "layout" => "product-category",
        "title" => category,
        "category" => category,
        "permalink" => "/products/#{Jekyll::Utils.slugify(category)}/"
      }

    end

  end

  class ProductCategoryGenerator < Generator

    safe true
    priority :lowest

    def generate(site)

      return unless site.collections["products"]

      categories = site.collections["products"].docs
        .map { |doc| doc.data["category"] }
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
