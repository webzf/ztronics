/**
 * Embedded Nerd — mobile sticky affiliate bar.
 * Show the bar after the purchase CTA leaves the viewport, and hide it
 * whenever another purchase CTA or the footer is visible.
 */
(function () {
  'use strict';

  function initStickyAffiliateBar() {
    var bar = document.querySelector('[data-sticky-affiliate]');
    if (!bar) return;

    var purchaseAreas = Array.prototype.slice.call(
      document.querySelectorAll('.en-product-cta, .en-buy-buttons')
    );
    var footer = document.querySelector('.page__footer');
    var mobileQuery = window.matchMedia('(max-width: 767px)');

    function isInViewport(element) {
      if (!element) return false;
      var rect = element.getBoundingClientRect();
      return rect.bottom > 0 && rect.top < window.innerHeight;
    }

    function updateVisibility() {
      var purchaseVisible = purchaseAreas.some(isInViewport);
      var footerVisible = isInViewport(footer);
      var shouldShow = mobileQuery.matches &&
        window.scrollY > 260 &&
        !purchaseVisible &&
        !footerVisible;

      bar.classList.toggle('is-visible', shouldShow);
      bar.setAttribute('aria-hidden', shouldShow ? 'false' : 'true');
    }

    window.addEventListener('scroll', updateVisibility, { passive: true });
    window.addEventListener('resize', updateVisibility);

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
