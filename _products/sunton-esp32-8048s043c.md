---
layout: product
internal_links: true
title: "Sunton ESP32-8048S043C"
product_id: sunton-esp32-8048s043c
category: Displays
manufacturer: "Sunton"

image: "https://www.makerfabs.com/image/wiki_image/2022-10-28_22_36_00_0.jpg"
alt: "Sunton ESP32-8048S043C 4.3 inch ESP32-S3 CYD touchscreen board"

excerpt: "Sunton ESP32-8048S043C CYD with ESP32-S3, 4.3-inch 800×480 IPS display, capacitive GT911 touch, 16MB Flash, 8MB PSRAM and microSD."

description: "The Sunton ESP32-8048S043C is a CYD-style ESP32-S3 development board with a 4.3-inch 800×480 IPS TFT, 16-bit RGB parallel display interface, GT911 capacitive touch over I2C, 16MB Flash, 8MB PSRAM, microSD storage and USB-C through a CH340C USB-to-UART bridge."

categories:
  - Displays
  - ESP32
  - ESP32-S3
  - CYD
tags:
  - ESP32
  - ESP32-S3
  - Sunton
  - CYD
  - Cheap Yellow Display
  - 4.3-inch
  - 800x480
  - IPS
  - RGB
  - GT911
  - Capacitive Touch
  - LVGL
  - Micro SD

permalink: /products/sunton-esp32-8048s043c/

specifications:
  - name: Processor
    value: "ESP32-S3-WROOM-1-MCN16R8, dual-core, up to 240 MHz"
  - name: Flash
    value: "16 MB"
  - name: PSRAM
    value: "8 MB OPI"
  - name: Display Size
    value: "4.3 inches"
  - name: Display Type
    value: "IPS TFT"
  - name: Resolution
    value: "800 × 480"
  - name: Display Interface
    value: "16-bit parallel RGB"
  - name: Display Controller
    value: "ST7262"
  - name: Touch Type
    value: "Capacitive"
  - name: Touch Interface
    value: "I2C"
  - name: Touch Controller
    value: "GT911"
  - name: Storage
    value: "MicroSD / TF card"
  - name: USB
    value: "USB-C via CH340C USB-to-UART bridge"
  - name: Wireless
    value: "2.4 GHz Wi-Fi and Bluetooth 5 LE"
  - name: LVGL
    value: "LVGL examples and development support are documented for this hardware"

links:
  - title: "Sunton / board documentation"
    icon: "fas fa-book"
    description: "Board definitions and pin information for the ESP32-8048S043C CYD family."
    url: "https://github.com/rzeldent/platformio-espressif32-sunton"
  - title: "ESP3D hardware reference"
    icon: "fas fa-microchip"
    description: "Hardware reference covering the display, touch controller, storage and USB-to-UART interface."
    url: "https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/"

related:
  - waveshare-esp32-s3-touch-lcd-4-3
  - waveshare-esp32-s3-touch-lcd-7
  - waveshare-esp32-s3-touch-lcd-1-85b
  - ili9341-xpt2046-2-8-touchscreen
---

## Overview

The **Sunton ESP32-8048S043C** is a 4.3-inch CYD-style touchscreen development board built around the ESP32-S3. It combines an 800×480 IPS TFT display, capacitive touch, PSRAM and microSD storage in a single board.

It is a useful option when a project needs a larger 800×480 interface while retaining the ESP32-S3 platform and LVGL-oriented development options.

## Display and touch

The board uses a **4.3-inch 800×480 IPS TFT** driven through a 16-bit parallel RGB interface. The display controller is the **ST7262**.

Touch is capacitive and uses a **GT911** controller connected over I2C. The board definitions and hardware references identify the touch bus separately from the RGB display bus.

## ESP32-S3 and memory

The board uses an **ESP32-S3-WROOM-1-MCN16R8** configuration with up to 240 MHz operation, **16 MB Flash** and **8 MB OPI PSRAM**.

The PSRAM is particularly relevant for 800×480 RGB display projects because framebuffer memory requirements are substantially higher than for small SPI displays.

## Storage and connectivity

A microSD/TF slot is available over SPI. The board also exposes I2C, SPI and UART connections through its expansion headers.

The USB-C connector is associated with a **CH340C USB-to-UART bridge**, so this board should not be treated as an ESP32-S3 native-USB implementation in the selector.

## LVGL

LVGL development is documented for the hardware, including an LVGL demo in the Sunton documentation hosted by Makerfabs. The board is therefore represented as LVGL-ready in the selector, while exact library configuration remains dependent on the selected graphics stack and board revision.

## Board variants

The ESP32-8048S043 family includes variants with different touch configurations. This page specifically describes the **ESP32-8048S043C**, the capacitive-touch variant using GT911.

Do not assume that the N or R variants have the same touch hardware: the N variant is listed without touch, while the R variant uses XPT2046 resistive touch.

## Sources

- Sunton board definitions: https://github.com/rzeldent/platformio-espressif32-sunton
- ESP3D hardware reference: https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/
- Makerfabs Sunton documentation: https://wiki.makerfabs.com/Sunton_ESP32_S3_4.3_inch_800x400_IPS_with_Touch.html
