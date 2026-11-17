(function () {
  'use strict';

  var popup = document.getElementById('seeed-campaign-popup');
  if (!popup) return;

  // Seeed's official campaign schedule: Nov 16, 2026 00:00 ET to Dec 1, 2026 00:00 ET.
  var CAMPAIGN_START = Date.parse('2026-11-16T05:00:00Z');
  var CAMPAIGN_END = Date.parse('2026-12-01T05:00:00Z');
  var SESSION_KEY = 'embeddednerd_seeed_black_friday_2026_v1';
  var DELAY_MS = 25000;
  var SCROLL_TRIGGER = 0.4;
  var dismissedThisPage = false;
  var storageAvailable = true;

  if (Date.now() < CAMPAIGN_START || Date.now() >= CAMPAIGN_END) return;

  function wasShown() {
    try {
      return window.sessionStorage.getItem(SESSION_KEY) === '1';
    } catch (error) {
      storageAvailable = false;
      return false;
    }
  }

  function markShown() {
    if (!storageAvailable) return;
    try {
      window.sessionStorage.setItem(SESSION_KEY, '1');
    } catch (error) {
      storageAvailable = false;
    }
  }

  if (wasShown()) return;

  var delayTimer;

  function removeTriggers() {
    if (delayTimer) window.clearTimeout(delayTimer);
    window.removeEventListener('scroll', onScroll);
    document.removeEventListener('mouseout', onExitIntent);
  }

  function openPopup() {
    if (dismissedThisPage || popup.classList.contains('is-open')) return;
    markShown();
    popup.classList.add('is-open');
    popup.setAttribute('aria-hidden', 'false');
    removeTriggers();
  }

  function closePopup() {
    dismissedThisPage = true;
    popup.classList.remove('is-open');
    popup.setAttribute('aria-hidden', 'true');
    removeTriggers();
  }

  function onScroll() {
    var root = document.documentElement;
    var scrollableHeight = root.scrollHeight - window.innerHeight;
    if (scrollableHeight > 0 && window.scrollY / scrollableHeight >= SCROLL_TRIGGER) {
      openPopup();
    }
  }

  function onExitIntent(event) {
    if (!event.relatedTarget && event.clientY <= 0) openPopup();
  }

  var closeButton = popup.querySelector('.seeed-campaign-popup__close');
  if (closeButton) closeButton.addEventListener('click', closePopup);

  document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape' && popup.classList.contains('is-open')) closePopup();
  });

  delayTimer = window.setTimeout(openPopup, DELAY_MS);
  window.addEventListener('scroll', onScroll, { passive: true });

  if (window.matchMedia && window.matchMedia('(hover: hover) and (pointer: fine)').matches) {
    document.addEventListener('mouseout', onExitIntent);
  }
})();
