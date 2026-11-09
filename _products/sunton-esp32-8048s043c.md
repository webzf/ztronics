---
layout: product
lang: en
locale: en-US
page_id: product-sunton-esp32-8048s043c
translation_id: sunton-esp32-8048s043c
available_languages: [en, de, es, fr]
english_url: /products/sunton-esp32-8048s043c/
german_url: /de/products/sunton-esp32-8048s043c/
spanish_url: /es/products/sunton-esp32-8048s043c/
french_url: /fr/products/sunton-esp32-8048s043c/
internal_links: true
title: "Sunton ESP32-8048S043C"
product_verdict: "A strong option for a larger 4.3-inch ESP32-S3 HMI; choose a smaller CYD if price and compact size matter more."
seo_title: "Sunton ESP32-8048S043C: Specs & Buying Guide"
seo_description: "Sunton ESP32-8048S043C with ESP32-S3, 4.3-inch 800×480 IPS and GT911 capacitive touch. Also compare the ESP32-8048S043 version without the C suffix."
product_id: sunton-esp32-8048s043c
category: Displays
manufacturer: "Sunton"

image: "/assets/images/products/sunton-esp32-8048s043c-main.webp"
header:
  og_image: "/assets/images/products/sunton-esp32-8048s043c-main.webp"
  og_image_alt: "Sunton ESP32-8048S043C-I 4.3-inch capacitive touchscreen display board, front view"
  teaser: "/assets/images/products/sunton-esp32-8048s043c-main.webp"
alt: "Sunton ESP32-8048S043C-I 4.3-inch capacitive touchscreen display board, front view"

excerpt: "Sunton ESP32-8048S043C CYD with ESP32-S3, 4.3-inch 800×480 IPS display, GT911 capacitive touch, 16MB Flash, 8MB PSRAM and microSD. Some listings also offer the ESP32-8048S043 (without C); check the selected variant’s touch configuration before ordering."

description: "The Sunton ESP32-8048S043C is a CYD-style ESP32-S3 development board with a 4.3-inch 800×480 IPS TFT, 16-bit RGB parallel display interface, GT911 capacitive touch over I2C, 16MB Flash, 8MB PSRAM, microSD storage and USB-C through a CH340C USB-to-UART bridge. Some sellers also list an ESP32-8048S043 version without the C suffix; check the exact touch configuration and specifications of the selected variant before ordering."

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
  - name: "Processor"
    value: "ESP32-S3-WROOM-1-MCN16R8, dual-core, up to 240 MHz"
  - name: "Flash"
    value: "16 MB"
  - name: "PSRAM"
    value: "8 MB OPI"
  - name: "Display Size"
    value: "4.3 inches"
  - name: "Display Type"
    value: "IPS TFT"
  - name: "Resolution"
    value: "800 × 480"
  - name: "Display Interface"
    value: "16-bit parallel RGB"
  - name: "Display Controller"
    value: "ST7262"
  - name: "Touch Type"
    value: "Capacitive"
  - name: "Touch Interface"
    value: "I2C"
  - name: "Touch Controller"
    value: "GT911"
  - name: "Storage"
    value: "MicroSD / TF card"
  - name: "USB"
    value: "USB-C via CH340C USB-to-UART bridge"
  - name: "Wireless"
    value: "2.4 GHz Wi-Fi and Bluetooth 5 LE"
  - name: "LVGL"
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
## Is the Sunton ESP32-8048S043C Worth Buying?

Choose this board when your project benefits from a 4.3-inch 800×480 display, ESP32-S3, capacitive touch and extra memory for a richer interface. It suits dashboards and HMI projects where screen area matters.

| Option | Best for | Main trade-off |
|---|---|---|
| **Sunton ESP32-8048S043C** | 4.3-inch 800×480 ESP32-S3 board with GT911 capacitive touch, 16MB Flash and 8MB PSRAM | Confirm the exact model suffix and interface before ordering |
| [**ESP32 CYD 2.8-inch**](/products/esp32-2432s028-2-8-cyd/) | A more compact integrated ESP32 touchscreen | Smaller 240×320 display and resistive touch |
| [**Waveshare ESP32-S3-Touch-LCD-4.3**](/products/waveshare-esp32-s3-touch-lcd-4-3/) | Another integrated 4.3-inch 800×480 ESP32-S3 option | Check connector layout, interface and accessories |

Use the [ESP32 display selector](/tools/esp32-touchscreen-selector/) to compare integrated options. Before ordering, confirm the model suffix, display interface, touch controller and included accessories. Similar-looking Sunton boards may use different hardware.

## Overview

The **Sunton ESP32-8048S043C** is a 4.3-inch CYD-style touchscreen development board built around the ESP32-S3. It combines an 800×480 IPS TFT, capacitive touch, PSRAM and microSD storage.

## Display and touch

The 4.3-inch 800×480 IPS TFT uses a 16-bit parallel RGB interface and the **ST7262** display controller. Capacitive touch is handled by a **GT911** controller over I2C.

## ESP32-S3 and memory

The board uses an **ESP32-S3-WROOM-1-MCN16R8**, operating up to 240 MHz, with **16 MB Flash** and **8 MB OPI PSRAM**. PSRAM is important for 800×480 RGB projects because framebuffers require substantially more memory than small SPI displays.

## Storage and connectivity

A microSD/TF slot is available over SPI. Expansion headers expose I2C, SPI and UART. USB-C connects through a **CH340C USB-to-UART bridge**; do not treat it as an ESP32-S3 native-USB implementation.

## LVGL

LVGL development is documented for this hardware, including a demo in Sunton documentation hosted by Makerfabs. Exact library configuration depends on the graphics stack and board revision.

## Board variants

This page describes the **ESP32-8048S043C**, the capacitive-touch variant using GT911. Do not assume the N or R variants share this touch hardware: the N variant is listed without touch, while the R variant uses XPT2046 resistive touch.

## Sources

- [Sunton board definitions](https://github.com/rzeldent/platformio-espressif32-sunton)
- [ESP3D hardware reference](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/)
- [Makerfabs Sunton documentation](https://wiki.makerfabs.com/Sunton_ESP32_S3_4.3_inch_800x400_IPS_with_Touch.html)

## Purchase Considerations

Use the purchase option above to check the current offer. The exact product ID behind the short affiliate URL is not exposed to Embedded Nerd, so verify the listing, seller photos and the **8048S043C capacitive GT911 variant** before ordering. Compare the delivered cost and confirm the model suffix, display interface, touch controller and accessories.

For wiring, code, touch setup and known limitations, read the [Sunton ESP32-8048S043C Arduino pinout and setup guide](/sunton-esp32-8048s043c-guide/).

## Embedded Nerd Guides & Selector

- [Sunton ESP32-8048S043C Arduino pinout and setup guide](/sunton-esp32-8048s043c-guide/) — GPIO tables, a minimal code example and troubleshooting.
- [ESP32 Touchscreen Selector](/tools/esp32-touchscreen-selector/)
- [800×480 touchscreen selector](/tools/esp32-touchscreen-selector/800x480/)
- [4.3-inch touchscreen selector](/tools/esp32-touchscreen-selector/esp32-4-3-inch-touchscreen/)
- [ESP32-S3 + LVGL selector](/tools/esp32-touchscreen-selector/esp32-s3-lvgl/)
- [ESP32 display boards with PSRAM](/tools/esp32-touchscreen-selector/esp32-display-psram/)
- [ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/)
- [Waveshare ESP32-S3-Touch-LCD-4.3](/products/waveshare-esp32-s3-touch-lcd-4-3/)
- [Guition ESP32-S3-4848S040](/products/guition-esp32-s3-4848s040/) — a smaller square 4-inch 480×480 alternative.
