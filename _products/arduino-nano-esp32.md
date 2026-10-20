---
layout: product
internal_links: true
title: "Arduino Nano ESP32"
product_verdict: "A compact Nano-format board for ESP32-S3 projects that need Wi-Fi, Bluetooth and Arduino-friendly pin names; remember that its GPIOs are 3.3 V only."
seo_title: "Arduino Nano ESP32: Specs, Pinout & Where to Buy"
seo_description: "Arduino Nano ESP32 specs, full D0–D13 / A0–A7 to GPIO pinout table, 3.3 V limits, MicroPython support and where to buy."
product_id: arduino-nano-esp32
category: Development Boards
manufacturer: "Arduino"
alt: "Arduino Nano ESP32 development board with ESP32-S3, Wi-Fi, Bluetooth and USB-C"
image: /assets/images/products/arduino-nano-esp32-board.webp
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
![Arduino Nano ESP32 development board, top-side components and headers](/assets/images/products/arduino-nano-esp32-board.webp)

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
| Board dimensions | 43.2 × 17.8 mm (board outline; connectors may overhang) |

Specifications above follow Arduino's board documentation and datasheet. Consult the official documentation for revision-specific details.

## Arduino Nano ESP32 pinout: Arduino labels vs ESP32 GPIO

![Arduino Nano ESP32 top-view pinout with D0–D13, A0–A7, power pins and ESP32 module](/assets/images/products/arduino-nano-esp32-pinout.webp)

The physical headers use Nano-style names, but sketches and low-level ESP32 code may refer to the ESP32-S3 GPIO numbers. This is the default Arduino pin mapping documented for the Nano ESP32.

| Arduino pin | ESP32-S3 GPIO | Common use / note |
|---|---:|---|
| D0 / RX | GPIO44 | UART RX label; PWM supported |
| D1 / TX | GPIO43 | UART TX label; PWM supported |
| D2 | GPIO5 | Digital I/O; PWM supported |
| D3 | GPIO6 | Digital I/O; PWM supported |
| D4 | GPIO7 | Digital I/O; PWM supported |
| D5 | GPIO8 | Digital I/O; PWM supported |
| D6 | GPIO9 | Digital I/O; PWM supported |
| D7 | GPIO10 | Digital I/O; PWM supported |
| D8 | GPIO17 | Digital I/O; PWM supported |
| D9 | GPIO18 | Digital I/O; PWM supported |
| D10 | GPIO21 | Digital I/O; PWM supported |
| D11 / COPI | GPIO38 | SPI COPI (MOSI); PWM also supported |
| D12 / CIPO | GPIO47 | SPI CIPO (MISO); PWM also supported |
| D13 / SCK | GPIO48 | SPI clock; built-in LED; PWM supported |
| A0 | GPIO1 | ADC1 analog input / GPIO; PWM supported |
| A1 | GPIO2 | ADC1 analog input / GPIO; PWM supported |
| A2 | GPIO3 | ADC1 analog input / GPIO; PWM supported |
| A3 | GPIO4 | ADC1 analog input / GPIO; PWM supported |
| A4 / SDA | GPIO11 | ADC2; I²C data by default. See the [I2C Address Lookup](/tools/i2c-address-lookup/) and [I2C Scanner Tutorial](/i2c-scanner-tutorial/). |
| A5 / SCL | GPIO12 | ADC2; I²C clock by default. See the [I2C Address Lookup](/tools/i2c-address-lookup/) and [I2C Scanner Tutorial](/i2c-scanner-tutorial/). |
| A6 | GPIO13 | ADC2 analog input / GPIO; PWM supported |
| A7 | GPIO14 | ADC2 analog input / GPIO; PWM supported |

Arduino’s official Nano ESP32 User Manual states that PWM via `analogWrite()` is supported on all digital pins D0–D13 and all analog pins A0–A7. However, due to timer restrictions, only five PWM signals can be generated simultaneously. The `~` marks on some pinout diagrams should not be interpreted as the only PWM-capable pins on this board. See the [official Arduino Nano ESP32 User Manual](https://docs.arduino.cc/tutorials/nano-esp32/cheat-sheet/).

For analog reads, **A0–A3 (GPIO1–GPIO4) use ADC1**. **A4–A7 (GPIO11–GPIO14) use ADC2**, which is also used by Wi-Fi and can fail or become unavailable while Wi-Fi is active. If you need stable analog measurements while using Wi-Fi, prefer A0–A3.

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

Choose the **Nano ESP32** when you want wireless connectivity in a Nano footprint. If you need the classic Nano's 5 V logic or depend on older 5 V shields, the original Nano may be easier to integrate. For a low-cost general-purpose ESP32 setup with a larger prototyping layout, compare the [ESP32 DevKit V1](/products/esp32-devkit/). For broader board selection, compare our [Best ESP32 Boards](/best-esp32-boards/) and [Best Arduino Starter Kits](/best-arduino-starter-kits/) guides, or browse the [Development Boards category](/products/development-boards/).

## Arduino Nano ESP32 example: blink and read A0

This sketch blinks the built-in LED and prints an analog reading from A0. It also shows that the Arduino pin name D2 maps to ESP32-S3 GPIO5; in normal Arduino sketches, use the board label D2 rather than hard-coding the raw GPIO number.

```cpp
const int ledPin = LED_BUILTIN;
const int digitalPin = D2; // Nano label D2 maps to ESP32-S3 GPIO5
const int analogPin = A0;  // Nano label A0 maps to GPIO1 (ADC1)

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
  pinMode(digitalPin, OUTPUT);
}

void loop() {
  digitalWrite(ledPin, !digitalRead(ledPin));
  digitalWrite(digitalPin, HIGH);
  Serial.print("A0 = ");
  Serial.println(analogRead(analogPin));
  delay(500);
  digitalWrite(digitalPin, LOW);
  delay(500);
}
```

Open Serial Monitor at **115200 baud** to see the A0 readings. For a real analog test, connect a voltage within the board’s allowed input range; never apply 5 V to a GPIO.

## Is the Arduino Nano ESP32 5 V tolerant?

No. Its GPIO pins operate at 3.3 V and must not receive 5 V signals. Applying 5 V to a digital or analog pin can damage the board. Use a logic-level shifter when connecting a 5 V sensor, module or shield. The VBUS pin is not a general 5 V logic input; it provides USB-sourced 5 V when the board is powered through USB and is not enabled in the same way when powered through VIN.

## Does it support MicroPython?

Yes. Arduino documents MicroPython support for the Nano ESP32. Follow the official MicroPython getting-started instructions for the correct firmware and flashing process. Switching firmware changes the programming environment; it does not change the board's 3.3 V electrical limits or the physical pin mapping.

## Can I use classic Arduino Nano shields?

Not automatically. The Nano form factor makes some accessories physically compatible, but check both the header layout and electrical requirements. Shields designed for 5 V logic may drive signals above the Nano ESP32's safe input voltage. Use a suitable level shifter or choose a shield explicitly compatible with 3.3 V boards.

## Arduino IDE or ESP-IDF?

Use the Arduino IDE with the Arduino ESP32 board package for the simplest setup and for most Arduino libraries and examples. ESP-IDF is Espressif's lower-level development framework and can be preferable when you need direct access to ESP32 features, advanced configuration or an ESP-IDF-based project. Confirm the selected framework and library support before porting code between environments.

## Arduino Nano ESP32 packaging

![Arduino Nano ESP32 board beside its retail box](/assets/images/products/arduino-nano-esp32-box.webp)

## Where to buy the Arduino Nano ESP32

Check the exact model and whether the board is supplied with headers soldered or unsoldered. Arduino's product listings and marketplace offers can differ by region, seller and included accessories. The purchase button uses the product-specific Amazon listing supplied for this board. Check the seller, delivery destination, price and whether headers are included before ordering; availability and offers can vary by region.

- [Official Arduino Nano ESP32 documentation](https://docs.arduino.cc/hardware/nano-esp32)
- [View the Arduino Nano ESP32 listing on Amazon](https://www.amazon.com/dp/B0C947BHK5?tag=embeddednerd2-20)

## Official resources

- [Arduino Nano ESP32 documentation](https://docs.arduino.cc/hardware/nano-esp32)
- [Official pinout PDF](https://docs.arduino.cc/resources/pinouts/ABX00083-full-pinout.pdf)
- [Arduino Nano ESP32 technical specifications](https://docs.arduino.cc/tutorials/nano-esp32/cheat-sheet/)
