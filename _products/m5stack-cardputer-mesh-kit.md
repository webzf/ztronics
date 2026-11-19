---
layout: product
internal_links: true
title: "M5Stack Cardputer Mesh Kit: ESP32-S3 LoRa & Meshtastic"
product_verdict: "A compact, ready-to-use Meshtastic handheld that combines the Cardputer-Adv with an SX1262 LoRa/GNSS expansion. Buy the complete Mesh Kit if you need the authorized Meshtastic hardware; the standard Cardputer-Adv alone is not equivalent."
seo_title: "M5Stack Cardputer Mesh Kit: Price, Specs & Meshtastic"
seo_description: "M5Stack Cardputer Mesh Kit with ESP32-S3, SX1262 LoRa, GNSS and Meshtastic pre-installed. Compare specs, setup, regional bands and where to buy."
page_id: product-m5stack-cardputer-mesh-kit
product_id: m5stack-cardputer-mesh-kit
category: ESP32
manufacturer: "M5Stack"
header:
excerpt: "M5Stack Cardputer Mesh Kit combines the ESP32-S3 Cardputer-Adv, Cap LoRa-1262 SX1262 radio, GNSS receiver and pre-installed Meshtastic firmware."
description: "Portable ESP32-S3 handheld with a 56-key keyboard, 1.14-inch display, SX1262 LoRa radio, GNSS and Meshtastic."
categories:
  - ESP32
  - ESP32-S3
  - LoRa
  - Meshtastic
  - Wireless
tags:
  - M5Stack
  - Cardputer
  - Cardputer-Adv
  - Cardputer Mesh Kit
  - Meshtastic
  - LoRa
  - SX1262
  - GNSS
  - GPS
  - ESP32-S3
  - Mesh Networking
  - Portable
permalink: /products/m5stack-cardputer-mesh-kit/
specifications:
  - name: Main controller
    value: "M5Stack Cardputer-Adv, Stamp-S3A / ESP32-S3FN8"
  - name: Processor
    value: "Dual-core Xtensa LX7, up to 240 MHz"
  - name: Flash
    value: "8 MB"
  - name: Display
    value: "1.14-inch ST7789V2 LCD, 240 × 135"
  - name: Keyboard
    value: "56 keys"
  - name: LoRa radio
    value: "Semtech SX1262"
  - name: Frequency range
    value: "868–923 MHz; select the correct regional band"
  - name: Maximum transmit power
    value: "+22 dBm (module specification)"
  - name: Receive sensitivity
    value: "Up to -147 dBm (low-data-rate mode)"
  - name: GNSS
    value: "ATGM336H-6N / AT6668; GPS, QZSS, BeiDou, Galileo and GLONASS"
  - name: Battery
    value: "1500 mAh in the latest documentation revision; official store listing still shows 1750 mAh"
  - name: Audio
    value: "ES8311 codec, MEMS microphone, 1 W speaker and 3.5 mm audio output"
  - name: IMU
    value: "BMI270 6-axis sensor"
  - name: Storage
    value: "microSD card slot"
  - name: Expansion
    value: "HY2.0-4P Grove and EXT 2.54-14P"
  - name: Development
    value: "Arduino, UiFlow2, ESP-IDF and PlatformIO"
links:
  - title: "M5Stack Cardputer Mesh Kit documentation"
    icon: "fas fa-book"
    description: "Official hardware specifications, package contents and registration notes."
    url: "https://docs.m5stack.com/en/core/Cardputer_Mesh_Kit"
  - title: "Official Meshtastic setup guide"
    icon: "fas fa-book"
    description: "M5Stack's step-by-step firmware, assembly and first-start instructions."
    url: "https://docs.m5stack.com/en/guide/cardputer_mesh_kit/meshtastic"
  - title: "M5Stack official product listing"
    icon: "fas fa-shopping-cart"
    description: "Manufacturer store listing for the complete Cardputer Mesh Kit."
    url: "https://shop.m5stack.com/products/cardputer-mesh-kit-for-meshtastic-esp32-s3"
related:
  - lilygo-t-deck-plus
---

The **M5Stack Cardputer Mesh Kit (SKU K152)** combines the Cardputer-Adv handheld computer with the Cap LoRa-1262 expansion module. The result is a pocket-sized device for Meshtastic messaging, LoRa mesh networking and GNSS-based location sharing.

This is the complete kit to look at if your goal is a Cardputer with LoRa. The standard Cardputer-Adv does not include the Cap LoRa-1262 radio/GNSS module, antenna or the kit's Meshtastic authorization.

## Is the M5Stack Cardputer Mesh Kit worth buying?

The main reason to choose the Mesh Kit is that it arrives as a matched hardware bundle: Cardputer-Adv, SX1262 LoRa/GNSS module and antenna, with Meshtastic firmware pre-installed. It avoids sourcing and assembling the radio expansion separately.

It is particularly interesting for:
- Portable Meshtastic messaging with a physical keyboard
- Outdoor mesh networking and field communications
- Sharing GNSS location with other nodes
- Experimenting with LoRa, GPS and ESP32-S3 development
- Building custom handheld tools with Arduino, ESP-IDF or PlatformIO

It is not simply a standard Cardputer-Adv with a different name. The Cap LoRa-1262 and the official Mesh Kit bundle are important to the Meshtastic authorization process.

## Cardputer-Adv vs Cardputer Mesh Kit

| Feature | Cardputer-Adv | Cardputer Mesh Kit |
|---|---|---|
| ESP32-S3 handheld | Yes | Yes |
| 56-key keyboard and 1.14-inch display | Yes | Yes |
| SX1262 LoRa radio | No, not included | Included in Cap LoRa-1262 |
| GNSS receiver | No, not included | Included |
| External LoRa antenna | Not included | Included |
| Meshtastic pre-installed | Not guaranteed | Yes, factory pre-installed |
| Official Meshtastic device registration | Not eligible as a standalone Cardputer | Supported for the complete kit |

**Buying advice:** if Meshtastic is the reason you are buying it, choose the complete Cardputer Mesh Kit. M5Stack's documentation says only devices in the Cardputer Mesh Kit set can be registered as the authorized device; a separate Cardputer or Cardputer-Adv is not eligible for that registration.

## Hardware overview

### Cardputer-Adv handheld

The Cardputer-Adv is built around M5Stack's Stamp-S3A module, based on the ESP32-S3FN8. It has a compact 56-key keyboard, a 1.14-inch 240 × 135 LCD, microSD storage, a six-axis BMI270 IMU and audio hardware.

The handheld also provides a Grove connector and a 14-pin expansion interface used by the LoRa cap.

### Cap LoRa-1262: SX1262 and GNSS

The Cap LoRa-1262 attaches to the Cardputer-Adv through its EXT 2.54-14P connector. It adds:
- Semtech SX1262 LoRa transceiver
- 868–923 MHz operating range (regional configuration matters)
- Up to +22 dBm transmit power
- Receive sensitivity down to -147 dBm in low-data-rate mode
- External RP-SMA LoRa antenna connector
- Integrated GNSS receiver and ceramic GNSS antenna
- HY2.0-4P connector for external sensors

The GNSS receiver supports GPS, QZSS, BeiDou, Galileo and GLONASS. M5Stack specifies positioning accuracy below 1.5 m (CEP50) under its stated test conditions.

## Specifications at a glance

| Specification | Details |
|---|---|
| Main MCU | ESP32-S3FN8, dual-core Xtensa LX7 up to 240 MHz |
| Flash | 8 MB |
| Display | 1.14-inch ST7789V2 LCD |
| Resolution | 240 × 135 |
| Keyboard | 56 keys |
| LoRa chipset | SX1262 |
| LoRa band | 868–923 MHz, hardware/region dependent |
| TX power | Up to +22 dBm |
| RX sensitivity | Up to -147 dBm |
| GNSS | ATGM336H-6N / AT6668 |
| GNSS constellations | GPS, QZSS, BeiDou, Galileo, GLONASS |
| IMU | BMI270 |
| Audio | ES8311, MEMS microphone, 1 W speaker, 3.5 mm output |
| Storage | microSD |
| Battery | 1500 mAh in latest documentation revision; store listing still says 1750 mAh |
| Dimensions | Cardputer-Adv: 84 × 54 × 19.6 mm; Cap: 84 × 24 × 15.2 mm |

M5Stack's Cardputer-Adv documentation includes a version-change note dated 13 July 2026 stating that the battery capacity changed from 1750 mAh to 1500 mAh. The official store listing still displays 1750 mAh. This page reports the latest documentation revision and flags the discrepancy; check the exact hardware revision and seller listing before purchase.

## Meshtastic: ready to use

The Cardputer Mesh Kit is supplied with Meshtastic firmware pre-installed. M5Stack provides an official setup guide covering firmware flashing, module assembly, region selection and first startup.

The keyboard makes the device useful as a standalone messaging terminal, while the mobile Meshtastic app can be used for channel management and map views.

### Set the correct LoRa region

During first startup, select the region that matches your country and local radio regulations. For Portugal and most of the EU, the relevant Meshtastic region is normally **EU_868**. Always confirm the current national rules and the device's permitted frequency and transmit-power settings before transmitting.

Do not assume that every frequency in the module's broad 868–923 MHz specification is legal for use in every country.

### Important antenna warning

**Connect the LoRa antenna before powering the Cap LoRa-1262.** M5Stack warns that operating the radio module without its antenna can permanently damage the hardware.

### Official Meshtastic device registration

M5Stack documents an authorization/registration process for the Cardputer Mesh Kit. The complete kit must be assembled and running Meshtastic firmware before registration. The manufacturer explicitly states that standalone Cardputer and Cardputer-Adv units are not eligible for this kit registration.

## GNSS and location sharing

The Cap LoRa-1262 adds GNSS positioning to the handheld. In Meshtastic, location information can be shared with other nodes and viewed through the mobile app's map interface.

GNSS performance depends on satellite visibility, antenna placement and the surrounding environment. For best results, use the device outdoors with a clear view of the sky.

## Development beyond Meshtastic

The Cardputer-Adv remains an ESP32-S3 development platform. M5Stack lists Arduino, UiFlow2, ESP-IDF and PlatformIO as development options. The Cap LoRa-1262 also has documentation and libraries for LoRa and GNSS development.

If you plan to replace the factory firmware with a custom project, follow M5Stack's flashing instructions and check which functions you may lose until Meshtastic is restored.

## Where to buy the M5Stack Cardputer Mesh Kit

The safest way to identify the correct bundle is to check that the listing explicitly includes all three key items:
1. Cardputer-Adv handheld
2. Cap LoRa-1262 expansion module
3. LoRa antenna with RP-SMA connector

The official M5Stack store listing is linked below. Marketplace prices, shipping and bundle contents can change, so verify the selected variant before checkout.

[Check the official M5Stack Cardputer Mesh Kit listing](https://shop.m5stack.com/products/cardputer-mesh-kit-for-meshtastic-esp32-s3)

AliExpress purchase button: add the verified affiliate URL for the complete Cardputer Mesh Kit after confirming that the destination is the ADV + Cap LoRa-1262 bundle. Do not use a standard Cardputer-Adv-only listing for this CTA.

As an affiliate, Embedded Nerd may earn a commission from qualifying purchases at no extra cost to you.

## Frequently asked questions

### Does the M5Stack Cardputer Mesh Kit support Meshtastic?

Yes. The complete kit ships with Meshtastic firmware pre-installed and M5Stack provides an official setup guide. The manufacturer also documents a device registration process for the kit.

### Does the normal Cardputer-Adv have LoRa?

No. The SX1262 LoRa radio and GNSS receiver are supplied by the separate Cap LoRa-1262 expansion module included in the Cardputer Mesh Kit.

### Can I register a standalone Cardputer-Adv as an authorized Meshtastic device?

M5Stack says only devices supplied as part of the Cardputer Mesh Kit set are eligible for its authorized-device registration. A standalone Cardputer or Cardputer-Adv is not eligible.

### Does the Cardputer Mesh Kit include GPS?

Yes. The Cap LoRa-1262 includes a GNSS receiver and supports GPS, QZSS, BeiDou, Galileo and GLONASS.

### Which LoRa frequency should I use in Portugal?

For normal EU Meshtastic use, select the EU_868 region and follow the applicable local radio rules. Do not select a region based only on the module's broad hardware frequency range.

### Can I use the Cardputer Mesh Kit for custom ESP32 projects?

Yes. The Cardputer-Adv supports Arduino, UiFlow2, ESP-IDF and PlatformIO. M5Stack also provides development resources for the LoRa and GNSS expansion.

### Does it support MeshCore?

Do not assume official MeshCore certification or out-of-the-box support. Meshtastic is the firmware documented and pre-installed by M5Stack for this kit. Treat any alternative firmware support as a separate community project and verify compatibility before flashing.

## Sources and verification

- [M5Stack Cardputer Mesh Kit hardware documentation](https://docs.m5stack.com/en/core/Cardputer_Mesh_Kit)
- [M5Stack Meshtastic setup guide](https://docs.m5stack.com/en/guide/cardputer_mesh_kit/meshtastic)
- [M5Stack official store listing](https://shop.m5stack.com/products/cardputer-mesh-kit-for-meshtastic-esp32-s3)

*Editorial note: This is a documentation-based product overview, not a hands-on review. Specifications and package contents should be checked against the exact seller listing and hardware revision.*
