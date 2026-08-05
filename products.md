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

{% assign products = site.products | where:"category", category %}
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
Relay, RFID, joystick, motor driver and interface modules.

{% when "Communication" %}
Wi-Fi, Bluetooth, LoRa, RF and wired communication modules.

{% when "Power" %}
Voltage regulators, battery chargers and power management modules.

{% when "Accessories" %}
Breadboards, jumper wires and prototyping accessories.

{% else %}
Electronic components and modules.

{% endcase %}

**{{ products.size }}**
{% if products.size == 1 %}
Product
{% else %}
Products
{% endif %}

[Browse {{ category }} →](/products/{{ slug }}/){: .btn .btn--primary}

</div>

{% endfor %}
