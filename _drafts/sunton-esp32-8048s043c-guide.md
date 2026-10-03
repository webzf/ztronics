---
title: "Sunton ESP32-8048S043C: Pinout, Setup and Getting Started Guide"
layout: single
permalink: /sunton-esp32-8048s043c-guide/
sidebar:
  nav: "embedded"
excerpt: "Everything you need to start with the Sunton ESP32-8048S043C: specs, pinout, touch controller, display libraries, first test and common problems."
show_date: false
read_time: false
last_modified_at: false
toc: true
toc_label: "Contents"
toc_sticky: true
header:
  teaser: /assets/images/sunton-esp32-8048s043c/teaser.jpg
  overlay_image: /assets/images/sunton-esp32-8048s043c/header.jpg
  overlay_filter: 0.5
  image: /assets/images/sunton-esp32-8048s043c/header.jpg
  og_image: /assets/images/sunton-esp32-8048s043c/header.jpg
categories:
  - Displays
tags:
  - esp32
  - sunton
  - esp32-s3
  - touchscreen
  - lvgl
related: true
share: true
---

The **Sunton ESP32-8048S043C** is an all-in-one board: an ESP32-S3, a 4.3" 800x480 IPS display and a capacitive touch panel on a single PCB. No wiring, no separate display module. That makes it one of the fastest ways to get a real touchscreen UI running on an ESP32.

This guide covers what the board offers, how to set it up in the Arduino IDE, how to check the touch controller, and the problems people hit most often.

> Looking for the bigger picture? See our [ESP32 touchscreen displays guide]({{ site.url }}/esp32-touchscreen-displays-guide/) or use the [ESP32 Touchscreen Selector]({{ site.url }}/tools/esp32-touchscreen-selector/) to compare options.
{: .notice--info}

![Sunton ESP32-8048S043C board, front view](/assets/images/sunton-esp32-8048s043c/board-front.jpg)
*IMAGE PLACEHOLDER: front view of the board running a demo UI*

## Sunton ESP32-8048S043C at a glance

| Feature | Details |
|---|---|
| MCU | ESP32-S3 (dual core, Wi-Fi + Bluetooth LE) |
| Display | 4.3" IPS, 800x480 |
| Display interface | 16-bit parallel RGB |
| Touch | Capacitive (the "C" in the name) |
| Memory | External PSRAM for the frame buffer (check your exact variant) |
| Extras | microSD slot, USB-C, expansion header, speaker and battery connectors (varies by revision) |

**Check your revision.** Sunton sells several revisions and a resistive version (usually marked "R"). Always compare the silkscreen on your board with the seller's documentation before relying on any pin number.
{: .notice--warning}

## Capacitive vs resistive: which one do you have?

The "C" version uses a capacitive controller on the I2C bus, so it works like a phone screen and supports light multi-touch. The resistive version uses a different touch chip and needs a different driver. If touch does nothing after you flash a working demo, the first thing to check is that the demo matches your variant.

## Pinout and what is already wired

Because the display and touch controller are on the board, you do not wire them yourself. What matters to you is:

- **Touch controller:** connected over I2C, with interrupt and reset lines.
- **Backlight:** controlled by one GPIO, so you can dim it with PWM.
- **microSD:** uses its own SPI pins, separate from the display.
- **Expansion header:** the few free GPIOs for your sensors (I2C sensors such as the [MPU6050]({{ site.url }}/mpu6050-arduino-guide/) or [BMA400]({{ site.url }}/bma400-esp32-tutorial-wiring-code-arduino-guide/) fit well here).

Take the exact GPIO numbers from the schematic or demo code supplied for your revision, and do not reuse pins assigned to the display, because the RGB bus takes most of the GPIOs.

![Sunton ESP32-8048S043C pinout](/assets/images/sunton-esp32-8048s043c/pinout.png)
*IMAGE PLACEHOLDER: annotated pinout with the free expansion pins highlighted*

## Setting up the Arduino IDE

1. Install the **ESP32 board package** (Espressif) in the Boards Manager.
2. Select an **ESP32-S3** board profile.
3. Enable **PSRAM** in the Tools menu (usually "OPI PSRAM"). Without it, the display cannot allocate its frame buffer and the screen stays blank or the board reboots.
4. Choose the flash size that matches your board.
5. Install a display library (next section).

## Which display library should you use?

| Library | Good for | Notes |
|---|---|---|
| **LVGL** | Full touch UIs with buttons, sliders, charts | Needs a display driver underneath |
| **Arduino_GFX** | Simple graphics, text, quick tests | Has an RGB panel driver for ESP32-S3 |
| **LovyanGFX** | Fast drawing and flexible configuration | Needs a panel config that matches this board |

For most projects, the usual path is a low-level driver for the RGB panel plus **LVGL** for the interface. Start from a demo made for this exact board, confirm the screen works, and only then change it.

## Step 1: confirm the touch controller with an I2C scan

Before writing any UI, check that the touch controller answers on the I2C bus. This sketch is generic, so set the SDA and SCL pins to the ones used by the touch controller on your revision.

```cpp
#include <Wire.h>

// Set these from your board's documentation
#define I2C_SDA  /* touch SDA pin */
#define I2C_SCL  /* touch SCL pin */

void setup() {
  Serial.begin(115200);
  delay(1000);
  Wire.begin(I2C_SDA, I2C_SCL);
  Serial.println("Scanning I2C bus...");

  byte found = 0;
  for (byte addr = 1; addr < 127; addr++) {
    Wire.beginTransmission(addr);
    if (Wire.endTransmission() == 0) {
      Serial.print("Device found at 0x");
      Serial.println(addr, HEX);
      found++;
    }
  }
  if (found == 0) Serial.println("No I2C devices found");
}

void loop() {}
```

If an address shows up, you can look it up with our [I2C Address Lookup tool]({{ site.url }}/tools/i2c-address-lookup/). If nothing shows up, read the [I2C scanner tutorial]({{ site.url }}/i2c-scanner-tutorial/) for troubleshooting.

## Step 2: run a known-good demo

Flash the demo for your exact revision, check that the screen shows an image and that touch moves something on screen. Only then start your own project. This separates hardware problems from code problems.

## Common problems and fixes

**Blank screen, but the board is running.** Check that PSRAM is enabled and that the board profile is ESP32-S3. Also check the backlight pin, since the picture can be present but invisible.

**Boot loop or reset right after upload.** Usually wrong PSRAM mode or flash size in the Tools menu.

**Touch does nothing.** Confirm the I2C scan finds the controller, and confirm you are using the capacitive driver, not the resistive one.

**Touch is mirrored or offset.** Swap or invert the X and Y axes in your touch configuration, or rotate the display in the library settings.

**Flickering or shifting image.** This is usually RGB timing or PSRAM bandwidth. Use the timing values from a demo for this board, and avoid heavy Wi-Fi traffic while drawing large areas.

**Cannot upload.** Hold BOOT while connecting USB-C, or try another cable. Some cables are charge-only.

## Project ideas

- A smart home panel with LVGL buttons and sliders
- A sensor dashboard with live charts (add an I2C sensor on the expansion header)
- A small game or media controller
- A control panel for a 3D printer or workshop tool

## FAQ

### Is the Sunton ESP32-8048S043C good for beginners?
Yes, because everything is already connected. The hardest part is matching the library configuration to the board, so start from a demo made for it.

### Does it support multi-touch?
The capacitive version supports basic multi-touch, but most LVGL interfaces only need single touch.

### Can I use other sensors with it?
Yes. Use the free pins on the expansion header, and keep I2C devices on addresses that do not clash with the touch controller.

### What is the difference between the C and R versions?
C is capacitive touch over I2C. R is resistive touch with a different controller and driver.

### How does it compare with Waveshare boards?
Waveshare boards usually come with more complete documentation and examples, while the Sunton is cheaper and widely available. See the [full comparison]({{ site.url }}/esp32-touchscreen-displays-guide/).

## Where to buy

The board is available on our product page: [Sunton ESP32-8048S043C]({{ site.url }}/products/sunton-esp32-8048s043c/).

<!-- AFFILIATE: add your real tracked link on the product page. Do not place a placeholder URL here. -->

## Next steps

- Compare alternatives in the [ESP32 touchscreen displays guide]({{ site.url }}/esp32-touchscreen-displays-guide/)
- Find the best fit with the [ESP32 Touchscreen Selector]({{ site.url }}/tools/esp32-touchscreen-selector/)
- Add motion input with the [MPU6050 Arduino guide]({{ site.url }}/mpu6050-arduino-guide/)
