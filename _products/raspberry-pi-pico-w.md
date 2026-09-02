---
layout: product

title: "Raspberry Pi Pico W"
product_id: raspberry-pi-pico-w
category: Raspberry Pi
manufacturer: Raspberry Pi
image: /assets/images/products/raspberry-pi-pico-w.jpg
description: "Raspberry Pi Pico W is a compact RP2040 microcontroller board with 2.4 GHz Wi-Fi and Bluetooth 5.2, ideal for IoT, wireless sensors, automation, and connected embedded projects."
keywords:
  - Raspberry Pi Pico W
  - Pico W
  - Raspberry Pi Pico W WiFi
  - Pico W projects
  - RP2040 WiFi
  - Raspberry Pi microcontroller
related:
  - raspberry-pi-pico
  - esp32-devkit-v1
  - dht22
  - mpu6050
required_hardware:
  - USB cable
  - Raspberry Pi Pico W
---

The **Raspberry Pi Pico W** is a compact and affordable wireless microcontroller board based on the Raspberry Pi RP2040. It combines the RP2040's dual-core processing and flexible GPIO with built-in **2.4 GHz Wi-Fi and Bluetooth 5.2**, making it a strong choice for IoT, automation, wireless sensors, and embedded projects.

Unlike a Raspberry Pi computer, the Pico W is a microcontroller: it runs firmware directly rather than a full Linux operating system. This makes it particularly well suited to applications that need fast startup, low power consumption, direct hardware control, and wireless connectivity.

## Key Features

- RP2040 dual-core Arm Cortex-M0+ processor up to 133 MHz
- 264 KB on-chip SRAM
- 2 MB on-board flash memory
- 26 multifunction GPIO pins
- 2 × SPI interfaces
- 2 × I2C interfaces
- 2 × UART interfaces
- 3 × 12-bit ADC inputs
- 16 PWM channels
- 8 programmable PIO state machines
- 2.4 GHz single-band 802.11n Wi-Fi
- Bluetooth 5.2 with Bluetooth Classic and Bluetooth Low Energy
- WPA3 support
- USB 1.1 for power, programming, and data
- On-board wireless antenna
- SWD debug interface
- Supports MicroPython, C, and C++

## Technical Specifications

| Specification | Raspberry Pi Pico W |
|---|---|
| Microcontroller | Raspberry Pi RP2040 |
| CPU | Dual-core Arm Cortex-M0+ |
| Maximum clock | Up to 133 MHz |
| SRAM | 264 KB |
| Flash | 2 MB |
| GPIO | 26 multifunction GPIO |
| ADC | 3 × 12-bit ADC |
| PWM | 16 channels |
| SPI | 2 |
| I2C | 2 |
| UART | 2 |
| PIO | 8 state machines |
| Wi-Fi | 2.4 GHz 802.11n |
| Bluetooth | Bluetooth 5.2, BLE |
| USB | USB 1.1 |
| Programming | MicroPython, C, C++ |
| Board dimensions | 21 × 51 mm |
| Headers | Not pre-soldered |

## Why Use the Raspberry Pi Pico W?

The main advantage of the Pico W is that it adds wireless connectivity to the Pico platform without requiring an external Wi-Fi module.

It is a good fit when a project needs to:

- Send sensor readings over Wi-Fi
- Host a simple web server
- Connect an embedded device to an MQTT broker
- Build wireless home-automation devices
- Create IoT sensors
- Communicate with a smartphone using Bluetooth
- Control hardware remotely
- Build low-cost connected prototypes

The Pico W is also useful for projects where a full Raspberry Pi computer would be unnecessary. It provides direct GPIO control and starts firmware immediately, making it better suited to many real-time embedded tasks.

## Raspberry Pi Pico W Projects

The Pico W can be combined with common sensors and modules to create practical wireless projects.

### Wireless Temperature and Humidity Monitor

Connect a **DHT22** to the Pico W and publish temperature and humidity readings to a web interface or MQTT server.

### Wi-Fi Motion Sensor

A **PIR motion sensor** can be connected to the Pico W to detect movement and send an alert or trigger another device over Wi-Fi.

### Wireless OLED Dashboard

An OLED display can show sensor readings while the Pico W retrieves data from a local network or web service.

### Remote Control Projects

The Pico W can receive commands over Wi-Fi and use GPIO, PWM, or other interfaces to control LEDs, motors, relays, and other electronics.

## Raspberry Pi Pico W vs ESP32

The Raspberry Pi Pico W and ESP32 are both excellent wireless microcontroller platforms, but they have different strengths.

| Feature | Raspberry Pi Pico W | ESP32 |
|---|---|---|
| Microcontroller | RP2040 | ESP32 family |
| CPU | Dual-core Cortex-M0+ | Depends on ESP32 model |
| Wi-Fi | 2.4 GHz 802.11n | 2.4 GHz Wi-Fi |
| Bluetooth | 5.2 | Depends on model |
| GPIO | 26 | Depends on model |
| ADC | 3 × 12-bit | Depends on model |
| PIO | 8 state machines | No equivalent PIO architecture |
| Programming | MicroPython, C, C++ | Arduino, ESP-IDF, MicroPython, etc. |
| Best suited for | RP2040 ecosystem, embedded control, wireless projects | Broad wireless IoT and ESP32 ecosystem |

Choose the Pico W when you value the RP2040's flexible PIO architecture, simple development environment, and Raspberry Pi ecosystem. Choose an ESP32 when you specifically need features or peripherals offered by a particular ESP32 variant.

## Recommended Products

The Pico W becomes much more useful when paired with sensors, displays, and other modules.

- **DHT22 Temperature & Humidity Sensor** — useful for wireless environmental monitoring.
- **MPU6050** — adds accelerometer and gyroscope measurements to motion projects.
- **OLED Display** — useful for local status and sensor dashboards.
- **PIR Motion Sensor** — useful for wireless motion detection and automation projects.

## Raspberry Pi Pico W Programming

The Pico W can be programmed using **MicroPython**, **C**, or **C++**. For beginners, MicroPython provides a particularly accessible way to experiment with GPIO, sensors, displays, and Wi-Fi.

For more advanced applications, the Raspberry Pi Pico SDK provides C/C++ development tools and libraries.

## Raspberry Pi Pico W Resources

For official technical information, see the Raspberry Pi Pico documentation and the Raspberry Pi Pico W datasheet.

## Conclusion

The **Raspberry Pi Pico W** is one of the most useful boards in the Pico family for connected embedded projects. Its RP2040 microcontroller, 2 MB flash, 26 GPIO, flexible peripherals, 2.4 GHz Wi-Fi, and Bluetooth 5.2 provide a capable platform for IoT and wireless hardware projects.

For projects that need a small microcontroller with built-in wireless connectivity rather than a full Linux computer, the Pico W is an excellent option.

## Related Embedded Nerd Content

- [Raspberry Pi Projects](/categories/#raspberry-pi)
- [ESP32 Projects](/categories/#esp32)
- [Arduino Projects](/categories/#arduino)
- [MPU6050 Calibration Guide](/mpu6050-calibration/)
