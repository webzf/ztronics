---
layout: product
internal_links: true
title: "Arduino Nano ESP32"
product_verdict: "A compact Nano-format board for ESP32-S3 projects that need Wi-Fi, Bluetooth and Arduino-friendly pin names; remember that its GPIOs are 3.3 V only."
seo_title: "Arduino Nano ESP32: Specs, Pinout & Where to Buy"
seo_description: "Arduino Nano ESP32 specs, D0–D13 and A0–A7 GPIO mapping, 3.3 V limits, MicroPython support and buying tips."
product_id: arduino-nano-esp32
category: Development Boards
manufacturer: "Arduino"
alt: "Arduino Nano ESP32 development board with ESP32-S3, Wi-Fi, Bluetooth and USB-C"
excerpt: "Arduino Nano ESP32 with ESP32-S3, Wi-Fi, Bluetooth, USB-C and Nano-format pin headers. Check the pin mapping, 3.3 V limits and buying options."
description: "The Arduino Nano ESP32 combines the familiar Nano form factor with an ESP32-S3-based NORA-W106 module, Wi-Fi, Bluetooth and USB-C. Its Arduino pin names map to ESP32-S3 GPIO numbers, so check the mapping before wiring existing projects."
categories:
  - ESP32
  - Arduino
  - Development Boards
tags:
  - Arduino Nano ESP32
  - ESP32-S3
  - Arduino
  - Development Board
  - Wi-Fi
  - Bluetooth
  - MicroPython
permalink: /products/arduino-nano-esp32/
specifications:
  - name: Module / MCU
    value: "u-blox NORA-W106 with ESP32-S3"
  - name: Logic voltage
    value: "3.3 V; GPIOs are not 5 V tolerant"
  - name: USB connector
    value: "USB-C"
  - name: Digital I/O
    value: "14 pins (D0–D13)"
  - name: Analog inputs
    value: "8 pins (A0–A7)"
  - name: Flash
    value: "16 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Wireless
    value: "2.4 GHz Wi-Fi and Bluetooth 5"
  - name: Programming
    value: "Arduino IDE / Arduino ESP32 core; MicroPython supported"
links:
  - title: "Official Arduino Nano ESP32 documentation"
    icon: "fas fa-book"
    description: "Official board overview, pinout, tutorials and technical resources."
    url: "https://docs.arduino.cc/hardware/nano-esp32"
  - title: "Official full pinout PDF"
    icon: "fas fa-file-pdf"
    description: "Board pinout with Nano labels and ESP32-S3 GPIO numbers."
    url: "https://docs.arduino.cc/resources/pinouts/ABX00083-full-pinout.pdf"
related:
  - esp32-devkit
  - raspberry-pi-pico
  - mpu6050
---
The **Arduino Nano ESP32** brings Espressif's ESP32-S3 platform into the familiar Nano footprint. Compared with the classic Arduino Nano, it adds 2.4 GHz Wi-Fi and Bluetooth, uses a USB-C connector, and runs its GPIO at 3.3 V rather than 5 V. It is a good fit for compact IoT devices, wireless sensors, USB-connected projects and anyone who wants ESP32 capabilities without moving to a larger DevKit-style board.

The key detail to understand before wiring it is the **pin mapping**: Arduino names such as D2 or A4 are not the same numbers as the ESP32-S3 GPIOs. Use the mapping table below instead of assuming the labels match GPIO numbers.

## Arduino Nano ESP32 specifications

| Specification | Details |
|---|---|
| Module / MCU | u-blox NORA-W106 module containing ESP32-S3 |
| CPU | Dual-core Xtensa LX7, up to 240 MHz |
| Flash | 16 MB |
| PSRAM | 8 MB |
| Logic voltage | 3.3 V |
| Digital pins | 14 (D0–D13) |
| Analog inputs | 8 (A0–A7) |
| USB connector | USB-C |
| Wireless | 2.4 GHz Wi-Fi and Bluetooth 5 |
| Programming | Arduino IDE / Arduino ESP32 core; MicroPython supported |
| Board dimensions | Check the official drawing for the exact mechanical details |

Specifications above follow Arduino's board documentation and datasheet. Consult the official documentation for revision-specific details.

## Arduino Nano ESP32 pinout: Arduino labels vs ESP32 GPIO

The physical headers use Nano-style names, but sketches and low-level ESP32 code may refer to the ESP32-S3 GPIO numbers. This is the default Arduino pin mapping documented for the Nano ESP32.

| Arduino pin | ESP32-S3 GPIO | Common use / note |
|---|---:|---|
| D0 / RX | GPIO44 | UART RX label |
| D1 / TX | GPIO43 | UART TX label |
| D2 | GPIO5 | Digital I/O |
| D3 | GPIO6 | Digital I/O / PWM |
| D4 | GPIO7 | Digital I/O |
| D5 | GPIO8 | Digital I/O / PWM |
| D6 | GPIO9 | Digital I/O / PWM |
| D7 | GPIO10 | Digital I/O |
| D8 | GPIO17 | Digital I/O |
| D9 | GPIO18 | Digital I/O |
| D10 | GPIO21 | Digital I/O / SPI chip-select convention varies by library |
| D11 / COPI | GPIO38 | SPI controller-out peripheral-in (MOSI) |
| D12 / CIPO | GPIO47 | SPI controller-in peripheral-out (MISO) |
| D13 / SCK | GPIO48 | SPI clock; built-in LED |
| A0 | GPIO1 | Analog input / GPIO |
| A1 | GPIO2 | Analog input / GPIO |
| A2 | GPIO3 | Analog input / GPIO |
| A3 | GPIO4 | Analog input / GPIO |
| A4 / SDA | GPIO11 | I²C data by default |
| A5 / SCL | GPIO12 | I²C clock by default |
| A6 | GPIO13 | Analog input / GPIO |
| A7 | GPIO14 | Analog input / GPIO |

All header pins have specific electrical and peripheral constraints. Although the ESP32-S3 GPIO matrix allows many peripherals to be reassigned, use the official pinout and board package defaults when following examples. ADC2 use can conflict with Wi-Fi, so check the ESP32-S3 ADC documentation if an analog reading behaves unexpectedly while wireless is active.

**Important:** the mapping above is the default Nano ESP32 Arduino configuration. It is not a generic mapping for every ESP32-S3 board.

## Arduino Nano ESP32 vs classic Nano vs ESP32 DevKit

| Feature | Nano ESP32 | Classic Arduino Nano | ESP32 DevKit V1 |
|---|---|---|---|
| Main MCU | ESP32-S3 in NORA-W106 | ATmega328P | Usually ESP32; variants differ |
| Logic level | 3.3 V | 5 V | Usually 3.3 V |
| Wi-Fi / Bluetooth | Yes / Yes | No / No | Usually yes / yes |
| USB connector | USB-C | Mini-B on classic model | Varies by board |
| Pin naming | Nano D/A labels mapped to ESP32 GPIOs | Arduino D/A labels | GPIO numbering varies by board |
| Best fit | Compact wireless Nano projects | Legacy 5 V Arduino projects | Flexible prototyping and more board space |

Choose the **Nano ESP32** when you want wireless connectivity in a Nano footprint. If you need the classic Nano's 5 V logic or depend on older 5 V shields, the original Nano may be easier to integrate. For a low-cost general-purpose ESP32 setup with a larger prototyping layout, compare the [ESP32 DevKit V1](/products/esp32-devkit/). For broader board selection, see our [ESP32 OLED and development guide](/esp32-oled-tutorial-wiring-code-display-guide/) and [Development Boards category](/products/development-boards/).

## Is the Arduino Nano ESP32 5 V tolerant?

No. Its GPIO pins operate at 3.3 V and must not receive 5 V signals. Applying 5 V to a digital or analog pin can damage the board. Use a logic-level shifter when connecting a 5 V sensor, module or shield. The VBUS pin is not a general 5 V logic input; it provides USB-sourced 5 V when the board is powered through USB and is not enabled in the same way when powered through VIN.

## Does it support MicroPython?

Yes. Arduino documents MicroPython support for the Nano ESP32. Follow the official MicroPython getting-started instructions for the correct firmware and flashing process. Switching firmware changes the programming environment; it does not change the board's 3.3 V electrical limits or the physical pin mapping.

## Can I use classic Arduino Nano shields?

Not automatically. The Nano form factor makes some accessories physically compatible, but check both the header layout and electrical requirements. Shields designed for 5 V logic may drive signals above the Nano ESP32's safe input voltage. Use a suitable level shifter or choose a shield explicitly compatible with 3.3 V boards.

## Arduino IDE or ESP-IDF?

Use the Arduino IDE with the Arduino ESP32 board package for the simplest setup and for most Arduino libraries and examples. ESP-IDF is Espressif's lower-level development framework and can be preferable when you need direct access to ESP32 features, advanced configuration or an ESP-IDF-based project. Confirm the selected framework and library support before porting code between environments.

## Where to buy the Arduino Nano ESP32

Check the exact model and whether the board is supplied with headers soldered or unsoldered. Arduino's product listings and marketplace offers can differ by region, seller and included accessories. The purchase button uses the product-specific Amazon listing supplied for this board. Check the seller, delivery destination, price and whether headers are included before ordering; availability and offers can vary by region.

- [Official Arduino Nano ESP32 documentation](https://docs.arduino.cc/hardware/nano-esp32)
- [View the Arduino Nano ESP32 listing on Amazon](https://www.amazon.com/dp/B0C947BHK5?tag=embeddednerd2-20)

## Official resources

- [Arduino Nano ESP32 documentation](https://docs.arduino.cc/hardware/nano-esp32)
- [Official pinout PDF](https://docs.arduino.cc/resources/pinouts/ABX00083-full-pinout.pdf)
- [Arduino Nano ESP32 technical specifications](https://docs.arduino.cc/tutorials/nano-esp32/cheat-sheet/)
