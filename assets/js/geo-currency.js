/*
 * Embedded Nerd — visitor currency display
 * EUR for visitors whose IP geolocation reports Europe; USD elsewhere.
 * Prices remain stored in their original currency. This script only changes
 * the displayed estimate and matching Product/Offer JSON-LD.
 */
(function () {
  "use strict";

  var GEO_URL = "https://free.freeipapi.com/api/v1/json/";
  var RATE_URL = "https://api.frankfurter.dev/v2/rate/EUR/USD";

  async function getRegion() {
    var response = await fetch(GEO_URL, {
      method: "GET",
      headers: { "Accept": "application/json" },
      cache: "default"
    });
    if (!response.ok) throw new Error("Country lookup failed: " + response.status);

    var location = await response.json();
    if (!location || typeof location.continentCode !== "string") {
      throw new Error("Country lookup returned no continent code");
    }
    return location.continentCode.toUpperCase() === "EU" ? "EU" : "OTHER";
  }

  async function getEurUsdRate() {
    var response = await fetch(RATE_URL, {
      method: "GET",
      headers: { "Accept": "application/json" },
      cache: "default"
    });
    if (!response.ok) throw new Error("Exchange-rate lookup failed: " + response.status);

    var data = await response.json();
    var rate = Number(data && data.rate);
    if (!Number.isFinite(rate) || rate <= 0) {
      throw new Error("Exchange-rate response was invalid");
    }
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

  function hasConvertibleOffer(data) {
    if (Array.isArray(data)) {
      return data.some(hasConvertibleOffer);
    }
    if (!data || typeof data !== "object") return false;

    var currency = String(data.priceCurrency || "").toUpperCase();
    if ((currency === "EUR" || currency === "USD") && data.price !== undefined) return true;

    return Object.keys(data).some(function (key) {
      return hasConvertibleOffer(data[key]);
    });
  }

  function shouldRun() {
    if (document.querySelector("[data-en-price][data-en-currency]")) return true;
    return Array.prototype.some.call(
      document.querySelectorAll('script[type="application/ld+json"]'),
      function (script) {
        try {
          return hasConvertibleOffer(JSON.parse(script.textContent));
        } catch (error) {
          return false;
        }
      }
    );
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

  if (!shouldRun()) return;

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", applyVisitorCurrency, { once: true });
  } else {
    applyVisitorCurrency();
  }
})();
