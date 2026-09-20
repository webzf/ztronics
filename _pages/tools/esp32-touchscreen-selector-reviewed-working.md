---
title: "ESP32 Hardware & Display Selector | Compatibility Checker"
layout: single
sidebar:
  nav: "embedded"
internal_links: true
permalink: /tools/esp32-touchscreen-selector/
excerpt: "Free ESP32 hardware and display selector. Filter boards, display modules and ESP32 touchscreen hardware by MCU family, display, touch, USB, PSRAM, GPIO, certification and other compatibility requirements."
show_date: false
read_time: false
last_modified_at: false
toc: true
toc_sticky: true
toc_label: "Contents"
related: true
share: true
header:
  teaser: /assets/images/esp32-touchscreen-selector.webp
  image: /assets/images/esp32-touchscreen-selector.webp
  og_image: /assets/images/esp32-touchscreen-selector.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.25
categories:
  - Tools
  - ESP32
  - Displays
tags:
  - ESP32
  - ESP32-S3
  - ESP32 Display
  - ESP32 Touchscreen
  - Hardware Selector
  - Compatibility Checker
  - LVGL
  - PSRAM
  - SPI
  - RGB
  - I2C
  - Electronics
---

![ESP32 Hardware & Display Selector](/assets/images/esp32-touchscreen-selector.webp)

# ESP32 Hardware & Display Selector

Find ESP32 boards, boards with displays and display modules that fit your project requirements.

The V2 selector separates **mandatory compatibility requirements** from **preferences**. Required filters exclude hardware that cannot satisfy the constraint; optional selections influence the preference ranking.

Always verify the exact manufacturer's documentation, controller, pinout, voltage, memory and driver support before ordering.

<link rel="stylesheet" href="/assets/tools/esp32-touchscreen-selector/selector.css">

{::nomarkdown}
<div class="en-v2-selector" id="esp32-hardware-selector">

<section class="hero" aria-labelledby="selector-title">
  <span class="site-label">EMBEDDED NERD · OPEN SOURCE TOOL</span>
  <div class="hero">
    <span class="eyebrow">ESP32 HARDWARE DISCOVERY</span>
    <h2 id="selector-title">ESP32 Hardware &amp; Display Selector</h2>
    <p>Find hardware using technical requirements first, then compare the products that best match your preferences.</p>
  </div>
</section>

<section class="tool" aria-labelledby="tool-title">
<h3 id="tool-title" class="sr-only">Hardware selector</h3>

<div class="mode-bar">
  <div class="mode-buttons">
    <button type="button" id="mode-requirements" class="mode-button active" data-mode="requirements">Filter &amp; find hardware</button>
  </div>
  <span class="catalog-status"><span id="catalog-count">0</span> catalog entries</span>
</div>

<div id="quick-start" class="quick-start"><div class="quick-start-heading"><strong>Quick start</strong><span>Choose a common setup or customize the filters below.</span></div><div class="preset-grid"><label for="preset-select">Preset</label><div class="preset-controls"><select id="preset-select" name="preset" aria-label="Quick start preset"><option value="">Choose a preset…</option><option value="s3-psram">ESP32-S3 + PSRAM 8 MB</option><option value="touch-spi">Touchscreen + SPI</option><option value="native-usb">Native USB</option><option value="large-display">Large display</option></select><button type="button" id="apply-preset-btn" class="btn-secondary">Apply preset</button></div></div></div>
<form id="selector-form">
<section class="filter-section">
<div class="section-heading"><div><span class="step">01</span><h3>Hardware type &amp; ESP32 family</h3></div><p>Selections become <strong>Required</strong> automatically. Uncheck <strong>Required</strong> when you want a preference instead.</p></div>
<div class="filter-grid">
<div class="filter-card"><label for="category">Hardware type</label><select id="category" name="category"><option value="">Any hardware</option><option value="display_module">Display module</option><option value="board_with_display">Board with display</option><option value="development_board">Development board</option></select><label class="required-toggle"><input id="category-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="family">ESP32 family</label><select id="family" name="family"><option value="">Any family</option><option>ESP32</option><option>ESP32-S2</option><option>ESP32-S3</option><option>ESP32-C3</option><option>ESP32-C5</option><option>ESP32-C6</option></select><label class="required-toggle"><input id="family-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="display_present">Display</label><select id="display_present" name="display_present"><option value="">Any</option><option value="yes">Display required</option><option value="no">No display</option></select><label class="required-toggle"><input id="display_present-required" type="checkbox"> Required</label></div>
</div></section>

<section class="filter-section">
<div class="section-heading"><div><span class="step">03</span><h3>Touch &amp; USB</h3></div><p>Choose the core connectivity requirements for your project.</p></div>
<div class="filter-grid">
<div class="filter-card"><label for="touch">Touch</label><select id="touch" name="touch"><option value="">Any</option><option value="yes">Touch required</option><option value="no">No touch</option></select><label class="required-toggle"><input id="touch-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="native_usb">USB</label><select id="native_usb" name="native_usb"><option value="">Any</option><option value="yes">Native USB</option><option value="no">No native USB</option></select><label class="required-toggle"><input id="native_usb-required" type="checkbox"> Required</label><small>UART bridges never satisfy a Native USB requirement.</small></div>
</div></section>

<details id="advanced-filters" class="advanced-filters">
<summary><strong>Advanced options</strong><span>Display details, touch details, memory, GPIO, storage and certification</span></summary>
<section class="filter-section">
<div class="section-heading"><div><span class="step">02</span><h3>Display</h3></div><p>Use technical display properties as hard constraints or soft preferences.</p></div>
<div class="filter-grid">
<div class="filter-card"><label for="display_technology">Technology</label><select id="display_technology" name="display_technology"><option value="">Any</option><option>OLED</option><option>LCD</option><option>TFT</option><option>e-paper</option><option>other</option></select><label class="required-toggle"><input id="display_technology-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="display_shape">Shape</label><select id="display_shape" name="display_shape"><option value="">Any</option><option>rectangular</option><option>square</option><option>round</option><option>other</option></select><label class="required-toggle"><input id="display_shape-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="size_min">Minimum display size (inches)</label><select id="size_min" name="size_min"><option value="">Any</option><option value="2">2″</option><option value="3">3″</option><option value="4">4″</option><option value="5">5″</option></select><label class="required-toggle"><input id="size_min-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="resolution">Resolution</label><select id="resolution" name="resolution"><option value="">Any</option><option value="240x320">240×320</option><option value="320x240">320×240</option><option value="480x320">480×320</option><option value="800x480">800×480</option><option value="1024x600">1024×600</option></select><label class="required-toggle"><input id="resolution-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="display_interface">Display interface</label><select id="display_interface" name="display_interface"><option value="">Any</option><option>SPI</option><option>RGB</option><option>8080</option><option>QSPI</option><option>other</option></select><label class="required-toggle"><input id="display_interface-required" type="checkbox"> Required</label></div>
</div></section>

<section class="filter-section advanced-inner">
<div class="section-heading"><div><span class="step">A1</span><h3>Touch details</h3></div><p>Use touch type and interface when the exact controller connection matters.</p></div>
<div class="filter-grid">
<div class="filter-card"><label for="touch_type">Touch type</label><select id="touch_type" name="touch_type"><option value="">Any</option><option>capacitive</option><option>resistive</option></select><label class="required-toggle"><input id="touch_type-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="touch_interface">Touch interface</label><select id="touch_interface" name="touch_interface"><option value="">Any</option><option>I2C</option><option>SPI</option><option>other</option></select><label class="required-toggle"><input id="touch_interface-required" type="checkbox"> Required</label></div>
</div></section>

<section class="filter-section">
<div class="section-heading"><div><span class="step">04</span><h3>Hardware requirements</h3></div></div>
<div class="filter-grid">
<div class="filter-card"><label for="microsd">microSD</label><select id="microsd" name="microsd"><option value="">Any</option><option value="yes">Present</option><option value="no">Not present</option></select><label class="required-toggle"><input id="microsd-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="battery_charging">Battery charging</label><select id="battery_charging" name="battery_charging"><option value="">Any</option><option value="yes">Present</option><option value="no">Not present</option></select><label class="required-toggle"><input id="battery_charging-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="flash_min">Minimum Flash (MB)</label><select id="flash_min" name="flash_min"><option value="">Any</option><option value="4">4 MB</option><option value="8">8 MB</option><option value="16">16 MB</option><option value="32">32 MB</option></select><label class="required-toggle"><input id="flash_min-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="psram_min">Minimum PSRAM (MB)</label><select id="psram_min" name="psram_min"><option value="">Any</option><option value="2">2 MB</option><option value="4">4 MB</option><option value="8">8 MB</option><option value="16">16 MB</option><option value="32">32 MB</option></select><span id="psram-note" class="field-note" hidden></span><label class="required-toggle"><input id="psram_min-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="free_gpio_min">Minimum free GPIO</label><select id="free_gpio_min" name="free_gpio_min"><option value="">Any</option><option value="5">5+</option><option value="10">10+</option><option value="15">15+</option><option value="20">20+</option><option value="25">25+</option></select><label class="required-toggle"><input id="free_gpio_min-required" type="checkbox"> Required</label></div>
</div></section>

<section class="filter-section">
<div class="section-heading"><div><span class="step">05</span><h3>Certification</h3></div></div>
<div class="filter-grid">
<div class="filter-card"><label for="ce">CE</label><select id="ce" name="ce"><option value="">Any</option><option value="yes">CE</option><option value="no">No CE</option></select><label class="required-toggle"><input id="ce-required" type="checkbox"> Required</label></div>
<div class="filter-card"><label for="fcc">FCC</label><select id="fcc" name="fcc"><option value="">Any</option><option value="yes">FCC</option><option value="no">No FCC</option></select><label class="required-toggle"><input id="fcc-required" type="checkbox"> Required</label></div>
</div></section>


</details>

<div class="form-actions"><button type="submit" class="btn-primary">Find compatible hardware</button><button type="button" id="reset-btn" class="btn-secondary">Reset</button><button type="button" id="share-btn" class="btn-secondary">Share setup</button><span id="live-count" class="live-count" aria-live="polite">Choose filters to see matching hardware.</span></div>
</form>

<div id="catalog-error" class="error-panel" hidden></div>

<div class="browse-launch">
  <button type="button" id="browse-btn" class="btn-secondary">Browse all hardware</button>
</div>

<div id="browse-note" class="browse-panel" hidden>
  <label for="hardware-search">Search all hardware</label>
  <p>Search by product, manufacturer, MCU, display or tag.</p>
  <input id="hardware-search" type="search" placeholder="e.g. ESP32-S3, Waveshare, OLED, touch">
</div>
</section>

<section id="results" class="results" hidden aria-live="polite">
<div class="results-heading"><span class="eyebrow">RESULTS</span><h3><span id="result-count">0</span> matching hardware</h3><p id="result-summary"></p><p class="result-meta"><span id="result-total">0</span> valid catalog entries · <span id="result-excluded">0</span> excluded</p></div>
<div id="empty-state" class="empty-state" hidden><h4>No hardware meets all mandatory requirements.</h4><p id="empty-state-text"></p><p>Try changing one or more filters from <strong>Required</strong> to a preference.</p></div>
<div id="exclusion-panel" class="exclusion-panel"><h4>Why other products were excluded</h4><p>Mandatory filters are evaluated before preference scoring.</p><ul id="exclusion-list"></ul></div>
<div id="product-grid" class="product-grid"></div>
</section>

<p class="footer-note">The catalog is deliberately conservative: unknown specifications remain unknown rather than being guessed. Verify exact controller, pinout, voltage, memory and driver support before purchase.</p>
</div>
{:/nomarkdown}

<script src="/assets/tools/esp32-touchscreen-selector/compatibility-engine.js?v=20260920-10" defer></script>
<script src="/assets/tools/esp32-touchscreen-selector/selector.js?v=20260920-14" defer></script>
<script src="/assets/tools/esp32-touchscreen-selector/presets.js?v=20260920-1" defer></script>
<script>
document.addEventListener("DOMContentLoaded",function(){
  var m=location.hash.match(/^#preset=(s3-psram|touch-spi|native-usb|large-display)$/);
  if(m&&window.EmbeddedNerdApplyPreset) window.EmbeddedNerdApplyPreset(m[1]);
});
</script>

## How to choose ESP32 hardware for a touchscreen project

Choosing an ESP32 touchscreen is not only about screen size. Compatibility can depend on the **ESP32 variant, display resolution, interface, touch controller, touch interface, PSRAM, GPIO availability and graphics requirements**.

### Start with the ESP32 family

Small SPI displays can work with several ESP32 variants. More demanding graphical interfaces often require closer attention to memory, peripherals and available GPIOs. The ESP32-S3 is commonly considered for larger graphical interfaces, but the exact board and display combination still needs verification.

### SPI, RGB and parallel interfaces

- **SPI** — relatively few pins and straightforward wiring for many small and medium displays.
- **RGB** — higher pixel-data throughput but substantially more GPIOs and stricter hardware requirements.
- **8080 / parallel** — can provide a different throughput/GPIO trade-off, but exact controller and peripheral support must be checked.

### Touch technology and buses

Capacitive touch is commonly paired with I²C controllers, while resistive controllers such as the XPT2046 commonly use SPI. These are common patterns rather than universal compatibility rules.

### PSRAM and GPIO

PSRAM becomes increasingly useful as framebuffer size and graphical complexity increase. GPIO availability also matters: a board can have many GPIOs on paper but fewer usable pins after display, touch, storage and other peripherals are reserved.

## Related Embedded Nerd resources

- [ESP32 Touchscreen Displays: Complete Guide to Choosing and Using a Touchscreen](/esp32-touchscreen-displays-guide/)
- [I²C Address Lookup Tool](/tools/i2c-address-lookup/)
- [I²C Pull-up Resistor Calculator](/tools/i2c-pullup-resistor-calculator/)

## Frequently asked questions

<details>
<summary>Which ESP32 board should I use for a touchscreen display?</summary>
<p>There is no single board that fits every display. The required interface, resolution, memory, touch controller and available GPIOs should be considered together.</p>
</details>

<details>
<summary>Do I need PSRAM for an ESP32 touchscreen?</summary>
<p>Not necessarily. Smaller SPI displays can often work without PSRAM, while larger frame buffers and more demanding graphical interfaces can benefit substantially from it.</p>
</details>

<details>
<summary>Is native USB the same as a UART bridge?</summary>
<p>No. The selector treats native USB and UART bridge hardware as separate properties and a required Native USB filter is not satisfied by a UART bridge.</p>
</details>

<details>
<summary>Can the selector guarantee hardware compatibility?</summary>
<p>No. It is a filtering and ranking tool based on the catalog data. Exact manufacturer specifications, pinouts, voltage, memory and driver support should always be verified before purchase.</p>
</details>

<script>
(function(){
  var faq=document.querySelectorAll("details");
  if(!faq.length)return;
  var entities=[];
  faq.forEach(function(item){
    var q=item.querySelector("summary"),a=item.querySelector("p");
    if(q&&a)entities.push({"@type":"Question","name":q.textContent.trim(),"acceptedAnswer":{"@type":"Answer","text":a.textContent.trim()}});
  });
  var script=document.createElement("script");
  script.type="application/ld+json";
  script.textContent=JSON.stringify({"@context":"https://schema.org","@type":"FAQPage","mainEntity":entities});
  document.head.appendChild(script);
})();
</script>
