---
layout: single
title: Products
permalink: /products/
author_profile: false
---

Browse our collection of development boards, sensors, modules and electronic components.

{% assign categories = site.products | map:"category" | compact | uniq | sort %}

| Category | Products |
|----------|---------:|
{% for category in categories %}
{% assign count = site.products | where:"category",category | size %}
| [{{ category }}](/products/{{ category | slugify }}/) | {{ count }} |
{% endfor %}
