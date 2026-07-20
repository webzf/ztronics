---
title: "ESP32 Joystick Tutorial: Read an Analog Joystick (KY-023) with Arduino IDE"
layout: single

sidebar:
  nav: "embedded"

excerpt: "Learn how to wire and program an analog joystick module (KY-023) with the ESP32. Includes wiring diagrams, pinout, complete Arduino code, calibration, dead zone, servo projects, OLED navigation, troubleshooting, and FAQs."

description: "Complete ESP32 joystick tutorial for beginners and makers. Learn how to connect the KY-023 analog joystick to an ESP32, read the X and Y axes, use the built-in push button, calibrate the joystick, eliminate noise, create a dead zone, and build real projects."

categories:
  - ESP32

tags:
  - ESP32
  - KY-023
  - Analog Joystick
  - Arduino IDE
  - ADC
  - Servo
  - OLED
  - Robotics

toc: true
toc_sticky: true
toc_label: "Table of Contents"

show_date: false
read_time: false
last_modified_at: false

header:
  image: images/esp32-joystick-hero.webp
  teaser: images/esp32-joystick-hero.webp
  overlay_image: images/header.webp
  overlay_filter: 0.35
---

# ESP32 Joystick Tutorial

![ESP32 Analog Joystick connected to an ESP32](images/esp32-joystick-hero.webp)

*Learn how to connect, calibrate, and program an analog joystick module with the ESP32 using the Arduino IDE.*

---

## What You'll Learn

By the end of this tutorial you will be able to:

✔ Understand how an analog joystick works

✔ Connect a KY-023 joystick to any ESP32 board

✔ Read the X and Y analog axes

✔ Detect the built-in push button

✔ Understand how the ESP32 ADC works

✔ Improve accuracy using calibration

✔ Remove unwanted joystick jitter

✔ Create a dead zone

✔ Convert joystick movement into percentages

✔ Control an SG90 servo

✔ Navigate OLED menus

✔ Control robot movement

✔ Build your own joystick-based projects

---

> **Skill Level**
>
> Beginner → Intermediate

> **Estimated Reading Time**
>
> 20–30 minutes

> **Project Time**
>
> Less than one hour

---

## Why Read This Guide?

The analog joystick is one of the most useful input devices available for embedded systems. Although it looks simple, it can be used in hundreds of projects ranging from small menu navigation systems to autonomous robots.

Unlike digital push buttons, which only detect ON and OFF states, an analog joystick provides proportional movement. This means your ESP32 can determine not only the direction of movement but also **how far** the joystick has been moved.

That capability opens the door to projects such as:

- Robot control
- Camera pan and tilt systems
- CNC controllers
- RC vehicles
- Drone transmitters
- OLED menu navigation
- Game controllers
- Robotic arms
- Industrial HMIs
- Home automation interfaces

Many beginners simply connect the joystick and call `analogRead()`. While that works, it rarely produces professional results because analog signals are affected by electrical noise, manufacturing tolerances, and ADC characteristics.

This guide goes much further.

Instead of only showing how to read the joystick, you'll learn how to build robust applications by calibrating the joystick, filtering noisy readings, implementing a dead zone, and converting analog values into useful engineering units.

---

## Why Use the ESP32?

The ESP32 is one of the most powerful microcontrollers available for hobbyists and professionals.

Compared with traditional Arduino boards, it offers:

| Feature | ESP32 | Arduino UNO |
|----------|---------|-------------|
| CPU | Dual-Core 240 MHz | 16 MHz |
| ADC Resolution | 12-bit | 10-bit |
| ADC Values | 0–4095 | 0–1023 |
| Wi-Fi | ✔ | ✘ |
| Bluetooth | ✔ | ✘ |
| RAM | 520 KB | 2 KB |
| PWM Channels | 16 | 6 |
| Price | Low | Low |

For joystick-based projects, the higher ADC resolution makes a significant difference because movements become smoother and more precise.

---

## What Is an Analog Joystick?

An analog joystick is essentially two potentiometers mounted at 90 degrees from each other.

One potentiometer measures horizontal movement (X-axis).

The second measures vertical movement (Y-axis).

A small mechanical switch located underneath the stick detects when the joystick is pressed downward.

Internally, each potentiometer behaves like a voltage divider.

When the joystick moves, the output voltage changes continuously between ground and the supply voltage.

The ESP32 converts that voltage into a digital value using its built-in Analog-to-Digital Converter (ADC).

For a 12-bit ADC, that value ranges from:

| Voltage | ADC Reading |
|----------|------------:|
| 0 V | 0 |
| 1.65 V | ≈2048 |
| 3.3 V | 4095 |

Because the joystick produces continuous values instead of simple HIGH or LOW signals, it allows smooth proportional control.

For example:

- Push slightly forward → Robot moves slowly
- Push fully forward → Robot moves at maximum speed
- Move halfway left → Servo rotates halfway
- Return to center → Robot stops

This proportional control is what makes analog joysticks far more versatile than directional buttons.

---

## Typical Applications

The KY-023 joystick module is commonly found in projects such as:

- Mobile robots
- Robot arms
- RC vehicles
- Drone controllers
- Camera stabilizers
- CNC machine controllers
- OLED menu navigation
- Smart home interfaces
- Electronic games
- Industrial operator panels
- Educational robotics
- DIY game consoles

If you have ever used a PlayStation, Xbox, or Nintendo controller, you have already used the same basic principle explained in this tutorial.

---

## How Does the KY-023 Work?

The KY-023 module combines three independent devices on a single board:

1. X-axis potentiometer
2. Y-axis potentiometer
3. Push button

Each potentiometer has approximately 10 kΩ of resistance.

When the joystick moves, the resistance changes, creating a different output voltage that the ESP32 measures using its ADC.

The push button is completely independent of the analog outputs.

It simply connects the SW pin to GND whenever the joystick is pressed downward.

Using the ESP32's internal pull-up resistor, reading the button becomes extremely simple:

- HIGH → Not pressed
- LOW → Pressed

No external resistor is required.

---

> **Tip**
>
> Although the module is often labeled **+5V**, it is strongly recommended to power it from **3.3V** when using an ESP32. This ensures the analog outputs never exceed the ESP32's maximum input voltage.

---

In the next section we'll examine every pin of the joystick module, understand what each one does, and see why choosing the correct ESP32 GPIOs is important for reliable analog readings.
