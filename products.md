---
layout: single
title: "Products"
permalink: /products/
author_profile: false

excerpt: "Browse our collection of electronic components, development boards and modules."

description: "Browse all product categories including ESP32 boards, sensors, displays, modules and accessories."
---

Browse our collection of development boards, sensors, displays, modules and electronic components.

{% assign categories = site.products | map:"category" | compact | uniq | sort %}

{% for category in categories %}

{% assign products = site.products | where:"category", category | sort:"title" %}
{% assign slug = category | slugify %}

<div class="notice--primary">

## {{ category }}

{% case category %}

{% when "Development Boards" %}
ESP32, Arduino, Raspberry Pi and other development boards.

{% when "Sensors" %}
Motion, temperature, humidity, pressure and environmental sensors.

{% when "Displays" %}
OLED, LCD, TFT and e-paper displays.

{% when "Modules" %}
Relay, RFID, motor driver and interface modules.

{% when "Communication" %}
Wi-Fi, Bluetooth, LoRa and RF communication modules.

{% when "Power" %}
Voltage regulators, battery chargers and power management modules.

{% when "Accessories" %}
Breadboards, jumper wires and prototyping accessories.

{% else %}
Electronic components.

{% endcase %}

### Featured products

<ul>
{% for product in products limit:3 %}

**[{{ product.title }}]({{ product.url | relative_url }})**

{{ product.excerpt }}

{% unless forloop.last %}
---
{% endunless %}

{% endfor %}
</ul>

**{{ products.size }}**
{% if products.size == 1 %}
Product
{% else %}
Products
{% endif %}

[Browse {{ category }} →]({{ "/products/" | append: slug | append: "/" | relative_url }}){: .btn .btn--primary}

</div>

{% endfor %}
