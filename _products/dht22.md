---

layout: product

title: "DHT22 Temperature & Humidity Sensor"

product_id: dht22

category: Sensors

manufacturer: Aosong

image: /assets/images/products/dht22.webp

header:
teaser: /assets/images/products/dht22.webp

og_image: /assets/images/products/dht22.webp

excerpt: "DHT22 digital temperature and humidity sensor with calibrated output, single-bus communication, and a wide measurement range for Arduino, ESP32, Raspberry Pi, and embedded projects."

description: "The DHT22, also known as AM2302, is a digital temperature and relative humidity sensor designed for environmental monitoring and embedded electronics projects. It provides calibrated digital measurements through a single-bus data interface and offers a wider temperature range and higher humidity accuracy than the DHT11."

categories:

- Sensors

tags:

- DHT22
- AM2302
- Temperature Sensor
- Humidity Sensor
- Arduino
- ESP32
- Raspberry Pi
- Environmental Sensor

permalink: /products/dht22/

last_modified_at: 2026-08-26

specifications:

- name: Sensor Type
  value: Digital temperature and humidity sensor

- name: Alternate Name
  value: AM2302

- name: Interface
  value: Single-bus digital

- name: Supply Voltage
  value: 3.3V to 5.5V

- name: Temperature Range
  value: -40°C to 80°C

- name: Temperature Accuracy
  value: ±0.5°C typical

- name: Temperature Resolution
  value: 0.1°C

- name: Humidity Range
  value: 0% to 99.9% RH

- name: Humidity Accuracy
  value: ±2% RH typical

- name: Humidity Resolution
  value: 0.1% RH

- name: Sampling Period
  value: 2 seconds

links:

- title: "AM2302 Technical Manual"
  icon: fas fa-book
  description: "Official Aosong technical manual for the AM2302 temperature and humidity sensor."
  url: https://www.aosong.com/uploadfiles/2025/04/20250417105409216.pdf

- title: "Aosong AM2302 Product Page"
  icon: fas fa-external-link-alt
  description: "Official Aosong product information for the AM2302 temperature and humidity sensor module."
  url: https://www.aosong.com/en/Products/info.aspx?itemid=2294

- title: "Adafruit DHT Sensor Library"
  icon: fab fa-github
  description: "Arduino library supporting DHT22 and other DHT-series temperature and humidity sensors."
  url: https://github.com/adafruit/DHT-sensor-library

related:

- esp32-devkit-v1
- solderless-breadboard
- jumper-wires
- ssd1306-oled

---

The DHT22 is a digital temperature and relative humidity sensor commonly used in Arduino, ESP32, Raspberry Pi, and other embedded electronics projects. It is also known as the AM2302.

The sensor combines a capacitive humidity sensing element, a temperature sensing element, internal signal processing, and calibrated digital output. Instead of providing an analog voltage that the microcontroller must convert, the DHT22 sends the measured temperature and humidity through a single digital data line.

Its relatively wide temperature range and approximately ±2% RH typical humidity accuracy make it useful for environmental monitoring, data logging, IoT prototypes, automation, and educational electronics.

Key Features

- Digital temperature and relative humidity measurement
- Also known as AM2302
- Single-bus digital communication
- Calibrated digital output
- Temperature measurement from -40°C to 80°C
- Humidity measurement from 0% to 99.9% RH
- 0.1°C temperature resolution
- 0.1% RH humidity resolution
- Typical temperature accuracy of ±0.5°C
- Typical humidity accuracy of ±2% RH
- 3.3V to 5.5V supply voltage
- Maximum measurement rate of approximately one reading every 2 seconds

The exact electrical implementation can vary between the bare DHT22 sensor and different breakout boards, so the documentation for the particular module should always be checked before wiring it.

Applications

The DHT22 is suitable for applications such as:

- Environmental monitoring
- IoT sensor nodes
- Weather stations
- Temperature and humidity data logging
- Home automation
- Greenhouse monitoring
- Robotics projects
- Embedded environmental sensors
- Educational electronics
- ESP32 monitoring projects
- Arduino sensor projects

The sensor is particularly useful when a project needs both temperature and humidity measurements without requiring separate sensors.

Pinout

A standard four-pin DHT22 sensor uses the following pin assignment:

Pin| Connection| Description
1| VCC| Power supply
2| DATA| Digital single-bus data signal
3| NC| Not connected
4| GND| Ground

Some DHT22 products are supplied as breakout boards or wired AM2302 modules. Those versions can expose the connections differently, so check the specific module before making the connection.

The DATA line requires the appropriate pull-up arrangement for the particular sensor or module. Some ready-made modules include the required resistor on the board.

How It Works

The DHT22 measures two environmental parameters internally:

- Relative humidity using a capacitive humidity sensing element
- Temperature using a temperature sensing element

The sensor processes these measurements internally and sends the resulting data digitally to the host microcontroller.

Communication takes place over a single data line using the DHT-series timing protocol. The host initiates a measurement request, after which the DHT22 responds with a digital data frame containing the humidity and temperature information.

The DHT22 is not compatible with the Dallas 1-Wire protocol, despite using a single data wire.

Because the sensor has a sampling period of approximately 2 seconds, it should not be polled continuously at a higher rate.

Compatible Boards

The DHT22 can be used with many microcontroller and single-board computer platforms when their electrical interface and software support are suitable.

Arduino

Arduino boards are a common platform for DHT22 projects. The sensor can be connected to a digital GPIO and read using a suitable DHT library.

ESP32

The DHT22 can be connected to an ESP32 digital GPIO. Since the sensor supports a 3.3V supply, it can be used directly with the ESP32 when wired according to the sensor and breakout-board requirements.

The ESP32 is particularly useful for DHT22 projects that transmit temperature and humidity data over Wi-Fi or Bluetooth.

Raspberry Pi

The DHT22 can also be used with Raspberry Pi GPIO hardware. Because Raspberry Pi GPIO operates at 3.3V logic, the data connection must be designed so that the GPIO is not exposed to an unsuitable voltage.

For Raspberry Pi projects, use a software library or driver that supports the DHT22 and follow the wiring requirements of the particular sensor module.

Technical Details

The DHT22 provides digital measurements with the following key characteristics:

Parameter| Specification
Sensor| DHT22 / AM2302
Interface| Single-bus digital
Supply voltage| 3.3V to 5.5V
Temperature range| -40°C to 80°C
Temperature accuracy| ±0.5°C typical
Temperature resolution| 0.1°C
Humidity range| 0% to 99.9% RH
Humidity accuracy| ±2% RH typical
Humidity resolution| 0.1% RH
Sampling period| 2 seconds

The published humidity accuracy is specified under particular test conditions, including 25°C, and actual accuracy can vary with environmental conditions.

The sensor is also temperature compensated and factory calibrated.

DHT22 Sampling Rate

One of the most important characteristics of the DHT22 is its relatively slow measurement rate.

The specified sampling period is approximately 2 seconds. This means the sensor is intended for relatively slow environmental measurements rather than high-speed temperature or humidity acquisition.

For applications such as room monitoring, weather stations, IoT nodes, or data logging, this limitation is usually acceptable.

For applications requiring rapid environmental measurements, a newer sensor with a higher measurement rate may be a better choice.

Why Choose the DHT22?

The DHT22 remains useful for projects that need a simple digital temperature and humidity sensor.

Its main advantages include:

- Simple single-data-line interface
- Calibrated digital output
- Wide temperature measurement range
- Useful humidity accuracy for hobby and educational applications
- Support from established Arduino libraries
- Compatibility with common embedded platforms
- No analog input required

Its main limitation is the relatively slow sampling rate of approximately one measurement every two seconds.

Project Ideas

The DHT22 can be used as the basis for several practical Embedded Nerd projects, including:

- ESP32 temperature and humidity monitor
- Arduino room temperature monitor
- ESP32 Wi-Fi environmental sensor
- OLED temperature and humidity display
- Environmental data logger
- Mini weather station
- Greenhouse monitoring system
- Home automation temperature and humidity sensor
- Web-based ESP32 environmental dashboard
- Temperature and humidity alarm system

A particularly useful project combination is an ESP32 + DHT22 + SSD1306 OLED, allowing temperature and humidity readings to be measured and displayed locally while the ESP32 can also provide wireless connectivity.

Documentation

The DHT22 is supported by several established software libraries.

For Arduino projects, the Adafruit DHT Sensor Library supports DHT22 and AM2302 sensors. The library can be installed through the Arduino Library Manager by searching for DHT sensor library. It also depends on the Adafruit Unified Sensor library.

For Raspberry Pi and CircuitPython-based projects, Adafruit provides a dedicated CircuitPython DHT driver supporting DHT22 devices.

The most important technical reference is the Aosong AM2302 Technical Manual, which documents the electrical characteristics, measurement performance, communication protocol, and timing requirements.

Related Products

The DHT22 works well with several existing Embedded Nerd products.

For wireless environmental monitoring, the "ESP32 DevKit V1" (/products/esp32-devkit/) provides a suitable development platform with built-in wireless connectivity.

For prototyping the circuit, a "Solderless Breadboard" (/products/solderless-breadboard/) and "Jumper Wires" (/products/jumper-wires/) can be used to connect the sensor to the development board.

An "SSD1306 OLED Display" (/products/ssd1306-oled/) can be added to display temperature and humidity readings locally.

Related Tutorials

The existing "ESP32 OLED Tutorial: Wiring, Code & Display Guide" (/esp32-oled-tutorial-wiring-code-display-guide/) includes an example of displaying sensor data such as DHT22 temperature and humidity readings on an SSD1306 OLED.

This makes the DHT22 a natural sensor to combine with the Embedded Nerd OLED and ESP32 ecosystem.

Frequently Asked Questions

What is a DHT22 sensor?

The DHT22 is a digital sensor that measures temperature and relative humidity. It is also commonly identified as the AM2302.

Is the DHT22 compatible with Arduino?

Yes. The DHT22 can be connected to an Arduino digital pin and read using a suitable DHT sensor library, such as the Adafruit DHT Sensor Library.

Can I use the DHT22 with an ESP32?

Yes. The DHT22 supports a 3.3V supply and uses a digital single-bus interface, making it suitable for ESP32 projects when wired according to the sensor or breakout-board requirements.

Can the DHT22 be used with Raspberry Pi?

Yes. The DHT22 can be connected to Raspberry Pi GPIO hardware, provided the data signal is kept within the GPIO's electrical limits and an appropriate software driver is used.

What voltage does the DHT22 require?

The AM2302 technical documentation specifies a supply voltage from 3.3V to 5.5V. Individual breakout boards can have different electrical implementations, so the module documentation should be checked before wiring it.

What is the DHT22 pinout?

A standard four-pin DHT22 uses VCC, DATA, NC, and GND. Pin 1 is VCC, pin 2 is DATA, pin 3 is not connected, and pin 4 is GND.

How often can the DHT22 be read?

The specified sampling period is approximately 2 seconds. It should therefore not be treated as a high-speed temperature or humidity sensor.

Does the DHT22 use the Dallas 1-Wire protocol?

No. Although the DHT22 communicates through a single data wire, its communication protocol is different from the Dallas 1-Wire bus protocol.

Do I need a library to use the DHT22?

A library is not fundamentally required if the DHT22 communication protocol is implemented directly, but using an established library makes development much easier. The Adafruit DHT Sensor Library provides support for DHT22 and AM2302 sensors.
