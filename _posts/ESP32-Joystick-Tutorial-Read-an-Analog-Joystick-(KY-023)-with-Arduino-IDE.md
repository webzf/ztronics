---
title: "ESP32 Joystick Tutorial: Read an Analog Joystick (KY-023) with Arduino IDE"
howto: true
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

related: true
share: true
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

# Hardware Overview

Before connecting the joystick, it's worth taking a few minutes to understand how the hardware works. Knowing what each pin does and why specific GPIOs are chosen will help you avoid unstable readings, Wi-Fi conflicts, and damaged inputs.

In this section you'll learn:

- The joystick pinout
- The ESP32 ADC architecture
- Why ADC1 is preferred
- GPIOs to avoid
- Recommended wiring
- Power supply recommendations

---

## Hardware Required

| Component | Quantity | Notes | Amazon |
|-----------|---------:|-------|--------|
| ESP32 Development Board | 1 | ESP32-WROOM-32 or equivalent | Affiliate Link |
| KY-023 Analog Joystick Module | 1 | 5-pin module | Affiliate Link |
| Breadboard | 1 | Half or full size | Affiliate Link |
| Jumper Wires | 5 | Male-Male | Affiliate Link |
| USB Cable | 1 | Data cable | Affiliate Link |

---

## Joystick Module Pinout

The KY-023 joystick module exposes five pins.

| Pin | Function |
|------|----------|
| GND | Ground |
| +5V | Power Supply |
| VRx | Analog X-axis Output |
| VRy | Analog Y-axis Output |
| SW | Push Button Output |

![Joystick Pinout](images/esp32-joystick-pinout.webp)

Although many modules print **+5V**, the joystick works perfectly from **3.3V**.

Powering it from 3.3V is actually recommended because the ESP32 ADC inputs are **not 5V tolerant**.

> **Warning**
>
> Never connect analog outputs exceeding 3.3V directly to ESP32 GPIOs.

---

## Understanding Each Pin

### GND

Ground is the common voltage reference shared between the ESP32 and the joystick.

Without a common ground, the analog readings become unpredictable.

Always connect:

```
Joystick GND
      │
      ▼
ESP32 GND
```

---

### VCC

This powers both potentiometers.

Recommended:

```
ESP32 3V3
      │
      ▼
Joystick VCC
```

Although the board usually says **+5V**, the internal potentiometers operate perfectly at 3.3V.

---

### VRx

Outputs an analog voltage representing horizontal movement.

Typical values:

| Position | Voltage | ADC Reading |
|-----------|---------|------------:|
| Left | 0V | ~0 |
| Center | 1.65V | ~2048 |
| Right | 3.3V | ~4095 |

---

### VRy

Exactly the same concept applies to the vertical axis.

| Position | Voltage | ADC Reading |
|-----------|---------|------------:|
| Down | 0V | ~0 |
| Center | 1.65V | ~2048 |
| Up | 3.3V | ~4095 |

---

### SW

The push button is completely independent.

It behaves like a normal switch.

When pressed:

```
SW
 │
 ▼
GND
```

Using INPUT_PULLUP:

| Button | Reading |
|---------|---------|
| Released | HIGH |
| Pressed | LOW |

No external resistor is required.

---

# Understanding the ESP32 ADC

This is one of the biggest differences between an ESP32 and a traditional Arduino.

The ESP32 contains two independent Analog-to-Digital Converters:

- ADC1
- ADC2

Although both can read analog voltages, they behave differently.

---

## ADC Resolution

The ADC converts an analog voltage into a digital number.

For the default 12-bit resolution:

| Voltage | Digital Reading |
|----------|----------------:|
| 0V | 0 |
| 0.825V | ~1024 |
| 1.65V | ~2048 |
| 2.475V | ~3072 |
| 3.3V | 4095 |

This gives the ESP32 four times the precision of an Arduino UNO.

| Board | ADC Bits | Values |
|--------|---------:|-------:|
| Arduino UNO | 10 | 1024 |
| ESP32 | 12 | 4096 |

The higher resolution allows much smoother joystick movement.

---

# ADC1 vs ADC2

This topic confuses many beginners.

The ESP32 contains two ADC peripherals.

## ADC1

GPIO32

GPIO33

GPIO34

GPIO35

GPIO36

GPIO39

✅ Safe to use with Wi-Fi

---

## ADC2

GPIO0

GPIO2

GPIO4

GPIO12

GPIO13

GPIO14

GPIO15

GPIO25

GPIO26

GPIO27

⚠ These pins stop providing reliable analog readings whenever Wi-Fi is active.

Since most ESP32 projects eventually use Wi-Fi or Bluetooth, it is good practice to always use ADC1 whenever possible.

That is why this tutorial uses:

- GPIO34
- GPIO35

---

> **Tip**
>
> Even if your current project doesn't use Wi-Fi, choosing ADC1 makes your code future-proof.

---

# Choosing the GPIOs

Our wiring will be:

| Joystick | ESP32 |
|-----------|--------|
| GND | GND |
| VCC | 3V3 |
| VRx | GPIO34 |
| VRy | GPIO35 |
| SW | GPIO32 |

These pins provide:

✔ Stable ADC readings

✔ No Wi-Fi conflicts

✔ Clean layout

✔ Easy expansion

---

# Wiring Diagram

![ESP32 Wiring](images/esp32-joystick-wiring.webp)

Follow the connections exactly as shown.

Double-check every wire before powering the ESP32.

Most joystick problems are simply caused by swapped VCC and GND connections.

---

# Power Supply Considerations

The joystick itself consumes very little current.

Typical current consumption:

| Device | Current |
|----------|---------:|
| KY-023 | <5 mA |

This makes it perfectly safe to power directly from the ESP32's 3.3V regulator.

No external power supply is required.

---

# Analog Noise

One thing beginners often notice is that the joystick values are never perfectly stable.

Instead of reading:

```
2048
2048
2048
2048
```

you may observe:

```
2043
2049
2052
2046
2048
```

This is completely normal.

Small variations are caused by:

- ADC quantization
- Electrical noise
- Potentiometer tolerances
- Breadboard contact resistance

Later in this tutorial we'll eliminate most of this noise using software filtering and a dead zone.

---

> **Note**
>
> Small variations of ±10 to ±30 ADC counts are completely normal and do not indicate a faulty joystick.

---

# Before Continuing

At this point you should have:

✅ ESP32 connected

✅ Joystick wired

✅ Correct GPIOs selected

✅ Powered from 3.3V

✅ Common ground connected

In the next section we'll configure the Arduino IDE, upload the first sketch, and verify that the joystick is working correctly before building more advanced projects.

---

In the next section we'll examine every pin of the joystick module, understand what each one does, and see why choosing the correct ESP32 GPIOs is important for reliable analog readings.
