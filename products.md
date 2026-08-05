---
layout: single
title: "Products"
permalink: /products/
author_profile: false

excerpt: Browse our collection of electronic components.

description: Browse ESP32 boards, sensors, displays, modules and accessories.
---

Browse our collection of development boards, sensors, displays, modules and electronic components.

{% assign categories = site.products | map:"category" | compact | uniq | sort %}

{% for category in categories %}

{% assign products = site.products | where:"category", category | sort:"title" %}
{% assign slug = category | slugify %}

---

## {{ category }}

{% case category %}

{% when "Development Boards" %}
ESP32, Arduino and Raspberry Pi development boards.

{% when "Sensors" %}
Motion, environmental and temperature sensors.

{% when "Displays" %}
OLED, LCD and TFT displays.

{% when "Modules" %}
Relay, RFID, motor drivers, joysticks and interface modules.

{% when "Communication" %}
Wi-Fi, Bluetooth, LoRa and RF communication modules.

{% when "Power" %}
Voltage regulators, battery chargers and power management modules.

{% when "Accessories" %}
Breadboards, jumper wires and prototyping accessories.

{% else %}
Electronic components.

{% endcase %}

<p>
<strong>{{ products.size }}</strong>
{% if products.size == 1 %}Product{% else %}Products{% endif %}
</p>

<div class="en-product-grid">

{% for product in products limit:3 %}

    {% include product-card.html product=product %}

{% endfor %}

</div>

<p align="center">

<a class="btn btn--primary"
href="{{ '/products/' | append: slug | append:'/' | relative_url }}">

Browse {{ category }}

</a>

</p>

{% endfor %}
