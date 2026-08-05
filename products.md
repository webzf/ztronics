---
layout: single
title: "Products"
permalink: /products/
author_profile: false
---

Browse our collection of development boards, sensors, displays and electronic components.

<div class="product-categories">

{% assign categories = site.products | map: "category" | compact | uniq | sort %}

{% for category in categories %}

{% assign items = site.products | where:"category",category %}
{% assign slug = category | slugify %}

<div class="product-category-card">

<h2>{{ category }}</h2>

<p>

{% case category %}
{% when "Development Boards" %}
ESP32, Arduino, Raspberry Pi and other development boards.
{% when "Sensors" %}
Motion, temperature, pressure and environmental sensors.
{% when "Displays" %}
OLED, LCD and TFT displays.
{% when "Modules" %}
Relay modules, RFID, Joystick and more.
{% when "Communication" %}
Wi-Fi, Bluetooth, LoRa and RF modules.
{% when "Power" %}
Voltage regulators, battery chargers and power modules.
{% when "Accessories" %}
Breadboards, jumper wires and prototyping accessories.
{% else %}
Electronic components.
{% endcase %}

</p>

<p>

<strong>{{ items.size }}</strong>
{% if items.size == 1 %}
Product
{% else %}
Products
{% endif %}

</p>

<a href="/products/{{ slug }}/" class="btn btn--primary">
View Products →
</a>
<br>
</div>

{% endfor %}

</div>
