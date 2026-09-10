---
layout: product
internal_links: true
title: "Waveshare ESP32-S3-Touch-LCD-4.3"

product_id: waveshare-esp32-s3-touch-lcd-4-3

category: Development Boards

manufacturer: "Waveshare"

image: /assets/images/products/waveshare-esp32-s3-touch-lcd-4-3.webp
alt: "Waveshare ESP32-S3-Touch-LCD-4.3 4.3 inch touchscreen development board"

header:
  teaser: /assets/images/products/waveshare-esp32-s3-touch-lcd-4-3.webp

og_image: /assets/images/products/waveshare-esp32-s3-touch-lcd-4-3.webp

excerpt: "Waveshare ESP32-S3-Touch-LCD-4.3 with an 800×480 IPS RGB touchscreen, capacitive 5-point touch, 16MB Flash, 8MB PSRAM, Wi-Fi, Bluetooth, CAN, RS485 and LVGL support."

description: "Waveshare ESP32-S3-Touch-LCD-4.3 development board featuring an ESP32-S3-WROOM-1-N16R8, 4.3-inch 800×480 IPS RGB touchscreen, capacitive GT911 touch, 16MB Flash, 8MB PSRAM and interfaces for CAN, RS485, I2C, USB and TF card storage."

categories:
  - Development Boards
  - ESP32
  - ESP32-S3
  - Displays

tags:
  - ESP32
  - ESP32-S3
  - Waveshare
  - Touchscreen
  - TFT
  - LCD
  - 800x480
  - Capacitive Touch
  - GT911
  - RGB
  - LVGL
  - Wi-Fi
  - Bluetooth
  - CAN
  - RS485
  - PSRAM

permalink: /products/waveshare-esp32-s3-touch-lcd-4-3/

specifications:
  - name: Processor
    value: "ESP32-S3-WROOM-1-N16R8, dual-core Xtensa LX7 up to 240 MHz"

  - name: Flash
    value: "16MB"

  - name: PSRAM
    value: "8MB"

  - name: Display Size
    value: "4.3 inches"

  - name: Display Type
    value: "IPS LCD"

  - name: Resolution
    value: "800 × 480 pixels"

  - name: Display Interface
    value: "RGB"

  - name: Display Colors
    value: "65K colors"

  - name: Viewing Angle
    value: "160°"

  - name: Brightness
    value: "270 cd/m²"

  - name: Touch Type
    value: "Capacitive"

  - name: Touch
    value: "5-point touch with interrupt support"

  - name: Touch Interface
    value: "I2C"

  - name: Touch Controller
    value: "GT911"

  - name: Wireless
    value: "2.4 GHz Wi-Fi 802.11 b/g/n and Bluetooth 5 LE"

  - name: Communication Interfaces
    value: "CAN, RS485, I2C and USB"

  - name: Storage
    value: "TF card slot"

  - name: USB
    value: "USB Type-C"

  - name: Power Supply
    value: "5V via USB Type-C"

  - name: Power Consumption
    value: "Approximately 5V / 450mA"

  - name: Operating Temperature
    value: "0°C to 65°C"

  - name: Dimensions
    value: "106.1 × 67.8 mm (touch version)"

links:
  - title: Waveshare Product Page
    icon: fas fa-external-link-alt
    description: "Official Waveshare product information"
    url: "https://www.waveshare.com/esp32-s3-touch-lcd-4.3.htm"

  - title: Waveshare Documentation
    icon: fas fa-book
    description: "Official ESP32-S3-Touch-LCD-4.3 documentation"
    url: "https://docs.waveshare.com/ESP32-S3-Touch-LCD-4.3"

  - title: Hardware Resources
    icon: fas fa-file-lines
    description: "Schematics, datasheets and example projects"
    url: "https://docs.waveshare.com/ESP32-S3-Touch-LCD-4.3/Resources-And-Documents"

related:
  - esp32-devkit
  - ili9341-xpt2046-2-8-touchscreen
  - st7789-tft
---

The **Waveshare ESP32-S3-Touch-LCD-4.3** is an ESP32-S3 development board with an integrated **4.3-inch 800×480 IPS RGB touchscreen**.

It combines a high-performance ESP32-S3 with **16MB Flash, 8MB PSRAM, capacitive 5-point touch, Wi-Fi, Bluetooth, CAN, RS485, I2C, USB and TF card storage**, making it suitable for graphical embedded interfaces and HMI applications.

The board is particularly interesting for projects using **LVGL**, dashboards, smart-home interfaces, control panels and other applications that need a larger touchscreen than a typical 2.4-inch or 2.8-inch SPI display.

## Key Features

* 4.3-inch IPS LCD
* 800 × 480 pixel resolution
* RGB display interface
* Capacitive 5-point touchscreen
* GT911 touch controller
* I2C touch interface
* ESP32-S3-WROOM-1-N16R8
* Dual-core Xtensa LX7 processor up to 240 MHz
* 16MB Flash
* 8MB PSRAM
* 2.4 GHz Wi-Fi
* Bluetooth 5 LE
* CAN interface
* RS485 interface
* I2C interface
* USB Type-C
* TF card slot
* LVGL-compatible platform

Waveshare documents the board as a GUI/HMI platform for applications such as IoT, mobile devices and smart-home interfaces. citeturn0search0turn0search1

## ESP32-S3 Controller

The board uses the **ESP32-S3-WROOM-1-N16R8**, combining the ESP32-S3 dual-core LX7 processor with 16MB Flash and 8MB PSRAM.

The additional PSRAM is particularly useful for graphical applications. An 800 × 480 RGB565 framebuffer alone requires approximately 768KB of memory, and more memory may be required when using multiple draw buffers, images, fonts or complex GUI elements.

## 4.3-inch 800 × 480 Display

The integrated display uses an **IPS panel** with an 800 × 480 resolution, RGB interface, 65K colors, approximately 160° viewing angle and 270 cd/m² brightness.

This makes it considerably more capable for graphical interfaces than compact 240 × 320 SPI TFT modules.

## Capacitive Touch

The touch version uses a **capacitive touchscreen** supporting up to 5-point touch.

The touch interface uses **I2C**, with interrupt support. The GT911 is the touch controller used by the board.

This provides a different user experience from the resistive XPT2046 touch commonly found on small ILI9341 modules.

## LVGL and GUI Applications

The ESP32-S3-Touch-LCD-4.3 is designed to run graphical interfaces such as **LVGL**.

Typical applications include:

* Touchscreen dashboards
* Smart-home control panels
* IoT interfaces
* Sensor dashboards
* Thermostats
* HMI panels
* Network monitoring displays
* Portable instruments
* Touch-based control systems

Waveshare provides Arduino and ESP-IDF examples and hardware resources for the board. citeturn0search0turn0search3

## Interfaces

The board includes several interfaces that make it useful beyond the touchscreen itself:

| Interface | Typical use |
|---|---|
| Wi-Fi | IoT and network connectivity |
| Bluetooth 5 LE | Wireless peripherals |
| CAN | Automotive and industrial communication |
| RS485 | Industrial and long-distance communication |
| I2C | Sensors and peripherals |
| USB | Programming and communication |
| TF card | Data and file storage |

## ESP32-S3-Touch-LCD-4.3 vs ILI9341 + XPT2046

The board occupies a different position from the smaller **ILI9341 + XPT2046 2.8-inch Touchscreen**.

| Feature | ILI9341 + XPT2046 | ESP32-S3-Touch-LCD-4.3 |
|---|---|---|
| Display size | 2.8" | 4.3" |
| Resolution | 240 × 320 | 800 × 480 |
| Touch | Resistive | Capacitive |
| Touch points | Single-touch | Up to 5-point |
| Display interface | SPI | RGB |
| Touch interface | SPI | I2C |
| Controller | ESP32 / Arduino | ESP32-S3 |
| PSRAM | Not normally included | 8MB |
| Best suited for | Compact GUIs | Larger GUIs and HMI |

The ILI9341 + XPT2046 remains a good low-cost option for small projects. The Waveshare board is better suited when a larger display, capacitive touch and more graphical memory are important.

## Power and Physical Size

Waveshare specifies a **5V Type-C power supply**, approximately **5V / 450mA power consumption**, and an operating temperature range of **0°C to 65°C**.

The touch version measures approximately **106.1 × 67.8 mm**. citeturn0search0

## Development Resources

Waveshare provides:

* Board schematic and design files
* ESP32-S3 documentation
* ST7262 display documentation
* GT911 touch documentation
* Arduino examples
* ESP-IDF examples
* LVGL-related resources

The official resources page provides access to the schematic, component datasheets and example projects. citeturn0search3

## Things to Consider

This board is more capable than a small SPI touchscreen, but that also comes with additional complexity.

* RGB displays require more resources than small SPI TFTs.
* GUI applications can use significant RAM.
* The 8MB PSRAM is valuable for larger graphical applications.
* Power consumption is higher than a small OLED.
* Hardware details can differ between Waveshare product variants, so check the exact model and revision before relying on revision-specific pin assignments.

## Recommended For

The Waveshare ESP32-S3-Touch-LCD-4.3 is a strong choice for:

* ESP32 touchscreen projects
* LVGL projects
* Touchscreen dashboards
* HMI development
* Smart-home control panels
* IoT interfaces
* Sensor monitoring systems
* Larger embedded GUIs

It is especially attractive as a step up from a small **ILI9341 + XPT2046** touchscreen when the project needs a larger, higher-resolution and capacitive display.

## Related Embedded Nerd Products

This board fits naturally into the Embedded Nerd ESP32 display and touchscreen cluster.

The **ILI9341 + XPT2046 2.8-inch Touchscreen** is the compact, low-cost resistive-touch option, while the Waveshare ESP32-S3-Touch-LCD-4.3 provides a larger capacitive touchscreen with an integrated ESP32-S3 and PSRAM.

---

*Specifications are based on Waveshare's documentation for the ESP32-S3-Touch-LCD-4.3, SKU 25948. Check the manufacturer's documentation for the exact hardware revision before using revision-specific electrical details.* citeturn0search0turn0search3
