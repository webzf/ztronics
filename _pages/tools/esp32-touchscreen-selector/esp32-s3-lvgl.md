---
title: "ESP32-S3 LVGL Display Selector | Embedded Nerd"
layout: single
permalink: /tools/esp32-touchscreen-selector/esp32-s3-lvgl/
canonical_url: /tools/esp32-touchscreen-selector/esp32-s3-lvgl/
excerpt: "Choose ESP32-S3 hardware for LVGL displays using PSRAM, display interface, resolution and compatibility requirements."
show_date: false
categories:
  - Tools
  - ESP32
  - Displays
tags:
  - ESP32-S3
  - LVGL
  - PSRAM
  - ESP32 Display
---
# ESP32-S3 LVGL Display Selector

Looking for an **ESP32-S3 board for an LVGL display**? Start with the requirements that actually affect compatibility: display interface, resolution, PSRAM, GPIO availability, touch and onboard hardware.

The Embedded Nerd selector separates **Required** compatibility constraints from optional preferences, so you can narrow the catalog without treating every specification as a hard requirement.

<a class="btn btn--primary" href="/tools/esp32-touchscreen-selector/#preset=s3-psram">Open the ESP32 Hardware &amp; Display Selector</a>

## What to check for an ESP32-S3 LVGL project

- Display resolution and interface: SPI, RGB, 8080 or another supported bus
- PSRAM capacity for larger framebuffers and graphical assets
- Available GPIO after the display, touch and storage peripherals are connected
- Touch controller and touch interface when a touchscreen is required
- LVGL support and the actual display driver used by the project

An ESP32-S3 is not automatically compatible with every display. The complete board, controller and software combination still needs verification.

## Related resources

- [ESP32 Touchscreen Displays: Complete Guide to Choosing and Using a Touchscreen](/esp32-touchscreen-displays-guide/)
- [ESP32 Hardware & Display Selector](/tools/esp32-touchscreen-selector/)
