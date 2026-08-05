---
layout: single
title: "Products"
permalink: /products/
author_profile: false
---

Browse our collection of development boards, sensors, displays and electronic components.

{% assign categories = site.products | map: "category" | compact | uniq | sort %}

{% for category in categories %}

{% assign items = site.products | where:"category", category %}
{% assign slug = category | slugify %}

<div class="notice--primary">

### {{ category }}

{% case category %}
{% when "Development Boards" %}
ESP32, Arduino, Raspberry Pi and other development boards.
{% when "Sensors" %}
Motion, temperature and environmental sensors.
{% when "Displays" %}
OLED, LCD and TFT displays.
{% when "Modules" %}
Relay modules, joystick, RFID and more.
{% when "Communication" %}
Wi-Fi, Bluetooth, LoRa and RF modules.
{% when "Power" %}
Voltage regulators, battery chargers and power modules.
{% when "Accessories" %}
Breadboards, jumper wires and prototyping accessories.
{% endcase %}

**{{ items.size }} Products**

[Browse {{ category }}](/products/{{ slug }}/){: .btn .btn--primary}

</div>

{% endfor %}
