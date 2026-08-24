---
layout: single

title: "Products"

permalink: /products/

author_profile: false

internal_links: true

toc: true
toc_sticky: true

sidebar: 
   nav: "embedded"

excerpt: "Browse our collection of development boards, sensors, displays, modules and accessories"

description: "Development boards, sensors, displays, communication modules, power modules and accessories for Arduino, ESP32 and Raspberry Pi."
---

Browse our collection of electronic components, development boards and accessories for embedded systems.

---

{% assign categories = site.products | map:"category" | compact | uniq | sort %}

{% for category in categories %}

{% assign products = site.products | where:"category", category | sort:"title" %}
{% assign slug = category | slugify %}

## {{ category }}

{% case category %}

{% when "Development Boards" %}
ESP32, Arduino and Raspberry Pi development boards.

{% when "Sensors" %}
Temperature, humidity, motion, pressure and environmental sensors.

{% when "Displays" %}
OLED, LCD, TFT and e-paper displays.

{% when "Modules" %}
Relay, RFID, joystick and interface modules.

{% when "Communication" %}
Wi-Fi, Bluetooth, LoRa and RF communication modules.

{% when "Power" %}
Voltage regulators, battery chargers and power modules.

{% when "Accessories" %}
Breadboards, jumper wires, pin headers and prototyping accessories.

{% else %}
Electronic components.

{% endcase %}

**{{ products.size }} Products**

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

---

{% endfor %}
