---
layout: product

title: "TCA9548A I2C Multiplexer"
product_verdict: "Use the TCA9548A when multiple I²C devices share the same fixed address; if each device can use a different address, a multiplexer may not be necessary."

internal_links: true
seo_title: "TCA9548A I2C Multiplexer: Specs & Buying Guide"
seo_description: "Connect up to 8 I2C bus channels and isolate address conflicts with the TCA9548A. Compare alternatives, key specs, wiring guide and where to buy."
product_id: tca9548a-i2c-multiplexer

category: Modules

manufacturer: HiLetgo

image: https://ae04.alicdn.com/kf/HTB16_j8biDxK1RjSsphq6zHrpXat.jpg

alt: "TCA9548A 8-channel I2C multiplexer breakout board"

last_modified_at: 2026-10-09

og_image: https://ae04.alicdn.com/kf/HTB16_j8biDxK1RjSsphq6zHrpXat.jpg

header:
  teaser: https://ae04.alicdn.com/kf/HTB16_j8biDxK1RjSsphq6zHrpXat.jpg

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

specifications:
  - name: Multiplexer IC
    value: "Texas Instruments TCA9548A"

  - name: Interface
    value: "I2C / IIC"

  - name: Number of Channels
    value: "8 Bidirectional Channels"

  - name: IC Supply Voltage
    value: "1.65V to 5.5V"

  - name: Maximum I2C Clock
    value: "400 kHz"

  - name: I2C Address Range
    value: "0x70 to 0x77 (7-bit)"

  - name: Address Selection
    value: "A0, A1 and A2"

  - name: Channel Selection
    value: "Control Register; Multiple Channels Can Be Enabled"

  - name: Reset
    value: "Active-Low RESET Input"

links:

  - title: Texas Instruments TCA9548A
    icon: fas fa-file-lines
    description: Official TCA9548A datasheet and product information
    url: https://www.ti.com/product/TCA9548A

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

## Is a TCA9548A Multiplexer Necessary?

Use a TCA9548A when two or more I²C devices need the same address and cannot be reconfigured to different addresses. If the devices already have unique addresses, they can normally share one bus and you may not need a multiplexer.

The chip provides eight selectable downstream channels and supports up to 400 kHz I²C clocking. Check the breakout board's voltage and pull-up arrangement: the IC supports 1.65–5.5 V, but a module's wiring and pull-up resistors affect how it should be connected to a 3.3 V or 5 V host.

| Situation | Recommended approach |
|---|---|
| Devices have unique I²C addresses | Share one bus, subject to bus loading and wiring limits |
| Same-address devices with configurable addresses | Change an address if practical |
| Same-address devices with fixed addresses | Use separate TCA9548A channels |

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

The TCA9548A provides eight downstream I2C channels. The microcontroller selects which channel is active through the multiplexer control interface. Multiple channels can also be enabled at once when required, provided the connected devices and bus design allow it.

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

The Amazon and AliExpress buttons above are affiliate links. Embedded Nerd may earn a commission from qualifying purchases at no additional cost to you.

---

## Related Guides

- **[I2C Scanner Tutorial](/i2c-scanner-tutorial/)**
- **[ESP32 DevKit V1](/products/esp32-devkit/)**
- **[SSD1306 OLED Display](/products/ssd1306-oled/)**
- **[MPU6050](/products/mpu6050/)**

