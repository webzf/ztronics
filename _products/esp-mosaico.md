---
layout: product
internal_links: true
title: "ESP-Mosaico (ESP32-S31)"
product_verdict: "A distinctive development kit for experimenting with display-based interaction, sensors, audio, modular hardware and AI-assisted coding. Its appeal depends on whether you want the integrated hardware and modular workflow; confirm the exact kit contents, revision and delivered cost before ordering."
seo_title: "ESP-Mosaico ESP32-S31: Price, Specs & Where to Buy"
seo_description: "ESP-Mosaico costs US$59 from the official store (pre-order). Compare ESP32-S31 specs, Waveshare alternatives and where to buy."
product_id: esp-mosaico
category: Displays
manufacturer: "Espressif"
image: "/assets/images/esp-mosaico-vision-combo.webp"
alt: "Official ESP-Mosaico Vision Combo Kit showing the ESP-Mosaico core unit, camera module and interaction module"
header:
  teaser: "/assets/images/esp-mosaico-vision-combo.webp"
  og_image: "/assets/images/esp-mosaico-vision-combo.webp"
  og_image_alt: "ESP-Mosaico Vision Combo Kit with core unit, camera module and interaction module"
excerpt: "ESP-Mosaico is an ESP32-S31 modular development kit with a 2.16-inch 480×480 AMOLED touchscreen, sensors, audio, flash storage and expansion headers."
description: "ESP-Mosaico is a modular development kit built around the ESP32-S31, combining a 2.16-inch 480×480 QSPI AMOLED touchscreen, Wi-Fi 6, Bluetooth 5.4, 802.15.4, onboard sensors, audio hardware and expansion modules."
categories:
  - Displays
  - ESP32
  - ESP32-S31
  - Development Boards
tags:
  - ESP-Mosaico
  - ESP32-S31
  - Espressif
  - AMOLED
  - Touchscreen
  - 480x480
  - AI Coding
  - ESP-IDF
  - ESP-Claw
permalink: /products/esp-mosaico/
specifications:
  - name: SoC
    value: "Espressif ESP32-S31NRV16, dual-core 32-bit RISC-V, up to 320 MHz"
  - name: Wireless
    value: "2.4 GHz Wi-Fi 6, Bluetooth 5.4, IEEE 802.15.4 (Thread / Zigbee)"
  - name: Display
    value: "2.16-inch AMOLED touchscreen, 480 × 480, QSPI"
  - name: Display controller
    value: "CO5300"
  - name: Touch controller
    value: "CST9220 series"
  - name: PSRAM
    value: "16 MB in-package"
  - name: NOR flash
    value: "16 MB SPI NOR"
  - name: NAND storage
    value: "1 Gbit (128 MB) SPI NAND"
  - name: Motion sensing
    value: "BMI270 6-axis IMU"
  - name: Magnetic sensing
    value: "Two BMM150 3-axis magnetometers"
  - name: Audio
    value: "ES8311 audio codec, NS4150B mono Class-D amplifier, speaker and microphone"
  - name: Expansion
    value: "Two 2 × 10-pin, 2.54 mm module headers; GPIO, UART, USB Serial/JTAG and power signals"
  - name: USB
    value: "USB Type-C, USB 2.0 High-Speed OTG for power, debug and communication"
  - name: Battery
    value: "Onboard 3.7 V, 65 mAh Li-ion battery"
  - name: Development
    value: "ESP-IDF target esp32s31; Espressif BSP and ESP-Claw resources"
links:
  - title: "Official ESP-Mosaico V1.2 User Guide"
    icon: "fas fa-book"
    description: "Hardware reference, setup guidance, pin assignments and V1.2 revision details."
    url: "https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide.html"
  - title: "ESP-Mosaico V1.0 User Guide"
    icon: "fas fa-book"
    description: "Use this guide if the CoreBoard silkscreen identifies hardware V1.0."
    url: "https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_v1.0.html"
  - title: "ESP-Mosaico Camera Module Guide"
    icon: "fas fa-camera"
    description: "Official installation and hardware notes for the optional camera module."
    url: "https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_camera.html"
related:
  - waveshare-esp32-s3-touch-amoled-2-16
  - waveshare-esp32-s3-touch-amoled-2-41
  - waveshare-esp32-p4-wifi6-touch-lcd-3-4c
---

The **ESP-Mosaico** is a modular development kit from Espressif built around the **ESP32-S31**. Unlike a conventional microcontroller board, it combines a small touch display, motion and magnetic sensing, audio, local storage and expansion headers in a package intended for interactive hardware projects and AI-assisted development.

This page focuses on the hardware, purchase considerations and whether the kit suits your project.

*Editorial note: This is a documentation-based assessment, not a physical review. Embedded Nerd has not hands-on tested this board.*

## Is the ESP-Mosaico worth buying?

The ESP-Mosaico is worth considering if you want a compact interactive platform with an AMOLED touchscreen, sensors, audio, local storage and modular expansion. If you only need inexpensive Wi-Fi control or a simple display, a more basic ESP32 board may be better value and easier to adapt.

## Quick facts

| Question | Answer |
|---|---|
| What is it? | A modular ESP32-S31 development kit with an integrated AMOLED touchscreen, sensors, audio and expansion headers. |\n| Official price | US$59 for the Vision Combo Kit; pre-order, with an estimated 15-day dispatch window (checked 2 Nov 2026). |
| Display | 2.16-inch, 480 × 480 AMOLED touchscreen |
| Processor | Dual-core 32-bit RISC-V ESP32-S31NRV16, up to 320 MHz |
| Memory and storage | 16 MB in-package PSRAM, 16 MB SPI NOR and 1 Gbit (128 MB) SPI NAND |
| Development | ESP-IDF target `esp32s31`, Espressif BSP and ESP-Claw resources |
| Physical testing | Not hands-on tested by Embedded Nerd; this assessment is based on published documentation. |

## Who should choose it?

### It may suit you if
- You want a compact, square AMOLED touchscreen and several onboard peripherals in one platform.
- Your project benefits from motion sensing, magnetometers, audio and additional local storage.
- You want to explore the ESP32-S31, its ESP-IDF support and the modular ESP-Mosaico ecosystem.

### It may not suit you if
- You only need a low-cost Wi-Fi microcontroller or a simple display controller.
- You need a larger screen for dense dashboards, accessibility-sized controls or a conventional HMI.
- You need proven battery runtime or independently measured reliability data before buying.

## Display, sensors and storage

The built-in 2.16-inch AMOLED touch display has a 480 × 480 resolution and uses the CO5300 display controller over QSPI; touch is handled by a CST9220-series controller over I²C. This square format is suited to compact controls, status screens and touch-driven interfaces, although the physical area is small for dense information or large touch targets.

The board combines a BMI270 6-axis IMU with two BMM150 magnetometers, so motion-aware and orientation-related interaction can be explored without first adding separate sensor modules. It also includes 16 MB of SPI NOR flash and 1 Gbit (128 MB) of SPI NAND storage for program data and larger assets.

## Audio and interaction

Espressif documents an ES8311 audio codec and NS4150B mono Class-D amplifier, with an onboard speaker and microphone. A vibration motor and physical controls add further interaction options. These components provide the hardware foundation; the software still needs to initialize and use the relevant peripherals.

## Expansion and modular design

The BaseBoard provides two 2 × 10-pin expansion headers with a 2.54 mm pitch. They expose GPIO, power, UART and USB Serial/JTAG-related signals for modules and secondary development.

The official camera module guide states that the camera module is supported in the **left slot (H2) only**. Do not install it in the right slot. Check the matching CoreBoard and module guide before hot-plugging or changing modules; not every expansion module has identical restrictions.

## ESP-IDF and AI-assisted coding

The official getting-started documentation identifies `esp32s31` as the ESP-IDF target and provides a board support package (BSP) intended to simplify initialization of the display, touch, audio, sensors, battery, NAND flash, expansion resources and USB console. The documented first-flash procedure may require entering ROM download mode manually.

Espressif also recommends ESP-Claw as an application framework for the kit. Espressif promotes Chat Coding and Vibe Coding workflows involving AI coding agents for the ESP-Mosaico ecosystem. Treat these as supported product workflows rather than a guarantee that arbitrary prompts, models or generated code will work without debugging. The AI toolchain, account requirements and model availability should be checked in the current official documentation.

For actual commands, USB/serial setup and revision-specific caveats, consult the [official V1.2 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide.html).

## Advantages and limitations

### What stands out

- Integrated 480 × 480 AMOLED touch display in a compact square format.
- Multiple onboard sensors, audio hardware and storage reduce the number of separate parts required for early prototypes.
- Dual expansion headers make the platform more modular than a typical all-in-one display development board.
- Official ESP-IDF target and BSP documentation give developers a hardware-specific starting point.
- The ESP-Mosaico ecosystem is explicitly designed around AI-assisted development and interactive applications.

### What to consider

- The 2.16-inch display is compact; it will not suit every interface or accessibility requirement.
- The platform has more components and a more specialised workflow than a basic ESP32 dev board, adding learning and debugging overhead.
- The 65 mAh onboard battery is small. Do not assume long standalone runtime without measuring consumption and considering the attached modules.
- Expansion modules have placement and compatibility rules; the camera module is limited to the left slot.
- CoreBoard V1.0 and V1.2 are not identical. The V1.2 guide documents pin and power-related changes, so old pinouts should not be applied blindly.

## ESP-Mosaico vs Waveshare ESP32-S3 and ESP32-C6 alternatives

All three boards use a 2.16-inch 480 × 480 AMOLED touchscreen with a CO5300 display driver and CST9220 capacitive touch controller. The important differences are the processor, memory, onboard hardware and expansion approach.

| Feature | ESP-Mosaico | Waveshare ESP32-S3-Touch-AMOLED-2.16 | Waveshare ESP32-C6-Touch-AMOLED-2.16 |
|---|---|---|---|
| SoC | ESP32-S31, dual-core RISC-V up to 320 MHz | ESP32-S3R8, dual-core Xtensa LX7 up to 240 MHz | ESP32-C6, single-core RISC-V up to 160 MHz |
| Display | 2.16-inch 480 × 480 AMOLED | 2.16-inch 480 × 480 AMOLED | 2.16-inch 480 × 480 AMOLED |
| RAM | 16 MB in-package PSRAM | 8 MB PSRAM | 512 KB HP SRAM + 16 KB LP SRAM; no PSRAM listed |
| Flash / storage | 16 MB SPI NOR + 128 MB SPI NAND | 16 MB Flash + TF card slot | 16 MB Flash + TF card slot |
| Sensors | BMI270 IMU and two BMM150 magnetometers | QMI8658 IMU and PCF85063 RTC | QMI8658 IMU and PCF85063 RTC |
| Wireless | Wi-Fi 6, Bluetooth 5.4, 802.15.4 | 2.4 GHz Wi-Fi, Bluetooth 5 LE | Wi-Fi 6, Bluetooth 5 LE, 802.15.4 |
| Expansion | Two 2 × 10-pin module headers and ESP-Mosaico modules | Board-level peripherals and exposed pads | Board-level peripherals and exposed pads |
| Development | ESP-IDF target `esp32s31`, Espressif BSP and ESP-Claw resources | ESP-IDF and Arduino IDE | ESP-IDF and Arduino IDE |

**Choose ESP-Mosaico** if you want its modular ecosystem, dual magnetometers, larger memory resources and dedicated ESP32-S31 platform. **Choose the Waveshare ESP32-S3 version** if you want a dual-core ESP32-S3 with 8 MB PSRAM at a much lower price. **Choose the ESP32-C6 version** if lower cost, Wi-Fi 6 and 802.15.4 matter more than multicore processing or external PSRAM.

These are alternatives for different project requirements, not exact replacements for one another. In particular, the ESP32-C6 is single-core and does not list external PSRAM, so do not assume it will handle the same workloads as the S3 or ESP-Mosaico.

See the individual product pages for more details:
- [Waveshare ESP32-S3-Touch-AMOLED-2.16](/products/waveshare-esp32-s3-touch-amoled-2-16/)
- [Waveshare ESP32-C6-Touch-AMOLED-2.16 product page](/products/waveshare-esp32-c6-touch-amoled-2-16/)

## Where to buy: official ESP-Mosaico vs lower-cost alternatives

If you specifically want the ESP-Mosaico Vision Combo Kit and its modular accessories, the official store is the clearest place to start. The official store currently lists the Vision Combo Kit (Core Unit v1.2 + Camera Module + Interaction Module) at **US$59**. The product is marked **PRE-ORDER**, with an estimated dispatch in 15 days; this is an estimate, not a guaranteed delivery date. Check shipping, taxes and the live dispatch estimate before ordering.

<p><a class="btn btn--primary" href="https://store.mosaico.ai/products/esp-mosaico" target="_blank" rel="noopener noreferrer">Buy ESP-Mosaico — official store (US$59, pre-order)</a></p>

There is also an AliExpress listing linked below. This is a third-party marketplace offer, not the official Espressif store. Compare its final checkout price with the official US$59 listing and verify that the selected option includes the Core Unit, Camera Module and Multi-function Interaction Module before purchasing.

<p><a class="btn btn--primary" href="https://s.click.aliexpress.com/e/_c4Dnkhan" target="_blank" rel="nofollow sponsored noopener noreferrer">Check ESP-Mosaico on AliExpress</a></p>

### Lower-cost 2.16-inch AMOLED alternatives {#lower-cost-amoled-alternatives}

| Board | Current manufacturer price | Where to buy | Main trade-off |
|---|---:|---|---|
| **Waveshare ESP32-S3-Touch-AMOLED-2.16** | US$29.99–31.99 (as of Nov 2026) | [Check AliExpress offer](/go/hardware/waveshare-esp32-s3-touch-amoled-2-16/){: rel="sponsored nofollow"} · [Waveshare product page](https://www.waveshare.com/esp32-s3-touch-amoled-2.16.htm) | Dual-core ESP32-S3 and 8 MB PSRAM, but no ESP-Mosaico modular ecosystem |
| **Waveshare ESP32-C6-Touch-AMOLED-2.16** | US$29.99–31.99 (as of Nov 2026) | [Check AliExpress offer](/go/hardware/waveshare-esp32-c6-touch-amoled-2-16/){: rel="sponsored nofollow"} · [Product details](/products/waveshare-esp32-c6-touch-amoled-2-16/) | Single-core C6 with Wi-Fi 6 and 802.15.4; no external PSRAM listed |

The Waveshare prices are manufacturer-listed ranges and can vary with the battery option. Both AliExpress links are affiliate links supplied for the respective listings. The price ranges above are manufacturer-listed reference prices checked in November 2026, not guaranteed marketplace prices. The AliExpress C6 seller listing may show a different price from Waveshare's official store; compare the final checkout price and selected battery option before ordering.

*Affiliate disclosure: Embedded Nerd may earn a commission from qualifying purchases made through the AliExpress links above, at no additional cost to you. The official ESP-Mosaico store and Waveshare manufacturer pages are not affiliate links.*

Before ordering any of these boards, confirm the selected version, battery inclusion, shipping, delivery estimate and applicable taxes.

## Revision notes: V1.0 vs V1.2

Check the CoreBoard silkscreen and read the corresponding official guide. Among the changes documented for V1.2 are swapped LCD reset and clock GPIO assignments, removal of the programmable orange LED previously on GPIO3, removal of the 3.3 V power LED, changes to codec power-domain control, and separation of onboard devices and expansion modules across two I²C buses. V1.2 also has a dedicated DCDC-generated external 3.3 V rail.

These differences can affect pin assignments and integrations. Always follow the guide for the exact hardware revision in hand.

## Frequently asked questions

### What is the ESP32-S31?

The ESP32-S31 is the SoC used by ESP-Mosaico. It has a dual-core 32-bit RISC-V processor running at up to 320 MHz. It is not the ESP32-S3, which uses a different processor architecture.

### What is the display resolution?

The integrated 2.16-inch AMOLED touchscreen is 480 × 480 pixels and uses a QSPI display interface.

### Does ESP-Mosaico support ESP-IDF?

Yes. Espressif's getting-started documentation uses the `esp32s31` target and provides a board support package for the onboard peripherals. Follow the instructions for your CoreBoard revision.

### Does the Vision Combo Kit include a camera?

Espressif’s ESP-Mosaico documentation describes the Core Unit, Camera Module and Interaction Module. Kit contents can vary by bundle, so confirm the exact components included in the seller’s selected option before ordering.

### Can I use the camera module on either side?

No. Espressif's camera module guide specifies the left expansion slot (H2). Do not connect the camera module to the right slot.

### Is ESP-Mosaico suitable for battery-powered projects?

It has an onboard 3.7 V, 65 mAh Li-ion battery, but that small capacity should not be treated as evidence of long runtime. Measure power consumption for the display brightness, wireless use, audio and attached modules in your intended application.

## Official resources

- [ESP-Mosaico V1.2 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide.html)
- [ESP-Mosaico V1.0 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_v1.0.html)
- [Camera Module User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_camera.html)

## Related ESP32 display hardware

- [Waveshare ESP32-S3-Touch-AMOLED-2.16](/products/waveshare-esp32-s3-touch-amoled-2-16/) — another compact 480 × 480 AMOLED development board.
- [Waveshare ESP32-S3-Touch-AMOLED-2.41](/products/waveshare-esp32-s3-touch-amoled-2-41/) — a larger AMOLED alternative.
- [Waveshare ESP32-P4 round touchscreen board](/products/waveshare-esp32-p4-wifi6-touch-lcd-3-4c/) — a different display-oriented platform.
- [ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/) — broader guidance on choosing display hardware.
