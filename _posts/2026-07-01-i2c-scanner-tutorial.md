---
title: "I2C Scanner Tutorial: Find Any I2C Device Address (Arduino & ESP32)"

layout: single

sidebar:
   nav: "embedded"

excerpt: "Learn how to use an I2C Scanner with Arduino, ESP32 and ESP8266 to detect OLED displays, sensors and modules. Includes wiring, code examples, troubleshooting and GitHub."

show_date: false
read_time: false
last_modified_at: false

toc: true
toc_sticky: true
toc_label: "Contents"

header:
  teaser: /assets/images/i2c-scanner-tutorial.webp
  overlay_image: /assets/images/headnerd2.webp
  overlay_filter: 0.4

categories:
  - Arduino
  - ESP32
  - Tutorials

tags:
  - I2C
  - I2C Scanner
  - Arduino
  - ESP32
  - Wire Library
  - SSD1306
  - MPU6050
  - Electronics

related: true
share: true
---

# I2C Scanner Tutorial: Find Any I2C Device Address

If you've ever connected an OLED display, MPU6050, BME280, RTC module or any other I2C device to an Arduino or ESP32, you've probably encountered the problem of not knowing its I2C address.

An I2C Scanner is one of the most useful tools for debugging electronic projects. It quickly scans the I2C bus, detects every connected device and displays its address in the Serial Monitor.

Whether you're using an Arduino Uno, ESP32, ESP8266 or another compatible board, running an I2C scanner should always be one of the first troubleshooting steps when an I2C device isn't responding.

![I2C Scanner tutorial showing Arduino Uno, ESP32, OLED SSD1306 and MPU6050 with wiring diagram and detected I2C addresses.]({{ '/assets/images/i2c-scanner-tutorial-arduino-esp32.webp' | relative_url }})

In this tutorial you'll learn:

- What I2C communication is
- How I2C addresses work
- Why an I2C Scanner is useful
- Required hardware
- Arduino and ESP32 wiring
- How to identify connected devices
- Common I2C addresses
- Troubleshooting common I2C problems

---

# What Is I2C?

I2C (Inter-Integrated Circuit) is one of the most widely used communication protocols in embedded electronics.

Instead of requiring many wires, I2C allows multiple devices to communicate using only two signal lines:

- SDA (Serial Data)
- SCL (Serial Clock)

This makes wiring much simpler than many other communication methods.

A single pair of SDA and SCL lines can connect multiple sensors, displays and expansion modules simultaneously.

Popular I2C devices include:

- SSD1306 OLED displays
- MPU6050 accelerometer and gyroscope
- BME280 environmental sensor
- BMP280 pressure sensor
- DS3231 Real Time Clock
- PCF8574 I/O expander
- ADS1115 Analog-to-Digital Converter
- LCD displays with I2C backpack

Because every device shares the same communication bus, each one must have a unique address.

---

# How I2C Addressing Works

Every I2C device has a hexadecimal address.

When your Arduino or ESP32 wants to communicate with a device, it sends data to that specific address.

For example:

| Device | Typical Address |
|---------|----------------:|
| SSD1306 OLED | 0x3C |
| MPU6050 | 0x68 |
| BME280 | 0x76 |
| DS3231 RTC | 0x68 |

Some modules allow the address to be changed using solder jumpers or address pins.

If your sketch uses the wrong address, the device simply won't respond.

This is why running an I2C Scanner is often the fastest way to solve communication problems.

---

# Why Use an I2C Scanner?

An I2C Scanner automatically checks every valid address on the I2C bus.

Whenever it finds a responding device, it prints its address in the Serial Monitor.

Using an I2C Scanner allows you to:

- Verify your wiring
- Find the correct I2C address
- Detect multiple devices
- Confirm that the module is powered correctly
- Troubleshoot communication issues in seconds

For beginners and experienced makers alike, it's one of the first programs worth keeping in your Arduino toolbox.

---

# Required Hardware

| Component | Link |
|-----------|------|
| Arduino Uno or ESP32 Development Board | Your Affiliate Link |
| I2C Module (OLED, MPU6050, BME280, etc.) | Your Affiliate Link |
| Breadboard | Your Affiliate Link |
| Jumper Wires | Your Affiliate Link |

---

# Wiring the I2C Bus

One of the biggest advantages of I2C is that every compatible device shares the same SDA and SCL lines.

Only four connections are usually required:

- VCC
- GND
- SDA
- SCL

Additional I2C devices can simply be connected in parallel to the same SDA and SCL pins.

---

# Arduino Uno Wiring

![Arduino I2C Wiring]({{ '/assets/images/arduino-i2c-scanner.webp' | relative_url }})

| Arduino Uno | I2C Device |
|--------------|------------|
| 5V | VCC |
| GND | GND |
| A4 | SDA |
| A5 | SCL |

---

# ESP32 Wiring

![ESP32 I2C Wiring]({{ '/assets/images/esp32-i2c-scanner.webp' | relative_url }})

| ESP32 | I2C Device |
|--------|------------|
| 3.3V | VCC |
| GND | GND |
| GPIO21 | SDA |
| GPIO22 | SCL |

Most ESP32 development boards use GPIO21 for SDA and GPIO22 for SCL by default.

If your board uses different pins, they can usually be changed in software.

---

# Before Running the Scanner

Before uploading the scanner sketch, double-check the following:

- The device is powered correctly.
- SDA is connected to SDA.
- SCL is connected to SCL.
- The USB cable supports data transfer.
- The correct board is selected in the Arduino IDE.
- The correct COM port is selected.

Taking a minute to verify these connections can save a lot of troubleshooting later.

---

# Arduino & ESP32 I2C Scanner Code

The following sketch works with most Arduino boards, including the Arduino Uno, Nano, Mega, ESP32 and ESP8266.

It scans every possible I2C address from **0x01** to **0x7E** and reports any responding devices in the Serial Monitor.

```cpp
/*
   Embedded Nerd
   I2C Scanner Tutorial
   https://embeddednerd.com
*/

#include <Wire.h>

void setup() {

  Wire.begin();

  Serial.begin(115200);

  while (!Serial);

  Serial.println();
  Serial.println("----------------------------");
  Serial.println("Embedded Nerd I2C Scanner");
  Serial.println("----------------------------");
}

void loop() {

  byte error;
  byte address;
  int devices = 0;

  Serial.println();
  Serial.println("Scanning I2C bus...");

  for (address = 1; address < 127; address++) {

    Wire.beginTransmission(address);

    error = Wire.endTransmission();

    if (error == 0) {

      Serial.print("Found device at 0x");

      if (address < 16)
        Serial.print("0");

      Serial.println(address, HEX);

      devices++;
    }

    else if (error == 4) {

      Serial.print("Unknown error at 0x");

      if (address < 16)
        Serial.print("0");

      Serial.println(address, HEX);
    }
  }

  if (devices == 0) {

    Serial.println("No I2C devices found.");

  } else {

    Serial.print(devices);
    Serial.println(" device(s) detected.");
  }

  Serial.println();
  Serial.println("Scan complete.");
  Serial.println("----------------------------");

  delay(5000);
}
```

---

# How the Scanner Works

The scanner checks every valid I2C address one at a time.

For each address, it attempts to start communication.

If the device responds, the address is printed to the Serial Monitor.

The process repeats until every address has been tested.

This makes it possible to discover connected devices even if you don't know their address beforehand.

---

# Understanding the Code

The program starts by including the Wire library.

```cpp
#include <Wire.h>
```

The Wire library provides all the functions required for I2C communication.

---

Next, I2C communication is initialized.

```cpp
Wire.begin();
```

On most Arduino boards this automatically uses the default SDA and SCL pins.

For the ESP32, the default pins are:

- SDA → GPIO21
- SCL → GPIO22

---

The scanner then loops through every possible I2C address.

```cpp
for(address = 1; address < 127; address++)
```

Valid I2C addresses range from **0x01** to **0x7E**.

Each address is tested individually.

---

To test an address, the scanner starts a transmission.

```cpp
Wire.beginTransmission(address);
```

It immediately ends the transmission.

```cpp
error = Wire.endTransmission();
```

If the device acknowledges the request, the function returns:

```cpp
0
```

which means a device was found.

---

If no device responds, the scanner simply continues checking the next address.

This process usually takes less than a second.

---

# Running the Scanner

Open the Arduino IDE.

Select your board:

**Tools → Board**

Select the correct COM port:

**Tools → Port**

Upload the sketch.

Once the upload is complete:

Open:

**Tools → Serial Monitor**

Set the baud rate to:

```
115200
```

The scanner will immediately begin searching for connected devices.

---

# Example Output

A typical Serial Monitor output looks like this:

```
----------------------------
Embedded Nerd I2C Scanner
----------------------------

Scanning I2C bus...

Found device at 0x3C

Found device at 0x68

2 device(s) detected.

Scan complete.
```

This means two devices were found.

---

# Interpreting the Results

In the example above:

```
0x3C
```

is typically an OLED SSD1306 display.

```
0x68
```

is commonly used by:

- MPU6050
- DS3231 RTC

Some devices share the same default address, so always check the module documentation if multiple devices are connected.

---

# Multiple Devices

One of the biggest advantages of I2C is that multiple devices can share the same communication bus.

For example:

| Device | Address |
|----------|---------|
| OLED SSD1306 | 0x3C |
| MPU6050 | 0x68 |
| BME280 | 0x76 |

All three devices can operate simultaneously using the same SDA and SCL pins.

Only the power connections and I2C lines are required.

---

# What If No Devices Are Found?

If the scanner reports:

```
No I2C devices found.
```

there is usually a simple explanation.

Common causes include:

- SDA and SCL wires reversed
- Incorrect power supply
- Loose jumper wires
- Wrong board selected
- Wrong COM port
- Faulty module
- USB cable without data support

An I2C Scanner is often the quickest way to determine whether the issue is related to software or hardware.

---

# Common I2C Device Addresses

Many I2C modules are available with different default addresses. While most use a fixed address, some allow it to be changed using jumpers or address pins.

The table below lists some of the most common I2C devices used with Arduino and ESP32 projects.

| Device | Default Address |
|---------|-----------------|
| SSD1306 OLED Display | 0x3C |
| SSD1306 OLED Display | 0x3D |
| SH1106 OLED Display | 0x3C |
| MPU6050 | 0x68 |
| MPU6050 (AD0 High) | 0x69 |
| DS3231 RTC | 0x68 |
| DS1307 RTC | 0x68 |
| BME280 | 0x76 |
| BME280 | 0x77 |
| BMP280 | 0x76 |
| BMP280 | 0x77 |
| LCD I2C Backpack (PCF8574) | 0x27 |
| LCD I2C Backpack | 0x3F |
| ADS1115 ADC | 0x48 |
| ADS1015 ADC | 0x48 |
| PCF8574 I/O Expander | 0x20–0x27 |
| MCP23017 I/O Expander | 0x20–0x27 |
| INA219 Current Sensor | 0x40 |
| BH1750 Light Sensor | 0x23 |
| HMC5883L Compass | 0x1E |
| VL53L0X Distance Sensor | 0x29 |
| PCA9685 Servo Driver | 0x40 |
| SHT31 Temperature Sensor | 0x44 |
| CCS811 Air Quality Sensor | 0x5A |

Always verify the detected address with your I2C Scanner before editing your Arduino sketch.

---

# Troubleshooting

Even simple wiring mistakes can prevent I2C devices from communicating.

Here are the most common problems and their solutions.

---

## No I2C Devices Found

If the scanner reports:

```
No I2C devices found.
```

Check the following:

- SDA and SCL wires are not swapped.
- VCC and GND are connected correctly.
- The module is receiving power.
- The correct board is selected in the Arduino IDE.
- The correct COM port is selected.
- The USB cable supports data transfer.
- The module is not damaged.

---

## Wrong I2C Address

Some modules support multiple addresses.

For example:

- SSD1306 OLED displays may use **0x3C** or **0x3D**.
- BME280 modules may use **0x76** or **0x77**.
- MPU6050 modules may use **0x68** or **0x69** depending on the AD0 pin.

Always update your sketch to match the address reported by the scanner.

---

## OLED Display Still Doesn't Work

If your scanner detects the display but nothing appears on the screen:

- Verify the display library.
- Check that the display size matches your code.
- Confirm the I2C address.
- Make sure the display is initialized correctly.

Example:

```cpp
display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
```

If your scanner reports **0x3D**, update the address accordingly.

---

## Scanner Freezes

A scanner that appears to freeze is usually caused by:

- Loose wiring
- Poor breadboard connections
- Incorrect voltage
- Damaged sensor
- Short circuit on SDA or SCL

Disconnect all devices and reconnect them one at a time until the faulty module is identified.

---

## Multiple Devices Share the Same Address

Two devices with identical addresses cannot communicate on the same I2C bus.

Possible solutions include:

- Changing the address using jumpers
- Using an I2C multiplexer such as the TCA9548A
- Selecting a module with configurable addresses

---

# Why Every Maker Should Keep an I2C Scanner

Whether you're building a simple weather station or a complex robotics project, an I2C Scanner should be one of the first sketches you upload.

It helps you:

- Verify hardware connections
- Detect faulty modules
- Find unknown I2C addresses
- Save debugging time
- Confirm that new sensors are working correctly

Many experienced makers run an I2C scan before writing any application code.

---

# GitHub Source Code

The complete I2C Scanner sketch is available in the GitHub repository.

The repository includes:

- Arduino source code
- ESP32 compatible sketch
- Wiring diagrams
- Example Serial Monitor output
- Project images

---

# Related Tutorials

If you're learning I2C communication, these tutorials may also be useful:

- [MPU6050 Arduino Guide](../mpu6050-arduino-guide/)
- [ESP32 OLED Display Guide](../ESP32-OLED-Tutorial-Wiring-Code-&-Display-Guide/)
- [ESP32 Snake Game](../esp32-snake-game/)
- [BME280 Arduino Tutorial](../bme280-arduino/)
- [LCD I2C Tutorial](../lcd-i2c-tutorial/)

Each of these projects uses I2C communication and can benefit from running an I2C Scanner before uploading the main sketch.

---

# Frequently Asked Questions

## Can I connect multiple I2C devices to the same bus?

Yes.

As long as every device has a unique address, multiple sensors and displays can share the same SDA and SCL lines.

---

## Does the scanner work with ESP32?

Yes.

The same sketch works with ESP32, Arduino Uno, Nano, Mega and many other compatible boards.

---

## Why does my OLED use 0x3D instead of 0x3C?

Some manufacturers configure the display differently.

Always use the address detected by the scanner.

---

## Can two devices have the same address?

No.

If two devices share the same address, communication conflicts will occur.

One of the addresses must be changed or an I2C multiplexer must be used.

---

# Conclusion

An I2C Scanner is one of the simplest yet most valuable tools for anyone working with Arduino or ESP32.

In just a few seconds, it can detect connected devices, identify their addresses and help diagnose wiring or communication problems before they become frustrating debugging sessions.

Whether you're using an OLED display, MPU6050, BME280, RTC module or any other I2C peripheral, running an I2C scan should always be your first step.

Keeping this small utility in your collection of Arduino sketches will save time, simplify troubleshooting and make future projects much easier to build.
````
