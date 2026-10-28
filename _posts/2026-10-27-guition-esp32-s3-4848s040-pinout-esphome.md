---
title: "4848S040 Pinout, GPIOs & ESPHome Setup Guide"
title_tag: "4848S040 Pinout & ESPHome Setup Guide"
layout: single
permalink: /guition-esp32-s3-4848s040-pinout-esphome/
excerpt: "Guition ESP32-S3-4848S040 pinout, RGB display signals, ST7701S initialization, GT911 touch, backlight GPIO and ESPHome setup notes."
show_date: false
read_time: false
last_modified_at: 2026-10-27
header:
  teaser: /assets/images/guition-esp32-s3-4848s040-back.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image_alt: "Rear view of the Guition ESP32-S3-4848S040 touchscreen board"
categories:
  - Displays
  - ESP32
tags:
  - esp32-s3
  - guition
  - touchscreen
  - esphome
  - pinout
sidebar:
  nav: "embedded"
related: true
related_posts:
  - /products/guition-esp32-s3-4848s040/
  - /esp32-touchscreen-displays-guide/
share: true
seo_title: "4848S040 Pinout, GPIOs & ESPHome Setup Guide"
seo_description: "4848S040 pinout and GPIO reference, RGB display signals, GT911 touch, backlight control and ESPHome setup guidance for this ESP32-S3 touchscreen."
---

For the board’s full specifications, editorial review, available variants and buying options, visit the [Guition ESP32-S3-4848S040](/products/guition-esp32-s3-4848s040/) product page.

This guide focuses on the 4848S040 pinout, display and touch interfaces, relay-related hardware considerations, and how to use an existing ESPHome configuration as a starting point.

![Rear view of the Guition ESP32-S3-4848S040 board](/assets/images/guition-esp32-s3-4848s040-back.webp)

> **Important:** Pin assignments and available GPIOs can vary by board revision. Use the tables below as a reference, then confirm them against your exact board and its documentation before wiring external hardware.

## Key hardware at a glance

This board family combines an ESP32-S3, a 480 × 480 RGB display using the ST7701S, and GT911 capacitive touch. Memory, relay hardware and enclosure options should be checked against the exact revision and seller listing. See the [product page for full specifications and buying options](/products/guition-esp32-s3-4848s040/).

## Guition ESP32-S3-4848S040 pinout

The following assignments are listed in the ESPHome Devices profile. Check your board revision before relying on them for hardware connections.

### RGB display pins

| Display signal | GPIO |
|---|---:|
| Red data | 11, 12, 13, 14, 0 |
| Green data | 8, 20, 3, 46, 9, 10 |
| Blue data | 4, 5, 6, 7, 15 |
| Display enable (DE) | 18 |
| Horizontal sync (HSYNC) | 16 |
| Vertical sync (VSYNC) | 17 |
| Pixel clock (PCLK) | 21 |

### ST7701S display initialization

| Signal | GPIO |
|---|---:|
| CS | 39 |
| CLK | 48 |
| DATA | 47 |

These signals are used for display initialization. They are separate from the RGB pixel data and timing signals.

### GT911 touch controller and backlight

| Function | GPIO |
|---|---:|
| Touch I²C SDA | 19 |
| Touch I²C SCL | 45 |
| Backlight PWM | 38 |

The GT911 uses I²C for touch communication. GPIO 38 is listed for backlight PWM control in the referenced profile.

![Guition ESP32-S3-4848S040 screen demonstration](/assets/images/guition-esp32-s3-4848s040-screen-demo.webp)

*Screen demonstration of the Guition ESP32-S3-4848S040.*

### Quick GPIO reference

The profile assigns **26 distinct GPIOs** to the display, display initialization, touch controller, and backlight:

`GPIO0, GPIO3, GPIO4, GPIO5, GPIO6, GPIO7, GPIO8, GPIO9, GPIO10, GPIO11, GPIO12, GPIO13, GPIO14, GPIO15, GPIO16, GPIO17, GPIO18, GPIO19, GPIO20, GPIO21, GPIO38, GPIO39, GPIO45, GPIO46, GPIO47, GPIO48`

This list describes the assignments in the referenced configuration. It does **not** prove that every other GPIO is available for external use. Other pins may be reserved for flash or PSRAM, onboard components, or board-specific functions.

## Which GPIOs are free?

Do not assume that a GPIO is available simply because it does not appear in the tables above. Before using a pin for a sensor, relay, button, or other peripheral:

1. Check the schematic and documentation for your exact board revision.
2. Confirm which GPIOs are physically exposed on the board.
3. Check whether the pin is reserved for flash, PSRAM, USB, boot configuration, or another onboard component.
4. Compare your intended pin assignment with the ESPHome configuration you plan to use.

The board profile is a useful starting point, but it is not a substitute for the schematic of your specific hardware revision.

## Relay and non-relay versions

The 4848S040 is sold in variants that may include a relay module and different mounting arrangements. If you are deciding between versions, check the [product page for variant details and guidance on which version to buy](/products/guition-esp32-s3-4848s040/).

- **Non-relay version:** Check the exact board documentation to identify the exposed connections and supported peripherals.
- **Relay version:** Do not assume the relay’s GPIO assignment or electrical ratings. Verify them in the schematic or documentation for that version before connecting a load.
- **Wall mounting:** The relay version may not fit a 60 mm European round wall box. Confirm the dimensions and mounting arrangement before purchasing or installing it.

Never connect a mains-voltage load based only on a generic pinout. Confirm the relay’s ratings, isolation, enclosure, and wiring requirements for the exact product.

## Getting started with ESPHome

An existing ESPHome configuration can help you get started, but inspect it before flashing. These community resources are useful starting points:

- [ESPHome Devices: Guition ESP32-S3-4848S040](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [Community ESPHome configuration](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

The following workflow helps reduce the risk of using a configuration intended for a different revision:

1. Open the configuration and read the YAML files and any referenced packages.
2. Check that the display, touch, and backlight GPIO assignments match your board.
3. Replace example device names, Wi-Fi credentials, and secrets with your own values.
4. Review any additional components or external packages used by the configuration.
5. Validate the configuration in ESPHome before flashing.
6. Follow the documented first-flash procedure for your board and revision.

This guide does not claim that the community configuration has been tested on every board revision. If the board does not start or the display remains blank, re-check the configuration and confirm the pinout against the hardware documentation before making wiring changes.

![Guition ESP32-S3-4848S040 dashboard on the touchscreen](/assets/images/guition-esp32-s3-4848s040-dashboard.webp)

*Example dashboard shown on the touchscreen.*

## Frequently asked question

### Can I use ESPHome with this display?

The linked ESPHome Devices profile and community configuration provide starting points. Review the YAML, verify the GPIO assignments for your board revision, and validate the configuration before flashing.

## Next steps

Ready to choose a board? Visit the [Guition ESP32-S3-4848S040 product page](/products/guition-esp32-s3-4848s040/) for the full specifications, editorial review, variant details and current buying options.

## Related resources

- [Guition ESP32-S3-4848S040 product page](/products/guition-esp32-s3-4848s040/)
- [ESP32 touchscreen selector](/tools/esp32-touchscreen-selector/)
- [ESP32 touchscreen displays guide](/esp32-touchscreen-displays-guide/)
- [ESPHome Devices profile](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [Community ESPHome configuration](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)
