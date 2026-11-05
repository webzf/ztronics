(function () {
  "use strict";

  function initProductsCatalog() {
    var root = document.getElementById("en-products-catalog");
    if (!root) return;

    var input = root.querySelector("#en-product-search");
    var results = root.querySelector("#en-search-results");
    var emptyState = root.querySelector("#en-no-products");
    var categories = Array.prototype.slice.call(root.querySelectorAll("[data-product-category]"));
    var cards = Array.prototype.slice.call(root.querySelectorAll(".en-product-list .en-product-card"));

    if (!input || !results || !cards.length) return;

    function filterProducts() {
      var query = input.value.trim().toLocaleLowerCase();
      var visibleCount = 0;

      cards.forEach(function (card) {
        var searchableText = (card.getAttribute("data-search") || card.textContent || "").toLocaleLowerCase();
        var matches = !query || searchableText.indexOf(query) !== -1;
        card.hidden = !matches;
        if (matches) visibleCount += 1;
      });

      categories.forEach(function (section) {
        var hasVisibleCards = section.querySelector(".en-product-card:not([hidden])") !== null;
        section.hidden = !hasVisibleCards;
      });

      results.textContent = query
        ? visibleCount + (visibleCount === 1 ? " matching product" : " matching products")
        : cards.length + " products in the catalogue";

      emptyState.hidden = visibleCount !== 0;
    }

    input.addEventListener("input", filterProducts);
    input.addEventListener("search", filterProducts);
    filterProducts();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initProductsCatalog);
  } else {
    initProductsCatalog();
  }
}());
