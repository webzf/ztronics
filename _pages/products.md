---
layout: single
classes: wide
title: "Products"
permalink: /products/
redirect_from:
  - /best-esp32-boards/
  - /best-esp32-sensors/
  - /de/best-esp32-boards/
  - /de/best-esp32-sensors/
  - /es/best-esp32-boards/
  - /es/best-esp32-sensors/
  - /fr/best-esp32-boards/
  - /fr/best-esp32-sensors/
  - /it/best-esp32-boards/
  - /it/best-esp32-sensors/
  - /nl/best-esp32-boards/
  - /nl/best-esp32-sensors/
  - /pl/best-esp32-boards/
  - /pl/best-esp32-sensors/
  - /pt/best-esp32-boards/
  - /pt/best-esp32-sensors/
author_profile: false
sidebar:
  nav: embedded
toc: false
internal_links: true
excerpt: "Explore development boards, ESP32 displays, sensors, modules and electronics accessories for embedded projects."
description: "Browse the Embedded Nerd hardware directory: development boards, ESP32 displays, sensors, modules and accessories, with technical guides and product information."
---

<div class="en-products-page" id="en-products-catalog">

  <section class="en-products-hero" aria-labelledby="en-products-hero-title">
    <div class="en-products-hero-content">
      <span class="en-products-label">Embedded Nerd Hardware Directory</span>
      <h2 id="en-products-hero-title">Hardware for Makers &amp; Engineers</h2>
      <p>Explore development boards, displays, sensors and modules for Arduino, ESP32, Raspberry Pi and embedded projects. Find the hardware, then dive into the technical details.</p>
      <div class="en-products-hero-meta">
        <span><strong>{{ site.products.size }}</strong> products</span>
        <span aria-hidden="true">·</span>
        <span>Technical guides and buying information</span>
      </div>
    </div>
  </section>

  {% assign category_order = "Development Boards|Displays|Sensors|Modules|Accessories" | split: "|" %}

  <nav class="en-category-nav" aria-label="Browse product categories">
    <div class="en-category-nav-inner">
      <span class="en-category-nav-label">Browse</span>
      {% for category in category_order %}
        {% assign category_products = site.products | where: "category", category %}
        {% if category_products.size > 0 %}
          {% assign category_slug = category | slugify %}
          <a class="en-category-chip" href="#{{ category_slug }}">
            <span class="en-category-icon" aria-hidden="true">
              {% case category %}
                {% when "Development Boards" %}⌘
                {% when "Displays" %}▣
                {% when "Sensors" %}◉
                {% when "Modules" %}▦
                {% when "Accessories" %}⌁
              {% endcase %}
            </span>
            <span class="en-category-name">{{ category }}</span>
            <span class="en-category-count">{{ category_products.size }}</span>
          </a>
        {% endif %}
      {% endfor %}
      <a class="en-category-top" href="#en-products-catalog" aria-label="Back to top" title="Back to top"><span aria-hidden="true">↑</span><span class="en-category-top-label">Top</span></a>
    </div>
  </nav>

  {% assign featured_ids = "arduino-uno-q|guition-esp32-s3-4848s040|waveshare-esp32-p4-wifi6-touch-lcd-7b|esp32-devkit" | split: "|" %}
  <section class="en-featured-section" aria-labelledby="en-featured-title">
    <div class="en-section-heading">
      <div>
        <span class="en-section-eyebrow">Worth a closer look</span>
        <h2 id="en-featured-title">Recommended Hardware</h2>
        <p>A few notable boards from the Embedded Nerd catalogue.</p>
      </div>
    </div>
    <div class="en-featured-grid">
      {% for featured_id in featured_ids %}
        {% assign featured_product = site.products | where: "product_id", featured_id | first %}
        {% if featured_product %}
          {% include product-card.html product=featured_product %}
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <section class="en-products-toolbar" aria-label="Search the hardware catalogue">
    <label class="en-search-box" for="en-product-search">
      <svg class="en-search-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
        <circle cx="10.8" cy="10.8" r="6.8" stroke="currentColor" stroke-width="1.8"></circle>
        <path d="m16 16 5 5" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"></path>
      </svg>
      <input class="en-search" id="en-product-search" type="search" placeholder="Search boards, displays, sensors and modules..." autocomplete="off">
      <span class="en-search-hint">Search</span>
    </label>
    <p class="en-search-results" id="en-search-results" aria-live="polite">{{ site.products.size }} products in the catalogue</p>
  </section>

  <div class="en-product-categories">
    {% for category in category_order %}
      {% assign products = site.products | where: "category", category | sort: "title" %}
      {% if products.size > 0 %}
        {% assign slug = category | slugify %}
        <section class="en-product-category" id="{{ slug }}" data-product-category>
          <div class="en-category-heading">
            <div>
              <h2>{{ category }}</h2>
              {% case category %}
                {% when "Development Boards" %}
                  <p>ESP32, Arduino and Raspberry Pi development boards.</p>
                {% when "Displays" %}
                  <p>OLED, LCD, TFT, AMOLED and touchscreen displays.</p>
                {% when "Sensors" %}
                  <p>Motion, temperature, humidity, pressure and environmental sensors.</p>
                {% when "Modules" %}
                  <p>Motor drivers, power modules, joysticks and interface boards.</p>
                {% when "Accessories" %}
                  <p>Breadboards, jumper wires and prototyping essentials.</p>
              {% endcase %}
            </div>
            <span class="en-category-total">{{ products.size }} {% if products.size == 1 %}product{% else %}products{% endif %}</span>
          </div>
          <div class="en-product-grid en-product-list">
            {% for product in products %}
              {% include product-card.html product=product %}
            {% endfor %}
          </div>
        </section>
      {% endif %}
    {% endfor %}
  </div>

  <div class="en-no-products" id="en-no-products" hidden>
    <div class="en-empty-icon" aria-hidden="true">⌕</div>
    <h3>No matching products</h3>
    <p>Try another search term, such as ESP32, touchscreen, sensor or Arduino.</p>
  </div>

  <p class="en-products-note">Product information is provided for research and comparison. Check each product page for specifications, compatibility notes, documentation and available buying options.</p>

</div>

<script src="{{ '/assets/js/products-catalog.js' | relative_url }}" defer></script>
