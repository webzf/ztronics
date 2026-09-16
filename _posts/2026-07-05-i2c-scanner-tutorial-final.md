---
title: "I2C Scanner Tutorial: Find I2C Address on Arduino, ESP32 & ESP8266"

howto: true

layout: single

sidebar:
   nav: "embedded"

permalink: /i2c-scanner-tutorial/

internal_link_keywords:
  - "I2C Scanner"
  - "I2C scanner"
  - "I2C address scanner"
  - "find I2C address"
  - "I2C device address"

excerpt: "Learn how to use an I2C Scanner with Arduino, ESP32 and ESP8266 to find I2C device addresses, verify wiring and troubleshoot OLED displays, sensors and modules."

show_date: false
read_time: false
last_modified_at: false

toc: true
toc_sticky: true
toc_label: "Contents"

header:
  teaser: /assets/images/i2c-scanner-tutorial-arduino-esp32.webp
  image: /assets/images/i2c-scanner-tutorial-arduino-esp32.webp
  og_image: /assets/images/i2c-scanner-tutorial-arduino-esp32.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.25

categories:
  - Arduino
  - ESP32
  - Tutorials

tags:
  - I2C
  - I2C Scanner
  - Arduino
  - ESP32
  - ESP8266
  - Wire Library
  - SSD1306
  - MPU6050
  - Electronics

related: true
share: true

required_hardware:
  - id: esp32-devkit
    component: ESP32 Development Board

  - id: mpu6050
    component: MPU6050 Accelerometer & Gyroscope

  - id: ssd1306-oled
    component: SSD1306 OLED Display

  - id: solderless-breadboard
    component: Breadboard

  - id: jumper-wires
    component: Male-to-Female Jumper Wires

---


## I2C Scanner Tutorial: Find I2C Address on Arduino, ESP32 & ESP8266

An **I2C Scanner** is a small diagnostic program that scans the I2C bus and reports the address of every device that responds. It's the fastest way to **find an I2C address**, confirm the **I2C device address** of a sensor or display, and verify that your wiring is correct — before you write a single line of application code.
If you've connected an [OLED Display](/products/ssd1306-oled/), MPU6050, BME280, RTC module or another I2C device to an **Arduino**, **ESP32** or **ESP8266**, one of the first things you may need to know is its I2C address. Datasheets and tutorials list "common" addresses, but the real address on your bus can differ depending on the module, its wiring, and any address-select pins it exposes. Running a scanner removes the guesswork.
If your project reports **"No I2C devices found"**, running an I2C Scanner should usually be one of the very first troubleshooting steps.
![I2C Scanner tutorial showing Arduino Uno, ESP32, SSD1306 OLED and MPU6050 with wiring and detected I2C addresses.]({{ '/assets/images/i2c-scanner-tutorial-arduino-esp32.webp' | relative_url }})
In this tutorial you'll learn:

- What I2C communication is and how I2C addresses work
- How an I2C Scanner works, address by address
- How to wire I2C devices to Arduino Uno, ESP32 and ESP8266
- How to use the scanner code on each platform
- How to find an unknown I2C address and interpret the result
- How to troubleshoot "No I2C devices found"
- The difference between 7-bit and 8-bit I2C addresses
- Common I2C addresses for popular modules

---

## I2C Scanner Quick Start

**Short on time? Here's the fastest path to a detected address:**

1. Connect **VCC** and **GND** to the correct voltage for your module.
2. Connect **SDA** and **SCL** to your board's I2C pins.
3. Upload the scanner sketch (full code below).
4. Open the **Serial Monitor**.
5. Set the baud rate to **115200**.
6. Read the hexadecimal address reported, e.g. `Found device at 0x3C`.

That hexadecimal value is the I2C address you'll use in your application code (for example, in `display.begin(SSD1306_SWITCHCAPVCC, 0x3C)`). The full scanner code, a line-by-line explanation, and platform-specific wiring for Arduino, ESP32 and ESP8266 are covered in detail below.

---

## What Is I2C?

I2C (Inter-Integrated Circuit) is a communication protocol commonly used to connect sensors, displays and other peripherals to microcontrollers.
Instead of requiring separate communication lines for every device, I2C allows multiple devices to share the same bus using two main signal lines:

- **SDA (Serial Data)**
- **SCL (Serial Clock)**

Multiple sensors, displays and modules can therefore communicate with the same microcontroller using the same SDA and SCL connections.
Popular I2C devices include:

- [**SSD1306 OLED Display**](/products/ssd1306-oled/)
- MPU6050 accelerometer and gyroscope
- BMA400 accelerometer
- BME280 environmental sensor
- BMP280 pressure sensor
- DS3231 Real Time Clock
- PCF8574 I/O expander
- ADS1115 Analog-to-Digital Converter
- LCD displays with I2C backpack

Each device normally needs a unique I2C address on the bus.

---

## How I2C Addresses Work

Every I2C device uses an address that identifies it on the bus.
Addresses are normally written in hexadecimal, such as:

```
0x3C
0x68
0x76

```

For example, an SSD1306 OLED commonly uses `0x3C`, while an MPU6050 commonly uses `0x68`.
However, the actual address can vary depending on the module and its hardware configuration. Some devices provide address pins or solder jumpers that allow the address to be changed.
This is why using an **I2C Scanner** is often more reliable than simply assuming the address from a tutorial or datasheet.

---

## Why Use an I2C Scanner?

An I2C Scanner automatically checks the I2C bus for responding devices. It can help you:

- Find the I2C address of an unknown device
- Verify SDA and SCL wiring
- Confirm that an I2C device is powered
- Detect multiple I2C devices on the same bus
- Troubleshoot communication problems
- Check a new sensor before writing application code

For example, if an SSD1306 OLED does not display anything, one of the first questions to answer is:

> Is the OLED actually responding on the I2C bus?

The scanner can answer that in seconds.

---

## Required Hardware

{% include required-hardware.html products=page.required_hardware %}
The scanner itself does not require a specific sensor. You can use it with almost any compatible I2C module.

---

## Wiring the I2C Bus

I2C devices normally require four connections:

- VCC
- GND
- SDA
- SCL

When multiple I2C devices are used, the SDA and SCL lines can normally be shared between them. However, always check the voltage requirements of the specific breakout board.
**Important:** many modern sensors use 3.3 V logic and are not 5 V tolerant. Do not connect 5 V I2C signals directly to a 3.3 V-only device unless the module provides appropriate level shifting.

---

## Arduino I2C Scanner

![Arduino Uno I2C wiring showing A4 as SDA and A5 as SCL.]({{ '/assets/images/mpu6050-wiring.webp' | relative_url }})
On an **Arduino Uno**, the I2C pins are fixed:

| Arduino Uno | I2C Device |
|------------|------------|
| 5V or appropriate module supply | VCC |
| GND                             | GND |
| A4                              | SDA |
| A5                              | SCL |

**A4 is SDA** and **A5 is SCL**. The correct supply voltage depends on the I2C module — always check the module documentation before connecting it to 5 V.
To use the scanner, simply upload the sketch from the [I2C Scanner Code](#arduino--esp32-i2c-scanner-code) section below with no changes; the default `Wire.begin()` call already uses A4/A5 on Uno-compatible boards. Other Arduino boards (Mega, Leonardo, Nano) may use different physical I2C pins, so check your board's pinout before wiring.
**Common Arduino I2C mistakes:**

- Swapping SDA and SCL
- Forgetting a common GND between the Arduino and the module
- Using a 5 V-only module with a 3.3 V sensor, or vice versa, without level shifting

---

## ESP32 I2C Scanner

![ESP32 I2C wiring showing GPIO21 as SDA and GPIO22 as SCL.]({{ '/assets/images/Pinout-and-wiring-diagram-of-the-ESP32-with-I2C-OLED-display.webp' | relative_url }})
A typical **ESP32** development board uses:

| ESP32 | I2C Device |
|------|------------|
| 3.3V            | VCC |
| GND             | GND |
| GPIO21          | SDA |
| GPIO22          | SCL |

**GPIO21 and GPIO22 are common defaults on many ESP32 development boards**, but they are not fixed in hardware the way A4/A5 are on the Uno. The ESP32 can use other GPIO pins for I2C when they are configured explicitly in software.
If you want to use different I2C pins on the ESP32, initialize them explicitly:

```
Wire.begin(21, 22);

```

Replace `21` and `22` with the SDA and SCL GPIO pins used by your project.
The scanner can detect devices such as SSD1306 OLED, MPU6050, BMA400, BME280, DS3231 and ADS1115 on an ESP32 without any code changes beyond the pin configuration above.
**Common ESP32 I2C mistakes:**

- Assuming GPIO21/GPIO22 on every board — some ESP32 variants and dev-board designs remap these pins
- Powering a 3.3 V-only sensor from a 5 V pin
- Forgetting to call `Wire.begin(SDA, SCL)` when using non-default pins

---

## ESP8266 I2C Scanner

The **ESP8266** also supports I2C, but unlike the Arduino Uno or a typical ESP32 board, there is no single universal SDA/SCL pin pair — the pins depend on the specific ESP8266 board (NodeMCU, Wemos D1 Mini, bare ESP-01, etc.) and how your code configures them.
For this reason, do not automatically reuse the ESP32 GPIO21/GPIO22 configuration with an ESP8266.
When using custom pins, initialize the Wire library with the pins you are actually using:

```
Wire.begin(SDA_PIN, SCL_PIN);

```

Make sure the physical wiring matches the pins configured in your code, and check your specific ESP8266 board's pinout diagram before wiring an I2C device.
**Common ESP8266 I2C mistakes:**

- Reusing an ESP32 or Arduino pin mapping without checking the board's actual pinout
- Wiring to pins that are also used for boot mode selection on some ESP8266 boards
- Omitting `Wire.begin(SDA_PIN, SCL_PIN)` and relying on defaults that don't match the wiring

---

## Before Running the I2C Scanner

Before uploading the scanner sketch, check:

- SDA is connected to SDA.
- SCL is connected to SCL.
- VCC is connected to the correct voltage.
- GND is connected correctly.
- The USB cable supports data.
- The correct board is selected in Arduino IDE.
- The correct COM port is selected.
- The module actually supports I2C.
- The selected SDA and SCL pins match your board.
- There are no address conflicts between connected devices.

These checks can eliminate many common I2C problems before you start debugging the software.

---

## Arduino & ESP32 I2C Scanner Code

The following I2C Scanner uses the Arduino **Wire library** and can be used with many Arduino-compatible boards, including Arduino Uno, Nano, Mega, ESP32 and ESP8266. It scans the standard I2C address range and reports every device that acknowledges the communication request.

```
/*
   Embedded Nerd
   I2C Scanner Tutorial
   https://embeddednerd.com
*/

#include <Wire.h>

void setup() {

  Wire.begin();

  Serial.begin(115200);

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

## How the I2C Scanner Works

`#include <Wire.h>` pulls in the Arduino I2C library, which handles the low-level SDA/SCL signalling so the sketch can talk to the bus using simple function calls.
The main scanning loop is:

```
for (address = 1; address < 127; address++)

```

This checks the commonly used **7-bit I2C address range**. The scan starts at `1` rather than `0` because `0x00` is reserved for special I2C addressing and is not used as a normal device address. It stops before `127` (`0x7F`); the upper end of the 7-bit address space also contains reserved values. Scanning `1` through `126` therefore covers the range normally checked by I2C scanner sketches.
For each address, the scanner starts a transmission:

```
Wire.beginTransmission(address);

```

This queues a communication attempt to that specific address without sending any data yet.
It then ends the transmission:

```
error = Wire.endTransmission();

```

`Wire.endTransmission()` actually sends the address on the bus and returns a status code describing what happened:

- **`0`** — the device acknowledged the address. A device is present and responding.
- **`4`** — an unknown/other error occurred while communicating with that address.
- Other non-zero values (not specifically handled in this sketch) generally indicate issues such as a busy bus or a NACK on data — but `0` is the only value that confirms a device is present.

If a device acknowledges the address, the scanner prints it, for example:

```
Found device at 0x3C

```

This means an I2C device responded at address `0x3C`.
If the loop finishes and no address returned `0`, the scanner prints:

```
No I2C devices found.

```

This means that no device acknowledged any of the addresses tested by the scanner. Common causes include wiring, power, incorrect SDA/SCL pins, missing pull-ups, address configuration, or an incompatible interface. See the [troubleshooting section](#no-i2c-devices-found-troubleshooting) below.
An **"Unknown error"** message means the scanner received a generic error status that this sketch does not handle specifically. If it appears consistently, check the wiring, power, pull-ups, pin configuration and overall bus condition.

---

## Running the I2C Scanner

Open the Arduino IDE.
Select your board:
**Tools > Board**
Select the correct serial port:
**Tools > Port**
Upload the scanner sketch.
Once the upload is complete, open:
**Tools > Serial Monitor**
Set the baud rate to:

```
115200

```

The scanner will then begin checking the I2C bus every 5 seconds.

---

## Example I2C Scanner Output

If an SSD1306 OLED and MPU6050 are connected, you might see:

```
----------------------------
Embedded Nerd I2C Scanner
----------------------------

Scanning I2C bus...

Found device at 0x3C

Found device at 0x68

2 device(s) detected.

Scan complete.
----------------------------

```

This means two devices responded. `0x3C` is commonly used by SSD1306 OLED displays, and `0x68` is commonly used by the MPU6050.

---

## How to Find the I2C Address of a Device

**Connect the device to SDA, SCL, VCC and GND, upload the I2C Scanner, open the Serial Monitor, and note the hexadecimal address reported by the scanner.**
In more detail:

1. Wire the device's VCC, GND, SDA and SCL pins to your board (see the platform sections above).
2. Upload the [scanner sketch](#arduino--esp32-i2c-scanner-code).
3. Open the Serial Monitor at 115200 baud.
4. Read the reported line, for example: `Found device at 0x3C`.
5. Use `0x3C` as the I2C address in your application code.

Common addresses listed in datasheets and tutorials are a useful starting point, but they are **not guaranteed** — always check the address the scanner actually reports against the module's documentation, especially if the module has address-select pins or jumpers.
Found an unknown I2C address? Use the Embedded Nerd [**I2C Address Lookup Tool**](/tools/i2c-address-lookup/) to check which devices are commonly associated with that address.

---

## 7-Bit vs 8-Bit I2C Addresses

I2C addresses can be a source of confusion because they're sometimes written two different ways:

- **7-bit address** — the format used by the Arduino Wire library and the scanner in this tutorial (e.g. `0x3C`). This is the value the scanner reports.
- **8-bit address** — some datasheets and libraries list an address that already includes the read/write bit shifted in, which makes the number look different (often roughly double the 7-bit value, plus a read/write bit).

If a datasheet's address doesn't match what the scanner reports, check whether the datasheet is using 8-bit notation — dividing that value by 2 (dropping the read/write bit) will usually get you back to the 7-bit address the Wire library expects. When in doubt, trust the address your I2C Scanner actually detects on your bus.

---

## Common I2C Device Addresses

The following table lists common addresses found on popular Arduino and ESP32 modules. **These are common addresses, not guaranteed ones** — the same address can be shared by unrelated device families, and a single address does not uniquely identify a specific component. Always confirm with the scanner and the module's documentation.

| Device | Common Address |
|--------|----------------|
| SSD1306 OLED         | 0x3C / 0x3D |
| SH1106 OLED          | 0x3C        |
| MPU6050              | 0x68 / 0x69 |
| BMA400               | 0x14 / 0x15 |
| BME280               | 0x76 / 0x77 |
| BMP280               | 0x76 / 0x77 |
| DS3231 RTC           | 0x68        |
| DS1307 RTC           | 0x68        |
| PCF8574              | 0x20–0x27   |
| PCF8574A             | 0x38–0x3F   |
| MCP23017             | 0x20–0x27   |
| ADS1115              | 0x48        |
| INA219               | 0x40        |
| BH1750               | 0x23        |
| VL53L0X              | 0x29        |
| PCA9685              | 0x40        |
| SHT31                | 0x44        |

You can also use our [**I2C Address Lookup Tool**](/tools/i2c-address-lookup/) to quickly check which device typically matches a given I2C address.

---

## No I2C Devices Found: Troubleshooting

If the Serial Monitor reports `No I2C devices found.`, don't immediately assume the module is faulty. Work through the checks below in order.

| Problem | Possible cause | What to check |
|---------|----------------|---------------|
| No response at any address              | VCC not connected                     | Confirm the module is receiving power at the correct voltage                                    |
| No response at any address              | GND not connected                     | Confirm a common ground between the board and the module                                        |
| No response at any address              | SDA/SCL swapped                       | Verify SDA goes to SDA and SCL goes to SCL                                                      |
| No response at any address              | Wrong pins configured in software     | Check that `Wire.begin()`/`Wire.begin(SDA, SCL)` matches the physical wiring                    |
| No response, multiple modules connected | Address conflict or bus loading issue | Disconnect all but one device and retest                                                        |
| No response despite correct wiring      | Missing pull-up resistors             | Confirm pull-ups exist on SDA and SCL (many breakout boards include them; bare sensors may not) |
| No response, board-specific             | Board uses non-standard I2C pins      | Check your exact board's pinout diagram (especially on ESP8266 boards)                          |
| No response, high-current setup         | Too many pull-ups in parallel         | Reduce the number of boards with onboard pull-ups on the same bus                               |
| No response ever                        | Module doesn't use I2C                | Confirm the module actually communicates over I2C and not SPI or another protocol               |
| No response, 3.3V/5V mismatch           | Logic-level incompatibility           | Check whether the module needs 3.3 V-only logic and add level shifting if mixing with 5 V       |

**Recommended troubleshooting sequence:**

1. Disconnect all I2C devices.
2. Connect only one device.
3. Check VCC and GND.
4. Check SDA and SCL wiring.
5. Verify the correct I2C pins for your board.
6. Upload the scanner again.
7. Open the Serial Monitor at 115200 baud.
8. Check whether the device is detected.
9. If it works, reconnect the other devices one at a time.

Testing one device at a time is usually much faster than trying to troubleshoot several modules simultaneously.

---

## I2C Scanner Finds the Device but My Code Doesn't

If the scanner reports:

```
Found device at 0x3C

```

but your application still cannot communicate with the device, it's important to understand the distinction: the scanner only confirms that **something is responding on the bus at that address** — it does not confirm that your application is using the same address, the same library configuration, or that the device is behaving as expected once initialized.
First, check that your application code uses the exact address the scanner reported. For example:

```
display.begin(SSD1306_SWITCHCAPVCC, 0x3C);

```

If the scanner reports `0x3D` instead, update your code accordingly:

```
display.begin(SSD1306_SWITCHCAPVCC, 0x3D);

```

The scanner confirms that a device responds at an address, but it does not prove that the device is the exact component you expect, or that the rest of your application configuration (library version, display resolution, initialization sequence) is correct.

---

## OLED Detected but Nothing Appears

If your SSD1306 OLED is detected by the scanner but the display remains blank, check:

- I2C address
- Display resolution
- Display library
- Initialization code
- SDA and SCL wiring
- Power supply

For example:

```
display.begin(SSD1306_SWITCHCAPVCC, 0x3C);

```

If the scanner reports `0x3D`, change the address accordingly.
You can then troubleshoot the OLED application separately from the I2C connection. See our [**ESP32 OLED Tutorial: Wiring, Code & Display Guide**](/esp32-oled-tutorial-wiring-code-display-guide/) for a complete OLED example.

---

## Multiple I2C Devices on the Same Bus

One of the main advantages of I2C is that multiple devices can share the same SDA and SCL bus, as long as each device uses a unique address.
For example:

| Device | Address |
|--------|---------|
| SSD1306 OLED  | 0x3C |
| MPU6050       | 0x68 |
| BMA400        | 0x14 |

All three can use the same SDA and SCL lines when their addresses and electrical requirements are compatible. This makes I2C useful for projects such as an ESP32 motion monitor combining an accelerometer and an OLED display.

### What If Two I2C Devices Have the Same Address?

Two devices that both respond to the same address can cause communication conflicts, because the microcontroller cannot independently select between them using only that address.
Possible solutions include:

- Change one device's address if the module provides an address-select pin or jumper.
- Use an address-selection jumper where available.
- Use an I2C multiplexer such as the **TCA9548A** to put each device on its own logical channel.
- Use separate I2C buses when your microcontroller supports more than one.

Always check the device documentation before changing an address.

---

## I2C Scanner for MPU6050

An I2C Scanner is particularly useful when setting up an MPU6050. The MPU6050 commonly responds at `0x68` or `0x69`, depending on the AD0 pin configuration.
If the scanner cannot detect your MPU6050, check the wiring and power supply before troubleshooting your sensor code. Once the sensor is detected, continue with our [**MPU6050 Arduino Guide**](/mpu6050-arduino-guide/). If you need to calibrate the sensor, see our [**MPU6050 Calibration Guide**](/mpu6050-calibration-guide/).

---

## I2C Scanner for BMA400

The BMA400 accelerometer can also be tested with an I2C Scanner. Depending on the hardware configuration, the BMA400 can use `0x14` or `0x15`.
Once the BMA400 is detected, you can continue with our [**BMA400 ESP32 Tutorial**](/bma400-esp32-tutorial-wiring-code-arduino-guide/).

---

## I2C Scanner for SSD1306 OLED

SSD1306 OLED displays commonly use `0x3C`, although some modules use `0x3D`.
If the scanner detects your OLED, use the detected address in your display initialization code, then continue with our [**ESP32 OLED Tutorial: Wiring, Code & Display Guide**](/esp32-oled-tutorial-wiring-code-display-guide/).

---

## I2C Scanner vs I2C Address Lookup Tool

These two tools answer different questions, and it helps to know which one you need:
**I2C Scanner** — *"Which addresses are responding on my physical bus, right now?"* It's the sketch in this tutorial, and it only tells you about the actual hardware connected to your board.
[**I2C Address Lookup Tool**](/tools/i2c-address-lookup/) — *"What devices commonly use this address?"* Once the scanner reports a hexadecimal address, the lookup tool helps you narrow down which component families are typically associated with it — useful when you've inherited a board, salvaged a module, or lost the datasheet.
Used together: run the scanner first to get a real address from your hardware, then use the lookup tool to help identify what that address is likely to be.

---

## Why Every Arduino and ESP32 Maker Should Keep an I2C Scanner

An I2C Scanner is a small utility, but it can save a significant amount of debugging time. It helps answer three important questions:

1. **Is my I2C device responding?**
2. **What address is it using?**
3. **Is the problem likely hardware or application code?**

Keeping an I2C Scanner sketch available is especially useful when experimenting with new sensors, displays and breakout boards.

---

## GitHub Source Code

The complete I2C Scanner sketch is available in the Embedded Nerd GitHub repository.
Keeping the scanner code available as a standalone utility makes it easy to reuse whenever you connect a new I2C sensor, display or module.

---

## Related Tutorials

If you're working with I2C devices, these Embedded Nerd tutorials may also be useful:

- [**MPU6050 Arduino Guide**](/mpu6050-arduino-guide/)
- [**MPU6050 Calibration Guide**](/mpu6050-calibration-guide/)
- [**BMA400 ESP32 Tutorial**](/bma400-esp32-tutorial-wiring-code-arduino-guide/)
- [**ESP32 OLED Tutorial: Wiring, Code & Display Guide**](/esp32-oled-tutorial-wiring-code-display-guide/)
- [**I2C Address Lookup Tool**](/tools/i2c-address-lookup/)

An I2C Scanner is particularly useful before starting these projects because it lets you confirm that the hardware is visible on the I2C bus first.

---

## Frequently Asked Questions

### What is an I2C Scanner?

An I2C Scanner is a small program that checks I2C addresses and reports devices that respond on the bus. It is commonly used to identify unknown I2C addresses and troubleshoot communication problems.

### How do I find the I2C address of a device?

Connect the device to your Arduino, ESP32 or ESP8266, upload an I2C Scanner and open the Serial Monitor. The scanner will display the address of every responding device, for example: `Found device at 0x3C`.

### Does an I2C Scanner work with Arduino?

Yes. The Arduino Uno uses A4 for SDA and A5 for SCL. Other Arduino boards may use different I2C pins.

### Does an I2C Scanner work with ESP32?

Yes. A typical ESP32 DevKit uses GPIO21 for SDA and GPIO22 for SCL. If you use different pins, configure them explicitly with `Wire.begin(SDA, SCL)`.

### Does an I2C Scanner work with ESP8266?

Yes. The Wire library can be used with ESP8266 boards, but the SDA and SCL pins depend on the specific board and software configuration, so there's no single universal pin mapping.

### What does an I2C Scanner show?

For each address that responds, it prints a line such as `Found device at 0x3C`, and finishes with either a device count or `No I2C devices found.` if nothing responded.

### Why does my I2C Scanner find no devices?

Check SDA and SCL wiring, power supply, GND connection, selected I2C pins, pull-up resistors, board configuration and device compatibility. Testing one I2C device at a time can help identify the problem.

### What is the I2C address of an SSD1306?

SSD1306 OLED modules commonly use `0x3C`, and sometimes `0x3D`. Always confirm with the scanner rather than assuming.

### What is the I2C address of an MPU6050?

The MPU6050 commonly responds at `0x68`, or `0x69` depending on the AD0 pin configuration.

### Can multiple I2C devices share the same SDA and SCL pins?

Yes. Multiple I2C devices can share the same bus as long as their addresses do not conflict and the electrical characteristics of the bus are suitable.

### Can two I2C devices have the same address?

They can be connected physically, but if both devices respond to the same address, the microcontroller cannot independently select them using that address. You may need to change one device's address or use an I2C multiplexer such as the TCA9548A.

### What is the difference between 7-bit and 8-bit I2C addresses?

The Arduino Wire library and this scanner use the 7-bit address format (e.g. `0x3C`). Some datasheets list an 8-bit value that includes the read/write bit; dividing that value by 2 typically gives the 7-bit address the scanner will report.

---

## Conclusion

An **I2C Scanner** is one of the simplest and most useful tools for Arduino, ESP32 and ESP8266 development. It can quickly identify I2C device addresses, verify that hardware is responding and help diagnose wiring and communication problems.
Whether you're connecting an **SSD1306 OLED, MPU6050, BMA400, BME280, RTC or another I2C peripheral**, running an I2C Scanner is often the best first step before debugging the application itself. Once you have a confirmed address, the [**I2C Address Lookup Tool**](/tools/i2c-address-lookup/) can help you double-check what it's commonly associated with.
Keep this small utility in your Arduino toolkit and use it whenever an I2C device isn't behaving as expected.
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is an I2C Scanner?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "An I2C Scanner is a small program that checks I2C addresses and reports devices that respond on the bus. It is commonly used to identify unknown I2C addresses and troubleshoot communication problems."
      }
    },
    {
      "@type": "Question",
      "name": "How do I find the I2C address of a device?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Connect the device to your Arduino, ESP32 or ESP8266, upload an I2C Scanner and open the Serial Monitor. The scanner will display the address of every responding device, for example: Found device at 0x3C."
      }
    },
    {
      "@type": "Question",
      "name": "Does an I2C Scanner work with Arduino?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. The Arduino Uno uses A4 for SDA and A5 for SCL. Other Arduino boards may use different I2C pins."
      }
    },
    {
      "@type": "Question",
      "name": "Does an I2C Scanner work with ESP32?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. A typical ESP32 DevKit uses GPIO21 for SDA and GPIO22 for SCL. If you use different pins, configure them explicitly with Wire.begin(SDA, SCL)."
      }
    },
    {
      "@type": "Question",
      "name": "Does an I2C Scanner work with ESP8266?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. The Wire library can be used with ESP8266 boards, but the SDA and SCL pins depend on the specific board and software configuration, so there's no single universal pin mapping."
      }
    },
    {
      "@type": "Question",
      "name": "What does an I2C Scanner show?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "For each address that responds, it prints a line such as Found device at 0x3C, and finishes with either a device count or No I2C devices found. if nothing responded."
      }
    },
    {
      "@type": "Question",
      "name": "Why does my I2C Scanner find no devices?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Check SDA and SCL wiring, power supply, GND connection, selected I2C pins, pull-up resistors, board configuration and device compatibility. Testing one I2C device at a time can help identify the problem."
      }
    },
    {
      "@type": "Question",
      "name": "What is the I2C address of an SSD1306?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "SSD1306 OLED modules commonly use 0x3C, and sometimes 0x3D. Always confirm with the scanner rather than assuming."
      }
    },
    {
      "@type": "Question",
      "name": "What is the I2C address of an MPU6050?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The MPU6050 commonly responds at 0x68, or 0x69 depending on the AD0 pin configuration."
      }
    },
    {
      "@type": "Question",
      "name": "Can multiple I2C devices share the same SDA and SCL pins?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. Multiple I2C devices can share the same bus as long as their addresses do not conflict and the electrical characteristics of the bus are suitable."
      }
    },
    {
      "@type": "Question",
      "name": "Can two I2C devices have the same address?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "They can be connected physically, but if both devices respond to the same address, the microcontroller cannot independently select them using that address. You may need to change one device's address or use an I2C multiplexer such as the TCA9548A."
      }
    },
    {
      "@type": "Question",
      "name": "What is the difference between 7-bit and 8-bit I2C addresses?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The Arduino Wire library and this scanner use the 7-bit address format, such as 0x3C. Some datasheets list an 8-bit value that includes the read/write bit; dividing that value by 2 typically gives the 7-bit address the scanner will report."
      }
    }
  ]
}
</script>
