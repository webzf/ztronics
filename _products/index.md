---
layout: archive
title: "Electronic Components & Development Boards"
permalink: /products/

excerpt: "Browse ESP32 boards, sensors, displays, modules and electronic components."

description: "Complete catalog of ESP32 boards, Arduino modules, sensors, displays and electronic components with specifications, pinouts and tutorials."

author_profile: false
---

Browse our collection of development boards, sensors, displays, modules and electronic components.

{% assign categories = site.products | map: "category" | uniq | sort %}

{% for category in categories %}
## {{ category }}

<div class="grid__wrapper">

{% assign products = site.products | where: "category", category | sort: "title" %}

{% for product in products %}
  <div class="grid__item">
    {% include archive-single.html type="grid" %}
  </div>
{% endfor %}

</div>

{% endfor %}
