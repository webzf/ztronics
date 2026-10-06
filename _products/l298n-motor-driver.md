---
layout: product

title: "L298N Motor Driver Module"

internal_links: true

product_id: l298n-motor-driver

category: Modules

manufacturer: Generic
image: "https://www.ic-components.com/upfile/images/21/20240724142422966.png"


excerpt: "L298N dual H-bridge motor driver module for controlling DC motors with Arduino, ESP32 and other microcontrollers."

description: "The L298N is a widely used dual H-bridge module for basic DC motor control, suitable for robotics, experiments and educational ESP32 projects."

categories:
  - Motor Drivers
  - Robotics

tags:
  - L298N
  - Motor Driver
  - H-Bridge
  - DC Motor
  - Arduino
  - ESP32
  - Robotics

permalink: /products/l298n-motor-driver/

specifications:
  - name: Driver Type
    value: Dual H-Bridge
  - name: Motor Channels
    value: 2
  - name: Motor Type
    value: Brushed DC Motors
  - name: Control
    value: Digital direction + PWM speed control
  - name: Logic Supply
    value: 5V typical
  - name: Application
    value: Basic robotics and DC motor projects

related:
  - esp32-devkit
  - ky-023-joystick
  - tb6612fng-motor-driver

---

The **L298N motor driver module** is a popular dual H-bridge board for controlling small brushed DC motors. It provides direction control and PWM speed control from a microcontroller such as the ESP32.

## Why Use a Motor Driver?

An ESP32 GPIO cannot directly drive a typical DC motor. A motor driver provides the required current switching and protects the microcontroller from motor-related electrical effects.

## Common Uses

- Two-wheel robots
- Joystick-controlled vehicles
- DC motor experiments
- Educational robotics
- Simple automation projects

The L298N is easy to understand and widely documented, although it is less efficient than newer MOSFET-based motor drivers.

## Related Project

The L298N can be used with the [ESP32 Joystick Tutorial](/esp32-joystick-tutorial-read-an-analog-joystick-ky-023-with-arduino-ide/) for proportional DC motor control.
