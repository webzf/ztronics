---
title: "ESP32 Touchscreen Selector & Compatibility Tool"

layout: single

sidebar:
  nav: "embedded"

internal_links: true

permalink: /tools/esp32-touchscreen-selector/

excerpt: "Free ESP32 touchscreen selector and compatibility checker. Choose an ESP32 board, display size, resolution, interface, touch technology, PSRAM and LVGL requirements to get a practical ESP32 touchscreen display recommendation."

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
  - ESP32 Touchscreen
  - ESP32 Display
  - Touchscreen Display
  - LVGL
  - PSRAM
  - SPI
  - RGB
  - I2C
  - Electronics
---

# ESP32 Touchscreen Selector & Compatibility Tool

Choose an ESP32 touchscreen display configuration based on your board, display size, resolution, interface, touch technology, PSRAM and LVGL requirements.

This tool provides a **recommendation rather than a universal compatibility guarantee**. Always verify the exact display controller, touch controller, pinout, voltage, memory and driver support before ordering hardware.

{::nomarkdown}

<section class="en-touch-tool" id="esp32-touchscreen-tool">

<div class="en-tool-header">
<div class="en-tool-brand">
  <span class="en-tool-kicker">EMBEDDED NERD TOOL</span>
  <span class="en-tool-status"><span class="en-status-dot"></span> Compatibility checker</span>
</div>

<h2>ESP32 Touchscreen Selector</h2>

<p>
Choose what you know about your project and get a practical
<strong>ESP32 touchscreen display</strong> recommendation.
</p>

<div class="en-progress-wrap" aria-label="Selection progress">
  <div class="en-progress-meta">
    <span><strong id="selection-count">0</strong> of 9 requirements selected</span>
    <span id="selection-percent">0%</span>
  </div>
  <div class="en-progress-track">
    <div class="en-progress-bar" id="selection-progress"></div>
  </div>
</div>
</div>

<form id="selector-form" novalidate>

<fieldset data-group="board">
<legend>1. ESP32 board</legend>
<div class="chip-group" role="radiogroup">
<span class="chip"><input type="radio" name="board" id="board-esp32" value="ESP32" required><label for="board-esp32">ESP32</label></span>
<span class="chip"><input type="radio" name="board" id="board-s2" value="ESP32-S2"><label for="board-s2">ESP32-S2</label></span>
<span class="chip"><input type="radio" name="board" id="board-s3" value="ESP32-S3"><label for="board-s3">ESP32-S3</label></span>
<span class="chip"><input type="radio" name="board" id="board-c3" value="ESP32-C3"><label for="board-c3">ESP32-C3</label></span>
<span class="chip"><input type="radio" name="board" id="board-unsure" value="Not sure"><label for="board-unsure">Not sure</label></span>
</div>
<p class="field-error">Please choose an option.</p>
</fieldset>

<fieldset data-group="size">
<legend>2. Display size</legend>
<div class="chip-group" role="radiogroup">
<span class="chip"><input type="radio" name="size" id="size-28" value="2.4–2.8&quot;" required><label for="size-28">2.4–2.8"</label></span>
<span class="chip"><input type="radio" name="size" id="size-35" value="3.5&quot;"><label for="size-35">3.5"</label></span>
<span class="chip"><input type="radio" name="size" id="size-43" value="4.3&quot;"><label for="size-43">4.3"</label></span>
<span class="chip"><input type="radio" name="size" id="size-5" value="5&quot;"><label for="size-5">5"</label></span>
<span class="chip"><input type="radio" name="size" id="size-7" value="7&quot;"><label for="size-7">7"</label></span>
<span class="chip"><input type="radio" name="size" id="size-other" value="Other / Not sure"><label for="size-other">Other / Not sure</label></span>
</div>
<p class="field-error">Please choose an option.</p>
</fieldset>

<fieldset data-group="resolution">
<legend>3. Resolution</legend>
<div class="chip-group" role="radiogroup">
<span class="chip"><input type="radio" name="resolution" id="res-240x320" value="240x320" required><label for="res-240x320">240×320</label></span>
<span class="chip"><input type="radio" name="resolution" id="res-320x240" value="320x240"><label for="res-320x240">320×240</label></span>
<span class="chip"><input type="radio" name="resolution" id="res-480x320" value="480x320"><label for="res-480x320">480×320</label></span>
<span class="chip"><input type="radio" name="resolution" id="res-800x480" value="800x480"><label for="res-800x480">800×480</label></span>
<span class="chip"><input type="radio" name="resolution" id="res-1024x600" value="1024x600"><label for="res-1024x600">1024×600</label></span>
<span class="chip"><input type="radio" name="resolution" id="res-unsure" value="Not sure"><label for="res-unsure">Not sure</label></span>
</div>
<p class="field-error">Please choose an option.</p>
</fieldset>

<fieldset data-group="interface">
<legend>4. Display interface</legend>
<div class="chip-group" role="radiogroup">
<span class="chip"><input type="radio" name="interface" id="int-spi" value="SPI" required><label for="int-spi">SPI</label></span>
<span class="chip"><input type="radio" name="interface" id="int-rgb" value="RGB"><label for="int-rgb">RGB</label></span>
<span class="chip"><input type="radio" name="interface" id="int-8080" value="8080 / Parallel"><label for="int-8080">8080 / Parallel</label></span>
<span class="chip"><input type="radio" name="interface" id="int-unsure" value="Not sure"><label for="int-unsure">Not sure</label></span>
</div>
<p class="field-error">Please choose an option.</p>
</fieldset>

<fieldset data-group="touchType">
<legend>5. Touch type</legend>
<div class="chip-group" role="radiogroup">
<span class="chip"><input type="radio" name="touchType" id="touch-cap" value="Capacitive" required><label for="touch-cap">Capacitive</label></span>
<span class="chip"><input type="radio" name="touchType" id="touch-res" value="Resistive"><label for="touch-res">Resistive</label></span>
<span class="chip"><input type="radio" name="touchType" id="touch-none" value="No touch"><label for="touch-none">No touch</label></span>
<span class="chip"><input type="radio" name="touchType" id="touch-unsure" value="Not sure"><label for="touch-unsure">Not sure</label></span>
</div>
<p class="field-error">Please choose an option.</p>
</fieldset>

<fieldset data-group="touchInterface">
<legend>6. Touch interface</legend>
<div class="chip-group" role="radiogroup">
<span class="chip"><input type="radio" name="touchInterface" id="ti-i2c" value="I²C" required><label for="ti-i2c">I²C</label></span>
<span class="chip"><input type="radio" name="touchInterface" id="ti-spi" value="SPI"><label for="ti-spi">SPI</label></span>
<span class="chip"><input type="radio" name="touchInterface" id="ti-other" value="Other / Not sure"><label for="ti-other">Other / Not sure</label></span>
</div>
<p class="field-error">Please choose an option.</p>
</fieldset>

<fieldset data-group="project">
<legend>7. Project type</legend>
<div class="chip-group" role="radiogroup">
<span class="chip"><input type="radio" name="project" id="proj-iot" value="IoT dashboard" required><label for="proj-iot">IoT dashboard</label></span>
<span class="chip"><input type="radio" name="project" id="proj-home" value="Home automation"><label for="proj-home">Home automation</label></span>
<span class="chip"><input type="radio" name="project" id="proj-hmi" value="HMI / control panel"><label for="proj-hmi">HMI / control panel</label></span>
<span class="chip"><input type="radio" name="project" id="proj-portable" value="Portable device"><label for="proj-portable">Portable device</label></span>
<span class="chip"><input type="radio" name="project" id="proj-data" value="Data display"><label for="proj-data">Data display</label></span>
<span class="chip"><input type="radio" name="project" id="proj-lvgl" value="ESP32 GUI / LVGL"><label for="proj-lvgl">ESP32 GUI / LVGL</label></span>
<span class="chip"><input type="radio" name="project" id="proj-rpi" value="Raspberry Pi-style interface"><label for="proj-rpi">Raspberry Pi-style interface</label></span>
<span class="chip"><input type="radio" name="project" id="proj-other" value="Other"><label for="proj-other">Other</label></span>
</div>
<p class="field-error">Please choose an option.</p>
</fieldset>

<fieldset data-group="lvgl">
<legend>8. Using LVGL?</legend>
<div class="chip-group" role="radiogroup">
<span class="chip"><input type="radio" name="lvgl" id="lvgl-yes" value="Yes" required><label for="lvgl-yes">Yes</label></span>
<span class="chip"><input type="radio" name="lvgl" id="lvgl-no" value="No"><label for="lvgl-no">No</label></span>
<span class="chip"><input type="radio" name="lvgl" id="lvgl-unsure" value="Not sure"><label for="lvgl-unsure">Not sure</label></span>
</div>
<p class="field-error">Please choose an option.</p>
</fieldset>

<fieldset data-group="psram">
<legend>9. PSRAM</legend>
<p class="field-hint">Extra RAM available on some ESP32 boards, useful for frame buffers and demanding graphical interfaces.</p>
<div class="chip-group" role="radiogroup">
<span class="chip"><input type="radio" name="psram" id="psram-req" value="Required" required><label for="psram-req">Required</label></span>
<span class="chip"><input type="radio" name="psram" id="psram-notreq" value="Not required"><label for="psram-notreq">Not required</label></span>
<span class="chip"><input type="radio" name="psram" id="psram-unsure" value="Not sure"><label for="psram-unsure">Not sure</label></span>
</div>
<p class="field-error">Please choose an option.</p>
</fieldset>

<div class="form-actions">
<button type="submit" class="btn-primary">Get my recommendation</button>
<button type="button" class="btn-secondary" id="reset-btn">Reset</button>
</div>

</form>
</section>




<section id="results" class="is-hidden" aria-labelledby="results-heading" aria-live="polite">

<h2 id="results-heading">Your recommended ESP32 touchscreen configuration</h2>

<div class="selection-summary">
<h3>Your selection</h3>
<p id="selection-text"></p>
</div>

<div class="confidence-banner">
<strong id="confidence-title">Recommendation ready</strong>
<span id="confidence-detail"></span>
</div>

<table class="spec-table">
<tbody id="spec-table-body"></tbody>
</table>

<div class="why-box">
<h3>Why this configuration</h3>
<p id="why-text"></p>
</div>

<div class="warning-list">
<h3>Compatibility warnings to check</h3>
<ul id="warning-list-items"></ul>
</div>

<div class="result-actions">
<button type="button" class="btn-small" id="copy-btn">Copy results</button>
<button type="button" class="btn-small" id="share-btn" hidden>Share results</button>
<span class="copy-feedback" id="copy-feedback" role="status"></span>
</div>

</section>


<section id="hardware" class="is-hidden" aria-labelledby="hardware-heading">

<h2 id="hardware-heading">Recommended hardware</h2>

<p class="section-intro">
Products are ranked by how closely their mapped specifications match the recommended configuration.
</p>

<div class="product-grid" id="product-grid"></div>

<p class="products-note">
More options are available in the
<a href="/esp32-touchscreen-displays-guide/">ESP32 Touchscreen Displays guide</a>.
</p>

</section>


<article aria-labelledby="guide-heading">

<section>

<h2 id="guide-heading">How to choose an ESP32 touchscreen display</h2>

<p>
Choosing the <strong>best ESP32 display</strong> is about matching the
board, display resolution, interface, touch controller and memory
requirements rather than simply choosing the largest screen.
</p>

<h3>Start with the ESP32 board</h3>

<p>
Small SPI displays can work well with several ESP32 variants.
For larger graphical interfaces, especially high-resolution RGB displays
or demanding LVGL projects, the ESP32-S3 is often the strongest starting
point because it offers display-oriented peripherals and is commonly
available with PSRAM.
</p>

<h3>Size and resolution matter</h3>

<p>
Display size alone does not determine hardware requirements.
A 4.3-inch display with a modest resolution can be easier to drive than
a smaller high-resolution panel. Resolution, interface, refresh
requirements and frame-buffer architecture are often more important.
</p>

<h3>SPI vs. RGB vs. 8080 / parallel</h3>

<ul>
<li><strong>SPI</strong> — relatively few pins and straightforward wiring. A good choice for many small and medium displays.</li>
<li><strong>RGB</strong> — higher pixel-data throughput but substantially more GPIOs and stricter hardware requirements.</li>
<li><strong>8080 / parallel</strong> — more GPIOs than SPI and potentially higher throughput, but exact controller and peripheral support must be verified.</li>
</ul>

<h3>Capacitive vs. resistive touch</h3>

<p>
Capacitive touch is common in modern interfaces and many controllers
use I²C. Resistive touch is useful for stylus, glove or pressure-based
input, and controllers such as the XPT2046 commonly use SPI.
These are common pairings, not universal rules.
</p>

<h3>PSRAM and LVGL</h3>

<p>
PSRAM is not automatically required for every
<strong>ESP32 display touch</strong> project. Small SPI interfaces can
often operate using internal RAM. As resolution, frame-buffer size and
UI complexity increase, PSRAM becomes increasingly valuable.
</p>

<h3>Match the display to the project</h3>

<p>
Portable devices and simple data displays often benefit from compact
SPI panels. IoT dashboards, home automation panels and Raspberry
Pi-style interfaces may benefit from larger displays, capacitive touch,
LVGL and an ESP32-S3 with suitable memory.
</p>

<div class="related-links">

<h3>Related Embedded Nerd tools &amp; guides</h3>

<ul>

<li>
<a href="/esp32-touchscreen-displays-guide/">
ESP32 Touchscreen Displays: Complete Guide to Choosing and Using a Touchscreen
</a>
</li>

<li>
<a href="/tools/i2c-address-lookup/">
I²C Address Lookup Tool
</a>
</li>

<li>
<a href="/tools/i2c-pull-up-resistor-calculator/">
I²C Pull-up Resistor Calculator
</a>
</li>

<li>
<span class="coming-soon">
ESP32 Display GPIO Calculator (coming soon)
</span>
</li>

</ul>

</div>

</section>
</article>


<section aria-labelledby="faq-heading">

<h2 id="faq-heading">Frequently asked questions</h2>

<details>
<summary>Which ESP32 board is best for a touchscreen display?</summary>
<p>
There is no single ESP32 board that is best for every touchscreen.
Small SPI displays can work well with several ESP32 variants. Larger
high-resolution RGB displays and demanding LVGL interfaces are generally
better suited to an ESP32-S3, often with PSRAM. Always verify the exact
board and display combination.
</p>
</details>

<details>
<summary>Do I need PSRAM for an ESP32 touchscreen project?</summary>
<p>
Not always. Small SPI touchscreen displays can often work without PSRAM.
PSRAM becomes increasingly useful for LVGL, larger frame buffers,
high-resolution displays and demanding graphical interfaces. For some
large RGB configurations it may be effectively required, depending on
the display driver and buffer architecture.
</p>
</details>

<details>
<summary>What's the difference between SPI and RGB ESP32 touchscreen displays?</summary>
<p>
SPI displays use relatively few pins and are generally simpler to
integrate, but their practical display throughput is lower. RGB
interfaces use substantially more GPIOs but can provide much higher
pixel throughput. Exact ESP32 peripheral, GPIO, memory and display
timing requirements must be verified.
</p>
</details>

<details>
<summary>Is capacitive or resistive touch better for an ESP32 display?</summary>
<p>
Neither is universally better. Capacitive touch is common in modern
interfaces and many controllers use I²C. Resistive touch can work
well with a stylus, gloves or pressure input, and controllers such
as the XPT2046 commonly use SPI.
</p>
</details>

<details>
<summary>Can I use LVGL on an ESP32 touchscreen display without PSRAM?</summary>
<p>
Yes. LVGL can run without PSRAM on suitable smaller displays if memory
usage and frame buffers are kept under control. Larger or higher-resolution
interfaces can benefit substantially from PSRAM.
</p>
</details>

</section>


<style>
.en-touch-tool{max-width:820px;margin:2rem auto;}
.en-touch-tool *, .en-touch-tool *::before, .en-touch-tool *::after{box-sizing:border-box;}
.en-touch-tool .en-tool-header{margin-bottom:1.25rem;}
.en-tool-brand{display:flex;align-items:center;justify-content:space-between;gap:.5rem 1rem;flex-wrap:wrap;margin-bottom:.35rem;}
.en-tool-kicker{font-size:.72rem;font-weight:800;letter-spacing:.13em;opacity:.75;}
.en-tool-status{font-size:.72rem;opacity:.7;}
.en-status-dot{display:inline-block;width:7px;height:7px;border-radius:50%;background:currentColor;margin-right:5px;opacity:.8;}
.en-touch-tool .en-tool-header h2{margin-top:0;margin-bottom:.55rem;}
.en-touch-tool .en-tool-header p{margin-bottom:0;line-height:1.65;}
.en-progress-wrap{margin-top:1.1rem;}
.en-progress-meta{display:flex;justify-content:space-between;gap:1rem;font-size:.78rem;opacity:.75;margin-bottom:.45rem;}
.en-progress-track{height:5px;border-radius:999px;overflow:hidden;background:currentColor;opacity:.15;}
.en-progress-bar{width:0;height:100%;border-radius:999px;background:currentColor;opacity:1;transition:width .25s ease;}
.en-touch-tool fieldset{margin:0 0 .85rem;padding:1rem 1rem 1.1rem;border:1px solid currentColor;border-radius:.35rem;opacity:.92;}
.en-touch-tool fieldset:hover{opacity:1;}
.en-touch-tool legend{padding:0 .45rem;font-weight:750;}
.en-touch-tool .field-hint{font-size:.82rem;line-height:1.55;opacity:.7;margin:.05rem 0 .75rem;}
.en-touch-tool .field-error{display:none;font-size:.82rem;font-weight:650;margin:.5rem 0 0;}
.en-touch-tool fieldset.has-error{border-width:2px;}
.en-touch-tool fieldset.has-error .field-error{display:block;}
.en-touch-tool .chip-group{display:flex;flex-wrap:wrap;gap:.5rem;}
.en-touch-tool .chip{position:relative;}
.en-touch-tool .chip input{position:absolute;opacity:0;width:1px;height:1px;}
.en-touch-tool .chip label{display:inline-flex;align-items:center;min-height:2.45rem;padding:.5rem .8rem;border:1px solid currentColor;border-radius:.35rem;background:transparent;cursor:pointer;user-select:none;opacity:.72;transition:opacity .15s ease,transform .12s ease,background .15s ease;}
.en-touch-tool .chip label:hover{opacity:1;}
.en-touch-tool .chip input:checked + label{opacity:1;font-weight:700;background:rgba(22,160,133,.16);box-shadow:inset 0 0 0 1px rgba(22,160,133,.45);}
.en-touch-tool .chip input:focus-visible + label{outline:2px solid currentColor;outline-offset:2px;}
.en-touch-tool .chip input:active + label{transform:scale(.98);}
.en-touch-tool .form-actions,.en-touch-tool .result-actions{display:flex;gap:.6rem;flex-wrap:wrap;align-items:center;margin-top:1rem;}
.en-touch-tool button{font-family:inherit;cursor:pointer;border-radius:.35rem;transition:transform .12s ease,opacity .15s ease;}
.en-touch-tool button:active{transform:translateY(1px);}
.en-touch-tool .btn-primary{padding:.7rem 1.05rem;font-weight:750;}
.en-touch-tool .btn-secondary,.en-touch-tool .btn-small{padding:.62rem .9rem;font-weight:650;}
.en-touch-tool .btn-small{padding:.45rem .7rem;font-size:.82rem;}
.en-touch-tool .is-hidden,#hardware.is-hidden{display:none;}
.en-touch-tool .selection-summary,.en-touch-tool .confidence-banner,.en-touch-tool .why-box,.en-touch-tool .warning-list,.en-touch-tool .related-links,#hardware .product-card{border:1px solid currentColor;border-radius:.35rem;padding:1rem;opacity:.95;}
.en-touch-tool .selection-summary,.en-touch-tool .confidence-banner,.en-touch-tool .why-box,.en-touch-tool .warning-list{margin-bottom:.85rem;}
.en-touch-tool .selection-summary h3,.en-touch-tool .why-box h3{margin-top:0;}
.en-touch-tool .selection-summary p{margin-bottom:0;font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-size:.79rem;line-height:1.55;opacity:.8;}
.en-touch-tool .confidence-banner{display:flex;gap:.5rem;align-items:center;flex-wrap:wrap;}
.en-touch-tool .confidence-banner span{opacity:.75;font-size:.88rem;}
.en-touch-tool .spec-table{width:100%;border-collapse:separate;border-spacing:0;overflow:hidden;border:1px solid currentColor;border-radius:.35rem;margin-bottom:.85rem;}
.en-touch-tool .spec-table th,.en-touch-tool .spec-table td{text-align:left;padding:.65rem .75rem;border-bottom:1px solid currentColor;vertical-align:top;font-size:.88rem;}
.en-touch-tool .spec-table tr:last-child th,.en-touch-tool .spec-table tr:last-child td{border-bottom:0;}
.en-touch-tool .spec-table th{width:44%;font-weight:550;opacity:.7;}
.en-touch-tool .spec-value{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;}
.en-touch-tool .badge{display:inline-block;margin-left:.35rem;padding:.12rem .4rem;border:1px solid currentColor;border-radius:999px;font-size:.65rem;font-weight:800;white-space:nowrap;}
.en-touch-tool .why-box{border-left-width:3px;}
.en-touch-tool .why-box p{margin-bottom:0;line-height:1.6;}
.en-touch-tool .warning-list{padding-left:2rem;}
.en-touch-tool .warning-list h3{margin-top:0;}
.en-touch-tool .warning-list li{margin-bottom:.4rem;font-size:.86rem;line-height:1.5;}
.en-touch-tool .copy-feedback{font-size:.82rem;font-weight:700;}
#hardware .product-grid{display:grid;grid-template-columns:1fr;gap:.85rem;}
#hardware .product-thumb{aspect-ratio:4/3;display:flex;align-items:center;justify-content:center;overflow:hidden;border:1px solid currentColor;border-radius:.3rem;opacity:.85;}
#hardware .product-thumb img{width:100%;height:100%;object-fit:contain;}
#hardware .product-card h3{margin:.75rem 0 .35rem;font-size:.98rem;}
#hardware .product-card p{margin-bottom:.75rem;font-size:.83rem;line-height:1.5;opacity:.75;}
#hardware .product-card a{display:block;text-align:center;text-decoration:none;}
.product-match{display:flex;align-items:center;gap:.4rem;flex-wrap:wrap;margin-bottom:.45rem;font-size:.74rem;}
.product-match strong{padding:.15rem .45rem;border:1px solid currentColor;border-radius:999px;font-weight:800;}
.product-match span{opacity:.65;}
.related-links{margin-top:1.4rem;}
.coming-soon{opacity:.7;font-style:italic;}
@media(min-width:560px){#hardware .product-grid{grid-template-columns:1fr 1fr;}}
@media(max-width:600px){.en-touch-tool fieldset{padding:.9rem .8rem 1rem;}.en-touch-tool .chip label{min-height:2.35rem;padding:.45rem .65rem;font-size:.84rem;}.en-touch-tool .form-actions{flex-direction:column;}.en-touch-tool .btn-primary,.en-touch-tool .btn-secondary{width:100%;text-align:center;}.en-touch-tool .spec-table th,.en-touch-tool .spec-table td{padding:.55rem .5rem;font-size:.82rem;}.en-touch-tool .spec-table th{width:40%;}}
@media(prefers-reduced-motion:reduce){.en-touch-tool *,.en-touch-tool *::before,.en-touch-tool *::after{transition:none!important;}}
</style>


<script>
(function(){

"use strict";

function initTouchscreenSelector(){

var form=document.getElementById("selector-form");
var results=document.getElementById("results");
var hardware=document.getElementById("hardware");
var productGrid=document.getElementById("product-grid");

var groups=[
  "board",
  "size",
  "resolution",
  "interface",
  "touchType",
  "touchInterface",
  "project",
  "lvgl",
  "psram"
];

var lastRecommendation=null;

form.addEventListener("change", updateSelectionProgress);
updateSelectionProgress();


/*
=========================================================
PRODUCT DATABASE

Map your real Embedded Nerd products here.

For external affiliate links use:
target="_blank"
rel="nofollow sponsored noopener"

=========================================================
*/

var products=[

{
name:'ILI9341 2.8" SPI TFT + XPT2046 Touch',
image:'/assets/images/products/ili9341-xpt2046-2-8-touchscreen.webp',
href:'/products/ili9341-xpt2046-2-8-touchscreen/',
reason:'Compact SPI touchscreen for smaller ESP32 projects. The ILI9341 display and XPT2046 resistive touch controller make this a straightforward low-pin-count option.',
esp32:['ESP32','ESP32-S2','ESP32-S3'],
sizes:['2.4–2.8"'],
resolutions:['240x320','320x240'],
interfaces:['SPI'],
touch:['Resistive'],
touchInterfaces:['SPI'],
psram:false
},

{
name:'Waveshare ESP32-S3-Touch-LCD-4.3',
image:'/assets/images/products/waveshare-esp32-s3-touch-lcd-4-3.webp',
href:'/products/waveshare-esp32-s3-touch-lcd-4-3/',
reason:'Integrated ESP32-S3 touchscreen platform for 4.3-inch 800×480 graphical interfaces and more demanding GUI projects.',
esp32:['ESP32-S3'],
sizes:['4.3"'],
resolutions:['800x480'],
interfaces:['RGB'],
touch:['Capacitive'],
touchInterfaces:['I²C'],
psram:true
},

{
name:'Waveshare ESP32-S3-Touch-LCD-7',
image:'/assets/images/products/waveshare-esp32-s3-touch-lcd-7.webp',
href:'/products/waveshare-esp32-s3-touch-lcd-7/',
reason:'Large ESP32-S3 touchscreen platform aimed at dashboards, HMI and Raspberry Pi-style interfaces.',
esp32:['ESP32-S3'],
sizes:['7"'],
resolutions:['1024x600'],
interfaces:['RGB'],
touch:['Capacitive'],
touchInterfaces:['I²C'],
psram:true
}

];


/*
=========================================================
VALUE HELPERS
=========================================================
*/

function getValue(name){

var el=form.querySelector(
'input[name="'+name+'"]:checked'
);

return el ? el.value : null;

}


function isHighResolution(res){

return res==="800x480" ||
       res==="1024x600";

}


function isLargeSize(size){

return size==='5"' ||
       size==='7"';

}


function escapeHtml(value){

return String(value)
.replace(/&/g,"&amp;")
.replace(/</g,"&lt;")
.replace(/>/g,"&gt;")
.replace(/"/g,"&quot;")
.replace(/'/g,"&#039;");

}


/*
=========================================================
VALIDATION
=========================================================
*/

function clearErrors(){

groups.forEach(function(group){

var fs=form.querySelector(
'fieldset[data-group="'+group+'"]'
);

if(fs){
fs.classList.remove("has-error");
}

});

}


function validate(){

clearErrors();

var answers={};
var firstInvalid=null;

groups.forEach(function(group){

var value=getValue(group);

answers[group]=value;

if(!value){

var fs=form.querySelector(
'fieldset[data-group="'+group+'"]'
);

if(fs){

fs.classList.add("has-error");

if(!firstInvalid){
firstInvalid=fs;
}

}

}

});


if(firstInvalid){

firstInvalid.scrollIntoView({
behavior:"smooth",
block:"center"
});

var input=firstInvalid.querySelector("input");

if(input){
input.focus();
}

return null;

}

return answers;

}


/*
=========================================================
RECOMMENDATION ENGINE
=========================================================
*/

function computeRecommendation(a){

var warnings=[];
var reasons=[];

var score=100;

var boardRec;
var boardStatus="recommended";

var interfaceRec;
var interfaceStatus="recommended";

var sizeRec=
a.size==="Other / Not sure"
?"Choose according to enclosure and viewing distance"
:a.size;

var resolutionRec=
a.resolution==="Not sure"
?"Choose according to UI requirements"
:a.resolution;

var touchRec;
var touchInterfaceRec;
var touchStatus="recommended";

var psramRec;
var lvglRec;


/*
DISPLAY DEMAND
*/

var demand=0;

if(isHighResolution(a.resolution)){
demand+=3;
}

if(a.interface==="RGB"){
demand+=3;
}

if(a.interface==="8080 / Parallel"){
demand+=2;
}

if(isLargeSize(a.size)){
demand+=1;
}

if(a.lvgl==="Yes"){
demand+=2;
}

if(a.psram==="Required"){
demand+=2;
}


/*
BOARD
*/

if(
a.interface==="RGB" ||
isHighResolution(a.resolution) ||
(a.lvgl==="Yes" && isLargeSize(a.size)) ||
a.psram==="Required"
){

boardRec="ESP32-S3";

}else if(
a.board==="ESP32" ||
a.board==="ESP32-S2" ||
a.board==="ESP32-S3" ||
a.board==="ESP32-C3"
){

boardRec=a.board;

}else{

boardRec="ESP32 or ESP32-S3";

}


/*
BOARD STATUS
*/

if(a.board==="Not sure"){

boardStatus="recommended";

}else if(
boardRec==="ESP32 or ESP32-S3" &&
(a.board==="ESP32" || a.board==="ESP32-S3")
){

boardStatus="likely";

}else if(a.board===boardRec){

boardStatus="recommended";

}else{

boardStatus="verify";

score-=20;

warnings.push(
"Your selected "+a.board+
" is not the preferred board for this configuration. "+
"The tool recommends "+boardRec+
", but the exact board and display combination must still be verified."
);

}


/*
C3 / HIGH DEMAND
*/

if(
a.board==="ESP32-C3" &&
(
a.interface==="RGB" ||
isHighResolution(a.resolution)
)
){

score-=15;

warnings.push(
"The ESP32-C3 is not the preferred platform for this high-demand display configuration. Consider an ESP32-S3 and verify the exact hardware requirements."
);

}


/*
INTERFACE
*/

if(a.interface==="SPI"){

interfaceRec="SPI";

reasons.push(
"SPI keeps GPIO usage relatively low and is practical for many small and medium displays."
);

}else if(a.interface==="RGB"){

interfaceRec="RGB";

reasons.push(
"RGB provides high pixel-data throughput, but requires more GPIOs and careful display timing configuration."
);

}else if(a.interface==="8080 / Parallel"){

interfaceRec="8080 / Parallel";

reasons.push(
"8080/parallel can provide higher throughput than SPI, but uses more GPIOs and requires controller-specific verification."
);

}else{

if(isHighResolution(a.resolution)){

interfaceRec="RGB or 8080 / Parallel";

interfaceStatus="likely";

reasons.push(
"Because the interface is unknown but the resolution is high, RGB or 8080/parallel should be investigated before selecting a specific module."
);

}else{

interfaceRec="SPI";

reasons.push(
"Because the interface is unknown and the display demand is relatively modest, SPI is the simplest starting point."
);

}

}


/*
RGB
*/

if(interfaceRec==="RGB"){

warnings.push(
"RGB displays use substantially more GPIOs than SPI. Check the exact display pinout and available ESP32 GPIOs."
);

if(isHighResolution(a.resolution)){

warnings.push(
"High-resolution RGB displays can require significant memory for frame buffers. An ESP32-S3 with suitable PSRAM is the safer choice."
);

}

}


/*
SPI
*/

if(
interfaceRec==="SPI" &&
isHighResolution(a.resolution)
){

score-=10;

warnings.push(
"SPI can be used with some higher-resolution displays, but practical refresh performance may be lower than RGB or parallel interfaces."
);

}


/*
TOUCH
*/

if(a.touchType==="No touch"){

touchRec="No touch";
touchInterfaceRec="N/A";

}else if(a.touchType==="Capacitive"){

touchRec="Capacitive";

if(a.touchInterface==="I²C"){

touchInterfaceRec="I²C";

}else if(a.touchInterface==="SPI"){

touchInterfaceRec="SPI";
touchStatus="verify";

score-=5;

warnings.push(
"SPI capacitive touch is possible, but I²C is more common. Verify the exact touch controller."
);

}else{

touchInterfaceRec="I²C";
touchStatus="likely";

warnings.push(
"Many capacitive touch controllers use I²C. Verify the exact controller, address and interrupt requirements."
);

}

}else if(a.touchType==="Resistive"){

touchRec="Resistive";

if(a.touchInterface==="SPI"){

touchInterfaceRec="SPI";

}else if(a.touchInterface==="I²C"){

touchInterfaceRec="I²C";
touchStatus="verify";

score-=5;

warnings.push(
"I²C resistive touch exists, but SPI is more commonly found with controllers such as the XPT2046. Verify the controller."
);

}else{

touchInterfaceRec="SPI";
touchStatus="likely";

warnings.push(
"Many resistive touch controllers use SPI. Verify the exact controller and required chip-select/interrupt pins."
);

}

}else{

touchRec="Capacitive or resistive — verify";

if(a.touchInterface==="I²C"){

touchInterfaceRec="I²C";
touchStatus="likely";

}else if(a.touchInterface==="SPI"){

touchInterfaceRec="SPI";
touchStatus="likely";

}else{

touchInterfaceRec="I²C or SPI — verify";
touchStatus="verify";

}

warnings.push(
"Touch technology is unknown. Check the touchscreen controller before assuming capacitive or resistive operation."
);

}


/*
PSRAM
*/

if(a.psram==="Required"){

psramRec="Required by project";

}else if(
isHighResolution(a.resolution) ||
interfaceRec==="RGB" ||
(a.lvgl==="Yes" && demand>=4) ||
isLargeSize(a.size)
){

psramRec="Strongly recommended; may be required";

reasons.push(
"PSRAM is strongly recommended because this configuration can require larger graphics buffers or more memory."
);

}else{

psramRec="Not normally required";

}


/*
LVGL
*/

if(a.lvgl==="Yes"){

if(
boardRec==="ESP32-S3" &&
(
isHighResolution(a.resolution) ||
interfaceRec==="RGB"
)
){

lvglRec="Excellent fit";

}else if(interfaceRec==="SPI"){

lvglRec="Good fit; keep buffers appropriate to available RAM";

}else{

lvglRec="Suitable with memory and driver verification";

}

reasons.push(
"LVGL is suitable for graphical touchscreen interfaces, but available RAM, frame buffers and display-driver support should be checked for the exact hardware."
);

}else if(a.lvgl==="No"){

lvglRec="Not required";

}else{

lvglRec="Optional; depends on UI complexity";

}


/*
SIZE / RESOLUTION UNKNOWN
*/

if(a.size==="Other / Not sure"){

warnings.push(
"Display size is unknown. Choose according to viewing distance, enclosure space and intended UI."
);

}

if(a.resolution==="Not sure"){

warnings.push(
"Display resolution is unknown. Verify it before choosing the final ESP32 memory and interface configuration."
);

}


/*
PROJECT
*/

if(
a.project==="IoT dashboard" ||
a.project==="Home automation" ||
a.project==="HMI / control panel" ||
a.project==="Raspberry Pi-style interface"
){

reasons.push(
"Your project type benefits from a graphical interface, making suitable display bandwidth, touch input and GUI support important."
);

}


/*
DIFFICULTY
*/

var difficultyPoints=0;

if(interfaceRec==="RGB") difficultyPoints+=2;
if(interfaceRec==="8080 / Parallel") difficultyPoints+=2;
if(isHighResolution(a.resolution)) difficultyPoints+=2;
if(isLargeSize(a.size)) difficultyPoints+=1;
if(a.lvgl==="Yes") difficultyPoints+=1;
if(a.psram==="Required") difficultyPoints+=1;
if(a.touchType!=="No touch") difficultyPoints+=1;
if(boardStatus==="verify") difficultyPoints+=2;
if(touchStatus==="verify") difficultyPoints+=1;

var difficulty=
difficultyPoints<=2
?"Beginner"
:difficultyPoints<=5
?"Intermediate"
:"Advanced";


/*
GENERAL WARNING
*/

warnings.push(
"Not every ESP32 board is compatible with every display module. Verify the exact display controller, touch controller, pinout, voltage, memory, interface and driver support before ordering."
);


/*
WHY
*/

reasons.unshift(
"The recommendation is based primarily on resolution, display interface, memory demand and your project requirements."
);

reasons.push(
"The recommended board is "+boardRec+
" because it provides the most appropriate balance of peripheral support and memory headroom for this configuration."
);

return{

score:Math.max(0,Math.min(100,score)),

board:boardRec,
boardStatus:boardStatus,

size:sizeRec,

resolution:resolutionRec,

iface:interfaceRec,
ifaceStatus:interfaceStatus,

touchType:touchRec,
touchInterface:touchInterfaceRec,
touchStatus:touchStatus,

psram:psramRec,

lvgl:lvglRec,

difficulty:difficulty,

why:reasons.join(" "),

warnings:warnings

};

}


/*
=========================================================
RENDER
=========================================================
*/

function badge(status){

if(status==="recommended")
return '<span class="badge recommended">Recommended</span>';

if(status==="likely")
return '<span class="badge likely">Likely compatible</span>';

return '<span class="badge verify">Requires verification</span>';

}


function renderResults(rec,a){

document.getElementById("selection-text")
.textContent=[
a.board,
a.size,
a.resolution,
a.interface,
a.touchType,
a.touchInterface
].join(" · ");


var title=
document.getElementById("confidence-title");

var detail=
document.getElementById("confidence-detail");


if(rec.score>=90 && rec.boardStatus!=="verify"){

title.textContent="Strong configuration match";

detail.textContent=
"The selected requirements align well with the recommended hardware approach.";

}else if(rec.score>=75 && rec.boardStatus!=="verify"){

title.textContent="Good configuration match";

detail.textContent=
"The configuration is practical, but exact module specifications should still be checked.";

}else{

title.textContent="Requires verification";

detail.textContent=
"One or more hardware constraints need closer verification.";

}


var rows=[

["Recommended ESP32",rec.board,rec.boardStatus],

["Recommended display size",rec.size,"likely"],

["Recommended resolution",rec.resolution,"likely"],

["Recommended display interface",rec.iface,rec.ifaceStatus],

["Recommended touch technology",rec.touchType,rec.touchStatus],

["Recommended touch interface",rec.touchInterface,rec.touchStatus],

["PSRAM",rec.psram,
rec.psram.indexOf("Required")!==-1
?"recommended"
:"likely"],

["LVGL suitability",rec.lvgl,"likely"],

["Estimated project difficulty",rec.difficulty,"likely"]

];


var tbody=
document.getElementById("spec-table-body");

tbody.innerHTML="";


rows.forEach(function(row){

var tr=document.createElement("tr");

var th=document.createElement("th");

th.scope="row";

th.textContent=row[0];

var td=document.createElement("td");

td.innerHTML=
'<span class="spec-value">'+
escapeHtml(row[1])+
"</span>"+
badge(row[2]);

tr.appendChild(th);
tr.appendChild(td);

tbody.appendChild(tr);

});


document.getElementById("why-text")
.textContent=rec.why;


var warningList=
document.getElementById("warning-list-items");

warningList.innerHTML="";


rec.warnings.forEach(function(w){

var li=document.createElement("li");

li.textContent=w;

warningList.appendChild(li);

});


results.classList.remove("is-hidden");

}


/*
=========================================================
PRODUCT MATCHING

The score is based on the recommendation, not the user's
raw selection. This means the product section supports
the recommended solution instead of simply echoing inputs.

=========================================================
*/

function productMatch(product,rec){

var score=0;

if(product.esp32.indexOf(rec.board)!==-1)
score+=5;

if(product.sizes.indexOf(rec.size)!==-1)
score+=4;

if(product.resolutions.indexOf(rec.resolution)!==-1)
score+=5;

if(product.interfaces.indexOf(rec.iface)!==-1)
score+=5;

if(product.touch.indexOf(rec.touchType)!==-1)
score+=3;

if(product.touchInterfaces.indexOf(rec.touchInterface)!==-1)
score+=3;

if(
rec.psram.indexOf("Required")!==-1 &&
product.psram
)
score+=3;

return score;

}


function renderProducts(rec){

productGrid.innerHTML="";


var ranked=products
.map(function(product){

return{
product:product,
score:productMatch(product,rec)
};

})
.filter(function(item){

return item.score>=5;

})
.sort(function(a,b){

return b.score-a.score;

})
.slice(0,3);


if(!ranked.length){

productGrid.innerHTML=
"<p>No mapped hardware currently matches this configuration. "+
'See the <a href="/esp32-touchscreen-displays-guide/">ESP32 Touchscreen Displays guide</a> for more options.</p>';

hardware.classList.remove("is-hidden");

return;

}


ranked.forEach(function(item){

var p=item.product;

var card=document.createElement("article");

card.className="product-card";


var thumb=document.createElement("div");

thumb.className="product-thumb";


if(p.image){

var img=document.createElement("img");

img.src=p.image;

img.alt=p.name;

img.loading="lazy";

thumb.appendChild(img);

}


var h3=document.createElement("h3");

h3.textContent=p.name;


var match=document.createElement("div");

match.className="product-match";

var matchPercent=Math.min(99,Math.round((item.score/23)*100));

match.innerHTML="<strong>"+matchPercent+"% match</strong> <span>based on mapped specifications</span>";


var reason=document.createElement("p");

reason.textContent=p.reason;


var link=document.createElement("a");

link.className="btn-primary";

link.href=p.href;

link.textContent="View product";


card.appendChild(thumb);
card.appendChild(h3);
card.appendChild(match);
card.appendChild(reason);
card.appendChild(link);

productGrid.appendChild(card);

});


hardware.classList.remove("is-hidden");

}


/*
=========================================================
SUBMIT
=========================================================
*/

function handleSelectorSubmit(e){

if(e){
e.preventDefault();
e.stopPropagation();
}

var answers=validate();

if(!answers){
return false;
}

lastRecommendation=
computeRecommendation(answers);

renderResults(
lastRecommendation,
answers
);

renderProducts(
lastRecommendation
);

results.scrollIntoView({
behavior:"smooth",
block:"start"
});

return false;
}

window.embeddedNerdTouchscreenSubmit=handleSelectorSubmit;

form.addEventListener("submit",handleSelectorSubmit);


/*
=========================================================
RESET
=========================================================
*/

document
.getElementById("reset-btn")
.addEventListener("click",function(){

clearErrors();

results.classList.add("is-hidden");

hardware.classList.add("is-hidden");

lastRecommendation=null;

});


/*
=========================================================
COPY
=========================================================
*/

document
.getElementById("copy-btn")
.addEventListener("click",function(){

if(!lastRecommendation){
return;
}

var rec=lastRecommendation;

var text=[

"Embedded Nerd — ESP32 Touchscreen Selector",

"",

"Recommended configuration:",

"ESP32: "+rec.board,

"Display size: "+rec.size,

"Resolution: "+rec.resolution,

"Display interface: "+rec.iface,

"Touch: "+rec.touchType,

"Touch interface: "+rec.touchInterface,

"PSRAM: "+rec.psram,

"LVGL: "+rec.lvgl,

"Difficulty: "+rec.difficulty,

"",

"Why: "+rec.why,

"",

"Warnings:"

].concat(

rec.warnings.map(function(w){

return"- "+w;

})

).join("\n");


var feedback=
document.getElementById("copy-feedback");


function done(ok){

feedback.textContent=
ok
?"Copied to clipboard."
:"Could not copy — select and copy manually.";

}


if(
navigator.clipboard &&
navigator.clipboard.writeText
){

navigator.clipboard
.writeText(text)
.then(
function(){done(true);},
function(){done(false);}
);

}else{

try{

var textarea=document.createElement("textarea");

textarea.value=text;

textarea.style.position="fixed";
textarea.style.opacity="0";

document.body.appendChild(textarea);

textarea.focus();
textarea.select();

var ok=document.execCommand("copy");

document.body.removeChild(textarea);

done(ok);

}catch(error){

done(false);

}

}

});


/*
=========================================================
SHARE
=========================================================
*/

var shareButton=
document.getElementById("share-btn");


if(navigator.share){

shareButton.hidden=false;

shareButton.addEventListener(
"click",
function(){

if(!lastRecommendation){
return;
}

navigator.share({

title:"ESP32 Touchscreen Recommendation",

text:
"Embedded Nerd — ESP32 Touchscreen Selector\n\n"+
"Recommended ESP32: "+
lastRecommendation.board+
"\nDisplay: "+
lastRecommendation.size+
" · "+
lastRecommendation.resolution+
"\nInterface: "+
lastRecommendation.iface+
"\nTouch: "+
lastRecommendation.touchType+
" · "+
lastRecommendation.touchInterface+
"\nPSRAM: "+
lastRecommendation.psram

}).catch(function(){});

}
);

}

}

if(document.readyState === "loading"){
  document.addEventListener("DOMContentLoaded", initTouchscreenSelector, {once:true});
}else{
  initTouchscreenSelector();
}

})();
</script>

{:/nomarkdown}



<script>
/*
FAQ structured data is generated from the visible FAQ content.
This keeps the JSON-LD synchronized with the page text.
*/
(function(){

var faq=document.querySelectorAll("details");

if(!faq.length){
return;
}

var entities=[];

faq.forEach(function(item){

var question=item.querySelector("summary");
var answer=item.querySelector("p");

if(question && answer){

entities.push({

"@type":"Question",

"name":question.textContent.trim(),

"acceptedAnswer":{

"@type":"Answer",

"text":answer.textContent.trim()

}

});

}

});


var script=document.createElement("script");

script.type="application/ld+json";

script.textContent=JSON.stringify({

"@context":"https://schema.org",

"@type":"FAQPage",

"mainEntity":entities

});

document.head.appendChild(script);

})();
</script>
