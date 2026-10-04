---
title: "Embedded Nerd Tools | ESP32, Arduino & I2C Tools"
layout: single
sidebar:
  nav: "embedded"
internal_links: true
permalink: /tools/
canonical_url: /tools/
excerpt: "Practical embedded engineering tools for ESP32, Arduino, Raspberry Pi and I2C projects. Select compatible displays, look up I2C addresses and calculate pull-up resistors."
show_date: false
read_time: false
last_modified_at: false
toc: false
related: true
share: true
categories:
  - Tools
tags:
  - Embedded Tools
  - ESP32
  - Arduino
  - I2C
---

# Embedded Nerd Tools

Practical tools for **ESP32, Arduino, Raspberry Pi and embedded hardware projects**. Use these tools to choose compatible hardware, check interfaces and solve common electronics design problems.

## ESP32 Display & Touchscreen Tools

### [ESP32 Touchscreen Display & Board Selector](/tools/esp32-touchscreen-selector/)

Find compatible ESP32 boards and touchscreen displays by **MCU family, screen size, resolution, display interface, touch technology, PSRAM, LVGL, USB, GPIO and other hardware requirements**.

This is the main Embedded Nerd hardware selector. Start here if you are choosing an ESP32 display or touchscreen for a new project.

**[Open the ESP32 Touchscreen Selector →](/tools/esp32-touchscreen-selector/)**

### Specialized ESP32 selectors

Once you know the type of display you need, use a focused selector for a specific hardware requirement:

- [ESP32-S3 LVGL Display Selector](/tools/esp32-touchscreen-selector/esp32-s3-lvgl/) — find ESP32-S3 hardware for LVGL graphical interfaces.
- [ESP32 AMOLED Touchscreen Battery Selector](/tools/esp32-touchscreen-selector/amoled-touch-battery/) — compare AMOLED touchscreen boards with battery and charging requirements.
- [ESP32-C6 Display Selector](/tools/esp32-touchscreen-selector/esp32-c6-display/) — focus on ESP32-C6 display and touchscreen hardware.
- [ESP32 800×480 Display Selector](/tools/esp32-touchscreen-selector/800x480/) — find boards and displays for 800×480 graphical interfaces.
- [ESP32 4.3-Inch Touchscreen Display Selector](/tools/esp32-touchscreen-selector/esp32-4-3-inch-touchscreen/) — compare 4.3-inch ESP32 touchscreen options.
- [ESP32 7-Inch Touchscreen Display Selector](/tools/esp32-touchscreen-selector/esp32-7-inch-touchscreen/) — compare larger 7-inch touchscreen hardware.
- [ESP32 Display with PSRAM Selector](/tools/esp32-touchscreen-selector/esp32-display-psram/) — find display boards with PSRAM for LVGL and framebuffer-heavy applications.
- [ESP32 Touchscreen SPI Selector](/tools/esp32-touchscreen-selector/spi-touchscreen/) — find touchscreen hardware using SPI display or touch interfaces.

## I2C Tools

### [I2C Address Lookup & Compatibility Checker](/tools/i2c-address-lookup/)

Look up common I2C device addresses, identify possible address conflicts and build a compatible I2C device configuration for Arduino, ESP32 and Raspberry Pi projects.

### [I2C Pull-up Resistor Calculator](/tools/i2c-pullup-resistor-calculator/)

Calculate a practical I2C pull-up resistor range from bus voltage, speed, sink current and bus capacitance.

## Guides & Hardware Resources

The tools work best together with the Embedded Nerd technical guides. For display projects, start with the [ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/), then use the selector to narrow the hardware choices.

For a specific product, follow the selector results to the relevant [ESP32 display and touchscreen product pages](/products/).

## Why use Embedded Nerd tools?

These tools are designed around practical hardware selection rather than generic calculators. They combine technical requirements such as interfaces, memory, touch controllers and peripherals so you can narrow the options before checking the manufacturer's documentation.

Always verify the final electrical, mechanical and software compatibility against the manufacturer's documentation for the exact board revision.
