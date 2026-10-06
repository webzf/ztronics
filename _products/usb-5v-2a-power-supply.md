---
layout: product

title: "USB 5V 2A Power Supply"

internal_links: true

product_id: usb-5v-2a-power-supply

category: Accessories

manufacturer: Generic

excerpt: "5V 2A USB power supply for ESP32 projects, servos, displays and other embedded electronics."

description: "A regulated 5V USB power supply suitable for powering small embedded projects and peripherals such as micro servos and motor-control circuits when a separate supply is required."

categories:
  - Power
  - Accessories

tags:
  - 5V
  - USB Power Supply
  - Power Supply
  - ESP32
  - Servo
  - Robotics
  - Electronics

permalink: /products/usb-5v-2a-power-supply/

specifications:
  - name: Output Voltage
    value: 5V DC
  - name: Maximum Current
    value: 2A
  - name: Connector
    value: USB
  - name: Application
    value: Embedded projects and peripheral power

related:
  - esp32-devkit
  - sg90-micro-servo
  - l298n-motor-driver
  - tb6612fng-motor-driver

---

A **5V 2A USB power supply** is useful when peripherals such as servos or motor drivers require more current than the ESP32 development board should provide directly.

## Typical Uses

- SG90 servo projects
- Small robotics projects
- External peripheral power
- Embedded prototypes

> **Important:** Always verify the voltage and current requirements of the connected hardware before powering it. When using an external supply with an ESP32-controlled circuit, connect the grounds together where required.

## Related Project

A separate 5V supply is recommended for the servo and motor examples in the [ESP32 Joystick Tutorial](/esp32-joystick-tutorial-read-an-analog-joystick-ky-023-with-arduino-ide/).
