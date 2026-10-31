---
layout: product
internal_links: true
title: "Guition ESP32-S3-4848S040"
product_verdict: "A good fit for a square 4-inch 480×480 ESP32-S3 touchscreen dashboard; verify the relay version and mounting dimensions before ordering."
editorial_review:
  rating: 9.5
  best_rating: 10
  worst_rating: 1
  author: "Embedded Nerd"
  summary: "The Guition ESP32-S3-4848S040 brings a sharp square 4-inch 480×480 IPS touchscreen, capacitive GT911 touch, ESP32-S3 processing, 16MB Flash and 8MB PSRAM into one compact development platform. Its strong hardware features make it a compelling basis for Home Assistant dashboards and custom LVGL interfaces; the main caveats are GPIO availability, software configuration and variant differences."
  methodology: "This editorial assessment is based on published specifications and available manufacturer/community documentation. Embedded Nerd has not physically tested the specific board or seller listing covered by this page."
  pros:
    - "Sharp 4-inch 480×480 IPS display with capacitive GT911 touch"
    - "ESP32-S3 with 16MB Flash and 8MB PSRAM for more ambitious interfaces"
    - "Community ESPHome and LVGL resources provide a useful starting point for Home Assistant panels"
  cons:
    - "The RGB display consumes many GPIOs, so available pins must be checked before adding peripherals"
    - "Community software configurations should be verified against the exact board revision"
    - "Relay modules and enclosures vary by listing; check compatibility and dimensions before ordering"
seo_title: "Guition ESP32-S3-4848S040: 4-Inch 480×480 Specs"
seo_description: "Guition ESP32-S3-4848S040 4-inch touchscreen: 480×480 specs, GPIO pinout, GT911 touch and ESPHome setup guidance."
page_id: product-guition-esp32-s3-4848s040
available_languages:
  - en
  - de
english_url: /products/guition-esp32-s3-4848s040/
german_url: /de/products/guition-esp32-s3-4848s040/
product_id: guition-esp32-s3-4848s040
category: Displays
manufacturer: "Guition"

image: "/assets/images/products/guition-4848s040-home-assistant-review.webp"
header:
  teaser: "/assets/images/products/guition-4848s040-home-assistant-review.webp"
  og_image: "/assets/images/products/guition-4848s040-home-assistant-review.webp"
  og_image_alt: "Guition ESP32-S3-4848S040 4-inch 480×480 touchscreen development board"
alt: "Guition ESP32-S3-4848S040 4-inch square touchscreen development board"

excerpt: "Guition ESP32-S3-4848S040 with ESP32-S3, 4-inch 480×480 IPS display, GT911 capacitive touch, 16MB Flash and 8MB PSRAM."

description: "The Guition ESP32-S3-4848S040 is a square touchscreen development board with an ESP32-S3, 4-inch 480×480 IPS display, ST7701S display driver, GT911 capacitive touch, 16MB Flash and 8MB PSRAM. Some listings bundle the board with a relay module or wall-mount enclosure; verify the exact variant."

categories:
  - Displays
  - ESP32
  - ESP32-S3
  - Smart Home
tags:
  - ESP32
  - ESP32-S3
  - Guition
  - 4848S040
  - 4-inch
  - 480x480
  - IPS
  - ST7701S
  - GT911
  - Capacitive Touch
  - LVGL
  - ESPHome
  - Home Assistant

permalink: /products/guition-esp32-s3-4848s040/

specifications:
  - name: Processor
    value: "ESP32-S3, dual-core up to 240 MHz"
  - name: Flash
    value: "16 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Display Size
    value: "4.0 inches"
  - name: Display Type
    value: "IPS TFT"
  - name: Resolution
    value: "480 × 480"
  - name: Display Controller
    value: "ST7701S"
  - name: Touch Type
    value: "Capacitive"
  - name: Touch Controller
    value: "GT911"
  - name: Wireless
    value: "2.4 GHz Wi-Fi and Bluetooth LE"
  - name: USB
    value: "USB Type-C (verify listing/revision)"
  - name: Dimensions
    value: "Board dimensions vary by assembly; verify the exact version and enclosure"
  - name: Relay Module
    value: "Optional; depends on the listing"

links:
  - title: "GUITION manufacturer product page"
    icon: "fas fa-book"
    description: "Manufacturer overview for the 4-inch ESP32-S3 display family."
    url: "https://www.guition.com/esp32-display-module/4-inch-esp32s3-display-module"
  - title: "ESPHome device configuration"
    icon: "fas fa-microchip"
    description: "Community hardware profile and configuration for the 4848S040."
    url: "https://devices.esphome.io/devices/guition-esp32-s3-4848s040/"
  - title: "Community ESPHome/LVGL project"
    icon: "fab fa-github"
    description: "Community notes and example configuration for this display."
    url: "https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040"

related:
  - sunton-esp32-8048s043c
  - esp32-2432s028-2-8-cyd
  - waveshare-esp32-s3-touch-lcd-4-3
---
The Guition ESP32-S3-4848S040 is a 4.0-inch (4″) ESP32-S3 touchscreen board with a square 480×480 IPS display, GT911 capacitive touch, 16MB Flash and 8MB PSRAM. It is designed for compact Home Assistant dashboards, wall panels and custom LVGL interfaces.

## Is the Guition ESP32-S3-4848S040 Worth Buying?

Choose this board if you want a square 4-inch touchscreen for a Home Assistant dashboard, wall panel or custom LVGL interface. The 480×480 resolution gives you a square layout, while 16MB Flash and 8MB PSRAM provide room for more involved interfaces.

Before ordering, check whether the listing is for the bare display board or a version with relays and an enclosure. The relay assembly may not fit a standard 60 mm EU round wall box.

## Specifications at a glance

| Specification | Details |
|---|---|
| MCU | ESP32-S3, dual-core up to 240 MHz |
| Flash | 16 MB |
| PSRAM | 8 MB |
| Display size | 4.0-inch (4″) IPS panel |
| Resolution | 480×480 pixels |
| Display driver | ST7701S |
| Touch | Capacitive, GT911 |
| Wireless | Wi-Fi and Bluetooth LE |
| USB | USB Type-C is listed for common variants; confirm the exact revision |
| Relays | Optional, listing-dependent |
| Dimensions | Verify the board/enclosure variant before ordering |

Specifications are based on manufacturer and community documentation; seller listings may bundle different board and relay assemblies.

## Display, touch and memory

The 4-inch IPS panel has a square 480×480 resolution and uses the ST7701/ST7701S display controller. Capacitive touch is handled by the GT911. The ESP32-S3 configuration commonly listed for this model includes 16MB Flash and 8MB PSRAM.

The RGB display interface uses a substantial number of GPIOs. If your project needs extra sensors, SPI peripherals or other external hardware, check the pinout and available GPIOs before choosing this board.

## Guition ESP32-S3-4848S040 pinout and GPIO usage

The board's 480×480 RGB display and capacitive touch controller use multiple ESP32-S3 GPIOs. A community ESPHome hardware profile documents the assignments below; use it as a reference, then confirm them against your exact board revision and schematic before wiring external devices.

### Display and touchscreen signals

| Function | GPIO assignment in community ESPHome profile |
|---|---|
| Red display data | GPIO 11, 12, 13, 14, 0 |
| Green display data | GPIO 8, 20, 3, 46, 9, 10 |
| Blue display data | GPIO 4, 5, 6, 7, 15 |
| Display data enable (DE) | GPIO 18 |
| Display horizontal sync (HSYNC) | GPIO 16 |
| Display vertical sync (VSYNC) | GPIO 17 |
| Display pixel clock (PCLK) | GPIO 21 |
| Display initialization chip select | GPIO 39 |
| Display initialization clock | GPIO 48 |
| Display initialization data | GPIO 47 |
| Touch I²C SDA | GPIO 19 |
| Touch I²C SCL | GPIO 45 |
| Backlight PWM | GPIO 38 |

The documented configuration uses the ST7701S display controller and GT911 capacitive touch controller. GPIO assignments can depend on board revisions, so treat this table as a documented reference rather than a guarantee for every seller variant.

### Which GPIOs are free for external hardware?

Do not assume that any ESP32-S3 GPIO not listed above is available on an accessible connector. Some pins may be reserved for onboard hardware, unavailable on the board's headers, or subject to ESP32-S3 boot and peripheral constraints. Check the schematic and connector pinout for your exact assembly before connecting sensors, SPI devices or other peripherals.

Reference: [ESPHome Devices — Guition ESP32-S3-4848S040](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/).

## With or without relays

The 4848S040 is sold in multiple configurations. Some offers include a relay module and wall-mount housing; others are the display/ESP32-S3 board only. Do not assume relays, a power supply or an enclosure are included unless the selected variant explicitly lists them.

For EU installations, check the complete dimensions and enclosure photos carefully. The relay version may not fit a standard 60 mm round EU wall box. Do not work with mains voltage unless you are qualified to do so.

## ESPHome, Home Assistant and LVGL

A community configuration is available for ESPHome, including the ST7701S display and GT911 touch controller. It can be a useful starting point for a Home Assistant control panel. Arduino and LVGL workflows are also used by the community, but check the software configuration for the exact board revision.

For the complete [pinout and GPIO reference](/guition-esp32-s3-4848s040-pinout-esphome/), including display signals and touch wiring, see the technical guide. For configuration steps, follow the [ESPHome setup guide](/guition-esp32-s3-4848s040-pinout-esphome/).

- [ESPHome device page](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [Community ESPHome/LVGL example and YAML template](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

### Starting with an ESPHome configuration

The community project's YAML file is a template that imports a package from the same repository. It is not a fully self-contained configuration: replace the sample device name and room values, configure Wi-Fi secrets, and inspect the referenced package and its component files before flashing.

Use the project's current [ESPHome YAML template](https://github.com/jtenniswood/esphome-lvgl/blob/main/guition-esp32-s3-4848s040/esphome.yaml) as a starting point. Confirm compatibility with your installed ESPHome version and the exact board variant. This page does not claim that the community YAML has been independently tested by Embedded Nerd.

## Where to buy

Choose the configuration that fits your project. Prices are indicative and may change; check the selected option, shipping and final delivered price on the seller's page before ordering.

The purchase buttons above link to Amazon and two AliExpress variants. The relay option is listed separately from the lower-cost option. Verify the selected variant, included accessories and final delivered price before purchase; do not assume a relay module or enclosure is included with every listing.

As an affiliate, Embedded Nerd may earn a commission from qualifying purchases at no extra cost to you.

## FAQ

### Is the Guition 4848S040 a 4-inch display?

Yes. The Guition ESP32-S3-4848S040 uses a 4.0-inch (4″) square IPS display with a resolution of 480 × 480 pixels. Check the selected listing to confirm the exact board variant.

### Does the Guition ESP32-S3-4848S040 have capacitive touch?

Yes. The documented 4848S040 configuration uses a GT911 capacitive touch controller. Confirm the model and revision in the listing before ordering.

### Does the Guition ESP32-S3-4848S040 come with relays?

Not always. It is sold in versions with and without a relay module, and some listings bundle an enclosure. Check the selected variant and included accessories.

### Does the Guition ESP32-S3-4848S040 work with ESPHome?

A community hardware profile and an ESPHome/LVGL example are available. Review the pin definitions, package dependencies and current ESPHome compatibility for your exact board variant before flashing.

### Is the Guition ESP32-S3-4848S040 suitable for Home Assistant?

It can be used as the basis for a Home Assistant touchscreen dashboard with a compatible ESPHome configuration. The interface, sensors and controls still need to be configured for your installation.

## Compare other ESP32 touchscreen boards

| Board | Best for |
|---|---|
| Guition ESP32-S3-4848S040 | Square 4-inch 480×480 interface |
| [Sunton ESP32-8048S043C](/products/sunton-esp32-8048s043c/) | Wider 4.3-inch 800×480 interface |
| [ESP32-2432S028 CYD](/products/esp32-2432s028-2-8-cyd/) | Lower-cost, compact 2.8-inch touchscreen |

Not sure which board fits your project? Use the [ESP32 Touchscreen Selector](/tools/esp32-touchscreen-selector/) and read the [ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/).
