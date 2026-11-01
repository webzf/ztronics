/*
 * Embedded Nerd — visitor currency display
 * EUR for visitors whose IP geolocation reports Europe; USD elsewhere.
 * Prices remain stored in their original currency. This script only changes
 * the displayed estimate and matching Product/Offer JSON-LD.
 */
(function () {
  "use strict";

  var REGION_KEY = "en_currency_region";
  var RATE_KEY = "en_eur_usd_rate";
  var RATE_DATE_KEY = "en_eur_usd_rate_date";
  var GEO_URL = "https://free.freeipapi.com/api/v1/json/";
  var RATE_URL = "https://api.frankfurter.dev/v2/rate/EUR/USD";

  function readSessionRegion() {
    try {
      var value = window.sessionStorage.getItem(REGION_KEY);
      return value === "EU" || value === "OTHER" ? value : null;
    } catch (error) {
      return null;
    }
  }

  function saveSessionRegion(value) {
    try {
      window.sessionStorage.setItem(REGION_KEY, value);
    } catch (error) {
      // Storage can be unavailable in private browsing; continue without it.
    }
  }

  function readCachedRate() {
    try {
      var rate = Number(window.localStorage.getItem(RATE_KEY));
      var date = window.localStorage.getItem(RATE_DATE_KEY);
      var today = new Date().toISOString().slice(0, 10);
      return date === today && Number.isFinite(rate) && rate > 0 ? rate : null;
    } catch (error) {
      return null;
    }
  }

  function saveCachedRate(rate, date) {
    try {
      window.localStorage.setItem(RATE_KEY, String(rate));
      window.localStorage.setItem(RATE_DATE_KEY, date || new Date().toISOString().slice(0, 10));
    } catch (error) {
      // A failed cache write must not prevent currency display.
    }
  }

  async function getRegion() {
    var cached = readSessionRegion();
    if (cached) return cached;

    var response = await fetch(GEO_URL, {
      method: "GET",
      headers: { "Accept": "application/json" },
      cache: "no-store"
    });
    if (!response.ok) throw new Error("Country lookup failed: " + response.status);

    var location = await response.json();
    if (!location || typeof location.continentCode !== "string") {
      throw new Error("Country lookup returned no continent code");
    }

    var region = location.continentCode.toUpperCase() === "EU" ? "EU" : "OTHER";
    saveSessionRegion(region);
    return region;
  }

  async function getEurUsdRate() {
    var cached = readCachedRate();
    if (cached) return cached;

    var response = await fetch(RATE_URL, {
      method: "GET",
      headers: { "Accept": "application/json" },
      cache: "no-cache"
    });
    if (!response.ok) throw new Error("Exchange-rate lookup failed: " + response.status);

    var data = await response.json();
    var rate = Number(data && data.rate);
    if (!Number.isFinite(rate) || rate <= 0) {
      throw new Error("Exchange-rate response was invalid");
    }

    saveCachedRate(rate, data.date);
    return rate;
  }

  function formatPrice(amount, currency) {
    var locale = document.documentElement.lang || undefined;
    return new Intl.NumberFormat(locale, {
      style: "currency",
      currency: currency,
      minimumFractionDigits: 2,
      maximumFractionDigits: 2
    }).format(amount);
  }

  function convertAmount(amount, fromCurrency, toCurrency, eurUsdRate) {
    if (fromCurrency === toCurrency) return amount;
    if (fromCurrency === "EUR" && toCurrency === "USD") return amount * eurUsdRate;
    if (fromCurrency === "USD" && toCurrency === "EUR") return amount / eurUsdRate;
    return null;
  }

  function updateVisiblePrices(targetCurrency, eurUsdRate) {
    var elements = document.querySelectorAll("[data-en-price][data-en-currency]");
    elements.forEach(function (element) {
      var originalAmount = Number(element.getAttribute("data-en-price"));
      var originalCurrency = (element.getAttribute("data-en-currency") || "").toUpperCase();
      if (!Number.isFinite(originalAmount) || (originalCurrency !== "EUR" && originalCurrency !== "USD")) return;

      var converted = convertAmount(originalAmount, originalCurrency, targetCurrency, eurUsdRate);
      if (converted === null) return;

      element.textContent = formatPrice(converted, targetCurrency);
      element.setAttribute("data-displayed-price", converted.toFixed(2));
      element.setAttribute("data-displayed-currency", targetCurrency);
    });
  }

  function updateOffer(offer, targetCurrency, eurUsdRate) {
    if (Array.isArray(offer)) {
      offer.forEach(function (item) { updateOffer(item, targetCurrency, eurUsdRate); });
      return;
    }
    if (!offer || typeof offer !== "object") return;

    var currency = String(offer.priceCurrency || "").toUpperCase();
    var amount = Number(offer.price);
    if ((currency === "EUR" || currency === "USD") && Number.isFinite(amount)) {
      var converted = convertAmount(amount, currency, targetCurrency, eurUsdRate);
      if (converted !== null) {
        offer.price = converted.toFixed(2);
        offer.priceCurrency = targetCurrency;
      }
    }

    if (offer.offers) updateOffer(offer.offers, targetCurrency, eurUsdRate);
    if (offer["@graph"]) updateOffer(offer["@graph"], targetCurrency, eurUsdRate);
  }

  function updateProductSchemas(targetCurrency, eurUsdRate) {
    document.querySelectorAll('script[type="application/ld+json"]').forEach(function (script) {
      try {
        var data = JSON.parse(script.textContent);
        updateOffer(data, targetCurrency, eurUsdRate);
        script.textContent = JSON.stringify(data);
      } catch (error) {
        // Leave unrelated or invalid JSON-LD untouched.
      }
    });
  }

  async function applyVisitorCurrency() {
    try {
      var region = await getRegion();
      var targetCurrency = region === "EU" ? "EUR" : "USD";
      var eurUsdRate = await getEurUsdRate();

      updateVisiblePrices(targetCurrency, eurUsdRate);
      updateProductSchemas(targetCurrency, eurUsdRate);
      document.documentElement.setAttribute("data-en-currency", targetCurrency);
    } catch (error) {
      // Fail safely: keep the original price and schema rather than showing
      // an unconverted amount with the wrong currency.
      if (window.console && typeof window.console.warn === "function") {
        console.warn("Embedded Nerd currency display kept its original prices.", error);
      }
    }
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", applyVisitorCurrency, { once: true });
  } else {
    applyVisitorCurrency();
  }
})();
