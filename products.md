---
layout: single
title: "Products"
permalink: /products/
author_profile: false

excerpt: "Browse our collection of electronic components, development boards and modules."

description: "Browse development boards, sensors, displays, communication modules, power modules and accessories for Arduino, ESP32 and Raspberry Pi."
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
Development boards for Arduino, ESP32 and Raspberry Pi projects.

{% when "Sensors" %}
Temperature, humidity, motion, pressure and environmental sensors.

{% when "Displays" %}
OLED, LCD, TFT and e-paper displays.

{% when "Modules" %}
Relay, RFID, joystick, RTC and interface modules.

{% when "Communication" %}
Wi-Fi, Bluetooth, LoRa, RF and wired communication modules.

{% when "Power" %}
Voltage regulators, battery chargers and power supply modules.

{% when "Accessories" %}
Breadboards, jumper wires, pin headers and other prototyping accessories.

{% else %}
Electronic components.

{% endcase %}

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
