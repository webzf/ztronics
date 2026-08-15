---
title: "MPU6050 Calibration Guide: How to Calibrate Accelerometer & Gyroscope"

permalink: /mpu6050-calibration-guide/

howto: true

layout: single

required_hardware:
  - id: esp32-devkit
    component: ESP32 Development Board

  - id: mpu6050
    component: MPU6050 Accelerometer & Gyroscope

  - id: solderless-breadboard
    component: Solderless Breadboard

  - id: jumper-wires
    component: Jumper Wires
---

# MPU6050 Calibration Guide: How to Calibrate Accelerometer & Gyroscope

The MPU6050 is a popular motion sensor for Arduino and ESP32 projects, combining a 3-axis accelerometer and 3-axis gyroscope in a single device.

However, the sensor can report small offsets even when it is completely stationary. These offsets can affect motion detection, tilt measurements, orientation calculations, and other applications that depend on accurate sensor readings.

This MPU6050 calibration guide explains how to measure and compensate for these offsets using Arduino.

![MPU6050 calibration guide showing the sensor module](https://embeddednerd.com/assets/images/mpu6050-calibration-guide.webp)

This tutorial includes:

- MPU6050 calibration basics
- Accelerometer and gyroscope offsets
- How to prepare the sensor for calibration
- MPU6050 calibration code
- How to verify the calibration results
- Common calibration problems
- Practical calibration tips

> **Important:** The MPU6050 must remain completely still during calibration. Movement or vibration while collecting samples can produce incorrect calibration values.

If you are new to the MPU6050, start with our [MPU6050 Arduino Guide](/mpu6050-arduino-guide/) to learn how to connect the sensor, install the required library, and read its accelerometer and gyroscope values.

---

# What Is MPU6050 Calibration?

MPU6050 calibration is the process of measuring the sensor's offset and using that information to compensate for errors in its readings.

A stationary MPU6050 should produce approximately zero rotational velocity from the gyroscope. When the accelerometer is positioned level, it should also measure approximately zero acceleration on the X and Y axes while detecting Earth's gravity on the Z axis.

In practice, the raw readings can be slightly different.

For example, a stationary MPU6050 might produce values such as:

```text
Accel X: -120
Accel Y: 340
Accel Z: 16384

Gyro X: 12
Gyro Y: -8
Gyro Z: 3
```

The exact values depend on the individual sensor and its operating conditions.

Calibration allows us to measure these offsets and compensate for them before using the sensor data in an application.

## Accelerometer Offset

The MPU6050 accelerometer measures acceleration along three axes:

- X
- Y
- Z

When the sensor is stationary and approximately level, the expected readings are:

```text
X ≈ 0 g
Y ≈ 0 g
Z ≈ +1 g
```

The Z axis is different because the accelerometer detects Earth's gravity.

With the common ±2g accelerometer range, 1g corresponds to approximately 16384 raw counts.

Therefore, a reading such as:

```text
Accel X: 120
Accel Y: -80
Accel Z: 16420
```

can be normal for a stationary sensor, although the X and Y offsets can still be compensated.

The goal of calibration is not necessarily to make every accelerometer value exactly zero. Instead, the goal is to make the readings match the physical conditions of the sensor as closely as possible.

## Gyroscope Offset

The MPU6050 gyroscope measures rotational velocity around the X, Y, and Z axes.

When the sensor is completely stationary, the expected gyroscope readings are approximately:

```text
Gyro X ≈ 0
Gyro Y ≈ 0
Gyro Z ≈ 0
```

However, a stationary sensor may report small non-zero values because of its inherent bias.

For example:

```text
Gyro X: 15
Gyro Y: -9
Gyro Z: 6
```

These values indicate that the gyroscope has an offset.

Calibration measures this offset so it can be compensated for when processing the sensor data.

This is particularly important for applications that integrate gyroscope measurements over time, because even a small bias can cause the estimated orientation to gradually move away from the real orientation.

> **Note:** Calibration can reduce the initial gyroscope bias, but it does not completely eliminate long-term gyroscope drift. Temperature changes, sensor noise, and other factors can still affect the readings.

We will cover gyroscope drift separately in a future MPU6050 guide.

## Why Does the MPU6050 Need Calibration?

Different MPU6050 modules can have different sensor offsets, even when they use the same sensor chip.

Small measurement errors can affect applications such as:

- Motion detection
- Tilt measurement
- Gesture control
- Robotics
- Self-balancing systems
- Motion-controlled games
- Orientation tracking

Without calibration, a stationary gyroscope may appear to be rotating, while accelerometer offsets can affect calculations based on gravity and tilt.

Calibration provides a better starting point by reducing these measurable offsets.

---

# Required Hardware

| Component | Recommended Product | Buy |
|---|---|---|
| ESP32 Development Board | ESP32 DevKit V1 | 🛒 AliExpress |
| MPU6050 Accelerometer & Gyroscope | MPU6050 Accelerometer & Gyroscope | 🛒 AliExpress |
| Breadboard | Solderless Breadboard | — |
| Jumper Wires | Jumper Wires | — |

> **Transparency Notice**
>
> Some links on this page are affiliate links. If you purchase through them, Embedded Nerd may earn a small commission at no additional cost to you. This helps support the website and allows us to continue creating free tutorials and guides. Thank you for your support.

---

# Before You Calibrate

Before starting the calibration process, make sure the MPU6050 is connected correctly and can remain completely stationary.

Follow these steps:

1. Place the MPU6050 on a stable surface.
2. Keep the sensor in the same orientation during the entire calibration process.
3. Make sure the jumper wires are firmly connected.
4. Power the Arduino or ESP32 and allow the sensor a few seconds to settle.
5. Do not touch the sensor while calibration samples are being collected.
6. Avoid surfaces affected by vibration or movement.
7. Keep the sensor away from sources of mechanical vibration.

The calibration process relies on collecting multiple measurements while the sensor is stationary.

If the sensor moves during this process, the program may interpret that movement as part of the sensor's normal offset and calculate incorrect calibration values.

For the best results, place the MPU6050 on a solid, stable surface and avoid touching the breadboard or sensor until calibration is complete.

![MPU6050 calibration hardware setup](https://embeddednerd.com/assets/images/mpu6050-calibration-hardware.webp)
