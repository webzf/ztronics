---
title: "Electronic Components"
layout: single
permalink: /products/

author_profile: false
toc: false
classes: wide
search: false
---

<div class="en-products-page">

    <!-- HERO -->

    <section class="en-products-hero">

        <div class="en-products-hero-content">

            <span class="en-products-label">

                Embedded Nerd Library

            </span>

            <h1>

                Electronic Components

            </h1>

            <p>

                Explore development boards, sensors, displays,
                modules and accessories used throughout our tutorials.

            </p>

        </div>

    </section>

    <!-- SEARCH -->

    <section class="en-products-toolbar">

        <div class="en-search-box">

            <svg class="en-search-icon"
                 viewBox="0 0 24 24"
                 fill="none"
                 stroke="currentColor"
                 stroke-width="2">

                <circle cx="11" cy="11" r="8"></circle>

                <line x1="21"
                      y1="21"
                      x2="16.65"
                      y2="16.65"></line>

            </svg>

            <input
                id="productSearch"
                class="en-search"
                type="search"
                autocomplete="off"
                placeholder="Search components...">

        </div>

    </section>

    <!-- FILTERS -->

    <section class="en-filters">

        <div class="en-filter-group">

            <h3>

                Platforms

            </h3>

            <div class="en-platforms">

                <button class="platform-chip active"
                        data-platform="">

                    All

                </button>

                <button class="platform-chip"
                        data-platform="ESP32">

                    ESP32

                </button>

                <button class="platform-chip"
                        data-platform="Arduino">

                    Arduino

                </button>

                <button class="platform-chip"
                        data-platform="STM32">

                    STM32

                </button>

                <button class="platform-chip"
                        data-platform="Raspberry Pi">

                    Raspberry Pi

                </button>

            </div>

        </div>

    </section>

    <!-- RESULTS -->

    <section class="en-products-results">

        <div>

            <h2>

                Components

            </h2>

            <p id="productsCount">

            </p>

        </div>

        <button
            id="clearFilters"
            class="en-clear-filters">

            Clear Filters

        </button>

    </section>

    <!-- GRID -->

    <div
        id="productsGrid"
        class="en-products-grid">

        {% assign products = site.products | sort:"title" %}

        {% for product in products %}

            {% include product-card.html product=product %}

        {% endfor %}

    </div>

    <!-- EMPTY -->

    <div
        id="noProducts"
        class="en-no-products"
        hidden>

        <div class="en-empty-icon">

            🔍

        </div>

        <h3>

            No components found

        </h3>

        <p>

            Try another search or remove the filters.

        </p>

    </div>

</div>

<script defer src="{{ '/assets/js/products.js' | relative_url }}"></script>
