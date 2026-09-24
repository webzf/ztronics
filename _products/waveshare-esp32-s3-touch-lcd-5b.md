---
layout: product
internal_links: true
title: "Waveshare ESP32-S3-Touch-LCD-5B"

product_id: waveshare-esp32-s3-touch-lcd-5b

category: Displays

manufacturer: "Waveshare"

image: https://www.waveshare.com/img/devkit/ESP32-S3-Touch-LCD-5/ESP32-S3-Touch-LCD-5-details-1.jpg
alt: "Waveshare ESP32-S3-Touch-LCD-5B 5-inch 1024x600 capacitive touchscreen development board"

header:
  teaser: https://www.waveshare.com/img/devkit/ESP32-S3-Touch-LCD-5/ESP32-S3-Touch-LCD-5-details-1.jpg

og_image: https://www.waveshare.com/img/devkit/ESP32-S3-Touch-LCD-5/ESP32-S3-Touch-LCD-5-details-1.jpg

excerpt: "Waveshare ESP32-S3-Touch-LCD-5B with a 5-inch 1024×600 IPS RGB touchscreen, 5-point capacitive touch, 16MB Flash, 8MB PSRAM, CAN, RS485 and LVGL support."

description: "Waveshare ESP32-S3-Touch-LCD-5B is an ESP32-S3 HMI development board with a 5-inch 1024×600 IPS RGB display, GT911 capacitive touch, 16MB Flash, 8MB PSRAM, CAN, RS485, I2C, TF card and USB interfaces."

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
  - 5-inch
  - 1024x600
  - IPS
  - LCD
  - RGB
  - Capacitive Touch
  - GT911
  - ST7262
  - LVGL
  - Wi-Fi
  - Bluetooth
  - CAN
  - RS485
  - PSRAM

permalink: /products/waveshare-esp32-s3-touch-lcd-5b/

specifications:
  - name: Processor
    value: "ESP32-S3 dual-core Xtensa LX7 up to 240 MHz"

  - name: Flash
    value: "16MB"

  - name: PSRAM
    value: "8MB"

  - name: Display Size
    value: "5 inches"

  - name: Display Type
    value: "IPS LCD"

  - name: Resolution
    value: "1024 × 600 pixels"

  - name: Display Interface
    value: "RGB"

  - name: Display Controller
    value: "ST7262"

  - name: Display Colors
    value: "65K colors"

  - name: Viewing Angle
    value: "178°"

  - name: Brightness
    value: "550 cd/m²"

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

  - name: Power
    value: "USB Type-C 5V, DC 7–36V and 3.7V single-cell battery input"

  - name: Battery
    value: "Single-cell 3.7V lithium battery support with charging management"

  - name: Software
    value: "Arduino, ESP-IDF and LVGL"

links:
  - title: Waveshare Product Page
    icon: fas fa-external-link-alt
    description: "Official product information for SKU 28151"
    url: "https://www.waveshare.com/esp32-s3-touch-lcd-5.htm?sku=28151"

  - title: Waveshare Documentation
    icon: fas fa-book
    description: "Official ESP32-S3-Touch-LCD-5 / 5B documentation"
    url: "https://docs.waveshare.com/ESP32-S3-Touch-LCD-5"

  - title: Hardware Resources
    icon: fas fa-file-lines
    description: "Schematics, datasheets and Arduino / ESP-IDF examples"
    url: "https://docs.waveshare.com/ESP32-S3-Touch-LCD-5/Resources-And-Documents"

related:
  - waveshare-esp32-s3-touch-lcd-4-3
  - waveshare-esp32-s3-touch-lcd-7
  - waveshare-esp32-s3-touch-lcd-1-85b
---

The **Waveshare ESP32-S3-Touch-LCD-5B** is a 5-inch ESP32-S3 development board built around a **1024 × 600 IPS RGB touchscreen**.

The 5B is the upgraded 1024×600 touchscreen variant of Waveshare's 5-inch ESP32-S3 platform. The manufacturer lists **16MB Flash, 8MB PSRAM, 5-point capacitive touch, Wi-Fi, Bluetooth 5, CAN, RS485, I2C, TF-card storage and USB**, with support for GUI applications such as LVGL.

## Key Features

* 5-inch IPS LCD
* 1024 × 600 pixel resolution
* RGB display interface
* 65K colors
* Capacitive 5-point touchscreen
* GT911 touch controller
* I2C touch interface
* ESP32-S3 dual-core LX7 up to 240 MHz
* 16MB Flash
* 8MB PSRAM
* 2.4 GHz Wi-Fi
* Bluetooth 5 LE
* CAN interface
* RS485 interface
* I2C interface
* TF card slot
* USB Type-C
* 7–36V DC input
* Single-cell 3.7V battery support
* LVGL-compatible platform

## 1024 × 600 Touch Display

The main difference from the standard **ESP32-S3-Touch-LCD-5** is the upgraded display resolution. The 5B uses a **1024 × 600** IPS panel and is specified with a **178° viewing angle** and **550 cd/m² brightness**.

The wider 5-inch format makes the board suitable for dashboards, control panels and other HMI interfaces where a larger working area is useful.

## Capacitive Touch

The touchscreen provides **5-point capacitive touch** through an **I2C** interface, with interrupt support. The touch controller is the **GT911**.

This makes the 5B particularly suitable for gesture-capable interfaces and LVGL applications where a traditional resistive touch panel would be limiting.

## ESP32-S3, Flash and PSRAM

The board uses an **ESP32-S3 dual-core LX7 processor** running up to 240 MHz, with **16MB Flash and 8MB PSRAM**.

The PSRAM is important for larger graphical applications because RGB displays and GUI assets can consume substantial memory. LVGL interfaces with multiple buffers, fonts, images and widgets benefit from having external PSRAM available.

## Industrial and HMI Interfaces

This board is more than a touchscreen development kit. It exposes interfaces aimed at real-world control applications:

| Interface | Typical use |
|---|---|
| CAN | Automotive and industrial communication |
| RS485 | Industrial and long-distance serial communication |
| I2C | Sensors and peripherals |
| TF card | Local storage and data logging |
| USB | Programming, power and communication |

The board also provides isolated digital inputs and outputs for 5–36V signals, making the 5B relevant to HMI and control-panel projects.

## LVGL Development

Waveshare provides both **Arduino and ESP-IDF examples** for the ESP32-S3-Touch-LCD-5 family. The platform can be used with **LVGL** for dashboards, touchscreen menus and embedded HMIs.

Typical projects include:

* Touchscreen dashboards
* Smart-home controllers
* Industrial HMI panels
* IoT control interfaces
* Network monitoring displays
* Sensor dashboards
* Portable instruments
* Machine control panels

## ESP32-S3-Touch-LCD-5B vs ESP32-S3-Touch-LCD-5

The two 5-inch touchscreen variants share the same general platform but use different display resolutions.

| Feature | ESP32-S3-Touch-LCD-5 | ESP32-S3-Touch-LCD-5B |
|---|---|---|
| Display size | 5" | 5" |
| Resolution | 800 × 480 | 1024 × 600 |
| Display | IPS RGB | IPS RGB |
| Touch | Capacitive | Capacitive |
| Touch points | 5-point | 5-point |
| Flash | 16MB | 16MB |
| PSRAM | 8MB | 8MB |
| MCU | ESP32-S3 | ESP32-S3 |
| LVGL | Supported | Supported |

The exact product variant matters when configuring display timing and resolution, so the **SKU should be checked before using example configurations**.

## ESP32-S3-Touch-LCD-5B vs Larger 7-inch Boards

Compared with the **Waveshare ESP32-S3-Touch-LCD-7**, the 5B keeps the same ESP32-S3-oriented HMI concept in a smaller 5-inch format, while increasing the resolution to 1024×600.

That makes it a useful middle ground for projects that need more screen area than a 4.3-inch panel without moving to a 7-inch enclosure.

## Things to Consider

RGB displays consume more GPIO and memory resources than small SPI TFT modules. On this board, the display uses many ESP32-S3 signals and the **CH422G I/O expander** is used for additional control functions.

The touch controller and onboard I2C devices also occupy I2C addresses, so external peripherals should be checked for address conflicts before connecting them.

For firmware development, use the exact **5B / 1024×600** configuration rather than assuming the 800×480 configuration for the standard 5-inch board.

## Recommended Applications

The ESP32-S3-Touch-LCD-5B is well suited to:

* ESP32-S3 touchscreen projects
* LVGL dashboards
* Industrial HMI prototypes
* Smart-home control panels
* IoT interfaces
* CAN bus dashboards
* RS485 control panels
* Sensor monitoring systems
* Embedded GUI experiments

The combination of a **5-inch 1024×600 display, capacitive touch, PSRAM and industrial interfaces** makes it a useful addition to the Embedded Nerd touchscreen hardware database.

---

*Specifications are based on Waveshare documentation and product information for the ESP32-S3-Touch-LCD-5B, SKU 28151. Check the manufacturer's documentation for the exact hardware revision before using revision-specific pin mappings.*