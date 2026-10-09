---
title: "Sunton ESP32-8048S043C: Arduino Pinout and Setup Guide"
layout: single
permalink: /sunton-esp32-8048s043c-guide/
nav: embedded
excerpt: "Sunton ESP32-8048S043C pinout, Arduino example, GT911 touch, microSD GPIOs, ESPHome setup, specifications and buying comparisons."
show_date: false
last_modified_at: 2026-10-10
author: "Embedded Nerd"
read_time: false
toc: true
toc_label: "Contents"
toc_sticky: true
teaser: https://cdn.espboards.net/boards/cyd-esp32-8048s043/cover-468.png
overlay_image: https://cdn.espboards.net/boards/cyd-esp32-8048s043/cover-468.png
overlay_filter: 0.5
image: https://cdn.espboards.net/boards/cyd-esp32-8048s043/cover-468.png
og_image: https://cdn.espboards.net/boards/cyd-esp32-8048s043/cover-468.png
categories:
  - Displays
tags:
  - esp32
  - sunton
  - esp32-s3
  - touchscreen
  - lvgl
  - gt911
related: false
share: true
---

The **Sunton ESP32-8048S043C** is an all-in-one board built around an ESP32-S3, a 4.3" 800×480 IPS display and a capacitive touch panel on one PCB. It is aimed at projects that need a relatively large touchscreen without combining a separate ESP32 and display module.

> **Testing note:** This guide is based on manufacturer documentation and publicly available hardware references and example projects. Embedded Nerd has not independently tested this board for this article. Pin assignments can vary by revision, so confirm them against your board's schematic before wiring peripherals.

> **Affiliate disclosure:** Some links on Embedded Nerd may be affiliate links. If you buy through an eligible link, we may earn a commission at no extra cost to you.

Before buying one, however, there are a few things worth checking. Sunton sells several similar boards, including capacitive and resistive versions, and the exact hardware revision can affect the pinout and recommended configuration.

This guide covers the specifications, display and touch hardware, important pins, software compatibility, common problems and the main things to consider before choosing the 8048S043C.

> **Not sure which ESP32 touchscreen is right for your project?** Start with our [ESP32 touchscreen displays guide]({{ site.url }}/esp32-touchscreen-displays-guide/) and compare boards by resolution and memory requirements.

![Sunton ESP32-8048S043C 4.3-inch ESP32-S3 touchscreen board on a white background](https://cdn.espboards.net/boards/cyd-esp32-8048s043/cover-468.png)

*Image source: [ESPboards](https://www.espboards.dev/esp32/cyd-esp32-8048s043/).*

## Sunton ESP32-8048S043C specs

| **Feature** | **Details** |
| --- | --- |
| MCU | ESP32-S3 (dual core, Wi-Fi + Bluetooth LE) |
| Flash / PSRAM | 16 MB flash, 8 MB octal PSRAM on the common N16R8 version |
| Display | 4.3" IPS, 800×480 |
| Display interface | 16-bit parallel RGB |
| Touch | Capacitive, GT911 controller on I2C |
| Storage | microSD slot |
| USB | USB-C |
| Other | BOOT button on GPIO0, expansion header, speaker and battery connectors vary by revision |

> **Check the exact revision before buying.** Sunton sells several similar boards with confusingly close names, including the 4827S043C and resistive "R" versions. Compare the silkscreen on the board with the seller's documentation before relying on any pin number, memory configuration or demo. {: .notice--warning}

## Is the Sunton ESP32-8048S043C a good choice?

The 8048S043C makes sense if you want a relatively large touchscreen while keeping the ESP32, display and touch controller on a single board.

### Good choice if you need

- A **4.3-inch 800×480 touchscreen**
- An **ESP32-S3** with Wi-Fi and Bluetooth LE
- Integrated capacitive touch
- PSRAM for graphics-heavy interfaces
- An all-in-one board rather than a separate ESP32 and display
- An **LVGL-based interface**
- A compact touchscreen control panel

Typical applications include dashboards, smart-home interfaces, equipment controls, sensor displays and other projects where a larger touchscreen is more useful than a small OLED or character display.

### Consider another board if you need

- Extensive official documentation and examples
- A different display size or resolution
- More easily accessible GPIO
- A different touch technology
- A board with a simpler software configuration

## Capacitive C vs resistive R: which one should you buy?

This is one of the most important things to check before ordering.

The **C version** uses a **GT911 capacitive touch controller** on the I2C bus. It provides the phone-like touch experience most users expect from a modern touchscreen.

The **R version** uses resistive touch hardware and requires a different controller and driver.

If you specifically want a modern capacitive touchscreen interface, make sure the listing identifies the board as the **8048S043C** rather than an R variant.

The wider **8048S043** name is also used without the suffix in example repositories and documentation. Listings may identify three touch configurations:

- **8048S043C** — capacitive touch, typically using the GT911.
- **8048S043R** — resistive touch; do not use the C-version GT911 setup.
- **8048S043N** — listed as a no-touch version in some product references.

Treat the suffix as important and verify the actual board, display controller and touch hardware with the seller before ordering. Names and bundled demos are not consistent across every listing.

## Datasheet, schematic and example downloads

These references are useful starting points for confirming the board revision and building a working project:

- [Makerfabs / Sunton documentation and display demos](https://wiki.makerfabs.com/Sunton_ESP32_S3_4.3_inch_800x400_IPS_with_Touch.html) — manufacturer-distributed setup instructions, screen demo and LVGL demo links.
- [ESP3D ESP32-8048S043C hardware reference](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/) — pin assignments, microSD connections and GT911 interrupt modification notes.
- [Sunton ESP32-8048S043 datasheet and demo archive](http://pan.jczn1688.com/directlink/1/ESP32%20module/4.3inch_ESP32-8048S043.zip) — manufacturer-hosted archive linked from community documentation; check the archive contents and revision before relying on it.
- [Arduino_GFX + GT911 + LVGL example project](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043) — a PlatformIO project using Arduino_GFX, GT911 and LVGL 9.1.
- [ESP-IDF + LVGL example](https://github.com/limpens/esp32-8048S043) — a separate example based on ESP-IDF and the GT911 touch component.

## Pinout: display, touch, microSD and expansion headers

The display is connected to the ESP32-S3 through a 16-bit parallel RGB bus. The GT911 touch controller uses I2C. These connections are already made on the board; avoid reusing them for other peripherals.

### Touch and control pins

| Function | GPIO | Notes |
| --- | ---: | --- |
| GT911 I2C SDA | 19 | Touch data |
| GT911 I2C SCL | 20 | Touch clock |
| GT911 reset (RST) | 38 | Touch-controller reset |
| GT911 interrupt (INT) | 18 | Usually not connected to the controller without a hardware modification |
| LCD backlight | 2 | Backlight control |
| BOOT button | 0 | Boot-mode selection |

The GT911 commonly uses I2C address **0x5D** or **0x14**, depending on configuration. The touch interrupt line may require a hardware modification; ordinary polling can be used when the interrupt line is not connected.

### microSD pins (SPI)

| Function | GPIO |
| --- | ---: |
| SD card CS | 10 |
| SD card MOSI | 11 |
| SD card SCK | 12 |
| SD card MISO | 13 |

### RGB display signals

| Signal | GPIO |
| --- | --- |
| DE / VSYNC / HSYNC / PCLK | 40 / 41 / 39 / 42 |
| Red (R0–R4) | 45, 48, 47, 21, 14 |
| Green (G0–G5) | 5, 6, 7, 15, 16, 4 |
| Blue (B0–B4) | 8, 3, 46, 9, 1 |

### Expansion headers

The published hardware reference describes these header assignments:

| Header | Pins / functions |
| --- | --- |
| P1 (UART-style) | GND, RX, TX, +5 V |
| P2 (SPI-style) | GPIO13, GPIO12, GPIO11, GPIO19 |
| P3 | GPIO20, GPIO19, GPIO18, GPIO17 |
| P4 | GPIO18, GPIO17, 3.3 V, GND |

**These are not all independent GPIOs.** GPIO19/20 are shared with touch I2C, GPIO11–13 are used by microSD, and GPIO18 may be associated with touch interrupt. Confirm the connector orientation and the schematic for your exact revision before connecting hardware. The RGB bus occupies many other GPIOs.

## Software and library compatibility

The 8048S043C can be used with several common ESP32 graphics libraries:

| **Library** | **Good for** | **Notes** |
| --- | --- | --- |
| **LVGL** | Full touch UIs with buttons, sliders and charts | Needs a display driver underneath |
| **Arduino_GFX** | Simple graphics, text and quick tests | Has an RGB panel driver for ESP32-S3 |
| **LovyanGFX** | Fast drawing and flexible configuration | Needs a panel configuration that matches the board |

For most projects, the path is a low-level RGB panel driver such as Arduino_GFX plus **LVGL** for the interface.

The important point when evaluating the board before buying is that it can handle sophisticated touchscreen interfaces, but the display configuration needs to match the exact hardware.

## Arduino code example: display and touch

For a complete Arduino_GFX + GT911 + LVGL implementation, start from the [Sunton-ESP32-8048S043 PlatformIO example on GitHub](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043). It includes the project configuration and required libraries; the UI is built with EEZ Studio and LVGL 9.x.

There is no single universally safe copy-and-paste sketch for every board sold under this name: RGB timing, touch configuration, PSRAM settings and library versions need to match the hardware. The project README specifies Arduino_GFX 1.4.7, GT911 1.0.2 and LVGL 9.1.0, so use those versions as a reproducible starting point rather than mixing libraries arbitrarily.

A sensible bring-up sequence is:

1. Confirm that the board is the **8048S043C** capacitive version.
2. Install the ESP32-S3 board support and open the example project in PlatformIO.
3. Build and upload the unmodified demo first.
4. Confirm that the RGB display renders before changing the UI.
5. Check touch coordinates and rotation, then add LVGL widgets.
6. Add microSD or other peripherals only after checking shared GPIOs.

**Verification status:** the example is a third-party project, not code tested by Embedded Nerd. Treat it as a reference implementation and check its license and dependencies before reusing code in your own project.

## SquareLine Studio and LVGL

[SquareLine Studio](https://squareline.io/) can be used to design an LVGL interface visually and export UI code. It does not replace the board-specific display and touch drivers: the generated UI still needs to be integrated with a working RGB panel driver, GT911 input driver and a compatible LVGL version. Check the export target and LVGL version before importing generated files.

## ESPHome

The board is also used with ESPHome and Home Assistant. The [ESPHome Devices reference](https://devices.esphome.io/devices/sunton-esp32-8048s043c/) includes a configuration for the 800×480 display and GT911 touch. ESPHome's [LVGL component documentation](https://esphome.io/components/lvgl/) explains how to build interactive pages.

ESPHome configurations are version-sensitive, especially for RGB displays and touch drivers. Start with a configuration known to work with your ESPHome release and board revision, then add Home Assistant entities and widgets.

## Arduino IDE settings

For the common N16R8 version, the relevant Arduino IDE settings are:

1. Install the **ESP32 board package** from Espressif through Boards Manager.
2. Select **ESP32S3 Dev Module**.
3. Set **PSRAM** to **OPI PSRAM**.
4. Set **Flash Size** to **16 MB**.
5. Use **QIO 80 MHz** flash mode for the N16R8 version.
6. Choose a partition scheme that fits the 16 MB flash if the project is large.

Without the correct PSRAM configuration, graphics applications may fail to allocate the frame buffer and can result in a blank screen or reboot loop.

> **Important:** These settings apply to the common N16R8 configuration. Check the exact board revision and seller documentation before copying them. {: .notice--warning}

## Common problems to know before buying

Understanding the common issues is useful before choosing this board because the 8048S043C is more configuration-sensitive than a simple SPI display.

### Blank screen, but the board is running

A wrong PSRAM configuration, display configuration or backlight setting can result in a working ESP32 with no visible image.

Check that:

- PSRAM is set to **OPI PSRAM**
- The board profile is **ESP32-S3**
- The backlight is configured correctly
- The display timing matches a known-good configuration for the board

### Boot loop or reset after upload

This is commonly caused by incorrect PSRAM or flash settings.

For the common N16R8 version, check the Arduino IDE settings before changing application code.

### Touch does nothing

The capacitive version uses a GT911 over I2C.

If the display works but touch does not:

1. Check the I2C pins.
2. Run an I2C scan.
3. Look for the GT911 at **0x5D** or **0x14**.
4. Make sure the software is using a GT911 driver rather than a resistive touch driver.

You can also use our [I2C Address Lookup tool]({{ site.url }}/tools/i2c-address-lookup/) to identify an I2C address, and the [I2C scanner tutorial]({{ site.url }}/i2c-scanner-tutorial/) for troubleshooting.

### Touch is mirrored or offset

This is usually a software configuration issue. Check the X/Y axis orientation and display rotation settings in the touch and display configuration.

### Flickering or shifting image

RGB timing or PSRAM bandwidth can be responsible. Start with timing values from a known-good demo for the exact board rather than guessing them.

### Limited GPIO availability

The RGB display consumes a substantial number of GPIOs. If your project also needs several sensors, peripherals or communication interfaces, check the available expansion pins before choosing the board.

### Cannot upload

Hold **BOOT (GPIO0)** while connecting USB-C if necessary, or try another USB cable. Some USB cables are charge-only.

## Sunton ESP32-8048S043C vs other ESP32 touchscreen boards

The main trade-off is not only screen size: resolution, touch technology, display interface, available GPIO and software support all affect how much work a project needs.

| Board | Display | Touch / MCU | Best fit |
| --- | --- | --- | --- |
| **Sunton ESP32-8048S043C** | 4.3", 800×480 RGB | ESP32-S3, capacitive GT911, 16 MB Flash / 8 MB PSRAM (common N16R8 version) | Integrated 4.3-inch touchscreen with high resolution |
| [Waveshare ESP32-S3-Touch-LCD-4.3](https://www.waveshare.com/esp32-s3-touch-lcd-4.3.htm) | 4.3", 800×480 | ESP32-S3; capacitive touch on the product variant | Alternative 4.3-inch platform with vendor documentation |
| **Sunton ESP32-8048S070C** | 7", 800×480 RGB | ESP32-S3, capacitive touch on the C version | Larger physical screen with the same pixel resolution |

Check each vendor's current documentation for memory, connector and touch-controller details; similar model names do not guarantee interchangeable pinouts or software configurations.

Compare screen size, resolution and PSRAM before choosing, using our [ESP32 touchscreen comparison tool]({{ site.url }}/tools/esp32-touchscreen-selector/).

## Sunton ESP32-8048S043C price & availability

**Check current price and availability on the [Embedded Nerd product page]({{ site.url }}/products/sunton-esp32-8048s043c/).** Before ordering, confirm that the listing is for the **8048S043C capacitive GT911 variant**, not the R resistive or N no-touch version.

Prices, shipping costs, taxes and stock can change by seller and destination. Compare the total delivered price and verify the board revision before buying. The link above leads to our product information page; use the current purchase options shown there.

## FAQ

### Is the Sunton ESP32-8048S043C worth buying?

It is a good option if you want an integrated ESP32-S3 and 4.3-inch 800×480 capacitive touchscreen in a single board. The main consideration is making sure the exact hardware revision matches the software configuration you intend to use.

### Which touch controller does the 8048S043C use?

The capacitive version uses a **GT911** over I2C, normally on GPIO19 and GPIO20.

### Does the 8048S043C have PSRAM?

The common N16R8 version has **8 MB of octal PSRAM** and **16 MB of flash**. Check the exact listing before ordering because variants exist.

### Is the 8048S043C capacitive or resistive?

The **C** version is capacitive and uses the GT911. The **R** version uses resistive touch hardware and a different controller.

### Is it suitable for LVGL?

Yes. The ESP32-S3, RGB display and PSRAM make it suitable for graphics-heavy LVGL interfaces, provided the display configuration is correct.

### Should I buy the 8048S043C or another ESP32 touchscreen?

That depends on the display size, resolution, touch technology, GPIO requirements and software support you need.

Compare screen size, resolution and PSRAM with the [ESP32 Touchscreen Selector]({{ site.url }}/tools/esp32-touchscreen-selector/).

### Can I connect other sensors?

Yes. Use the free pins on the expansion header and keep I2C devices on addresses that do not clash with the touch controller.

For example, I2C sensors such as the [MPU6050]({{ site.url }}/mpu6050-arduino-guide/) or [BMA400]({{ site.url }}/bma400-esp32-tutorial-wiring-code-arduino-guide/) can be used with the board, provided the available pins and I2C addresses are suitable.

## About the author

**Embedded Nerd** publishes practical guides on ESP32 boards, embedded hardware, displays, sensors and development tools. This guide is based on manufacturer documentation and referenced community projects; the board was not independently tested for this article.

## Final verdict

The **Sunton ESP32-8048S043C** is a compelling option if you want a relatively large **4.3-inch 800×480 capacitive touchscreen** integrated with an **ESP32-S3**.

Its main strengths are the integrated display and touch hardware, PSRAM and support for graphics-heavy interfaces such as LVGL.

The main trade-off is that the RGB display, PSRAM configuration and hardware variants require more care than a simpler ESP32 display module.

If those characteristics match your project, the 8048S043C is worth considering. Make sure the exact suffix and hardware revision match your software before buying.

### Related guides

- [ESP32 touchscreen displays guide]({{ site.url }}/esp32-touchscreen-displays-guide/) — compare display sizes, touch technologies and interfaces.
- [ESP32 Touchscreen Selector]({{ site.url }}/tools/esp32-touchscreen-selector/) — filter boards by resolution, PSRAM and touch type.
- [Sunton ESP32-8048S043C product page]({{ site.url }}/products/sunton-esp32-8048s043c/) — check current purchase options.
