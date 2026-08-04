---
layout: product

title: "SSD1306 OLED Display"

product_id: ssd1306-oled

manufacturer: Generic

image: /assets/images/products/ssd1306-oled.webp

header:
  teaser: /assets/images/products/ssd1306-oled.webp

og_image: /assets/images/products/ssd1306-oled.webp

excerpt: "0.96-inch SSD1306 OLED display module with I2C interface for Arduino, ESP32 and Raspberry Pi projects."

description: "Monochrome 128×64 OLED display based on the SSD1306 controller. Features low power consumption, excellent contrast and simple I2C communication."

categories:
  - Displays

tags:
  - OLED
  - SSD1306
  - I2C
  - Arduino
  - ESP32
  - Raspberry Pi

permalink: /products/ssd1306-oled/

specifications:

  - name: Controller
    value: SSD1306

  - name: Display Size
    value: 0.96 inch

  - name: Resolution
    value: 128 × 64 pixels

  - name: Display Type
    value: Monochrome OLED

  - name: Interface
    value: I2C

  - name: I2C Address
    value: 0x3C (default)

  - name: Operating Voltage
    value: 3.3V – 5V

  - name: Viewing Angle
    value: ">160°"

  - name: Active Color
    value: White (most common)

links:

  - title: Datasheet
    icon: fas fa-file-lines
    description: SSD1306 Controller Datasheet
    url: https://cdn-shop.adafruit.com/datasheets/SSD1306.pdf

  - title: Adafruit Library
    icon: fab fa-github
    description: Adafruit SSD1306 Arduino Library
    url: https://github.com/adafruit/Adafruit_SSD1306

  - title: GFX Library
    icon: fab fa-github
    description: Adafruit GFX Graphics Library
    url: https://github.com/adafruit/Adafruit-GFX-Library

related:

  - esp32-devkit
  - mpu6050 
  - solderless-breadboard
  - jumper-wires
---


## Overview

The **SSD1306 OLED Display** is one of the most popular display modules used in embedded electronics. Thanks to its excellent contrast, ultra-low power consumption and simple **I2C** interface, it has become the preferred choice for makers, students and professional developers alike.

Whether you're building an IoT device, weather station, robotics project or portable instrument, the SSD1306 pairs perfectly with development boards such as the **[ESP32 DevKit](/products/esp32-devkit/)**, Arduino and Raspberry Pi.

If you're getting started, follow our **[ESP32 OLED Tutorial – Wiring, Code & Display Guide](/ESP32-OLED-Tutorial-Wiring-Code-&-Display-Guide/)** to learn how to connect the display, install the required libraries and display your first graphics.

---

## Features

- 128 × 64 monochrome OLED display
- SSD1306 controller
- I2C communication interface
- Default I2C address **0x3C**
- Compatible with both 3.3V and 5V systems
- High contrast and excellent readability
- Wide viewing angle
- Very low power consumption
- Compact 0.96-inch module
- Extensive software support

---

## Why Choose the SSD1306?

Unlike traditional LCD displays, OLED technology does not require a backlight because each pixel generates its own light. This produces deep blacks, exceptional contrast and excellent visibility while consuming significantly less power.

The SSD1306 has become the industry-standard OLED display for embedded systems thanks to its reliability, affordable price and excellent compatibility with modern development boards. Whether you're displaying sensor readings, system status or custom graphics, it provides a simple yet powerful solution.

---

## I2C Communication

The SSD1306 communicates over the **I2C bus**, requiring only four connections:

- VCC
- GND
- SDA
- SCL

Most modules use the default I2C address **0x3C**, although some versions are configured as **0x3D**.

If your display isn't detected, our **[I2C Scanner Tutorial](/i2c-scanner-tutorial/)** shows you how to identify the correct device address and troubleshoot common communication problems.

---

## Applications

The SSD1306 OLED Display is widely used in embedded projects, including:

- IoT devices
- Weather stations
- Sensor dashboards
- Home automation
- [Robotics](/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-(KY-023)-with-Arduino-IDE/)
- Battery-powered electronics
- Portable instruments
- Data loggers
- Menu systems
- Debug displays

Its compact size and low power consumption make it an excellent companion for ESP32 and Arduino-based projects.

---

## Software Support

One of the SSD1306's biggest strengths is its excellent software ecosystem.

Popular libraries include:

- Adafruit SSD1306
- Adafruit GFX
- U8g2
- SSD1306Wire
- ESPHome Display Component

These libraries make it easy to display text, icons, graphics and animations with only a few lines of code.

---

## Compatibility

The SSD1306 OLED Display is compatible with many popular development platforms, including:

- Arduino Uno
- Arduino Nano
- **[ESP32 DevKit](/products/esp32-devkit/)**
- ESP8266
- Raspberry Pi
- STM32
- RP2040
- Teensy

Thanks to its standard I2C interface, integrating the display into new or existing projects is quick and straightforward.

---

## Project Ideas

The SSD1306 is suitable for countless embedded applications, such as:

- Smart clocks
- Battery monitors
- Wi-Fi status displays
- Environmental monitoring
- Sensor dashboards
- Portable measurement devices
- Home automation controllers

Looking for a practical project? Our **[ESP32 Snake Game with MPU6050 and OLED Display](/ESP32-Snake-Game-with-MPU6050-and-OLED-Display/)** demonstrates how to combine an SSD1306 display with the **[MPU6050](/mpu6050-arduino-guide/)** to create a fun motion-controlled game.

---

## Related Tutorials

To get the most from your SSD1306 OLED Display, we recommend these guides:

- **[ESP32 OLED Tutorial – Wiring, Code & Display Guide](/ESP32-OLED-Tutorial-Wiring-Code-&-Display-Guide/)**
- **[I2C Scanner Tutorial](/i2c-scanner-tutorial/)**
- **[MPU6050 Arduino Guide](/mpu6050-arduino-guide/)**
- **[ESP32 Snake Game with MPU6050 and OLED Display](/ESP32-Snake-Game-with-MPU6050-and-OLED-Display/)**

You can also explore our complete **[Products](/products/)** collection and discover more components in our **[Recommended Hardware](/recommended-hardware/)** guide.

---

## Final Thoughts

The SSD1306 OLED Display remains one of the best display modules available for embedded systems. Its combination of low power consumption, sharp image quality, affordable price and extensive software support makes it suitable for everything from beginner projects to advanced IoT applications.

Whether you're displaying sensor data, creating user interfaces or building your next ESP32 project, the SSD1306 is a reliable and versatile display that continues to be a favourite within the embedded development community.
