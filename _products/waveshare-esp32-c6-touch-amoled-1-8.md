---
layout: product
internal_links: true
title: "Waveshare ESP32-C6-Touch-AMOLED-1.8"
product_id: waveshare-esp32-c6-touch-amoled-1-8
category: Displays
manufacturer: "Waveshare"

image: "https://www.waveshare.com/img/devkit/ESP32-C6-Touch-AMOLED-1.8/ESP32-C6-Touch-AMOLED-1.8-details-1.jpg"
alt: "Waveshare ESP32-C6-Touch-AMOLED-1.8 1.8 inch ESP32-C6 AMOLED touchscreen board"

excerpt: "Waveshare ESP32-C6-Touch-AMOLED-1.8 with a 1.8-inch 368×448 AMOLED touchscreen, ESP32-C6, 16MB Flash, IMU, RTC, audio, microSD, battery charging and native USB."

description: "The Waveshare ESP32-C6-Touch-AMOLED-1.8 combines an ESP32-C6 with a 1.8-inch 368×448 AMOLED display, capacitive I2C touch, 16MB Flash, QMI8658 IMU, PCF85063 RTC, audio, TF card storage, battery support and native USB. V1 uses SH8601 with FT3168/FT6146; V2 uses CO5300 with CST820."

categories:
  - Displays
  - ESP32
  - ESP32-C6
tags:
  - ESP32
  - ESP32-C6
  - Waveshare
  - AMOLED
  - Touchscreen
  - 1.8-inch
  - 368x448
  - QSPI
  - Capacitive Touch
  - LVGL
  - IMU
  - RTC
  - Audio
  - Battery
  - Micro SD
  - Native USB

permalink: /products/waveshare-esp32-c6-touch-amoled-1-8/

specifications:
  - name: Processor
    value: "ESP32-C6, 32-bit RISC-V, up to 160 MHz"
  - name: Flash
    value: "16 MB"
  - name: Display Size
    value: "1.8 inches"
  - name: Display Type
    value: "AMOLED"
  - name: Resolution
    value: "368 × 448"
  - name: Display Interface
    value: "QSPI"
  - name: Touch Type
    value: "Capacitive"
  - name: Touch Interface
    value: "I2C"
  - name: Touch Controller
    value: "FT3168 / FT6146 (V1) / CST820 (V2)"
  - name: Display Controller
    value: "SH8601 (V1) / CO5300 (V2)"
  - name: IMU
    value: "QMI8658 6-axis IMU"
  - name: RTC
    value: "PCF85063"
  - name: Power Management
    value: "AXP2101"
  - name: Audio
    value: "ES8311 low-power audio codec, speaker and microphone"
  - name: Storage
    value: "TF / microSD card"
  - name: Battery
    value: "3.7V Li-battery header with charging and discharging"
  - name: USB
    value: "ESP32-C6 USB Type-C for programming and log output"
  - name: Wireless
    value: "2.4 GHz Wi-Fi and Bluetooth 5 LE"
  - name: Wireless Protocols
    value: "Wi-Fi 6 and IEEE 802.15.4 (Zigbee 3.0 / Thread) supported by ESP32-C6"
  - name: LVGL
    value: "Suitable for LVGL projects; Arduino IDE and ESP-IDF supported"

links:
  - title: "Waveshare Documentation"
    icon: "fas fa-book"
    description: "Official ESP32-C6-Touch-AMOLED-1.8 documentation, revision details and development resources."
    url: "https://docs.waveshare.com/ESP32-C6-Touch-AMOLED-1.8"

related:
  - waveshare-esp32-s3-touch-lcd-1-85b
  - waveshare-esp32-s3-touch-lcd-4-3
  - ili9341-xpt2046-2-8-touchscreen
---

## Overview

The **Waveshare ESP32-C6-Touch-AMOLED-1.8** is a compact ESP32-C6 development board with an integrated **1.8-inch 368×448 AMOLED touchscreen**.

It combines the ESP32-C6 RISC-V microcontroller with 16MB Flash, capacitive touch, a 6-axis IMU, RTC, audio, TF card storage, battery support and USB connectivity. Waveshare documents two hardware revisions, V1 and V2, with different display and touch controllers.

## Display and Touch

The board uses a **1.8-inch 368×448 capacitive AMOLED display**. The display interface is QSPI and the touch interface is I2C. citeturn905410view0

The controller combination depends on the hardware revision:

| Hardware version | AMOLED driver | Touch controller |
|---|---|---|
| V1 | SH8601 | FT3168 / FT6146 |
| V2 | CO5300 | CST820 |

Waveshare states that the board-level interfaces and pin assignments are shared between V1 and V2, while the display and touch drivers are revision-specific. citeturn905410view0

## ESP32-C6 Platform

The board uses an **ESP32-C6 32-bit RISC-V processor** with an operating frequency up to 160 MHz and 16MB external Flash. The ESP32-C6 also provides Wi-Fi 6, Bluetooth 5 and IEEE 802.15.4 wireless capabilities. citeturn905410view0

## Onboard Peripherals

Waveshare lists the following onboard hardware:

- QMI8658 6-axis IMU
- PCF85063 RTC
- AXP2101 power-management IC
- ES8311 low-power audio codec
- Onboard speaker output
- Microphone
- TF card slot
- Programmable PWR and BOOT buttons
- 3.7V lithium-battery connector with charging and discharging
- USB Type-C
- Reserved GPIO pads
- I2C, UART and USB breakout interfaces citeturn905410view0

## Battery and Power Management

The board includes an **AXP2101 PMU** and an MX1.25 2-pin header for a 3.7V lithium battery. Waveshare specifies charging and discharging support and also provides backup-battery pads for maintaining RTC power during a main-battery replacement. citeturn905410view0

## USB and Development

The USB Type-C interface is provided by the ESP32-C6 USB interface and is documented for program flashing and log output. The board supports development with both **Arduino IDE and ESP-IDF**. citeturn905410view0

## LVGL Projects

The hardware is well suited to compact graphical interfaces and LVGL-based projects because the display is integrated with the ESP32-C6 rather than requiring a separate development board.

Typical applications include:

- Small touchscreen HMIs
- Portable instruments
- IoT dashboards
- Sensor interfaces
- Battery-powered controllers
- Compact status displays
- Touchscreen embedded interfaces

## V1 vs V2 Software Compatibility

One of the most important details when developing for this board is the hardware revision.

V1 uses **SH8601 + FT3168/FT6146**, while V2 uses **CO5300 + CST820**. Waveshare's ESP-IDF BSP detects the touch address and selects the matching drivers, but Arduino projects should use the example and bundled libraries corresponding to the installed hardware version. citeturn905410view0

## Official Documentation

The official Waveshare documentation contains the hardware description, version differences, pin definitions and Arduino/ESP-IDF development information:

[ESP32-C6-Touch-AMOLED-1.8 Documentation](https://docs.waveshare.com/ESP32-C6-Touch-AMOLED-1.8)

## Recommended For

This board is particularly relevant for:

- ESP32-C6 touchscreen projects
- LVGL interfaces
- Portable HMI devices
- Battery-powered embedded products
- Sensor dashboards
- Compact IoT controllers

*Specifications and revision details are based on Waveshare's official ESP32-C6-Touch-AMOLED-1.8 documentation.*