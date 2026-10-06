---
layout: product

title: "SG90 Micro Servo"

internal_links: true

product_id: sg90-micro-servo

category: Modules

manufacturer: TowerPro
image: "https://www.cytron.io/image/catalog/products/SG90/SG90_5.jpg"


excerpt: "Compact SG90 micro servo for Arduino, ESP32, robotics, pan-tilt mechanisms and beginner motion-control projects."

description: "The SG90 is a lightweight 9g micro servo with simple PWM control, making it a practical actuator for Arduino and ESP32 projects."

categories:
  - Motors
  - Robotics

tags:
  - SG90
  - Servo
  - Micro Servo
  - Arduino
  - ESP32
  - Robotics
  - PWM

permalink: /products/sg90-micro-servo/

specifications:
  - name: Type
    value: 9g Micro Servo
  - name: Control
    value: PWM
  - name: Operating Voltage
    value: 4.8V–6V
  - name: Typical Rotation
    value: Approximately 180°
  - name: Weight
    value: Approximately 9g
  - name: Application
    value: Robotics, pan-tilt, mechanisms and prototypes

related:
  - esp32-devkit
  - ky-023-joystick
  - ssd1306-oled

---

The **SG90 micro servo** is a compact and inexpensive actuator commonly used in Arduino and ESP32 projects. It is especially useful when an analog input such as the **[KY-023 joystick](/products/ky-023-analog-joystick/)** needs to control physical movement.

## Common Uses

- Joystick-controlled mechanisms
- Pan-tilt platforms
- Robot arms
- Camera positioning
- Small robotic projects
- Prototypes and educational projects

## Using the SG90 with an ESP32

The servo signal is controlled with PWM. The ESP32 generates the control signal while the servo should receive an appropriate external power supply when the application requires more current.

> **Important:** Do not assume the ESP32 3.3V rail can safely power a servo under load. For reliable projects, use a suitable 5V supply and connect the grounds together.

## Related Project

The SG90 is used in the [ESP32 Joystick Tutorial](/esp32-joystick-tutorial-read-an-analog-joystick-ky-023-with-arduino-ide/) to demonstrate proportional servo control.
