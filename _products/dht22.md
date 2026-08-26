---
layout: product

title: "DHT22 Temperature & Humidity Sensor"

product_id: dht22

category: Sensors

manufacturer: Aosong

image: /assets/images/products/Dht22.webp

header:
  teaser: /assets/images/products/Dht22.webp

og_image: /assets/images/products/Dht22.webp

excerpt: "DHT22 digital temperature and humidity sensor with calibrated output and single-bus communication for Arduino, ESP32, Raspberry Pi, and embedded projects."

description: "The DHT22, also known as AM2302, is a digital temperature and relative humidity sensor with calibrated digital output. It uses a single-bus interface and provides a wide temperature measurement range, making it suitable for environmental monitoring, IoT, automation, data logging, and embedded electronics projects."

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
    value: Digital temperature and relative humidity sensor

  - name: Model
    value: AM2302

  - name: Interface
    value: Single-bus digital interface

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
    value: ±2% RH typical at 25°C

  - name: Humidity Resolution
    value: 0.1% RH

  - name: Sampling Period
    value: 2 seconds

links:
  - title: "AM2302 Technical Manual"
    icon: fas fa-book
    description: "Official technical manual for the AM2302 temperature and humidity sensor."
    url: https://www.aosong.com/uploadfiles/2025/04/20250417105409216.pdf

  - title: "Aosong AM2302 Product Page"
    icon: fas fa-external-link-alt
    description: "Official Aosong product page for the AM2302 temperature and humidity sensor."
    url: https://www.aosong.com/en/Products/info.aspx?itemid=2294

  - title: "Adafruit DHT Sensor Library"
    icon: fab fa-github
    description: "Arduino library supporting DHT22 and other DHT-series temperature and humidity sensors."
    url: https://github.com/adafruit/DHT-sensor-library

related:
  - esp32-devkit-v1
  - ssd1306-oled
  - solderless-breadboard
  - jumper-wires
---

The **DHT22** is a digital temperature and relative humidity sensor commonly used in Arduino, ESP32, Raspberry Pi, and other embedded electronics projects. It is also known as the **AM2302**.

The sensor combines temperature and humidity sensing with internal signal processing and calibrated digital output. Instead of producing an analog voltage that must be converted by a microcontroller ADC, the DHT22 sends temperature and humidity measurements through a single digital data line.

With a temperature range of -40°C to 80°C and typical humidity accuracy of ±2% RH at 25°C, the DHT22 is well suited to environmental monitoring, IoT prototypes, automation, data logging, weather stations, and educational electronics.

## Key Features

- Digital temperature and relative humidity measurement
- Also known as AM2302
- Calibrated digital output
- Single-bus digital communication
- Temperature range of -40°C to 80°C
- Humidity range of 0% to 99.9% RH
- 0.1°C temperature resolution
- 0.1% RH humidity resolution
- ±0.5°C typical temperature accuracy
- ±2% RH typical humidity accuracy at 25°C
- 3.3V to 5.5V supply voltage
- Minimum sampling interval of approximately 2 seconds

## Applications

The DHT22 is suitable for applications such as:

- Environmental monitoring
- IoT sensor nodes
- Weather stations
- Temperature and humidity data logging
- Home automation
- Greenhouse monitoring
- HVAC monitoring
- Robotics projects
- Educational electronics
- ESP32 monitoring projects
- Arduino sensor projects

## Pinout

A standard four-pin AM2302/DHT22 sensor uses the following pin assignment:

| Pin | Connection | Description |
|---|---|---|
| 1 | VDD | Power supply |
| 2 | SDA | Bidirectional serial data |
| 3 | NC | Not connected |
| 4 | GND | Ground |

The exact physical presentation can differ between the bare sensor and breakout boards. Some DHT22 modules expose labeled pins such as `VCC`, `DATA`, and `GND` rather than all four sensor pins.

Always check the markings on the specific module before connecting it.

The data line requires a pull-up arrangement. The AM2302 technical documentation specifies a typical pull-up resistor for the single-bus interface.

## How It Works

The DHT22 measures temperature and relative humidity internally and processes the sensor signals before transmitting the results digitally.

The host microcontroller communicates with the sensor using the DHT22 single-bus protocol.

A typical measurement sequence works as follows:

1. The microcontroller initiates communication with the sensor.
2. The DHT22 responds on the data line.
3. The sensor transmits the humidity and temperature measurement data.
4. The microcontroller decodes the digital data.
5. The application can display, store, transmit, or otherwise process the measurements.

The DHT22 is not an I2C sensor. Although it uses a single data wire, its communication protocol is different from the Dallas 1-Wire protocol.

The sensor also has a relatively slow measurement rate. A minimum interval of approximately 2 seconds should be maintained between readings.

## Compatible Boards

The DHT22 uses a digital single-bus interface and can be used with many microcontrollers that can implement the required timing protocol.

### Arduino

The DHT22 is widely used with Arduino boards. A digital GPIO can be connected to the sensor data line and a compatible DHT library can be used to handle the communication protocol.

### ESP32

The DHT22 is suitable for ESP32 projects. Its 3.3V-compatible supply range allows it to be powered from a 3.3V ESP32 system when the particular sensor or module is wired according to its specifications.

An ESP32 combined with a DHT22 can be used to build Wi-Fi environmental monitoring systems, dashboards, data loggers, and IoT sensor nodes.

### Raspberry Pi

The DHT22 can also be used with Raspberry Pi GPIO hardware. The data interface must be operated within the electrical limits of the Raspberry Pi GPIO, and suitable software support is required to implement the DHT22 communication protocol.

## Technical Details

| Parameter | Specification |
|---|---|
| Sensor | DHT22 / AM2302 |
| Manufacturer | Aosong |
| Interface | Single-bus digital |
| Supply voltage | 3.3V to 5.5V |
| Temperature range | -40°C to 80°C |
| Temperature accuracy | ±0.5°C typical |
| Temperature resolution | 0.1°C |
| Humidity range | 0% to 99.9% RH |
| Humidity accuracy | ±2% RH typical at 25°C |
| Humidity resolution | 0.1% RH |
| Sampling period | 2 seconds |

The published humidity accuracy is specified under particular test conditions. Actual sensor performance can vary with environmental conditions, temperature, humidity level, installation, and sensor age.

## DHT22 Sampling Rate

The DHT22 is designed for relatively slow environmental measurements.

The specified sampling period is approximately **2 seconds**, meaning applications should not request new measurements faster than this interval.

This is normally sufficient for:

- Room monitoring
- Weather stations
- Greenhouse monitoring
- IoT environmental nodes
- Data logging
- Home automation

It is not designed for applications requiring high-speed temperature or humidity measurements.

## DHT22 Wiring Considerations

The DHT22 requires power, ground, and a digital data connection.

For a typical bare AM2302 sensor:

| DHT22 | Microcontroller |
|---|---|
| VDD | Suitable supply voltage |
| SDA | Digital GPIO |
| NC | Leave unconnected |
| GND | GND |

The official documentation specifies a 3.3V to 5.5V supply range and recommends a pull-up resistor on the data line for the single-bus connection.

When using a breakout board, the required pull-up resistor may already be included on the module.

## Why Choose the DHT22?

The DHT22 is a practical choice for projects that need simple temperature and humidity measurement without an analog input or a more complex digital bus.

Its main advantages include:

- Simple digital interface
- Calibrated output
- Wide temperature measurement range
- Useful humidity accuracy
- 3.3V-compatible operation
- Straightforward integration with microcontrollers
- Established software-library support
- Suitable for common environmental monitoring projects

Its main limitation is its relatively slow sampling period of approximately 2 seconds.

## Project Ideas

The DHT22 can be used as the basis for several practical Embedded Nerd projects:

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

A particularly useful combination is an **ESP32 + DHT22 + SSD1306 OLED**, allowing the sensor readings to be displayed locally while the ESP32 can also provide wireless connectivity.

## Documentation

The DHT22/AM2302 does not require an I2C or SPI library because it uses its own single-bus communication protocol.

For Arduino projects, an established library can handle the timing and data decoding required by the sensor. The **Adafruit DHT Sensor Library** provides support for DHT22 and AM2302 sensors.

The official **AM2302 Technical Manual** is the primary technical reference for the sensor and documents its electrical characteristics, communication protocol, timing, measurement range, and accuracy.

## Related Products

The DHT22 can be combined with several existing Embedded Nerd products for complete embedded projects.

The **[ESP32 DevKit V1](/products/esp32-devkit/)** provides a convenient development platform for wireless DHT22 monitoring projects.

The **[SSD1306 OLED Display](/products/ssd1306-oled/)** can be used to display temperature and humidity measurements locally.

For physical prototyping, the **[Solderless Breadboard](/products/solderless-breadboard/)** and **[Jumper Wires](/products/jumper-wires/)** provide a simple way to connect the sensor to a development board.

## Frequently Asked Questions

### What is the DHT22?

The DHT22 is a digital temperature and relative humidity sensor. It is also commonly known as the AM2302.

### Is the DHT22 compatible with Arduino?

Yes. The DHT22 can be connected to an Arduino digital GPIO and read using a compatible DHT sensor library.

### Can I use the DHT22 with an ESP32?

Yes. The DHT22 supports a 3.3V to 5.5V supply range and uses a digital single-bus interface, making it suitable for ESP32 projects when wired correctly.

### Can the DHT22 be used with Raspberry Pi?

Yes. The DHT22 can be connected to Raspberry Pi GPIO hardware using suitable software support. The electrical characteristics of the connection must be respected because Raspberry Pi GPIO uses 3.3V logic.

### What voltage does the DHT22 require?

The AM2302 documentation specifies a supply voltage from 3.3V to 5.5V. Individual breakout boards can have additional circuitry, so the documentation for the exact module should be checked before wiring it.

### What is the DHT22 pinout?

A standard four-pin DHT22/AM2302 uses VDD, SDA, NC, and GND. Pin 1 is VDD, pin 2 is the data connection, pin 3 is not connected, and pin 4 is GND.

### Does the DHT22 use I2C?

No. The DHT22 does not use I2C. It uses a proprietary single-bus digital communication protocol.

### How often can the DHT22 be read?

The specified sampling period is approximately 2 seconds. Applications should therefore maintain at least this interval between sensor readings.

### Does the DHT22 need a library?

A library is not strictly required if the communication protocol is implemented directly, but using an established library is much easier. The Adafruit DHT Sensor Library supports DHT22 and AM2302 sensors.

### Is the DHT22 accurate?

The AM2302 documentation specifies typical temperature accuracy of ±0.5°C and typical relative humidity accuracy of ±2% RH at 25°C. Actual results can vary with environmental conditions and sensor characteristics.
