---
title: "ESP32 Touchscreen SPI Selector | Embedded Nerd"
layout: single
permalink: /tools/esp32-touchscreen-selector/spi-touchscreen/
canonical_url: /tools/esp32-touchscreen-selector/spi-touchscreen/
excerpt: "Find ESP32 touchscreen hardware using SPI display and touch requirements with the Embedded Nerd compatibility selector."
show_date: false
categories:
  - Tools
  - ESP32
  - Displays
tags:
  - ESP32 Touchscreen
  - SPI
  - ESP32 Display
  - Touch
---
# ESP32 Touchscreen SPI Selector

If your project uses an **ESP32 touchscreen with SPI**, the display and touch interfaces should be considered together. A board that works with the display may still have GPIO, controller or touch-bus constraints.

This selector preset starts with a touchscreen + SPI configuration and lets you refine the requirements further.

<a class="btn btn--primary" href="/tools/esp32-touchscreen-selector/#preset=touch-spi">Open the ESP32 SPI touchscreen selector</a>

## SPI touchscreen compatibility checks

- Display controller and SPI interface
- Touch controller and whether touch also uses SPI or another bus
- Available GPIO and chip-select lines
- Display resolution and size
- Memory and PSRAM requirements for the graphical interface

SPI is a useful interface for many small and medium displays, but the exact controller and driver support should always be verified.

## Related resources

- [ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/)
- [ESP32 Hardware & Display Selector](/tools/esp32-touchscreen-selector/)
