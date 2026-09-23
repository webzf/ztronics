---
title: "ESP32-C6 Display Selector | Touchscreen & Display Compatibility"
layout: single
permalink: /tools/esp32-touchscreen-selector/esp32-c6-display/
canonical_url: /tools/esp32-touchscreen-selector/esp32-c6-display/
excerpt: "Compare ESP32-C6 display and touchscreen hardware by interface, touch, battery and compatibility requirements."
show_date: false
categories:
  - Tools
  - ESP32
  - Displays
tags:
  - ESP32-C6
  - ESP32 Display
  - Touchscreen
  - AMOLED
---
# ESP32-C6 Display Selector

Choosing an **ESP32-C6 display or touchscreen** requires more than checking whether the board has enough processing power. Display bus, touch controller, memory, GPIO and power features can change which hardware is practical.

Use this selector preset as a starting point for ESP32-C6 + AMOLED + touch + battery configurations.

<a class="btn btn--primary" href="/tools/esp32-touchscreen-selector/#preset=c6-amoled-touch-battery">Open the ESP32-C6 display selector</a>

## ESP32-C6 display compatibility checklist

- Display technology and controller
- SPI, QSPI, RGB or other display interface
- Capacitive or resistive touch and its bus
- PSRAM and flash requirements
- Battery and charging support
- GPIO requirements after all peripherals are assigned

Always verify the exact board implementation and display driver support. MCU-family compatibility alone is not sufficient.

## Related resources

- [ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/)
- [ESP32 Hardware & Display Selector](/tools/esp32-touchscreen-selector/)
