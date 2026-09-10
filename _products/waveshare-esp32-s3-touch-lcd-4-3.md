---
category: Development Boards
description: ESP32-S3 development board with a 4.3-inch 800×480 RGB IPS
  capacitive touchscreen, 16MB Flash, 8MB PSRAM, GT911 touch controller,
  and LVGL support.
image: /assets/images/products/waveshare-esp32-s3-touch-lcd-4-3.webp
layout: product
manufacturer: Waveshare
product_id: waveshare-esp32-s3-touch-lcd-4-3
title: Waveshare ESP32-S3-Touch-LCD-4.3
---

# Waveshare ESP32-S3-Touch-LCD-4.3

The **Waveshare ESP32-S3-Touch-LCD-4.3** is an ESP32-S3 development
board with an integrated **4.3-inch 800×480 RGB IPS capacitive
touchscreen**. It is designed for graphical user interfaces, HMI
applications, IoT devices, dashboards, and LVGL-based projects.

## Key Features

-   **MCU:** ESP32-S3-WROOM-1-N16R8
-   **CPU:** Dual-core Xtensa LX7, up to 240 MHz
-   **Flash:** 16MB
-   **PSRAM:** 8MB
-   **Display:** 4.3-inch IPS LCD
-   **Resolution:** 800 × 480
-   **Display interface:** RGB
-   **Touch:** Capacitive, up to 5-point touch
-   **Touch controller:** GT911
-   **Touch interface:** I2C
-   **Wireless:** 2.4 GHz Wi-Fi and Bluetooth 5 LE
-   **Interfaces:** CAN, RS485, I2C and USB
-   **Storage:** TF card slot
-   **Power:** 5V via USB Type-C
-   **Operating temperature:** 0°C to 65°C
-   **Dimensions:** 106.1 × 67.8 mm for the touch version

## Display and Touch

The integrated display has an **800 × 480 resolution**, IPS panel, 65K
colors, approximately 160° viewing angle, and 270 cd/m² brightness.

The touch panel uses tempered glass and supports capacitive 5-point
touch. The touch controller is the **GT911**, communicating through I2C
with interrupt support.

## ESP32-S3, Flash and PSRAM

The board uses the **ESP32-S3-WROOM-1-N16R8**, with 16MB Flash and 8MB
PSRAM.

The external PSRAM is particularly useful for graphical applications
because larger displays require more memory for draw buffers, images,
fonts, and GUI elements.

An 800 × 480 RGB565 framebuffer requires approximately 768KB for one
full frame, before additional GUI buffers and assets are considered.

## Interfaces and Peripherals

  Interface        Purpose
  ---------------- --------------------------------------------
  USB              Programming and communication
  I2C              Touch and external peripherals
  CAN              CAN bus applications
  RS485            Industrial and long-distance communication
  TF card          Removable storage
  Wi-Fi            Wireless networking
  Bluetooth 5 LE   Bluetooth Low Energy applications

## LVGL Support

The board is particularly well suited to **LVGL** graphical interfaces.

Typical LVGL applications include:

-   Buttons
-   Labels
-   Sliders
-   Switches
-   Charts
-   Menus
-   Status indicators
-   Touch-controlled screens

Waveshare provides Arduino and ESP-IDF examples, including LVGL
examples.

## ESP32-S3-Touch-LCD-4.3 vs Small SPI Touchscreens

  ------------------------------------------------------------------------
  Feature                 Small SPI touchscreen   ESP32-S3-Touch-LCD-4.3
  ----------------------- ----------------------- ------------------------
  Typical size            2.4--2.8"               4.3"

  Resolution              Often 240×320           800×480

  Touch                   Often resistive         Capacitive

  Touch controller        Commonly XPT2046        GT911

  Display interface       SPI                     RGB

  MCU                     Often classic ESP32     ESP32-S3

  PSRAM                   Usually absent          8MB

  GUI complexity          Basic to moderate       Moderate to advanced

  Best use                Compact projects        HMI, dashboards and
                                                  graphical interfaces
  ------------------------------------------------------------------------

For a small and inexpensive touchscreen project, an ILI9341 + XPT2046
module remains attractive. For a larger and more modern interface, the
ESP32-S3-Touch-LCD-4.3 is a stronger platform.

## Typical Applications

-   Smart home control panels
-   IoT dashboards
-   Sensor dashboards
-   Thermostats
-   Industrial HMIs
-   Network monitoring panels
-   Touchscreen control interfaces
-   Data loggers
-   Portable instruments
-   LVGL user interfaces

## Why Choose This Board?

The main advantage is the combination of a relatively large touchscreen
with a capable ESP32-S3 and substantial external memory.

Instead of connecting an ESP32 development board to a separate display
and touch controller, this board integrates the main components into one
development platform.

It is particularly attractive when a project needs a **responsive
graphical interface rather than a simple status display**.

## Things to Consider

-   The 800 × 480 RGB display is more demanding than a small SPI TFT.
-   Graphical applications can use significant RAM, making the 8MB PSRAM
    valuable.
-   The board is larger than compact ESP32 display modules.
-   Power consumption is higher than a small OLED or low-power display.
-   Check the exact hardware revision before relying on
    revision-specific pin assignments.

Waveshare specifies 5V power and approximately 5V/450mA power
consumption for this model.

## Documentation and Development

Waveshare provides:

-   Hardware design files
-   Schematics
-   ESP32-S3 documentation
-   ST7262 display documentation
-   GT911 touch documentation
-   Arduino examples
-   ESP-IDF examples
-   LVGL examples

The official documentation identifies the display driver as **ST7262**
and the touch controller as **GT911**.

## Related Embedded Nerd Content

This product fits the Embedded Nerd touchscreen display cluster:

-   ESP32 Touchscreen Displays: Complete Guide to Choosing and Using a
    Touchscreen
-   ESP32 OLED Tutorial
-   I2C Scanner Tutorial
-   ILI9341 + XPT2046 2.8-inch Touchscreen

It is especially useful as the larger, capacitive and ESP32-S3
alternative to a small ILI9341 + XPT2046 touchscreen.

## Product Information

**Manufacturer:** Waveshare\
**Model:** ESP32-S3-Touch-LCD-4.3\
**Waveshare SKU:** 25948
