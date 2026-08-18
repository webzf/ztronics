---

title: "BMA400 ESP32 Tutorial: Wiring, Arduino Code & Accelerometer Guide"

permalink: /bma400-esp32-tutorial-wiring-code-accelerometer-guide/

howto: true

layout: single

required_hardware:

- id: esp32-devkit
  component: ESP32 Development Board

- id: bma400
  component: BMA400 Accelerometer

- id: solderless-breadboard
  component: Breadboard

- id: jumper-wires
  component: Male-to-Female Jumper Wires

sidebar:
nav: "embedded"

excerpt: "Learn how to connect a BMA400 accelerometer to an ESP32, install the Arduino library, read X/Y/Z acceleration data, and configure the sensor over I2C."

show_date: false
read_time: false
last_modified_at: false

toc: true
toc_sticky: true
toc_label: "Contents"

header:
teaser: /assets/images/bma400-esp32-tutorial.webp
image: /assets/images/bma400-esp32-tutorial.webp
og_image: /assets/images/bma400-esp32-tutorial.webp
overlay_image: /assets/images/header3.webp
overlay_filter: 0.25

categories:

* Sensors
* BMA400
* Arduino

tags:

* BMA400
* Accelerometer
* Arduino
* ESP32
* I2C
* Motion Sensor
* Sensors
* Electronics

related: true
share: true

---


# BMA400 ESP32 Tutorial: Wiring, Arduino Code & Accelerometer Guide

The **BMA400** is a low-power 3-axis accelerometer from Bosch Sensortec that is well suited to motion-sensing and battery-powered embedded projects.

In this tutorial, you will learn how to connect a BMA400 accelerometer to an ESP32, communicate with it over I2C, install an Arduino library, and read acceleration data from the X, Y and Z axes.

We will start with a simple working example and then look at the sensor's measurement range, I2C address, acceleration data, troubleshooting and some of the BMA400's more advanced features.

![BMA400 accelerometer connected to an ESP32 development board](/assets/images/bma400-esp32-hardware.webp)

By the end of this tutorial, you will know how to:

* Connect a BMA400 to an ESP32
* Wire the sensor using I2C
* Install the BMA400 Arduino library
* Read X, Y and Z acceleration
* Understand acceleration values expressed in `g`
* Check the BMA400 I2C address
* Change the accelerometer measurement range
* Troubleshoot common connection problems
* Understand when calibration may be useful
* Use the BMA400 as a foundation for low-power motion projects

---

# What Is the BMA400?

The BMA400 is a **3-axis digital accelerometer** developed by Bosch Sensortec.

It measures acceleration along three independent axes:

* X
* Y
* Z

The sensor supports four selectable measurement ranges:

| Range | Maximum acceleration |
| ----- | -------------------: |
| ±2 g  |                  2 g |
| ±4 g  |                  4 g |
| ±8 g  |                  8 g |
| ±16 g |                 16 g |

The BMA400 provides 12-bit digital resolution and supports I2C and SPI communication. Bosch also designed the sensor for low-power applications, with features such as auto wake-up, activity recognition, orientation detection, tap detection and step counting.

The BMA400 is therefore useful for projects involving:

* Motion detection
* Tilt detection
* Orientation
* Wearables
* Portable electronics
* Battery-powered sensors
* IoT devices
* Activity monitoring
* Low-power ESP32 applications

---

# Why Use the BMA400 with an ESP32?

The ESP32 is a popular microcontroller for embedded projects because it combines processing power with Wi-Fi, Bluetooth and a large Arduino ecosystem.

The BMA400 adds three-axis acceleration sensing while keeping power consumption low.

This combination is particularly useful when a project needs to detect:

* Movement
* Shaking
* Tilt
* Orientation changes
* Activity
* Wake-up events
* Steps

One of the biggest advantages of the BMA400 is that many motion-related functions can be handled by the sensor itself.

Instead of continuously waking the ESP32 and processing every measurement, the BMA400 can be configured to generate interrupts when specific conditions occur.

This makes it especially interesting for battery-powered applications.

---

# BMA400 vs MPU6050

The BMA400 and MPU6050 have different strengths.

The **BMA400 is a 3-axis accelerometer**, while the **MPU6050 combines a 3-axis accelerometer with a 3-axis gyroscope**.

| Feature         | BMA400                  | MPU6050                 |
| --------------- | ----------------------- | ----------------------- |
| Accelerometer   | 3-axis                  | 3-axis                  |
| Gyroscope       | No                      | Yes                     |
| I2C             | Yes                     | Yes                     |
| SPI             | Yes                     | No                      |
| Low-power focus | Excellent               | More limited            |
| Best for        | Acceleration and motion | Acceleration + rotation |

If your project only needs acceleration, the BMA400 can be a very good choice.

If you need both acceleration and rotational velocity, an IMU such as the MPU6050 is more appropriate.

The [MPU6050 Arduino Guide](/mpu6050-arduino-guide/) covers the MPU6050 in more detail.

---

# Required Hardware

For this project you need:

* ESP32 Development Board
* BMA400 Accelerometer breakout board
* Breadboard
* Male-to-Female Jumper Wires
* USB cable

The exact breakout board matters.

The BMA400 chip itself is a low-voltage device, while breakout boards may include additional circuitry such as voltage regulation, pull-up resistors and address configuration.

Always check the documentation for the particular BMA400 module you are using.

---

# BMA400 Pinout

A typical BMA400 breakout exposes the following connections:

| Pin       | Function    |
| --------- | ----------- |
| VCC / 3V3 | Power       |
| GND       | Ground      |
| SDA       | I2C data    |
| SCL       | I2C clock   |
| INT1      | Interrupt 1 |
| INT2      | Interrupt 2 |

Some breakout boards may expose additional pins or use a different pin layout.

For this basic ESP32 example, only four connections are required:

* VCC
* GND
* SDA
* SCL

The interrupt pins will become useful for more advanced motion-detection projects.

![BMA400 breakout board pinout](/assets/images/bma400-esp32-pinout.webp)

---

# BMA400 I2C Address

The BMA400 supports two 7-bit I2C addresses:

| SDO level | I2C address |
| --------- | ----------- |
| Low       | `0x14`      |
| High      | `0x15`      |

The SDO pin determines which address is used.

Many BMA400 breakout boards use `0x14` as their default address.

If your sensor does not respond at `0x14`, check the breakout board documentation and verify whether the address has been changed to `0x15`.

This is one of the first things to check when troubleshooting an I2C sensor.

---

# Wiring the BMA400 to the ESP32

For a typical ESP32 DevKit V1, GPIO21 and GPIO22 are commonly used for I2C.

Connect the BMA400 as follows:

| BMA400    | ESP32  |
| --------- | ------ |
| VCC / 3V3 | 3.3V   |
| GND       | GND    |
| SDA       | GPIO21 |
| SCL       | GPIO22 |

![BMA400 ESP32 I2C wiring diagram](/assets/images/bma400-esp32-wiring.webp)

The connection can be summarized as:

```text
BMA400                 ESP32 DevKit V1

VCC   ----------------  3.3V
GND   ----------------  GND
SDA   ----------------  GPIO21
SCL   ----------------  GPIO22
```

## Why GPIO21 and GPIO22?

The ESP32 Arduino core allows the I2C pins to be assigned explicitly.

In this tutorial we use:

```cpp
Wire.begin(21, 22);
```

This makes the wiring clear and avoids relying on board-specific default I2C configuration.

---

# BMA400 Voltage

The BMA400 itself is designed for low-voltage operation.

For an ESP32 project, **3.3 V is the appropriate logic level**.

Do not assume that every BMA400 breakout board can be connected directly to 5 V.

Some breakout boards include regulators and additional circuitry, while others expose the sensor supply more directly.

Always check the specifications of the particular board you are using.

---

# Installing the BMA400 Arduino Library

For this tutorial we will use the **SparkFun BMA400 Arduino Library**.

The library provides an Arduino-friendly interface for the BMA400 and implements Bosch's BMA400 API.

It supports:

* I2C
* SPI
* Acceleration readings
* Measurement range configuration
* Filtering
* Interrupts
* Motion detection
* Orientation detection
* Tap detection
* Step counting
* FIFO
* Power management

The library can be installed directly through the Arduino IDE.

## Arduino IDE Steps

1. Open Arduino IDE.
2. Select:

**Sketch → Include Library → Manage Libraries**

3. Search for:

**SparkFun BMA400**

4. Install:

**SparkFun BMA400 Arduino Library**

The library also includes example sketches that can be opened from:

**File → Examples → SparkFun BMA400 Arduino Library**

---

# Basic BMA400 ESP32 Example

The following example initializes the BMA400 over I2C and continuously reads the acceleration on all three axes.

The sensor values returned by the SparkFun library are converted to `g`.

```cpp
#include <Wire.h>
#include "SparkFun_BMA400_Arduino_Library.h"

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
  // Update sensor data
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

The SparkFun library's current implementation uses `beginI2C()` to initialize the sensor and `getSensorData()` to update the acceleration structure. The returned X, Y and Z values are converted to `g`.

---

# How the Code Works

## Include the Libraries

```cpp
#include <Wire.h>
#include "SparkFun_BMA400_Arduino_Library.h"
```

`Wire.h` provides the Arduino I2C interface.

The SparkFun library provides the BMA400-specific functions and data structures.

---

## Create the Sensor Object

```cpp
BMA400 accelerometer;
```

This creates the BMA400 object used throughout the program.

---

## Start I2C

```cpp
Wire.begin(21, 22);
```

The ESP32 uses:

* GPIO21 → SDA
* GPIO22 → SCL

These pins can be changed if your ESP32 board uses a different I2C configuration.

---

## Initialize the Sensor

```cpp
accelerometer.beginI2C(BMA400_I2C_ADDRESS_DEFAULT);
```

The library accepts the BMA400 I2C address during initialization.

The default address constant corresponds to the standard BMA400 address.

If the initialization fails, the example prints an error and tries again.

This is useful during development because the Serial Monitor immediately indicates whether the ESP32 can communicate with the sensor.

---

## Read the Sensor Data

Inside `loop()` we call:

```cpp
accelerometer.getSensorData();
```

This updates the sensor data structure.

Only after this function has been called should the acceleration values be read.

---

## Read X, Y and Z

The acceleration values are available through:

```cpp
accelerometer.data.accelX
accelerometer.data.accelY
accelerometer.data.accelZ
```

The library converts the raw BMA400 measurements into values expressed in `g`.

---

# Understanding X, Y and Z

An accelerometer measures acceleration along three perpendicular axes.

The exact orientation depends on how the breakout board is mounted.

![BMA400 three-axis acceleration orientation diagram](/assets/images/bma400-esp32-axes.webp)

When the sensor is stationary, gravity is still acting on it.

For example, depending on the physical orientation, you might see values approximately like:

```text
X ≈ 0 g
Y ≈ 0 g
Z ≈ +1 g
```

If the board is turned upside down, the corresponding axis may become approximately:

```text
Z ≈ -1 g
```

The actual values will vary.

Factors such as:

* Sensor orientation
* Offset
* Noise
* Temperature
* Mechanical mounting
* Selected measurement range

can all affect the readings.

---

# Why Does a Stationary Sensor Measure 1 g?

An accelerometer does not simply measure whether the device is moving.

It measures acceleration forces acting on the sensor, including the effect of gravity.

That is why a stationary accelerometer can be used to estimate orientation relative to gravity.

For example:

* Flat on a table → one axis is dominated by gravity
* Rotate the board → the gravity component moves between axes
* Move the board → dynamic acceleration is added to gravity

This principle is commonly used for tilt and orientation detection.

---

# Testing the Accelerometer

After uploading the program:

1. Open the Serial Monitor.
2. Set the baud rate to **115200**.
3. Leave the BMA400 stationary.
4. Observe the X, Y and Z values.
5. Slowly rotate the breakout board.
6. Move it in different directions.
7. Observe which axis changes.

The output should follow this general format:

```text
X: 0.012 g | Y: -0.021 g | Z: 0.987 g
X: 0.018 g | Y: -0.014 g | Z: 1.004 g
X: 0.412 g | Y: 0.082 g | Z: 0.903 g
```

These are example values showing the output format, not guaranteed measurements.

Your actual values will depend on the sensor, breakout board and orientation.

![BMA400 ESP32 Serial Monitor acceleration output](/assets/images/bma400-esp32-output.webp)

---

# Accelerometer Measurement Range

The BMA400 supports four acceleration ranges:

| Range | Typical use                            |
| ----- | -------------------------------------- |
| ±2 g  | Small movements and higher sensitivity |
| ±4 g  | General-purpose motion                 |
| ±8 g  | Larger acceleration                    |
| ±16 g | High-acceleration applications         |

The smaller ranges provide more measurement resolution for smaller acceleration values, while larger ranges allow stronger acceleration to be measured before saturation.

The SparkFun library provides the `setRange()` function for changing the measurement range.

For example:

```cpp
accelerometer.setRange(BMA400_RANGE_2G);
```

For a basic orientation or low-motion project, ±2 g can be a sensible starting point.

For impacts or faster movement, a larger range may be more appropriate.

---

# Output Data Rate

The BMA400 supports configurable output data rates from **12.5 Hz to 800 Hz**.

The appropriate rate depends on the application.

A lower data rate can be suitable for:

* Orientation
* Tilt detection
* Slow movement

Higher rates can be useful for:

* Faster movement
* Vibration
* More responsive motion detection

A higher data rate is not automatically better.

The correct configuration depends on what the project needs to measure.

---

# BMA400 Low-Power Features

Low power is one of the main reasons to consider the BMA400.

Bosch designed the sensor for applications where battery life is important.

The BMA400 provides several operating modes and hardware features intended to reduce the amount of work required from the host microcontroller.

These include:

* Low-power operation
* Auto wake-up
* Activity recognition
* Orientation detection
* Tap detection
* Double-tap detection
* Step counting
* Interrupts
* FIFO buffering

The SparkFun library exposes functions for configuring many of these features.

This allows the ESP32 to remain in a lower-power state until the sensor detects something interesting.

---

# Motion Detection and Interrupts

One of the most interesting aspects of the BMA400 is its interrupt system.

Instead of continuously polling the sensor, the BMA400 can be configured to generate an interrupt when a particular event occurs.

Examples include:

* Motion detection
* Wake-up
* Orientation change
* Tap
* Double tap
* Activity change
* Step detection

This architecture can be particularly useful in battery-powered ESP32 applications.

For example, an ESP32 could remain in a low-power state and wake only after the BMA400 detects movement.

These advanced features are better treated as separate projects because each requires additional configuration.

---

# Calibration and Sensor Offset

The BMA400 can have small measurement offsets.

For example, an axis that theoretically should read close to zero may produce a small positive or negative value when the sensor is stationary.

This is commonly referred to as **offset** or **bias**.

Calibration can be used to estimate these errors and compensate for them.

## When Is Calibration Necessary?

Calibration becomes more important when you need:

* Accurate tilt measurements
* Consistent measurements
* Precise orientation
* Reliable motion thresholds
* Better agreement between multiple sensors

For simple movement detection, a small offset may not matter.

For precision measurements, it becomes much more important.

The calibration process should be treated as a separate BMA400 tutorial rather than making the basic ESP32 guide unnecessarily complicated.

---

# Practical Tips

## Keep the Sensor Still During Testing

Place the BMA400 on a stable surface when first testing it.

This makes it much easier to understand the acceleration caused by gravity.

## Check the Voltage

Always check the specifications of the breakout board.

The BMA400 itself is a low-voltage sensor, but different breakout boards can contain different power circuitry.

## Check the I2C Address

If the sensor is not detected, check whether your board is using:

```text
0x14
```

or:

```text
0x15
```

## Check SDA and SCL

Verify:

* SDA → SDA
* SCL → SCL
* GND → GND
* 3.3 V → correct power input

## Keep the Wiring Short

Long jumper wires can make I2C communication less reliable, especially on a breadboard.

If communication is intermittent, shorten the connections and inspect the breadboard contacts.

---

# Troubleshooting

## BMA400 Not Detected

If the Serial Monitor repeatedly displays:

```text
BMA400 not detected. Check wiring and I2C address.
```

check:

* Power
* Ground
* SDA
* SCL
* I2C address
* Breakout configuration
* Jumper connections
* I2C pull-up configuration

The first thing to verify is whether the sensor is actually visible on the I2C bus.

An I2C scanner is particularly useful for this type of problem.

---

## The Sensor Is Detected but Values Do Not Change

Make sure this function is being called:

```cpp
accelerometer.getSensorData();
```

before reading:

```cpp
accelerometer.data.accelX
accelerometer.data.accelY
accelerometer.data.accelZ
```

The library uses `getSensorData()` to retrieve and convert the latest acceleration measurement.

---

## The Values Look Wrong

Check:

* Sensor orientation
* Measurement range
* Wiring
* Power supply
* Mechanical mounting
* Sensor movement

Remember that gravity contributes to the measured acceleration.

A stationary sensor will not necessarily show zero on all three axes.

---

## The I2C Address Is 0x15

If your breakout uses the secondary address, initialize the sensor with:

```cpp
accelerometer.beginI2C(BMA400_I2C_ADDRESS_SECONDARY);
```

The BMA400 supports both `0x14` and `0x15`.

If you are unsure which address is active, use an I2C scanner.

---

# Choosing a BMA400 Breakout Board

There are several BMA400 breakout boards available.

When choosing one for an ESP32 project, look for:

| Feature             | Why it matters                   |
| ------------------- | -------------------------------- |
| I2C support         | Simple ESP32 connection          |
| 3.3 V compatibility | Matches ESP32 logic              |
| Pull-up resistors   | Simplifies I2C wiring            |
| Address selection   | Useful with multiple I2C devices |
| Interrupt pins      | Useful for advanced projects     |
| Header pins         | Easier breadboard prototyping    |
| Good documentation  | Easier troubleshooting           |

A well-documented breakout is generally a better choice for a first project than the cheapest available board.

For more advanced battery-powered projects, interrupt pins and low-power configuration become especially important.

---

# Recommended Hardware

The basic project uses:

* ESP32 Development Board
* BMA400 Accelerometer
* Breadboard
* Male-to-Female Jumper Wires

The ESP32 provides the processing and connectivity.

The BMA400 provides three-axis acceleration sensing.

The breadboard and jumper wires make the first prototype easy to assemble and modify.

The exact BMA400 breakout should be selected based on its voltage requirements, I2C support, address configuration and available interrupt pins.

---

# GitHub Source Code

The complete Arduino example should be kept together with the Embedded Nerd project source so it can be expanded later.

Possible extensions include:

* OLED display
* Motion detection
* Wake-up interrupts
* Orientation detection
* Step counting
* Data logging
* Bluetooth
* Wi-Fi
* Battery-powered operation

The basic example should remain the starting point: first establish reliable communication, then build more advanced functionality on top of it.

---

# Related Tutorials

The BMA400 fits naturally into the Embedded Nerd sensor and ESP32 content.

## MPU6050 Arduino Guide

If you need both acceleration and gyroscope data, the [MPU6050 Arduino Guide](/mpu6050-arduino-guide/) is a useful alternative.

It covers the MPU6050 wiring, Arduino library, code and troubleshooting.

## MPU6050 Calibration

The Embedded Nerd also has dedicated MPU6050 calibration content.

The concepts of offset and calibration are relevant to accelerometers in general, but the calibration procedure should not be copied directly from one sensor to another.

The BMA400 should eventually have its own dedicated calibration guide.

---

# Frequently Asked Questions

## Can the BMA400 work with ESP32?

Yes.

The BMA400 supports I2C and SPI communication and can be connected to an ESP32 using an appropriate low-voltage interface.

This tutorial uses I2C because it requires only SDA and SCL in addition to power and ground.

## Is the BMA400 compatible with Arduino?

Yes.

The SparkFun BMA400 Arduino Library provides an Arduino-compatible interface for the sensor and can be installed through the Arduino Library Manager.

## How do I connect the BMA400 to an ESP32?

For a typical ESP32 DevKit V1:

| BMA400    | ESP32  |
| --------- | ------ |
| VCC / 3V3 | 3.3V   |
| GND       | GND    |
| SDA       | GPIO21 |
| SCL       | GPIO22 |

The exact connections can vary depending on the ESP32 board and BMA400 breakout.

## What is the BMA400 I2C address?

The BMA400 supports two I2C addresses:

* `0x14`
* `0x15`

The address is selected using the SDO configuration.

## What library should I use with the BMA400?

For an Arduino-based ESP32 project, the SparkFun BMA400 Arduino Library is a practical choice.

It provides an Arduino-friendly interface to the BMA400 and includes examples for both basic measurements and advanced features.

## Does the BMA400 need calibration?

Not necessarily.

A basic motion-detection project can work without a dedicated calibration procedure.

Calibration becomes more useful when accurate acceleration, tilt or orientation measurements are required.

## Is the BMA400 better than the MPU6050?

Neither is universally better.

The BMA400 is particularly attractive when you need a low-power 3-axis accelerometer.

The MPU6050 is more appropriate when you also need a gyroscope.

## Is the BMA400 good for low-power projects?

Yes.

Low-power operation is one of the main strengths of the BMA400.

Its wake-up, activity, orientation and interrupt features can also allow the sensor to perform motion-related tasks without requiring the ESP32 to continuously process every measurement.

## Can the BMA400 detect motion without constantly reading it from the ESP32?

Yes.

The BMA400 includes interrupt-based functionality for events such as wake-up, motion, orientation, tap and step detection.

This makes it suitable for applications where the ESP32 should remain inactive until a relevant event occurs.

---

# Conclusion

The BMA400 is a powerful 3-axis accelerometer for ESP32 projects, especially when low power and motion detection are important.

In this tutorial, you learned how to:

* Connect a BMA400 to an ESP32
* Use I2C communication
* Understand the BMA400 I2C address
* Install the Arduino library
* Initialize the sensor
* Read X, Y and Z acceleration
* Interpret acceleration in `g`
* Understand measurement ranges
* Test the sensor
* Troubleshoot I2C communication
* Understand sensor offsets and calibration
* Explore the BMA400's low-power and interrupt capabilities

The basic example is deliberately simple.

Once communication is working, the BMA400 can become the foundation for more advanced ESP32 projects involving motion detection, orientation, wake-up events, step counting and battery-powered sensing.

This makes it a useful addition to the Embedded Nerd sensor library and a strong starting point for a dedicated BMA400 project series.
