/**
 * Embedded Nerd — mobile sticky affiliate bar.
 * Keep the bar hidden while a product purchase CTA is visible and near the footer.
 */
(function () {
  'use strict';

  function initStickyAffiliateBar() {
    var bar = document.querySelector('[data-sticky-affiliate]');
    if (!bar) return;

    // Guition and a few other product pages use .en-product-cta;
    // standard product pages use .en-buy-buttons.
    var purchaseAreas = Array.prototype.slice.call(
      document.querySelectorAll('.en-product-cta, .en-buy-buttons')
    );
    var footer = document.querySelector('.page__footer');
    var mobileQuery = window.matchMedia('(max-width: 767px)');
    var visiblePurchaseAreas = new Set();
    var footerVisible = false;

    function updateVisibility() {
      var shouldShow = mobileQuery.matches &&
        window.scrollY > 260 &&
        visiblePurchaseAreas.size === 0 &&
        !footerVisible;

      bar.classList.toggle('is-visible', shouldShow);
      bar.setAttribute('aria-hidden', shouldShow ? 'false' : 'true');
    }

    if ('IntersectionObserver' in window) {
      var purchaseObserver = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            visiblePurchaseAreas.add(entry.target);
          } else {
            visiblePurchaseAreas.delete(entry.target);
          }
        });
        updateVisibility();
      }, { threshold: 0.01 });

      purchaseAreas.forEach(function (area) {
        purchaseObserver.observe(area);
      });

      if (footer) {
        var footerObserver = new IntersectionObserver(function (entries) {
          entries.forEach(function (entry) {
            footerVisible = entry.isIntersecting;
          });
          updateVisibility();
        }, { threshold: 0.01 });
        footerObserver.observe(footer);
      }
    }

    window.addEventListener('scroll', updateVisibility, { passive: true });

    function handleViewportChange() {
      updateVisibility();
    }

    if (mobileQuery.addEventListener) {
      mobileQuery.addEventListener('change', handleViewportChange);
    } else if (mobileQuery.addListener) {
      mobileQuery.addListener(handleViewportChange);
    }

    updateVisibility();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initStickyAffiliateBar);
  } else {
    initStickyAffiliateBar();
  }
})();
