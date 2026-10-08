---
layout: product

title: "TCA9548A I2C Multiplexer"

internal_links: true
product_id: tca9548a-i2c-multiplexer

category: Modules

manufacturer: HiLetgo

image: /assets/images/products/tca9548a-i2c-multiplexer.webp

og_image: /assets/images/products/tca9548a-i2c-multiplexer.webp

header:
  teaser: /assets/images/products/tca9548a-i2c-multiplexer.webp

excerpt: "8-channel TCA9548A I2C multiplexer for connecting I2C devices with conflicting addresses to Arduino and ESP32 projects."

description: "TCA9548A 8-channel I2C multiplexer breakout board for separating I2C devices into independent channels when address conflicts prevent them from sharing the same bus."

categories:
  - I2C

tags:
  - TCA9548A
  - I2C
  - I2C Multiplexer
  - IIC
  - Arduino
  - ESP32
  - ESP8266

permalink: /products/tca9548a-i2c-multiplexer/

links:

  - title: Texas Instruments TCA9548A
    icon: fas fa-file-lines
    description: Official TCA9548A datasheet and product information
    url: https://www.ti.com/product/TCA9548A

  - title: Amazon
    icon: fab fa-amazon
    description: HiLetgo TCA9548A I2C IIC Multiplexer, 8 Channel
    url: https://amzn.to/4dVc55m

  - title: AliExpress
    icon: fas fa-cart-shopping
    description: TCA9548A I2C IIC 8-channel multiplexer module
    url: https://s.click.aliexpress.com/e/_c2RIcacD

related:

  - esp32-devkit
  - ssd1306-oled
  - mpu6050
---

The **TCA9548A I2C Multiplexer** is an 8-channel switch that allows multiple I2C devices to be separated into independent bus channels. It is particularly useful when two or more devices use the same I2C address and cannot be distinguished on a single bus.

For example, if two identical OLED displays both respond at the same I2C address, a TCA9548A can place them on separate channels so the microcontroller can communicate with each one independently.

---

## When to Use a TCA9548A

A TCA9548A multiplexer is useful when:

- Two I2C devices have the same address.
- A device has a fixed I2C address that cannot be changed.
- You need to connect multiple identical I2C modules.
- You want to isolate groups of devices on separate I2C channels.

Before adding a multiplexer, check whether the device provides an address-select pin or jumper. Changing the address may be simpler when that option is available.

---

## TCA9548A and I2C Address Conflicts

I2C devices share the SDA and SCL bus, but each responding device normally needs a unique address on that bus.

For example:

| Device | Address |
|---|---|
| SSD1306 OLED | 0x3C |
| MPU6050 | 0x68 |
| BME280 | 0x76 |

These devices can normally share one bus because their addresses are different.

A conflict occurs when two devices respond to the same address. A TCA9548A solves this by placing the devices on different downstream channels.

---

## 8-Channel I2C Multiplexer

The TCA9548A provides eight downstream I2C channels. The microcontroller selects which channel is active through the multiplexer control interface.

The exact breakout-board implementation, connector layout and supply arrangement can vary by manufacturer, so check the specific board documentation before wiring it into a project.

---

## Compatible Platforms

The TCA9548A can be used with microcontrollers and development boards that provide an I2C interface, including:

- Arduino
- ESP32
- ESP8266
- Raspberry Pi
- Other I2C-compatible microcontrollers

Software support depends on the platform and library being used.

---

## Troubleshooting I2C Conflicts

Start with an **[I2C Scanner](/i2c-scanner-tutorial/)** to see which addresses respond on the physical bus.

If two devices use the same address, first check whether one device can be moved to another address. When that is not possible, an I2C multiplexer such as the TCA9548A can separate the devices into independent channels.

---

## Buy the TCA9548A I2C Multiplexer

The product links above are affiliate links. Embedded Nerd may earn a commission from qualifying purchases at no additional cost to you.

---

## Related Guides

- **[I2C Scanner Tutorial](/i2c-scanner-tutorial/)**
- **[ESP32 DevKit V1](/products/esp32-devkit/)**
- **[SSD1306 OLED Display](/products/ssd1306-oled/)**
- **[MPU6050](/products/mpu6050/)**

