/**
 * Embedded Nerd — mobile sticky affiliate bar.
 * Shows after the primary product purchase buttons leave the viewport.
 */
(function () {
  'use strict';

  function initStickyAffiliateBar() {
    var bar = document.querySelector('[data-sticky-affiliate]');
    if (!bar) return;

    var purchaseArea = document.querySelector('.en-product-box .en-buy-buttons, .product-page .en-buy-buttons');
    var mobileQuery = window.matchMedia('(max-width: 767px)');
    var visible = false;

    function setVisible(nextVisible) {
      if (visible === nextVisible) return;
      visible = nextVisible;
      bar.classList.toggle('is-visible', visible);
      bar.setAttribute('aria-hidden', visible ? 'false' : 'true');
    }

    function updateVisibility(purchaseAreaVisible) {
      if (!mobileQuery.matches) {
        setVisible(false);
        return;
      }

      var hasScrolled = window.scrollY > 260;
      setVisible(hasScrolled && !purchaseAreaVisible);
    }

    if ('IntersectionObserver' in window && purchaseArea) {
      var purchaseIsVisible = false;
      var observer = new IntersectionObserver(function (entries) {
        purchaseIsVisible = entries.some(function (entry) {
          return entry.isIntersecting;
        });
        updateVisibility(purchaseIsVisible);
      }, { threshold: 0.01 });
      observer.observe(purchaseArea);

      window.addEventListener('scroll', function () {
        updateVisibility(purchaseIsVisible);
      }, { passive: true });
    } else {
      window.addEventListener('scroll', function () {
        updateVisibility(false);
      }, { passive: true });
      updateVisibility(false);
    }

    if (mobileQuery.addEventListener) {
      mobileQuery.addEventListener('change', function () {
        updateVisibility(purchaseArea ? purchaseArea.getBoundingClientRect().top < window.innerHeight && purchaseArea.getBoundingClientRect().bottom > 0 : false);
      });
    } else if (mobileQuery.addListener) {
      mobileQuery.addListener(function () {
        updateVisibility(false);
      });
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initStickyAffiliateBar);
  } else {
    initStickyAffiliateBar();
  }
})();
