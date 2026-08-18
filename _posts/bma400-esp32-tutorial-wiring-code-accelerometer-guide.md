---
title: "BMA400 ESP32 Tutorial: Wiring, Arduino Code & Accelerometer Guide"

permalink: /bma400-esp32-tutorial-wiring-code-accelerometer-guide/

howto: true

layout: single

required_hardware:
  - id: esp32-devkit
    component: ESP32 Development Board

  - id: solderless-breadboard
    component: Solderless Breadboard

excerpt: "Learn how to connect a BMA400 accelerometer to an ESP32, install the Arduino library, read X/Y/Z acceleration data, and understand the sensor's I2C interface."

toc: true
toc_sticky: true
toc_label: "Contents"

categories:
  - ESP32
  - Sensors

tags:
  - BMA400
  - Accelerometer
  - ESP32
  - Arduino
  - I2C
  - Motion Sensor
  - Sensors

---

# BMA400 ESP32 Tutorial: Wiring, Arduino Code & Accelerometer Guide

The **BMA400** is a low-power 3-axis accelerometer from Bosch Sensortec that is particularly interesting for battery-powered ESP32 projects.

In this tutorial, you will learn how to connect a BMA400 breakout board to an ESP32, communicate with it over I2C, install the Arduino library, and read acceleration on the X, Y and Z axes.

We will build a simple example that prints the acceleration data to the Serial Monitor.

By the end of the tutorial, you will know:

- What the BMA400 accelerometer is
- How to connect a BMA400 to an ESP32
- Which I2C address the sensor uses
- Which Arduino library to install
- How to read X, Y and Z acceleration
- How to interpret the values in `g`
- How to change the acceleration range
- How to troubleshoot I2C communication problems
- When calibration may be useful
- Why the BMA400 is interesting for low-power applications

> **Note:** This tutorial uses a BMA400 breakout board rather than the bare BMA400 chip. The electrical characteristics of the breakout board can differ from the bare sensor, so always check the documentation for the specific module you are using.

---

## What Is the BMA400?

The BMA400 is a **3-axis digital accelerometer** developed by Bosch Sensortec.

It measures acceleration along three perpendicular axes:

- X
- Y
- Z

Unlike an IMU such as the MPU6050, the BMA400 is an accelerometer rather than a combined accelerometer and gyroscope.

The sensor supports selectable measurement ranges of:

| Range | Maximum measurable acceleration |
|---|---:|
| ±2 g | 2 g |
| ±4 g | 4 g |
| ±8 g | 8 g |
| ±16 g | 16 g |

The BMA400 provides 12-bit acceleration data and supports both I2C and SPI communication. Bosch also designed it specifically for very low-power applications, with features such as automatic wake-up, activity recognition, orientation detection, tap detection and step counting. :contentReference[oaicite:4]{index=4}

This makes the BMA400 especially useful for:

- Wearable electronics
- Battery-powered sensors
- Motion detection
- Portable devices
- IoT projects
- Activity monitoring
- Orientation detection
- Low-power ESP32 projects

---

## Why Use the BMA400 with an ESP32?

The ESP32 is already a popular choice for wireless embedded projects because it combines processing power, Wi-Fi and Bluetooth with a large Arduino ecosystem.

Adding the BMA400 gives the ESP32 access to motion data without requiring a large amount of power from the sensor.

This combination is useful when a project needs to detect:

- Movement
- Tilt
- Orientation changes
- Shaking
- Activity
- Steps
- Wake-up events

The BMA400 is particularly attractive when you only need acceleration.

If you also need rotational velocity from a gyroscope, an IMU such as the MPU6050 may be a better fit.

For a basic introduction to the MPU6050, see the [MPU6050 Arduino Guide](/mpu6050-arduino-guide/).

---

## BMA400 vs MPU6050

The BMA400 and MPU6050 are not direct replacements for each other.

| Feature | BMA400 | MPU6050 |
|---|---|---|
| Accelerometer | 3-axis | 3-axis |
| Gyroscope | No | 3-axis |
| Measurement type | Acceleration | Acceleration + rotation |
| I2C | Yes | Yes |
| SPI | Yes | No |
| Low-power focus | Excellent | Less focused |
| Best suited for | Motion and low-power sensing | Motion + orientation/rotation |

The main distinction is simple:

**Use the BMA400 when acceleration is enough. Use an MPU6050 when you also need a gyroscope.**

This is one reason the BMA400 can be a better choice for battery-powered motion-detection projects.

A more detailed comparison can be covered separately without making this tutorial unnecessarily complicated.

---

## Required Hardware

For this tutorial you need:

- ESP32 DevKit V1
- BMA400 breakout board
- Solderless breadboard
- Jumper wires
- USB cable

The BMA400 is available on several breakout boards. For example, SparkFun offers both standard and Micro BMA400 Qwiic boards. These boards operate the BMA400 at 3.3 V and expose the sensor through I2C. :contentReference[oaicite:5]{index=5}

When choosing a breakout board, look for:

- 3.3 V compatibility
- I2C support
- Clearly labelled SDA and SCL pins
- Accessible address configuration
- Pull-up resistors on the I2C lines
- Good documentation

The breakout board matters because the BMA400 chip itself and the surrounding breakout circuitry are not necessarily identical across manufacturers.

---

## BMA400 Pinout

A typical BMA400 breakout board exposes pins similar to these:

| BMA400 Module | Function |
|---|---|
| VCC / 3V3 | Power |
| GND | Ground |
| SDA | I2C data |
| SCL | I2C clock |
| INT1 | Interrupt 1 |
| INT2 | Interrupt 2 |

Some boards may expose additional pins such as CS or provide a different pin order.

Always check the labels on your particular breakout board before connecting it.

For this basic tutorial we only need:

- VCC
- GND
- SDA
- SCL

The interrupt pins will become useful in more advanced BMA400 projects.

---

## BMA400 I2C Address

The BMA400 supports two 7-bit I2C addresses.

| SDO configuration | I2C address |
|---|---|
| SDO low | `0x14` |
| SDO high | `0x15` |

The BMA400 datasheet defines the address using the SDO pin. The pin must have a defined logic level and should not be left floating. :contentReference[oaicite:6]{index=6}

Many breakout boards configure the sensor for `0x14` by default.

For example, the SparkFun BMA400 breakout uses `0x14` by default and allows the alternate `0x15` address to be selected through its address configuration. :contentReference[oaicite:7]{index=7}

This is important when troubleshooting an apparently invisible sensor.

If your BMA400 does not respond at `0x14`, check the breakout documentation and run an I2C scanner.

---

## Wiring the BMA400 to the ESP32

For a typical ESP32 DevKit V1, GPIO21 and GPIO22 are commonly used for I2C.

Connect the BMA400 as follows:

| BMA400 | ESP32 DevKit V1 |
|---|---|
| VCC / 3V3 | 3.3V |
| GND | GND |
| SDA | GPIO21 |
| SCL | GPIO22 |

### Wiring Diagram

The connection can be represented as:

```text
BMA400              ESP32 DevKit V1

VCC  ----------------  3.3V
GND  ----------------  GND
SDA  ----------------  GPIO21
SCL  ----------------  GPIO22
```

GPIO21 and GPIO22 are common I2C pins on ESP32 development boards, but the ESP32 Arduino core allows the I2C pins to be assigned explicitly.

Using:

```cpp
Wire.begin(21, 22);
```

makes the intended pins clear in the program.

### Important Voltage Note

The BMA400 chip operates from a low-voltage supply. Bosch specifies a sensor supply range of approximately 1.72 V to 3.6 V. :contentReference[oaicite:8]{index=8}

For an ESP32 project, **3.3 V is the appropriate logic level**.

Do not assume that every BMA400 breakout board can be connected directly to 5 V.

Some breakout boards include additional power circuitry, while others may expose the sensor supply directly.

Always check the documentation for your specific board.

---

## Installing the BMA400 Arduino Library

The easiest way to use the BMA400 with Arduino is the **SparkFun BMA400 Arduino Library**.

The library provides an Arduino-friendly interface based on Bosch's BMA400 API. It supports I2C and SPI and includes examples for basic readings, interrupts, filtering, FIFO, motion detection, orientation, tap detection, step counting and power management. :contentReference[oaicite:9]{index=9}

### Install the Library

Open the Arduino IDE.

Go to:

**Sketch → Include Library → Manage Libraries**

Search for:

**SparkFun BMA400**

Install:

**SparkFun BMA400 Arduino Library**

The library can also be obtained from its official GitHub repository. :contentReference[oaicite:10]{index=10}

---

## Basic BMA400 ESP32 Example

The following example initializes the BMA400 over I2C and continuously prints the acceleration measured on the three axes.

It uses the library's `beginI2C()` and `getSensorData()` functions and reads the converted acceleration values from `accelerometer.data.accelX`, `accelY` and `accelZ`. :contentReference[oaicite:11]{index=11}

```cpp
#include <Wire.h>
#include "SparkFun_BMA400_Arduino_Library.h"

// Create the BMA400 sensor object
BMA400 accelerometer;

void setup()
{
  Serial.begin(115200);

  // Start I2C on the ESP32
  Wire.begin(21, 22);

  // Initialize the BMA400
  while (accelerometer.beginI2C(BMA400_I2C_ADDRESS_DEFAULT) != BMA400_OK)
  {
    Serial.println("BMA400 not detected. Check wiring and I2C address.");
    delay(1000);
  }

  Serial.println("BMA400 connected successfully!");
}

void loop()
{
  // Update the sensor data
  accelerometer.getSensorData();

  Serial.print("X: ");
  Serial.print(accelerometer.data.accelX, 3);

  Serial.print(" g | Y: ");
  Serial.print(accelerometer.data.accelY, 3);

  Serial.print(" g | Z: ");
  Serial.print(accelerometer.data.accelZ, 3);

  Serial.println(" g");

  delay(100);
}
```

The official SparkFun example uses the same basic sequence: create a `BMA400` object, initialize I2C with `beginI2C()`, call `getSensorData()`, and then read the three acceleration values from the sensor data structure. :contentReference[oaicite:12]{index=12}

---

## How the Code Works

### Include the Libraries

```cpp
#include <Wire.h>
#include "SparkFun_BMA400_Arduino_Library.h"
```

`Wire.h` provides the Arduino I2C interface.

The SparkFun library provides the BMA400-specific functions.

---

### Create the Sensor Object

```cpp
BMA400 accelerometer;
```

This creates an instance of the BMA400 class.

The object is then used to initialize the sensor and retrieve measurements.

---

### Start I2C

```cpp
Wire.begin(21, 22);
```

On this ESP32 example:

- GPIO21 = SDA
- GPIO22 = SCL

Using the pins explicitly also makes the wiring and code easier to compare when troubleshooting.

---

### Initialize the BMA400

```cpp
accelerometer.beginI2C(BMA400_I2C_ADDRESS_DEFAULT);
```

The SparkFun library defines `BMA400_I2C_ADDRESS_DEFAULT` as the sensor's default address, `0x14`. The alternate address is `0x15`. :contentReference[oaicite:13]{index=13}

If the sensor cannot be initialized, the example waits and tries again.

This is useful during development because the Serial Monitor immediately tells you that the sensor has not been detected.

---

### Read the Sensor

```cpp
accelerometer.getSensorData();
```

This step is important.

The library documentation specifies that `getSensorData()` must be called before accessing the acceleration data. Otherwise the values will not be updated. :contentReference[oaicite:14]{index=14}

---

### Read X, Y and Z

The acceleration values are available through:

```cpp
accelerometer.data.accelX
accelerometer.data.accelY
accelerometer.data.accelZ
```

The SparkFun library converts the raw sensor data into acceleration values expressed in **g**. :contentReference[oaicite:15]{index=15}

---

## Understanding X, Y and Z

An accelerometer measures acceleration along three axes.

```text
                 Z
                 ↑
                 |
                 |
                 +--------→ X
                /
               /
              ↓
              Y
```

The exact physical orientation depends on how the breakout board is mounted.

The important point is that the three values represent acceleration along three perpendicular directions.

### What Happens When the Sensor Is Still?

Gravity is always acting on the sensor.

Therefore, when the BMA400 is sitting still, one axis will normally measure approximately **1 g** or **-1 g**, depending on the sensor's orientation.

For example, if the Z axis points upward, you may see something similar to:

```text
X ≈ 0 g
Y ≈ 0 g
Z ≈ +1 g
```

If the board is turned upside down, the sign of the corresponding axis can change.

The exact values will not necessarily be perfect.

Small offsets, noise, board orientation and mounting can all affect the measurement.

---

## Why Is Gravity Visible?

An accelerometer does not simply measure "movement".

It measures acceleration forces acting on the sensor, including the effect of gravity.

That is why an accelerometer can be used to estimate orientation when the sensor is stationary.

For example:

- Flat on a table → one axis is dominated by gravity
- Rotated 90° → another axis becomes dominated by gravity
- Moving → dynamic acceleration is added to the gravity component

This is one of the foundations of tilt and orientation detection.

---

## Testing the Accelerometer

After uploading the sketch:

1. Open the Arduino Serial Monitor.
2. Set the baud rate to **115200**.
3. Leave the sensor stationary.
4. Observe X, Y and Z.
5. Slowly rotate the breakout board.
6. Move the sensor in different directions.
7. Observe which axis changes.

You should see output similar to:

```text
X: 0.012 g | Y: -0.021 g | Z: 0.987 g
X: 0.018 g | Y: -0.014 g | Z: 1.004 g
X: 0.412 g | Y: 0.082 g | Z: 0.903 g
```

These values are examples of the format, not guaranteed measurements.

Your actual readings will depend on:

- Sensor orientation
- Breakout board
- Mechanical mounting
- Sensor range
- Noise
- Temperature
- Motion

Do not expect the sensor to produce exactly `0.000 g` and `1.000 g` in every situation.

---

## Accelerometer Range

The BMA400 supports four selectable acceleration ranges:

| Range | Use |
|---|---|
| ±2 g | Small movements and higher sensitivity |
| ±4 g | General-purpose motion |
| ±8 g | Larger acceleration |
| ±16 g | High-acceleration applications |

The smaller ranges provide greater sensitivity for a given acceleration, while larger ranges allow the sensor to measure stronger acceleration without saturating. Bosch specifies the four ranges as ±2, ±4, ±8 and ±16 g. :contentReference[oaicite:16]{index=16}

For a basic motion project, ±2 g is often a sensible starting point.

For applications involving impacts or fast movement, a larger range may be more appropriate.

The SparkFun library exposes range configuration through `setRange()`. :contentReference[oaicite:17]{index=17}

For example, range configuration can be added later when the application requires it rather than complicating the first sensor test.

---

## Output Data Rate

The BMA400 also provides configurable output data rates.

Bosch specifies normal-mode output data rates from **12.5 Hz to 800 Hz**. :contentReference[oaicite:18]{index=18}

The correct value depends on the application.

A lower data rate may be enough for:

- Orientation
- Slow movement
- Basic monitoring

A higher data rate can be useful for:

- Faster motion
- Vibration analysis
- More responsive motion detection

Higher sampling rates are not automatically better.

The appropriate configuration depends on what the project is actually trying to measure.

---

## BMA400 Low-Power Features

One of the main reasons to choose the BMA400 is its low-power architecture.

Bosch specifies very low current consumption depending on the operating configuration, together with an ultra-low-power auto-wake-up mode. :contentReference[oaicite:19]{index=19}

The sensor also includes hardware features such as:

- Auto wake-up
- Auto low-power operation
- Activity recognition
- Orientation detection
- Step counting
- Tap detection
- Double-tap detection
- Interrupts
- FIFO buffering

These functions allow the BMA400 to perform some motion-related tasks inside the sensor rather than forcing the ESP32 to continuously process every measurement. :contentReference[oaicite:20]{index=20}

This can be particularly valuable in battery-powered ESP32 projects.

---

## Motion Detection and Interrupts

The BMA400 includes programmable interrupt functionality.

Instead of continuously polling the sensor and asking whether something happened, the sensor can generate an interrupt when a configured condition occurs.

Possible applications include:

- Wake the ESP32 when movement is detected
- Detect orientation changes
- Detect taps
- Count steps
- Detect activity
- Trigger a low-power application

The SparkFun library exposes functions for configuring generic interrupts, orientation interrupts, tap detection, step counter interrupts, activity changes and wake-up interrupts. :contentReference[oaicite:21]{index=21}

These features are intentionally outside the main example in this tutorial.

The goal here is to first establish reliable communication and understand the acceleration data.

---

## Calibration: Does the BMA400 Need It?

A new accelerometer does not automatically require a complete calibration procedure before it can be used.

However, acceleration measurements can contain an offset.

For example, when the sensor is positioned so that an axis should theoretically measure close to zero acceleration, the actual reading may be slightly positive or negative.

This offset is commonly called **bias** or **offset error**.

Calibration can be used to estimate and compensate for these errors.

### When Is Calibration Useful?

Calibration becomes more important when you need:

- More accurate tilt measurements
- Better orientation calculations
- Consistent readings between sensors
- More precise motion analysis
- Reliable threshold-based detection

For a simple project that only needs to detect movement, a small offset may not matter.

For a measurement system, it can matter significantly.

A dedicated BMA400 calibration tutorial should cover this subject in much more detail rather than making the main ESP32 tutorial unnecessarily complex.

---

## BMA400 Practical Tips

### Keep the Sensor Still During Startup

When testing the sensor, place the breakout on a stable surface.

This makes it easier to understand the initial acceleration values.

### Check the Board Voltage

Do not assume every BMA400 module uses the same power circuitry.

The BMA400 itself is a low-voltage device, while breakout boards may add regulators or other circuitry.

### Check the I2C Address

If the sensor is not detected, verify whether the module is using:

```text
0x14
```

or:

```text
0x15
```

### Check SDA and SCL

Make sure:

- SDA is connected to SDA
- SCL is connected to SCL
- GND is shared
- The sensor is powered correctly

### Avoid Loose Breadboard Connections

Intermittent connections can look like software problems.

If the sensor repeatedly connects and disconnects, inspect the jumper wires and breadboard contacts.

---

## Troubleshooting

### BMA400 Not Detected

If the Serial Monitor repeatedly shows:

```text
BMA400 not detected. Check wiring and I2C address.
```

check the following:

- BMA400 power connection
- GND connection
- SDA connection
- SCL connection
- I2C address
- Breakout board configuration
- Jumper settings
- I2C pull-up configuration

The BMA400 requires a defined I2C address configuration, and the SDO pin determines whether the address is `0x14` or `0x15`. :contentReference[oaicite:22]{index=22}

---

### The Sensor Works but Values Do Not Change

Make sure that:

```cpp
accelerometer.getSensorData();
```

is called inside `loop()` before reading:

```cpp
accelerometer.data.accelX
accelerometer.data.accelY
accelerometer.data.accelZ
```

Without updating the sensor data, the values will not change. :contentReference[oaicite:23]{index=23}

---

### Values Look Strange

Check:

- Sensor orientation
- Selected acceleration range
- Wiring
- Power supply
- Mechanical mounting
- Sensor movement during testing

Remember that acceleration values include gravity.

A stationary sensor does not necessarily produce zeros on all three axes.

---

### I2C Address Is Different

If your breakout uses `0x15`, change the initialization:

```cpp
accelerometer.beginI2C(BMA400_I2C_ADDRESS_SECONDARY);
```

The SparkFun library defines the default and secondary addresses as `0x14` and `0x15`. :contentReference[oaicite:24]{index=24}

If you are unsure which address is active, an I2C scanner is a useful diagnostic tool.

---

## Choosing a BMA400 Module

The BMA400 is available on different breakout boards.

When choosing one for an ESP32 project, consider:

| Feature | Why It Matters |
|---|---|
| I2C support | Simplifies ESP32 connection |
| 3.3 V operation | Matches ESP32 logic |
| Pull-up resistors | Simplifies I2C wiring |
| Address selection | Useful when multiple I2C devices are used |
| Interrupt pins | Important for motion/wake-up projects |
| Header pins | Easier breadboard prototyping |
| Documentation | Makes troubleshooting easier |

A Qwiic-style board can be particularly convenient because the breakout already provides the necessary I2C connections and supporting circuitry.

The SparkFun BMA400 breakout also provides traditional through-hole connections for users who prefer jumper wires and breadboards. :contentReference[oaicite:25]{index=25}

For this tutorial, a well-documented 3.3 V BMA400 breakout with accessible SDA and SCL pins is the most practical choice.

---

## Recommended Hardware

For the basic ESP32 tutorial, the recommended setup is:

- ESP32 DevKit V1
- BMA400 breakout board
- Solderless breadboard
- Jumper wires
- USB cable

The BMA400 breakout is the component that still needs to be integrated into the Embedded Nerd hardware/product system before the article can have the same product experience as the existing MPU6050 content.

---

## GitHub Source Code

The complete example should be made available through the Embedded Nerd GitHub repository alongside the tutorial.

The project can later be expanded with:

- OLED display
- Motion detection
- Wake-up interrupts
- Orientation detection
- Step counting
- Data logging
- Bluetooth
- Wi-Fi
- Battery-powered operation

The first step, however, should remain simple: establish communication and verify that the three acceleration axes are working correctly.

---

## Related Tutorials

The BMA400 fits naturally into the Embedded Nerd sensor and ESP32 content cluster.

### MPU6050 Arduino Guide

If you are comparing accelerometer and IMU options, the [MPU6050 Arduino Guide](/mpu6050-arduino-guide/) covers the MPU6050's accelerometer and gyroscope and provides a useful alternative approach.

### MPU6050 Calibration Guide

The [MPU6050 Calibration Guide](/mpu6050-calibration-guide/) provides a useful introduction to sensor calibration concepts.

The calibration process for the BMA400 should be treated separately rather than copying the MPU6050 procedure directly.

### I2C Scanner

When an I2C sensor is not detected, an I2C scanner is one of the simplest ways to determine whether the ESP32 can see the device on the bus.

The Embedded Nerd I2C Scanner tutorial is therefore a useful companion when troubleshooting BMA400 communication.

---

## Frequently Asked Questions

### Can the BMA400 work with an ESP32?

Yes. The BMA400 supports I2C and SPI communication, and it can be connected to an ESP32 using the appropriate 3.3 V electrical interface. :contentReference[oaicite:26]{index=26}

For this tutorial, I2C is used because it requires only SDA and SCL in addition to power and ground.

---

### Is the BMA400 compatible with Arduino?

Yes.

The SparkFun BMA400 Arduino Library provides an Arduino-compatible interface for the sensor and is designed around Bosch's BMA400 API. It can be installed through the Arduino Library Manager. :contentReference[oaicite:27]{index=27}

---

### How do I connect the BMA400 to an ESP32?

For a typical ESP32 DevKit V1:

| BMA400 | ESP32 |
|---|---|
| VCC | 3.3V |
| GND | GND |
| SDA | GPIO21 |
| SCL | GPIO22 |

The exact connections can vary depending on the ESP32 board and BMA400 breakout being used.

---

### What is the BMA400 I2C address?

The BMA400 supports two 7-bit I2C addresses:

- `0x14`
- `0x15`

The address depends on the logic level applied to the SDO pin. :contentReference[oaicite:28]{index=28}

Many breakout boards use `0x14` as the default.

---

### What library should I use with the BMA400?

For Arduino-based projects, the SparkFun BMA400 Arduino Library is a practical choice.

It provides an Arduino-friendly interface based on Bosch's BMA400 API and includes examples for basic readings and advanced sensor features. :contentReference[oaicite:29]{index=29}

---

### Does the BMA400 need calibration?

Not necessarily for a basic motion-detection project.

However, calibration can be useful when you need more accurate acceleration, tilt or orientation measurements.

Offset errors can cause the measured acceleration to differ slightly from the ideal value.

---

### Is the BMA400 better than the MPU6050?

Neither sensor is universally better.

The BMA400 is a strong choice when you need a low-power 3-axis accelerometer.

The MPU6050 is more appropriate when you also need a 3-axis gyroscope.

The correct choice depends on the requirements of the project.

---

### Is the BMA400 good for low-power projects?

Yes.

Low-power operation is one of the main strengths of the BMA400. Bosch specifically designed it for applications such as wearables and smart-home devices where battery life is important. :contentReference[oaicite:30]{index=30}

Its embedded wake-up, activity, orientation and step-counting functions can also reduce the amount of continuous processing required from the host microcontroller. :contentReference[oaicite:31]{index=31}

---

### Can the BMA400 detect motion without the ESP32 constantly reading it?

Yes.

The BMA400 provides interrupt-based features including generic interrupts, wake-up, orientation change, tap detection, activity change and step counter functionality. :contentReference[oaicite:32]{index=32}

This makes it possible to design applications where the sensor detects an event and signals the ESP32 only when necessary.

---

### Can the BMA400 measure tilt?

Yes, indirectly.

A stationary accelerometer can use the gravity vector to estimate orientation relative to gravity.

However, accurate tilt calculations require consideration of sensor orientation, offsets and dynamic acceleration.

For a simple project, observing which axis is close to ±1 g can already provide a useful indication of orientation.

---

## Conclusion

The BMA400 is a particularly interesting accelerometer for ESP32 projects where low power, motion detection and compact sensor functionality are important.

In this tutorial, you learned how to:

- Connect a BMA400 to an ESP32
- Use I2C communication
- Identify the `0x14` and `0x15` I2C addresses
- Install the SparkFun BMA400 Arduino Library
- Initialize the sensor
- Read X, Y and Z acceleration
- Interpret acceleration in `g`
- Understand the selectable measurement ranges
- Troubleshoot common communication problems
- Understand why calibration can matter
- Explore the BMA400's low-power and interrupt capabilities

The basic example is deliberately simple.

Once the sensor is working reliably, the BMA400 becomes much more interesting when its built-in features are used for wake-up detection, orientation, motion detection, step counting and other low-power applications.

That makes it a strong sensor to build a dedicated BMA400 project series around, rather than treating it as just another I2C accelerometer.
