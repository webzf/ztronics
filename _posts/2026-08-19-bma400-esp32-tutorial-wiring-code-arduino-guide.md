
---
title: "BMA400 ESP32 Tutorial: Wiring, Code & Arduino Guide"

permalink: /bma400-esp32-tutorial-wiring-code-arduino-guide/

howto: true

layout: single

required_hardware:
  - esp32-devkit-v1
  - bma400
  - breadboard
  - jumper-wires

excerpt: "Learn how to connect the BMA400 accelerometer to an ESP32 using I2C, install the Arduino library, read acceleration data and troubleshoot common problems."

show_date: true

toc: true
toc_sticky: true
toc_label: "Contents"

header:
  teaser: /assets/images/bma400-esp32-tutorial.webp
  image: /assets/images/bma400-esp32-tutorial.webp

categories:
  - ESP32
  - Arduino
  - Sensors

tags:
  - BMA400
  - ESP32
  - Arduino
  - Accelerometer
  - I2C
  - Motion Sensor
---

The **BMA400** is a low-power 3-axis digital accelerometer designed for applications where motion sensing and low power consumption are important.

In this tutorial, we will connect a BMA400 breakout board to an **ESP32** using I2C, install the Arduino library, read acceleration from the X, Y and Z axes, and verify the sensor through the Serial Monitor.

The BMA400 is particularly interesting for battery-powered projects because it combines acceleration measurements with built-in motion-detection features and very low power consumption.

By the end of this guide, you will have a working **BMA400 ESP32** setup that can be used as the foundation for motion sensing, orientation detection, wearable electronics, robotics and low-power IoT projects.

![BMA400 accelerometer connected to an ESP32](/assets/images/bma400-esp32-tutorial.webp)

## What Is the BMA400?

The **BMA400** is a 3-axis digital accelerometer from Bosch Sensortec.

It measures acceleration along three perpendicular axes:

- X
- Y
- Z

Because gravity is also measured as acceleration, the sensor can be used to determine orientation and tilt as well as movement.

The BMA400 supports selectable acceleration ranges of:

| Range | Maximum acceleration |
|---|---:|
| ±2 g | 2 g |
| ±4 g | 4 g |
| ±8 g | 8 g |
| ±16 g | 16 g |

The sensor provides 12-bit acceleration data and supports both **I2C** and **SPI** communication.

One of its main advantages is its very low power consumption.

The BMA400 also includes hardware features for:

- Motion detection
- Orientation detection
- Tap and double-tap detection
- Activity recognition
- Step counting
- Auto wake-up
- FIFO buffering
- Interrupt generation

This combination makes the BMA400 particularly interesting for battery-powered embedded projects.

## Why Use the BMA400 with an ESP32?

The ESP32 is a powerful microcontroller with Wi-Fi and Bluetooth, but battery-powered applications often require careful power management.

The BMA400 complements the ESP32 well because the sensor can perform several motion-related tasks without requiring the ESP32 to continuously process raw acceleration data.

For example, the BMA400 can detect:

- Motion
- Orientation changes
- Taps
- Double taps
- Walking
- Running
- Stillness

This makes it possible to design systems where the accelerometer detects an event and then uses an interrupt to wake or notify the ESP32.

Typical applications include:

- Wearable electronics
- Motion-controlled interfaces
- IoT devices
- Battery-powered sensors
- Activity tracking
- Security systems
- Robotics
- Tilt detection
- Wake-on-motion projects

## BMA400 vs MPU6050

The BMA400 is also an interesting alternative to the **MPU6050**, which is another popular motion sensor used with Arduino and ESP32.

The main difference is that the MPU6050 combines an accelerometer and a gyroscope, while the BMA400 is an accelerometer focused on low-power motion sensing.

| Feature | BMA400 | MPU6050 |
|---|---|---|
| Accelerometer | 3-axis | 3-axis |
| Gyroscope | No | Yes |
| Interface | I2C / SPI | I2C |
| Acceleration range | ±2 / ±4 / ±8 / ±16 g | Configurable |
| Low-power focus | Excellent | Lower |
| Motion features | Extensive | More limited |
| Step counter | Yes | No dedicated step counter |
| Tap detection | Yes | No dedicated tap engine |

If you need gyroscope measurements, the MPU6050 remains an excellent option.

If your project primarily needs acceleration, orientation, motion detection and low power consumption, the BMA400 can be a better fit.

If you want to learn more about the MPU6050, see our [MPU6050 Arduino Guide](/mpu6050-arduino-guide/).

## Required Hardware

For this tutorial you need:

- ESP32 development board
- BMA400 breakout board
- Breadboard
- Jumper wires
- USB cable

A breakout board is strongly recommended because the BMA400 sensor itself is a very small surface-mount component.

Using a breakout makes it possible to connect the sensor directly to a breadboard and experiment with it without working with the bare sensor package.

## BMA400 Breakout Boards

There are several BMA400 breakout boards available.

For example, the **SparkFun Triple Axis Accelerometer Breakout - BMA400 (Qwiic)** provides convenient access to the sensor through I2C and exposes the features required for typical Arduino and ESP32 projects.

When choosing a BMA400 module, check:

- I2C support
- Supply voltage
- Available interrupt pins
- Board size
- Pull-up resistors
- Connector type
- Documentation and library support

For a first ESP32 project, an I2C breakout board is generally the simplest option.

## BMA400 I2C Address

The BMA400 supports two I2C addresses:

| Address | Description |
|---|---|
| `0x14` | Default |
| `0x15` | Alternate |

The exact address depends on the configuration of the breakout board.

If the ESP32 cannot detect the sensor, checking the I2C address should be one of the first troubleshooting steps.

## BMA400 ESP32 Wiring

The BMA400 can communicate with the ESP32 using I2C.

For a typical ESP32 DevKit V1, the default I2C pins are:

| BMA400 | ESP32 |
|---|---|
| VCC | 3.3V |
| GND | GND |
| SDA | GPIO21 |
| SCL | GPIO22 |

![BMA400 connected to ESP32 using I2C](/assets/images/bma400-esp32-wiring.webp)

### Wiring Notes

The ESP32 uses 3.3 V logic, making a suitable 3.3 V BMA400 breakout a convenient combination.

Always check the specifications of the particular breakout board you are using.

The important I2C connections are:

**SDA → GPIO21**

**SCL → GPIO22**

**GND → GND**

**VCC → 3.3V**

If your ESP32 board uses different I2C pins, the Arduino `Wire` interface can be configured accordingly.

## Installing the BMA400 Arduino Library

The easiest way to use the BMA400 with Arduino is the **SparkFun BMA400 Arduino Library**.

The library provides an Arduino-friendly interface for the BMA400 and is based on Bosch's BMA400 Sensor API.

### Arduino IDE

Open:

`Sketch → Include Library → Manage Libraries`

Search for:

`SparkFun BMA400`

Install the library provided by SparkFun.

The library includes examples for basic acceleration measurements as well as more advanced functionality.

## BMA400 ESP32 Code Example

The following example initializes the BMA400 over I2C and continuously prints the acceleration measured on all three axes.

```cpp
 // Embedded Nerd - https://embeddednerd.com

#include <Wire.h>
#include "SparkFun_BMA400_Arduino_Library.h"

// Create BMA400 sensor object
BMA400 accelerometer;

// Default BMA400 I2C address
uint8_t i2cAddress = BMA400_I2C_ADDRESS_DEFAULT;

// Alternate address:
// uint8_t i2cAddress = BMA400_I2C_ADDRESS_SECONDARY;

void setup()
{
  Serial.begin(115200);

  // Start I2C
  Wire.begin();

  Serial.println();
  Serial.println("BMA400 ESP32 Tutorial");
  Serial.println("Initializing BMA400...");

  // Initialize sensor
  while (accelerometer.beginI2C(i2cAddress) != BMA400_OK)
  {
    Serial.println("BMA400 not detected. Check wiring and I2C address.");
    delay(1000);
  }

  Serial.println("BMA400 connected!");
}

void loop()
{
  // Read new acceleration data
  accelerometer.getSensorData();

  Serial.print("X: ");
  Serial.print(accelerometer.data.accelX, 3);
  Serial.print(" g");

  Serial.print(" | Y: ");
  Serial.print(accelerometer.data.accelY, 3);
  Serial.print(" g");

  Serial.print(" | Z: ");
  Serial.print(accelerometer.data.accelZ, 3);
  Serial.println(" g");

  delay(100);
}
```

This example follows the API provided by the SparkFun BMA400 Arduino Library.

The important sequence is:

1. Start I2C.
2. Initialize the BMA400.
3. Request new sensor data.
4. Read the X axis.
5. Read the Y axis.
6. Read the Z axis.

## Understanding the Output

With the sensor sitting still on a flat surface, one axis should normally measure approximately **+1 g or -1 g**, depending on the orientation of the breakout board.

The other two axes should normally be much closer to zero.

For example:

```text
X: 0.012 g | Y: -0.021 g | Z: 0.984 g
X: 0.015 g | Y: -0.018 g | Z: 0.991 g
X: 0.009 g | Y: -0.024 g | Z: 1.003 g
```

These are illustrative values rather than guaranteed measurements.

The exact readings depend on:

- Sensor orientation
- Sensor noise
- Board construction
- Mechanical mounting
- Power supply
- Sensor configuration
- Calibration

The important observation is that the acceleration caused by gravity should be close to **1 g** when the sensor is stationary.

![Example BMA400 acceleration output](/assets/images/bma400-esp32-output.webp)

## What Happens When You Move the BMA400?

Try rotating the breakout board slowly.

The acceleration measured on each axis will change as the direction of gravity relative to the sensor changes.

For example:

- Flat on the table → one axis should be close to ±1 g.
- Rotate the board 90° → another axis becomes dominant.
- Turn the board upside down → the dominant axis changes sign.

This simple experiment is a good way to verify that the sensor is working correctly.

You can also shake the sensor or move it quickly.

During movement, the acceleration values will change rapidly and may temporarily become much larger.

## How the Code Works

### `Wire.begin()`

```cpp
Wire.begin();
```

Initializes the ESP32 I2C interface.

For a typical ESP32 DevKit V1:

- SDA = GPIO21
- SCL = GPIO22

### `beginI2C()`

```cpp
accelerometer.beginI2C(i2cAddress);
```

Initializes communication with the BMA400.

The default address is:

```cpp
BMA400_I2C_ADDRESS_DEFAULT
```

The alternate address can be selected using:

```cpp
BMA400_I2C_ADDRESS_SECONDARY
```

### `getSensorData()`

```cpp
accelerometer.getSensorData();
```

Requests updated acceleration data from the sensor.

This needs to be called before reading the acceleration values.

### Reading the Axes

The acceleration values are available through:

```cpp
accelerometer.data.accelX
accelerometer.data.accelY
accelerometer.data.accelZ
```

The library reports the acceleration values in **g**.

## Changing the Acceleration Range

The BMA400 supports:

- ±2 g
- ±4 g
- ±8 g
- ±16 g

For example, the ±2 g range can be selected with:

```cpp
accelerometer.setRange(BMA400_RANGE_2G);
```

A smaller range is useful when the application does not experience large accelerations.

For example, ±2 g can be appropriate for:

- Tilt sensing
- Orientation
- Static measurements
- Slow movement

For applications involving stronger acceleration or impacts, a larger range may be more appropriate.

## Output Data Rate

The BMA400 supports several output data rates.

The SparkFun library provides settings such as:

```cpp
BMA400_ODR_12_5HZ
BMA400_ODR_25HZ
BMA400_ODR_50HZ
BMA400_ODR_100HZ
BMA400_ODR_200HZ
BMA400_ODR_400HZ
BMA400_ODR_800HZ
```

For example:

```cpp
accelerometer.setODR(BMA400_ODR_100HZ);
```

For many basic ESP32 motion projects, 100 Hz is more than sufficient.

Higher rates can be useful when faster motion needs to be captured, while lower rates can reduce the amount of data processed by the system.

## Low-Power Operation

One of the most interesting characteristics of the BMA400 is its focus on low power consumption.

The sensor supports different operating modes designed for applications where battery life is important.

This makes the BMA400 particularly interesting when combined with the ESP32's own power-management capabilities.

However, it is important to distinguish the sensor's power consumption from the total power consumption of the project.

The ESP32 itself can consume significantly more power than the accelerometer, especially when Wi-Fi or Bluetooth is active.

The real benefit therefore comes from designing the entire system around low-power operation.

## Motion Detection and Interrupts

The BMA400 includes hardware interrupt features that can reduce the amount of processing required from the ESP32.

Depending on the configuration, the sensor can detect events such as:

- Motion
- Wake-up
- Orientation changes
- Tap
- Double tap
- Step detection
- Data-ready events
- FIFO events

This is particularly useful for projects where the ESP32 should remain in a low-power state until something happens.

Instead of continuously polling the sensor, an interrupt can be used to notify the ESP32 when a relevant event occurs.

This is an advanced application and is better treated as a dedicated project rather than part of this introductory tutorial.

## Step Counting

The BMA400 includes a hardware step counter and activity recognition functionality.

The sensor can be used to identify activities such as:

- Walking
- Running
- Stillness

This is particularly useful for wearable projects because the sensor can perform part of the motion processing internally.

The ESP32 can then retrieve the resulting information rather than implementing a complete step-detection algorithm from raw acceleration data.

## Does the BMA400 Need Calibration?

For a simple project that only needs to detect motion or orientation, calibration may not be necessary.

For applications where absolute acceleration measurements are important, sensor offsets and measurement accuracy become more relevant.

A useful initial test is to place the sensor on a stable flat surface and check that:

- One axis is close to ±1 g.
- The other two axes are close to 0 g.
- The readings remain reasonably stable.

Calibration can be treated as a separate topic rather than making this introductory BMA400 tutorial unnecessarily complex.

## Troubleshooting

### BMA400 Not Detected

If the Serial Monitor repeatedly displays:

```text
BMA400 not detected. Check wiring and I2C address.
```

check the following:

1. Confirm that VCC is connected correctly.
2. Confirm that GND is connected.
3. Check SDA.
4. Check SCL.
5. Verify the I2C address.
6. Check the breakout board configuration.
7. Check the wiring for loose connections.

The most common address is `0x14`.

If the hardware configuration has been changed, the address may be `0x15`.

If you regularly work with I2C sensors and displays, an **I2C scanner** is also a useful diagnostic tool.

### The Sensor Is Found but Values Do Not Change

Make sure the code calls:

```cpp
accelerometer.getSensorData();
```

inside the loop.

Also check that the sensor is properly connected and that the breakout board is not moving because of loose jumper wires.

### Acceleration Values Look Wrong

If the values seem unusually large or unstable:

- Check the power supply.
- Check the I2C wiring.
- Verify the selected acceleration range.
- Make sure the sensor is securely mounted.
- Check whether the sensor is being moved during testing.
- Verify the breakout board configuration.

### I2C Address Is Different

If the sensor does not respond at `0x14`, use an I2C scanner to identify the device address.

The BMA400 supports:

```text
0x14
0x15
```

The actual address depends on the hardware configuration.

## Choosing a BMA400 Module

When buying a BMA400 breakout, the sensor itself is not the only consideration.

### I2C Support

For an ESP32 project, I2C is usually the simplest interface.

A board with accessible header pins or a convenient connector makes prototyping easier.

### Voltage Compatibility

Check the specifications of the breakout board you are buying.

The BMA400 sensor itself supports a low supply voltage, but breakout boards can include additional circuitry such as regulators and pull-up resistors.

For an ESP32 project, a breakout designed for 3.3 V operation is a convenient choice.

### Interrupt Pins

If you plan to use:

- Motion detection
- Tap detection
- Wake-up
- Step detection
- Orientation detection

choose a breakout board that exposes the interrupt pins required by your project.

### Board Size

A standard breakout board is convenient for breadboard prototyping.

A smaller board can be more appropriate for:

- Wearables
- Compact IoT devices
- Battery-powered projects
- Space-constrained designs

## Recommended Hardware

A simple starting combination is:

**ESP32 DevKit V1 + BMA400 breakout + breadboard + jumper wires**

The ESP32 handles the application logic and connectivity while the BMA400 provides acceleration and motion sensing.

For compact projects, a smaller BMA400 breakout may be preferable.

When selecting a module, prioritize a well-documented breakout with accessible I2C and interrupt connections.

## BMA400 Project Ideas

Once the basic sensor is working, the BMA400 can be used for much more than displaying acceleration values.

Possible projects include:

- ESP32 motion detector
- Wake-on-motion system
- Tap-controlled ESP32 interface
- Step counter
- Wearable activity tracker
- Tilt-controlled OLED interface
- Motion-triggered IoT device
- Low-power security sensor
- Orientation-controlled robot
- ESP32 deep-sleep wake-up system

The combination of the BMA400's low-power features and the ESP32's sleep modes is particularly interesting for battery-powered projects.

## Using the BMA400 with an OLED

The acceleration data can also be displayed on an SSD1306 OLED.

The ESP32 can share its I2C bus with multiple devices as long as they use different I2C addresses.

For example, an OLED normally uses an address such as `0x3C`, while the BMA400 can use `0x14` or `0x15`.

This makes it possible to create a compact motion dashboard showing:

- X acceleration
- Y acceleration
- Z acceleration
- Orientation
- Motion status

Our [ESP32 OLED Tutorial](/esp32-oled-tutorial-wiring-code-display-guide/) explains how to connect an SSD1306 OLED to the ESP32 and display sensor data.

## Related Embedded Nerd Tutorials

The BMA400 fits naturally into the Embedded Nerd sensor and ESP32 content cluster.

If you are comparing motion sensors, our [MPU6050 Arduino Guide](/mpu6050-arduino-guide/) provides a useful reference for a sensor that combines an accelerometer and gyroscope.

The BMA400 and MPU6050 solve different problems, so the right choice depends on whether your project needs a gyroscope or prioritizes low-power acceleration sensing.

The [ESP32 OLED Tutorial](/esp32-oled-tutorial-wiring-code-display-guide/) is also useful if you want to display BMA400 measurements on a small screen.

## Frequently Asked Questions

### What is the BMA400?

The BMA400 is a low-power 3-axis digital accelerometer from Bosch Sensortec. It supports selectable acceleration ranges up to ±16 g and includes hardware features for motion, orientation, tap and activity detection.

### Can the BMA400 work with an ESP32?

Yes. The BMA400 supports I2C and SPI, and an ESP32 can communicate with it using either interface. I2C is the simplest option for a beginner project.

### What is the BMA400 I2C address?

The BMA400 supports two I2C addresses: `0x14` and `0x15`. The address used depends on the hardware configuration of the breakout board.

### Does the BMA400 have a gyroscope?

No. The BMA400 is an accelerometer.

If your project requires gyroscope measurements, you need an IMU such as the MPU6050 or another sensor that includes a gyroscope.

### Is the BMA400 better than the MPU6050?

Neither sensor is universally better.

The BMA400 is particularly attractive for low-power acceleration and motion sensing.

The MPU6050 is more suitable when you also need a gyroscope.

### Does the BMA400 measure tilt?

Yes.

Because the accelerometer measures gravity, the relative acceleration on the X, Y and Z axes can be used to determine orientation and tilt when the sensor is not undergoing significant dynamic acceleration.

### Does the BMA400 support step counting?

Yes.

The BMA400 includes a hardware step counter and activity recognition features.

### Can the BMA400 wake an ESP32?

Yes.

The BMA400 provides interrupt and wake-up functionality that can be used as part of a low-power ESP32 system.

The exact implementation depends on the breakout board and the ESP32 sleep configuration.

### Can multiple BMA400 sensors share the same I2C bus?

Two BMA400 devices can potentially be placed on the same I2C bus when their addresses are configured differently.

The two supported addresses are `0x14` and `0x15`.

For more complex I2C systems, an I2C multiplexer may be required.

## Conclusion

The BMA400 is an excellent accelerometer for ESP32 projects that need more than basic X, Y and Z measurements.

Its combination of:

- 12-bit acceleration data
- ±2 g to ±16 g ranges
- I2C and SPI
- Low power consumption
- Motion detection
- Orientation detection
- Tap detection
- Activity recognition
- Step counting
- Hardware interrupts

makes it particularly well suited to battery-powered and motion-aware embedded systems.

For a first project, start with the I2C connection and the basic acceleration example.

Once the sensor is communicating correctly, you can move towards interrupt-driven motion detection, step counting and low-power ESP32 applications.

The BMA400 is therefore a strong alternative to traditional motion sensors when a project needs **acceleration sensing, low power consumption and built-in motion features**.

