---
layout: product
internal_links: true
title: "Waveshare ESP32-S3-Touch-AMOLED-2.41"
product_verdict: "A feature-rich compact board for a sharp AMOLED interface plus built-in motion sensing and RTC; choose an LCD touchscreen instead if your project prioritizes a larger panel over compactness."
seo_title: "Waveshare ESP32-S3 AMOLED 2.41: Specs & Buying Guide"
seo_description: "Waveshare ESP32-S3-Touch-AMOLED-2.41 overview: 600×450 AMOLED, capacitive touch, ESP32-S3, IMU, RTC, storage and alternatives."
product_id: waveshare-esp32-s3-touch-amoled-2-41
category: Displays
manufacturer: "Waveshare"
image: "https://www.waveshare.com/img/devkit/ESP32-S3-Touch-AMOLED-2.41/ESP32-S3-Touch-AMOLED-2.41-details-1.jpg"
alt: "Waveshare ESP32-S3-Touch-AMOLED-2.41 2.41 inch AMOLED touchscreen board"
header:
  teaser: "https://www.waveshare.com/img/devkit/ESP32-S3-Touch-AMOLED-2.41/ESP32-S3-Touch-AMOLED-2.41-details-1.jpg"
excerpt: "Waveshare ESP32-S3-Touch-AMOLED-2.41 with a 2.41-inch 600×450 AMOLED touchscreen, ESP32-S3R8, 8MB PSRAM, IMU, RTC, TF card and battery support."
description: "The Waveshare ESP32-S3-Touch-AMOLED-2.41 combines an ESP32-S3R8 with 16MB Flash, 8MB PSRAM, a 2.41-inch 600×450 AMOLED touchscreen, QMI8658 IMU, PCF85063 RTC, TF card storage and lithium-battery support."
categories:
  - Displays
  - ESP32
  - ESP32-S3
tags:
  - ESP32
  - ESP32-S3
  - Waveshare
  - AMOLED
  - Touchscreen
  - 2.41-inch
  - 600x450
  - QSPI
  - Capacitive Touch
  - LVGL
  - IMU
  - RTC
  - Battery
  - TF Card
  - PSRAM
permalink: /products/waveshare-esp32-s3-touch-amoled-2-41/
specifications:
  - name: Processor
    value: "ESP32-S3R8, dual-core Xtensa LX7, up to 240 MHz"
  - name: Flash
    value: "16 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Display Size
    value: "2.41 inches"
  - name: Display Type
    value: "AMOLED"
  - name: Resolution
    value: "600 × 450"
  - name: Display Interface
    value: "QSPI"
  - name: Display Controller
    value: "RM690B0"
  - name: Touch Type
    value: "Capacitive"
  - name: Touch Controller
    value: "FT6336"
  - name: Touch Interface
    value: "I2C"
  - name: IMU
    value: "QMI8658 6-axis IMU"
  - name: RTC
    value: "PCF85063"
  - name: Storage
    value: "TF card slot"
  - name: Battery
    value: "3.7V lithium battery header with charging and discharging"
  - name: USB
    value: "USB Type-C"
  - name: Interfaces
    value: "I2C, UART, USB, 34-pin GPIO header"
  - name: Wireless
    value: "2.4 GHz Wi-Fi and Bluetooth 5 LE"
  - name: LVGL
    value: "Supported; Arduino IDE and ESP-IDF"
links:
  - title: "Waveshare Documentation"
    icon: "fas fa-book"
    description: "Official documentation, hardware revisions, pin definitions and development resources."
    url: "https://docs.waveshare.com/ESP32-S3-Touch-AMOLED-2.41"
  - title: "Waveshare Product Page"
    icon: "fas fa-external-link-alt"
    description: "Official product page and specifications."
    url: "https://www.waveshare.com/esp32-s3-touch-amoled-2.41.htm"
related:
  - waveshare-esp32-s3-touch-amoled-1-75
  - waveshare-esp32-c6-touch-amoled-1-8
  - waveshare-esp32-s3-touch-lcd-1-85b
---

## Is the ESP32-S3-Touch-AMOLED-2.41 a Good Fit?

Choose this board if you want a **compact, high-resolution AMOLED touchscreen** and value its integrated IMU, real-time clock and battery-related hardware. It is a different kind of option from the larger LCD HMI boards: its strength is a small, information-dense interface rather than a large control panel.

| Option | Choose it when | Main trade-off |
|---|---|---|
| **Waveshare ESP32-S3-Touch-AMOLED-2.41** | You want a compact 600×450 AMOLED interface with integrated sensors | Smaller screen area; QSPI display setup differs from RGB LCDs |
| [**Waveshare ESP32-S3-Touch-LCD-4.3**](/products/waveshare-esp32-s3-touch-lcd-4-3/) | You need a larger 800×480 touch interface | Larger board and different display interface |
| [**Waveshare ESP32-S3-Touch-LCD-7**](/products/waveshare-esp32-s3-touch-lcd-7/) | You are building a large wall panel or dashboard | Much larger physical footprint |
| [**Waveshare ESP32-P4-WIFI6-Touch-LCD-7B**](/products/waveshare-esp32-p4-wifi6-touch-lcd-7b/) | You need a 7-inch 1024×600 HMI | More complex platform and a much larger display assembly |

Check the product listing for the exact revision, touch support and included accessories. The [ESP32 Touchscreen Selector](/tools/esp32-touchscreen-selector/) is useful for comparing board formats, although this AMOLED board differs from conventional RGB LCD options.



## Overview

The **Waveshare ESP32-S3-Touch-AMOLED-2.41** combines an ESP32-S3R8 with a **2.41-inch 600×450 AMOLED touchscreen**, 16MB Flash, 8MB PSRAM, IMU, RTC, TF card storage and lithium-battery support.

It is aimed at compact graphical interfaces, portable HMI projects and LVGL applications.

## Display and Touch

The AMOLED panel uses a **QSPI interface** and provides 600×450 resolution. Capacitive touch is handled through I2C by the FT6336 controller.

## ESP32-S3 Platform

The board uses the ESP32-S3R8 dual-core LX7 processor at up to 240 MHz, with **16MB Flash and 8MB PSRAM**. It provides 2.4 GHz Wi-Fi and Bluetooth 5 LE.

## Onboard Peripherals

The board includes:

- QMI8658 6-axis IMU
- PCF85063 RTC
- TF card slot
- 3.7V lithium battery connector with charging and discharging
- USB Type-C
- I2C and UART
- 34-pin GPIO header

## LVGL and HMI Projects

The combination of AMOLED, capacitive touch, PSRAM and the ESP32-S3 makes it suitable for:

- Portable dashboards
- Touchscreen controllers
- IoT interfaces
- Sensor displays
- Compact HMIs
- Battery-powered instruments

## Hardware Revisions

Waveshare documents **V1 and V2** hardware revisions for this board. Pin definitions and some interface mappings differ between revisions, so the corresponding examples and firmware should be used for the installed PCB version.

## Development

The board supports development with **Arduino IDE and ESP-IDF**.

## Official Resources

- [Waveshare ESP32-S3-Touch-AMOLED-2.41 Documentation](https://docs.waveshare.com/ESP32-S3-Touch-AMOLED-2.41)
- [Waveshare ESP32-S3-Touch-AMOLED-2.41 Product Page](https://www.waveshare.com/esp32-s3-touch-amoled-2.41.htm)

## Embedded Nerd Guides & Selector
- [ESP32 Display with PSRAM Selector](/tools/esp32-touchscreen-selector/esp32-display-psram/) — filter boards with documented PSRAM for larger GUIs.

- [ESP32 Touchscreen Selector](/tools/esp32-touchscreen-selector/) — compare ESP32 touchscreen boards.
- [AMOLED + battery selector](/tools/esp32-touchscreen-selector/amoled-touch-battery/) — filter for AMOLED, touch and battery support.
- [ESP32-S3 + LVGL selector](/tools/esp32-touchscreen-selector/esp32-s3-lvgl/) — focus on ESP32-S3 LVGL boards.
- [ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/) — compare display technologies and interfaces.
- [Waveshare ESP32-S3-Touch-AMOLED-1.75](/products/waveshare-esp32-s3-touch-amoled-1-75/) — related AMOLED option.
- [Waveshare ESP32-S3-Touch-AMOLED-2.16](/products/waveshare-esp32-s3-touch-amoled-2-16/) — related AMOLED option.
