---
layout: product
internal_links: true
title: "Waveshare ESP32-S3-Touch-LCD-1.85B"
product_id: waveshare-esp32-s3-touch-lcd-1-85b
category: Displays
manufacturer: "Waveshare"
alt: "Waveshare ESP32-S3-Touch-LCD-1.85B 1.85 inch ESP32-S3 touchscreen board"
excerpt: "Waveshare ESP32-S3-Touch-LCD-1.85B with a 1.85-inch 360×360 capacitive touchscreen, 8MB PSRAM, IMU, RTC, audio, battery support, microSD, and native USB."
description: "The Waveshare ESP32-S3-Touch-LCD-1.85B is a compact ESP32-S3 touchscreen development board combining a 1.85-inch 360×360 QSPI display with capacitive I2C touch, 8MB PSRAM, 16MB Flash, native USB, IMU, RTC, audio, microSD, and 3.7V lithium battery charging/discharging support."
categories:
  - Displays
  - ESP32
  - ESP32-S3
tags:
  - ESP32
  - ESP32-S3
  - Waveshare
  - Touchscreen
  - TFT
  - LCD
  - 1.85-inch
  - 360x360
  - QSPI
  - Capacitive Touch
  - LVGL
  - PSRAM
  - IMU
  - RTC
  - Audio
  - Battery
  - Micro SD
  - Native USB
permalink: /products/waveshare-esp32-s3-touch-lcd-1-85b/
specifications:
  - name: Processor
    value: "ESP32-S3R8, dual-core LX7, up to 240 MHz"
  - name: Flash
    value: "16 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Display Size
    value: "1.85 inches"
  - name: Display Type
    value: "TFT LCD"
  - name: Resolution
    value: "360 × 360"
  - name: Display Interface
    value: "QSPI"
  - name: Touch Type
    value: "Capacitive"
  - name: Touch Interface
    value: "I2C"
  - name: IMU
    value: "QMI8658 6-axis IMU"
  - name: RTC
    value: "PCF85063"
  - name: Audio
    value: "ES8311 + ES7210, dual microphones and speaker pads"
  - name: Storage
    value: "Micro SD / TF card"
  - name: Battery
    value: "3.7V Li-battery charging/discharging interface"
  - name: USB
    value: "Native ESP32-S3 USB Type-C"
  - name: LVGL
    value: "Ready; official LVGL demo and ESP-IDF examples"
links:
  - title: "Waveshare Product Page"
    icon: "fas fa-external-link-alt"
    description: "Official product page and ordering information."
    url: "https://www.waveshare.com/esp32-s3-touch-lcd-1.85b.htm"
  - title: "Waveshare Documentation"
    icon: "fas fa-book"
    description: "Official documentation, examples, and development resources."
    url: "https://docs.waveshare.com/ESP32-S3-Touch-LCD-1.85B"
related:
  - waveshare-esp32-s3-touch-lcd-4-3
  - waveshare-esp32-s3-touch-lcd-7
  - ili9341-xpt2046-2-8-touchscreen
---
## Overview

The **Waveshare ESP32-S3-Touch-LCD-1.85B** is a compact ESP32-S3 board designed for graphical, HMI, sensor, audio, and portable projects. It combines a 1.85-inch 360×360 capacitive touchscreen with 8MB PSRAM, 16MB Flash, native USB, microSD, battery support, an IMU, RTC, and audio hardware.

Waveshare documents the board with an official LVGL demo and a comprehensive ESP-IDF example covering the display, touch, audio, and onboard peripherals.

## Hardware Highlights

- ESP32-S3R8 dual-core LX7 up to 240 MHz
- 16 MB Flash
- 8 MB PSRAM
- 1.85-inch 360×360 TFT LCD
- QSPI display interface
- CST816S capacitive touch over I2C
- QMI8658 6-axis IMU
- PCF85063 RTC
- ES8311 audio codec
- ES7210 audio input and echo-cancellation hardware
- Dual microphones and speaker pads
- Micro SD / TF card
- 3.7V lithium battery charging/discharging interface
- Native ESP32-S3 USB Type-C
- Arduino IDE and ESP-IDF support

## LVGL Support

The official ESP-IDF documentation includes a dedicated **LVGL demo** as well as an LVGL application example using the Brookesia component. The comprehensive example also combines LVGL initialization with the touchscreen, audio, and onboard peripherals.

That makes this board particularly useful for testing the Embedded Nerd selector's V2.2 capability filters for **LVGL, IMU, RTC, audio, and battery**.

## Sensors, RTC and Audio

The board integrates a QMI8658 six-axis IMU and a PCF85063 real-time clock. The audio subsystem includes an ES8311 codec, ES7210 echo-cancellation/input hardware, dual microphones, and speaker pads.

These peripherals are all explicitly documented by Waveshare rather than inferred from the product category.

## Battery and Storage

The board provides a 3.7V lithium-battery connector with charging and discharging support. It also includes a TF/microSD interface for external storage.

## Display and Touch

The 360×360 LCD uses a QSPI interface and the CST816S capacitive touch controller communicates over I2C. The round 1:1 display format makes the board different from the larger rectangular 4.3-inch and 7-inch ESP32-S3 touchscreen boards in the selector catalog.

## Who Is It For?

Typical use cases include:

- Compact touchscreen HMIs
- Portable ESP32-S3 interfaces
- LVGL projects
- Sensor dashboards
- Audio and voice interfaces
- Wearable or badge-style prototypes
- Battery-powered embedded interfaces

## Official Documentation

Waveshare's documentation provides the hardware reference, ESP-IDF examples, Arduino support, and tests for the onboard IMU, RTC, battery gauge, and other peripherals.

