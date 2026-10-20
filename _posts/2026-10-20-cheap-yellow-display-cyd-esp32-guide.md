---
title: "Cheap Yellow Display (CYD) ESP32: Which Board to Buy"
title_tag: "Cheap Yellow Display (CYD) ESP32: Which Board to Buy"
layout: single
permalink: /cheap-yellow-display-cyd-esp32-guide/
excerpt: "Compare the classic 2.8-inch ESP32-2432S028 CYD with the 4.3-inch Sunton ESP32-8048S043C. Learn the key hardware differences and choose the right ESP32 touchscreen board."
show_date: false
read_time: false
last_modified_at: 2026-10-20
header:
  teaser: /assets/images/cyd-2432s028-board.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/cyd-2432s028-board.webp
  og_image: /assets/images/cyd-2432s028-board.webp
  og_image_alt: "ESP32-2432S028 2.8-inch Cheap Yellow Display touchscreen board"
categories:
  - Displays
  - ESP32
tags:
  - esp32
  - cyd
  - touchscreen
  - esp32-s3
  - lvgl
sidebar:
  nav: "embedded"
related: true
related_posts:
  - /sunton-esp32-8048s043c-guide/
  - /esp32-touchscreen-displays-guide/
share: true
---

The **Cheap Yellow Display (CYD) ESP32** is a low-cost touchscreen development board best known for the **ESP32-2432S028**, a compact 2.8-inch board with an integrated ESP32, colour display and resistive touch. Larger alternatives, such as the **Sunton ESP32-8048S043C**, offer more screen space, capacitive touch and additional memory for more demanding interfaces.

> **Short answer:** Choose the ESP32-2432S028 for the cheapest, compact option; choose the Sunton ESP32-8048S043C for a bigger screen with capacitive touch.

Both boards combine an ESP32 microcontroller and a touchscreen on one PCB, making them useful for dashboards, IoT control panels and small human-machine interfaces (HMIs). However, they use different hardware and should not be treated as interchangeable.

![ESP32-2432S028 classic CYD board with a 2.8-inch touchscreen](/assets/images/cyd-2432s028-board.webp)

*The classic CYD integrates the ESP32, display and resistive touch on one board. Check the exact revision before ordering.*

![Sunton ESP32-8048S043C board with a 4.3-inch 800 × 480 touchscreen](/assets/images/sunton-esp32-8048s043c-board.webp)

*The Sunton is a larger CYD-style alternative. Confirm the exact model suffix and revision in the listing.*

## CYD Models Compared

| Feature | ESP32-2432S028 (classic CYD) | Sunton ESP32-8048S043C |
|---|---|---|
| Display | 2.8-inch TFT | 4.3-inch TFT |
| Resolution | 240 × 320 pixels | 800 × 480 pixels |
| Microcontroller | ESP32-WROOM-32 | ESP32-S3 |
| Touch | Resistive (XPT2046) | Capacitive (GT911) |
| Memory | Standard ESP32 memory | 16 MB Flash and 8 MB PSRAM |
| USB | Micro-USB or USB-C, by revision | USB-C |
| Display controller | ILI9341 or ST7789, by revision | Verify the exact board documentation |
| Best for | Low-cost, compact projects | Larger interfaces and more demanding LVGL projects |

**Before ordering:** CYD listings may use the same family name for different hardware revisions. Confirm the display controller, touch type and USB connector with the seller instead of relying on the product title alone.

## Which Board Should You Buy?

### Choose the ESP32-2432S028 if…

- You want an inexpensive, compact ESP32 touchscreen board.
- A 2.8-inch display is large enough for your project.
- You are building a sensor monitor, small dashboard or simple control panel.
- You are comfortable checking the board revision before configuring your display library.

See the [ESP32-2432S028 2.8-inch CYD product page](/products/esp32-2432s028-2-8-cyd/) for specifications, pin considerations and revision notes.

**[See current price and listings →](/products/esp32-2432s028-2-8-cyd/)**

The display controller can be **ILI9341 or ST7789**, depending on the revision. This matters when configuring Arduino libraries, LVGL or other display software. Do not assume that every board sold as an ESP32-2432S028 uses the same controller.

### Choose the Sunton ESP32-8048S043C if…

- You want a larger 4.3-inch, 800 × 480 display.
- Capacitive touch is important for your interface.
- You need more memory for a richer LVGL interface.
- You want an ESP32-S3-based board rather than the classic ESP32-WROOM CYD.

The Sunton is a **CYD-style ESP32 touchscreen board**, not the classic 2.8-inch CYD model. Read the [Sunton ESP32-8048S043C setup guide](/sunton-esp32-8048s043c-guide/) for pinout and configuration details, or visit the [Sunton ESP32-8048S043C product page](/products/sunton-esp32-8048s043c/) for product information.

**[See current price and listings →](/products/sunton-esp32-8048s043c/)**

### Consider a square 4-inch alternative

If you prefer a square screen, compare the [Guition ESP32-S3-4848S040 4-inch touchscreen](/products/guition-esp32-s3-4848s040/). Its 480 × 480 display gives you a different layout from the wide 4.3-inch Sunton.

Still deciding? Use the [ESP32 display selector](/tools/esp32-touchscreen-selector/) to compare display boards, or read the [ESP32 touchscreen displays guide](/esp32-touchscreen-displays-guide/) for a broader overview of display sizes, interfaces and touch technologies.

## Getting Started

1. **Identify your hardware.** Check the exact board model, USB connector and display controller before selecting a configuration.
2. **Configure the display.** Choose a compatible library and match its settings to the actual display controller.
3. **Test the display first.** Confirm that the image renders correctly before troubleshooting the touchscreen.
4. **Test the touch input.** Verify coordinate mapping and calibration where required. Resistive and capacitive touch controllers can require different configuration steps.
5. **Optimize the interface.** On the Sunton ESP32-8048S043C, use its available PSRAM appropriately when building larger LVGL interfaces.

For the classic CYD, the XPT2046 is a resistive touch controller. Depending on the software and board configuration, you may need to calibrate or map the touch coordinates. The Sunton's GT911 is a capacitive touch controller and uses a different configuration approach.

## First Project Ideas

![Flight Tracker interface running on a CYD touchscreen](/assets/images/cyd-flight-tracker-demo.webp)

*A community project example showing how a small CYD display can be used for a live data interface.*

The CYD and similar integrated ESP32 touchscreen boards are useful for:

- **Weather dashboard:** display local conditions and sensor readings.
- **Home Assistant control panel:** create a compact interface for selected smart-home controls.
- **Sensor monitor:** show temperature, humidity, pressure or motion data.
- **Simple game:** build a small touch-controlled game.
- **Device status display:** show operating state, alerts or measurements from another device.

Choose the board based on the interface you need. A compact status display may not require the larger Sunton, while a multi-panel dashboard may benefit from its larger resolution and PSRAM.

## Frequently Asked Questions

### What does CYD stand for?

CYD stands for **Cheap Yellow Display**, the community nickname most commonly associated with the ESP32-2432S028 family of low-cost 2.8-inch touchscreen boards.

### Is the ESP32-2432S028 the same as the ESP32-2432S028R?

The names are used for the same general board family, and the “R” is associated with the resistive-touch version. Product listings and documentation are not always consistent, so check the touch controller and the exact board revision before ordering.

### Does the CYD use resistive or capacitive touch?

The classic ESP32-2432S028 uses resistive touch with an XPT2046 controller. The Sunton ESP32-8048S043C uses capacitive touch with a GT911 controller. These are different boards, not touch variants of the same CYD model.

### Which display controller does the 2.8-inch CYD use?

It depends on the hardware revision. ILI9341 is common, while some revisions use ST7789. Check the seller's listing or documentation for the exact board before choosing a software configuration.

### Does the CYD have Wi-Fi and Bluetooth?

The classic ESP32-2432S028 uses an ESP32-WROOM-32 module, which supports Wi-Fi and Bluetooth. Wireless features and software support depend on the firmware and libraries used by your project.

### Can the CYD run ESPHome?

ESPHome can be used with supported ESP32 touchscreen configurations, but compatibility depends on the exact board revision and the display and touch components. Confirm the controller and pin configuration for your hardware before copying a configuration from another CYD project.

## Related Guides and Boards

- [ESP32 display selector](/tools/esp32-touchscreen-selector/) – compare touchscreen boards.
- [ESP32 touchscreen displays guide](/esp32-touchscreen-displays-guide/) – understand display sizes, interfaces and touch technologies.
- [ESP32-2432S028 2.8-inch CYD](/products/esp32-2432s028-2-8-cyd/) – classic CYD specifications and hardware revisions.
- [Sunton ESP32-8048S043C](/products/sunton-esp32-8048s043c/) – larger ESP32-S3 touchscreen board.
- [Guition ESP32-S3-4848S040](/products/guition-esp32-s3-4848s040/) – square 4-inch touchscreen alternative.
