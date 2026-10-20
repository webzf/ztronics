---
title: "Sensors for ESP32, Arduino & Raspberry Pi"
layout: single
permalink: /sensors/
internal_links: true
excerpt: "Explore sensor tutorials, comparisons and hardware for ESP32, Arduino and Raspberry Pi, including motion, temperature, humidity and pressure sensors."
description: "Browse Embedded Nerd sensor guides, tutorials and product references for MPU6050, BMA400, BME280, DHT22 and other sensors used with ESP32, Arduino and Raspberry Pi."
sidebar:
  nav: "embedded"
toc: true
toc_sticky: true
toc_label: "On this page"
toc_levels: 2
---

Sensors let an ESP32, Arduino or Raspberry Pi measure motion, temperature, humidity, pressure and other real-world conditions. Use this index to find practical setup guides, comparisons, troubleshooting advice and sensor hardware references.

## Motion and accelerometer sensors

- [MPU6050 Arduino Guide](/mpu6050-arduino-guide/) — read accelerometer and gyroscope data.
- [MPU6050 Calibration Guide](/mpu6050-calibration-guide/) — improve sensor readings by calibrating offsets.
- [MPU6050 alternatives](/mpu6050-discontinued-alternatives/) — review options for new designs.
- [BMA400 ESP32 Tutorial](/bma400-esp32-tutorial-wiring-code-arduino-guide/) — connect and configure a low-power accelerometer.
- [BMA400 vs MPU6050](/bma400-vs-mpu6050/) — compare capabilities and typical use cases.
- [ICM-42670-P sensor](/products/icm-42670-p/) — view the product reference.
- [ICM-42688-P sensor](/products/icm-42688-p/) — view the product reference.

## Temperature, humidity and environmental sensing

- [BME280 sensor](/products/bme280/) — temperature, pressure and humidity sensing.
- [DHT22 sensor](/products/dht22/) — a common temperature and humidity sensor.

## I2C tools and troubleshooting

- [I2C Scanner Tutorial](/i2c-scanner-tutorial/) — scan the bus to find connected device addresses.
- [I2C Address Lookup Tool](/tools/i2c-address-lookup/) — check common I2C addresses and potential conflicts.
- [I2C Pull-up Resistor Calculator](/tools/i2c-pullup-resistor-calculator/) — estimate a practical pull-up resistor range.

## Sensor hardware

Browse the [sensor product collection](/products/sensors/) for hardware references, or explore [Best Sensors for ESP32](/best-esp32-sensors/) for project-oriented recommendations.

Before wiring a sensor, check its operating voltage, logic levels, bus interface and library support against the datasheet for your exact module.
