---
layout: product

title: "SSD1306 OLED Display"

product_id: ssd1306-oled

manufacturer: Generic

image: /assets/images/products/ssd1306-oled.webp

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
---

## Overview

The **SSD1306 OLED Display** is one of the most popular display modules used in embedded electronics. Its crisp image quality, low power consumption and simple **I2C** interface make it an excellent choice for beginners and experienced developers alike.

Whether you're building an IoT device, weather station or robotics project, the SSD1306 integrates seamlessly with boards such as the **[ESP32 DevKit](/products/esp32-devkit/)**, Arduino and Raspberry Pi.

If you're looking for a complete wiring guide and working code examples, check out our **[ESP32 OLED Tutorial](/esp32-oled-tutorial/)**.

---

## Features

- 128 × 64 monochrome OLED display
- SSD1306 controller
- I2C communication interface
- Default I2C address **0x3C**
- Compatible with both 3.3V and 5V systems
- Excellent contrast ratio
- Very low power consumption
- Wide viewing angle
- Compact 0.96-inch module
- Large ecosystem of software libraries

---

## Why Use an OLED Display?

Unlike traditional LCD displays, OLED technology does not require a backlight. Each pixel emits its own light, producing true blacks, vibrant contrast and excellent readability even in low-light environments.

Because of these advantages, SSD1306 displays have become the preferred choice for embedded projects where power efficiency and readability are important.

---

## I2C Communication

The SSD1306 communicates over the **I2C bus**, requiring only two signal lines:

- SDA (Data)
- SCL (Clock)

This makes wiring simple while leaving more GPIO pins available for sensors and peripherals.

If your display isn't detected, our **[I2C Scanner Tutorial](/i2c-scanner-tutorial/)** shows how to find the correct device address and troubleshoot common connection issues.

---

## Applications

The SSD1306 is ideal for displaying:

- Sensor readings
- Temperature and humidity data
- System status
- Menus
- Battery information
- Debug messages
- Wi-Fi status
- Small animations
- Custom graphics

It is commonly found in:

- IoT devices
- Home automation
- Robotics
- Weather stations
- Portable instruments
- Data loggers
- DIY electronics projects

---

## Software Support

One of the reasons the SSD1306 remains so popular is its outstanding software support.

Popular libraries include:

- Adafruit SSD1306
- Adafruit GFX
- U8g2
- SSD1306Wire
- ESPHome Display Component

These libraries provide ready-to-use functions for displaying text, graphics, icons and animations with only a few lines of code.

---

## Compatibility

The SSD1306 works with virtually every popular development platform, including:

- Arduino Uno
- Arduino Nano
- **[ESP32 DevKit](/products/esp32-devkit/)**
- ESP8266
- Raspberry Pi
- STM32
- RP2040
- Teensy

Its wide compatibility makes it one of the easiest displays to integrate into new or existing embedded projects.

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
- Robotics
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
