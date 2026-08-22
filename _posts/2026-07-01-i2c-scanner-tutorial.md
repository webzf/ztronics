---

title: "I2C Scanner Tutorial: Find I2C Address on Arduino, ESP32 & ESP8266"

howto: true

layout: single
permalink: /i2c-scanner-tutorial/

sidebar:
nav: "embedded"

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

I2C Scanner Tutorial: Find I2C Address on Arduino, ESP32 & ESP8266

If you've connected an OLED display, MPU6050, BME280, RTC module or another I2C device to an Arduino, ESP32 or ESP8266, one of the first things you need to know is its I2C address.

An I2C Scanner is a simple diagnostic program that scans the I2C bus and reports the addresses of devices that respond.

It is one of the most useful tools for troubleshooting Arduino and ESP32 projects because it can quickly tell you whether an I2C device is being detected.

Whether you're trying to find an unknown I2C address, checking your wiring, or troubleshooting a message such as "No I2C devices found", running an I2C Scanner should usually be one of your first steps.

![I2C Scanner tutorial showing Arduino, ESP32, SSD1306 OLED and MPU6050 with detected I2C addresses.]({{ '/assets/images/i2c-scanner-tutorial-arduino-esp32.webp' | relative_url }})

In this tutorial you'll learn:

- What I2C communication is
- How I2C addresses work
- How an I2C Scanner works
- How to wire I2C devices to Arduino Uno
- How to use an I2C Scanner with ESP32
- How to use an I2C Scanner with ESP8266
- How to find an unknown I2C address
- How to interpret scanner results
- How to fix "No I2C devices found"
- Common I2C addresses for popular modules

---

What Is I2C?

I2C, short for Inter-Integrated Circuit, is a communication protocol commonly used to connect sensors, displays and other peripherals to microcontrollers.

I2C normally uses two signal lines:

- SDA — Serial Data
- SCL — Serial Clock

Multiple I2C devices can share the same SDA and SCL bus, provided that their addresses do not conflict.

This makes I2C particularly useful for projects containing several sensors and modules.

Popular I2C devices include:

- [SSD1306 OLED Display](/products/ssd1306-oled/)
- MPU6050 accelerometer and gyroscope
- BME280 environmental sensor
- BMP280 pressure sensor
- DS3231 Real Time Clock
- PCF8574 I/O expander
- ADS1115 ADC
- LCD displays with I2C backpack
- BMA400 accelerometer

---

How I2C Addresses Work

Each I2C device communicates using an address on the bus.

Addresses are normally written in hexadecimal, for example:

0x3C
0x68
0x76

When the microcontroller wants to communicate with a device, it uses that address.

For example, an SSD1306 OLED commonly uses "0x3C", while an MPU6050 commonly uses "0x68".

However, the exact address can vary depending on the module configuration.

Some devices have address pins or solder jumpers that allow the address to be changed.

This is why you should scan the bus instead of assuming the address.

---

Why Use an I2C Scanner?

An I2C Scanner checks the I2C bus for devices that respond to communication requests.

It can help you:

- Find an unknown I2C address
- Verify SDA and SCL wiring
- Confirm that a device is powered
- Detect multiple I2C devices
- Troubleshoot communication problems
- Check whether a new sensor is visible to the microcontroller

For example, if an SSD1306 OLED does not display anything, the first useful question is:

«Can the ESP32 or Arduino detect the OLED on the I2C bus?»

An I2C Scanner can answer that in seconds.

---

Required Hardware

{% include required-hardware.html products=page.required_hardware %}

You can also use the scanner with almost any Arduino-compatible I2C device. The hardware required depends on the board and module you are testing.

---

I2C Wiring

I2C devices normally require:

- VCC
- GND
- SDA
- SCL

When several I2C devices are connected, SDA and SCL can normally be shared between them.

However, always check the voltage requirements of the module before connecting it.

Important: not every I2C module is 5 V tolerant. Many sensors are designed for 3.3 V operation. If your module is not 5 V tolerant, do not connect a 5 V I2C signal directly to it.

---

Arduino Uno I2C Wiring

![Arduino Uno I2C wiring showing SDA on A4 and SCL on A5.]({{ '/assets/images/mpu6050-wiring.webp' | relative_url }})

Arduino Uno| I2C Device
5V or appropriate module supply| VCC
GND| GND
A4| SDA
A5| SCL

The Arduino Uno uses A4 for SDA and A5 for SCL.

Before connecting a sensor, check whether its breakout board supports 5 V or requires 3.3 V.

---

ESP32 I2C Wiring

![ESP32 I2C wiring showing GPIO21 as SDA and GPIO22 as SCL.]({{ '/assets/images/Pinout-and-wiring-diagram-of-the-ESP32-with-I2C-OLED-display.webp' | relative_url }})

A typical ESP32 DevKit configuration uses:

ESP32| I2C Device
3.3V| VCC
GND| GND
GPIO21| SDA
GPIO22| SCL

GPIO21 and GPIO22 are commonly used as the default I2C pins on ESP32 development boards, although I2C pins can be configured differently in software.

---

ESP8266 I2C Wiring

ESP8266 boards can also use I2C, but the SDA and SCL pins depend on the board and software configuration.

For this reason, do not assume that ESP8266 uses the same pins as the ESP32.

If you explicitly configure the pins in your program, use the same pins when wiring the I2C device.

---

Before Running the I2C Scanner

Before uploading the scanner sketch, check:

- SDA is connected to SDA.
- SCL is connected to SCL.
- VCC is connected to the correct voltage.
- GND is connected correctly.
- The USB cable supports data.
- The correct board is selected in Arduino IDE.
- The correct COM port is selected.
- The device is actually an I2C device.
- No other device is causing an address conflict.

These simple checks eliminate many common I2C problems.

---

Arduino, ESP32 & ESP8266 I2C Scanner Code

The following I2C Scanner uses the Arduino Wire library and works with many Arduino-compatible boards, including Arduino Uno, Nano, Mega, ESP32 and ESP8266.

'''
/*
   Embedded Nerd
   I2C Scanner Tutorial
   https://embeddednerd.com
*/

#include <Wire.h>

void setup() {

  Serial.begin(115200);
  Wire.begin();

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

      if (address < 16) {
        Serial.print("0");
      }

      Serial.println(address, HEX);

      devices++;
    }

    else if (error == 4) {

      Serial.print("Unknown error at 0x");

      if (address < 16) {
        Serial.print("0");
      }

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
'''
---

How the I2C Scanner Works

The scanner tests I2C addresses one at a time.

The main loop is:

for (address = 1; address < 127; address++)

For each address, the program attempts to start an I2C transmission:

Wire.beginTransmission(address);

It then ends the transmission:

error = Wire.endTransmission();

If the device acknowledges the request, "Wire.endTransmission()" returns "0".

The scanner then prints the address.

For example:

Found device at 0x3C

means that a device responded at address "0x3C".

---

How to Run the I2C Scanner

1. Open Arduino IDE.
2. Connect your Arduino, ESP32 or ESP8266.
3. Select the correct board.
4. Select the correct serial port.
5. Upload the scanner sketch.
6. Open Serial Monitor.
7. Set the baud rate to 115200.

The scanner will automatically check the I2C bus every five seconds.

---

Example I2C Scanner Output

If an SSD1306 OLED and MPU6050 are connected, you might see:

----------------------------
Embedded Nerd I2C Scanner
----------------------------

Scanning I2C bus...

Found device at 0x3C
Found device at 0x68

2 device(s) detected.

Scan complete.
----------------------------

This tells us that two devices responded.

"0x3C" is commonly an SSD1306 OLED address.

"0x68" is commonly used by the MPU6050.

---

ESP32 I2C Scanner

The same scanner can be used as an ESP32 I2C Scanner.

For a typical ESP32 DevKit:

GPIO21 → SDA
GPIO22 → SCL

The scanner can then detect devices such as:

- SSD1306 OLED
- MPU6050
- BMA400
- BME280
- DS3231
- ADS1115

If you use different I2C pins, initialize them explicitly:

Wire.begin(SDA_PIN, SCL_PIN);

For example:

Wire.begin(21, 22);

This can be useful when the default I2C pins are already being used by another peripheral.

---

Arduino I2C Scanner

The same program can be used as an Arduino I2C Scanner.

On an Arduino Uno, the default I2C pins are:

A4 → SDA
A5 → SCL

On other Arduino boards, the I2C pins may be different.

Always check the pinout for your specific board.

---

ESP8266 I2C Scanner

The scanner can also be used with an ESP8266.

Unlike the ESP32, the I2C pins are more dependent on the specific ESP8266 board and your software configuration.

If you configure custom pins, use:

Wire.begin(SDA_PIN, SCL_PIN);

and connect the hardware accordingly.

---

Common I2C Addresses

The following table contains common addresses found on popular Arduino and ESP32 modules.

Device| Common Address
SSD1306 OLED| 0x3C / 0x3D
SH1106 OLED| 0x3C
MPU6050| 0x68 / 0x69
BMA400| 0x14 / 0x15
BME280| 0x76 / 0x77
BMP280| 0x76 / 0x77
DS3231 RTC| 0x68
DS1307 RTC| 0x68
PCF8574| 0x20–0x27
MCP23017| 0x20–0x27
ADS1115| 0x48
INA219| 0x40
BH1750| 0x23
VL53L0X| 0x29
PCA9685| 0x40
SHT31| 0x44

These are common addresses, not guaranteed addresses. Always use the address detected by your scanner and check the module documentation.

---

What If No I2C Devices Are Found?

One of the most common scanner results is:

No I2C devices found.

If this happens, don't immediately assume that the sensor is defective.

Work through the following checks.

1. Check SDA and SCL

Make sure:

SDA → SDA
SCL → SCL

Swapping these two wires is one of the most common I2C wiring mistakes.

2. Check power

Verify:

- VCC is connected.
- GND is connected.
- The module is receiving the correct voltage.

3. Check the I2C pins

Make sure your software and wiring use the same SDA and SCL pins.

This is especially important with ESP32 and ESP8266 boards.

4. Disconnect other devices

If several modules are connected, disconnect them and test one device at a time.

5. Check pull-up resistors

I2C normally requires pull-up resistors on SDA and SCL.

Many breakout boards already include them, but not all do.

Multiple modules can also result in too many pull-up resistors being connected in parallel.

6. Check the module documentation

Some boards labelled as a particular sensor may use a different address, different voltage or even a different interface.

---

Troubleshooting "No I2C Devices Found"

If the scanner repeatedly reports:

No I2C devices found.

use this process:

Disconnect all I2C devices
          ↓
Connect one device
          ↓
Check VCC and GND
          ↓
Check SDA and SCL
          ↓
Run scanner
          ↓
Device detected?
       /      \
     YES       NO
      ↓         ↓
Continue    Check pins,
testing     voltage and
devices     pull-ups

Testing one device at a time is usually much faster than troubleshooting several modules simultaneously.

---

What If the I2C Scanner Finds the Device but My Code Doesn't?

This is an important distinction.

If the scanner reports:

Found device at 0x3C

but your application cannot communicate with the device, the physical I2C connection is at least responding at that address.

Check that your application code uses the same address.

For example:

display.begin(SSD1306_SWITCHCAPVCC, 0x3C);

If the scanner reports "0x3D", use:

display.begin(SSD1306_SWITCHCAPVCC, 0x3D);

The scanner confirms that something responds at the address, but it does not prove that the device is the exact component you expect or that the rest of your application configuration is correct.

---

OLED Detected but Nothing Appears

If your SSD1306 OLED is detected at "0x3C" but the display remains blank, check:

- OLED address
- OLED resolution
- display library
- initialization code
- SDA/SCL wiring
- power supply

For example:

display.begin(SSD1306_SWITCHCAPVCC, 0x3C);

If the scanner reports "0x3D", change the address accordingly.

You can then continue troubleshooting the display separately from the I2C connection itself.

---

Multiple I2C Devices

One of the biggest advantages of I2C is that multiple devices can share the same SDA and SCL bus.

For example:

Device| Address
SSD1306 OLED| 0x3C
MPU6050| 0x68
BMA400| 0x14

The three devices can share:

SDA
SCL

provided their addresses are compatible and the electrical characteristics of the bus are suitable.

This makes it possible to build projects such as an ESP32 motion monitor using an accelerometer and OLED on the same I2C bus.

---

What If Two Devices Have the Same I2C Address?

Two devices using the same address can cause communication conflicts.

For example, if two modules both respond at "0x68", the microcontroller cannot independently address them using only that address.

Possible solutions include:

- Change one device's address if supported
- Use an address-selection jumper
- Use an I2C multiplexer such as the TCA9548A
- Use separate I2C buses when supported by the microcontroller

Always check whether the device actually supports changing its address before attempting to modify it.

---

I2C Scanner for MPU6050

An I2C Scanner is particularly useful when setting up an MPU6050.

The MPU6050 commonly responds at:

0x68

or:

0x69

depending on the AD0 pin configuration.

If you are working with an MPU6050 and the scanner cannot detect it, check the wiring before troubleshooting the sensor code.

You can continue with our "MPU6050 Arduino Guide" (/mpu6050-arduino-guide/) once the sensor is detected.

If you are calibrating the sensor, see our "MPU6050 Calibration Guide" (/mpu6050-calibration-guide/).

---

I2C Scanner for BMA400

The BMA400 accelerometer is another useful device to test with an I2C Scanner.

The BMA400 commonly uses:

0x14

or:

0x15

depending on the address configuration.

Once the sensor is detected, you can use it with an ESP32 or Arduino.

See our "BMA400 ESP32 Tutorial" (/bma400-esp32-tutorial-wiring-code-arduino-guide/) for a complete example.

---

I2C Scanner for SSD1306 OLED

SSD1306 OLED displays commonly use:

0x3C

although some modules use:

0x3D

If the scanner detects the OLED, use the detected address in your display initialization code.

You can then continue with our "ESP32 OLED Tutorial" (/esp32-oled-tutorial-wiring-code-display-guide/).

---

Why Every Arduino and ESP32 Maker Should Keep an I2C Scanner

An I2C Scanner is a small utility, but it can save a significant amount of debugging time.

It helps answer three important questions:

1. Is my I2C device responding?
2. What address is it using?
3. Is the problem likely hardware or application code?

Keeping an I2C Scanner sketch available is especially useful when experimenting with new sensors, displays and breakout boards.

---

GitHub Source Code

The complete I2C Scanner sketch can be kept in your Arduino project repository so it is easy to reuse whenever you connect a new I2C device.

---

Related Tutorials

If you're working with I2C devices, these Embedded Nerd tutorials may also be useful:

- "MPU6050 Arduino Guide" (/mpu6050-arduino-guide/)
- "MPU6050 Calibration Guide" (/mpu6050-calibration-guide/)
- "BMA400 ESP32 Tutorial" (/bma400-esp32-tutorial-wiring-code-arduino-guide/)
- "ESP32 OLED Tutorial" (/esp32-oled-tutorial-wiring-code-display-guide/)

An I2C Scanner is particularly useful before starting any of these projects because it lets you confirm that the hardware is visible on the bus first.

---

Frequently Asked Questions

What is an I2C Scanner?

An I2C Scanner is a small program that checks I2C addresses and reports devices that respond on the bus.

It is commonly used to identify unknown I2C addresses and troubleshoot communication problems.

---

How do I find the I2C address of a device?

Connect the device to your Arduino or ESP32, upload an I2C Scanner and open the Serial Monitor.

The scanner will display the address of every responding device.

For example:

Found device at 0x3C

means that a device responded at "0x3C".

---

Does an I2C Scanner work with ESP32?

Yes.

The scanner can be used with ESP32 boards. A typical ESP32 DevKit uses GPIO21 for SDA and GPIO22 for SCL.

If you use different pins, configure them explicitly with "Wire.begin(SDA, SCL)".

---

Does an I2C Scanner work with Arduino Uno?

Yes.

The Arduino Uno uses A4 for SDA and A5 for SCL.

Other Arduino boards may use different I2C pins.

---

Does an I2C Scanner work with ESP8266?

Yes.

The same Wire library can be used with ESP8266 boards, but the SDA and SCL pins depend on the board and software configuration.

---

Why does my I2C Scanner say "No I2C devices found"?

Check:

- SDA and SCL wiring
- power supply
- GND connection
- selected I2C pins
- pull-up resistors
- board configuration
- device compatibility

Testing one I2C device at a time can help identify the problem.

---

Why does my OLED use 0x3D instead of 0x3C?

Both addresses can be used by SSD1306 OLED modules.

The exact address depends on the module configuration.

Use the address reported by the I2C Scanner.

---

Can multiple I2C devices share the same SDA and SCL pins?

Yes.

Multiple I2C devices can share the same bus as long as their addresses do not conflict and the electrical characteristics of the bus are suitable.

---

Can two I2C devices have the same address?

They can physically be connected, but if both respond to the same address, the microcontroller cannot independently select them using that address.

You may need to change one device's address or use an I2C multiplexer.

---

Conclusion

An I2C Scanner is one of the simplest and most useful tools for Arduino, ESP32 and ESP8266 development.

It can quickly identify I2C device addresses, verify that hardware is responding and help diagnose wiring and communication problems.

Whether you're connecting an SSD1306 OLED, MPU6050, BMA400, BME280, RTC or another I2C peripheral, running an I2C Scanner is often the best first step before debugging the application itself.

Keep this small utility in your Arduino toolkit and use it whenever an I2C device isn't behaving as expected.
