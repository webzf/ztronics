---
layout: archive
title: "Products"
permalink: /products/
author_profile: false
---

Browse our collection of development boards, sensors, displays and electronic components.

{% assign categories = site.products | map: "category" | uniq | sort %}

{% for category in categories %}

## {{ category }}

<div class="entries-grid">

  {% assign category_products = site.products | where: "category", category | sort: "title" %}

  {% for post in category_products %}
    {% include archive-single.html type="grid" %}
  {% endfor %}

</div>

{% endfor %}
