/**
 * Embedded Nerd — mobile sticky affiliate bar.
 * Show after a short scroll on mobile; hide only when the footer enters view.
 */
(function () {
  'use strict';

  function initStickyAffiliateBar() {
    var bar = document.querySelector('[data-sticky-affiliate]');
    if (!bar) return;

    var footer = document.querySelector('.page__footer');
    var mobileQuery = window.matchMedia('(max-width: 767px)');
    var scrollThreshold = 260;

    function isFooterVisible() {
      if (!footer) return false;
      var rect = footer.getBoundingClientRect();
      return rect.top < window.innerHeight && rect.bottom > 0;
    }

    function updateVisibility() {
      var scrollPosition = window.scrollY || window.pageYOffset || 0;
      var shouldShow = mobileQuery.matches &&
        scrollPosition > scrollThreshold &&
        !isFooterVisible();

      bar.classList.toggle('is-visible', shouldShow);
      bar.setAttribute('aria-hidden', shouldShow ? 'false' : 'true');
    }

    window.addEventListener('scroll', updateVisibility, { passive: true });
    window.addEventListener('resize', updateVisibility);
    window.addEventListener('pageshow', updateVisibility);

    if (mobileQuery.addEventListener) {
      mobileQuery.addEventListener('change', updateVisibility);
    } else if (mobileQuery.addListener) {
      mobileQuery.addListener(updateVisibility);
    }

    updateVisibility();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initStickyAffiliateBar);
  } else {
    initStickyAffiliateBar();
  }
})();
