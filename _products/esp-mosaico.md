---
layout: product
internal_links: true
title: "ESP-Mosaico (ESP32-S31)"
product_verdict: "A distinctive development kit for experimenting with display-based interaction, sensors, audio, modular hardware and AI-assisted coding. Its appeal depends on whether you want the integrated hardware and modular workflow; confirm the exact kit contents, revision and delivered cost before ordering."
seo_title: "ESP-Mosaico ESP32-S31: Specs & Buying Guide"
seo_description: "ESP-Mosaico ESP32-S31 kit: 2.16-inch 480×480 AMOLED touchscreen, memory, sensors, audio, expansion and software."
product_id: esp-mosaico
category: Displays
manufacturer: "Espressif"
image: "https://store.mosaico.ai/cdn/shop/files/Vision_Combo_Kit.jpg?v=1792487968&width=3840"
alt: "Official ESP-Mosaico Vision Combo Kit showing the ESP-Mosaico core unit, camera module and interaction module"
header:
  teaser: "https://store.mosaico.ai/cdn/shop/files/Vision_Combo_Kit.jpg?v=1792487968&width=3840"
  og_image: "https://store.mosaico.ai/cdn/shop/files/Vision_Combo_Kit.jpg?v=1792487968&width=3840"
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
  - title: "Check ESP-Mosaico on AliExpress"
    icon: "fas fa-shopping-cart"
    description: "Check the current listing, kit contents, price and shipping. Offers and availability may change."
    url: "https://s.click.aliexpress.com/e/_c4Dnkhan"
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

## Is the ESP-Mosaico worth buying?

The ESP-Mosaico is worth considering if you want to explore a complete interactive embedded platform rather than wire a display, sensors and audio components separately. The 2.16-inch 480 × 480 AMOLED touchscreen, onboard IMU and magnetometers, audio hardware, NAND storage and magnetic expansion approach create a useful base for compact interfaces, interactive devices and prototypes.

It is less compelling if you only need inexpensive Wi-Fi control, a bare MCU module or a simple display. The integrated hardware and modular ecosystem are central to the proposition; a simpler ESP32 board may be easier to adapt when you already know the exact peripherals and form factor your project needs.

This is a documentation-based editorial assessment, not a physical review. We have not hands-on tested this board.

## Quick facts

| Question | Answer |
|---|---|
| What is it? | A modular ESP32-S31 development kit with an integrated AMOLED touchscreen, sensors, audio and expansion headers. |
| Display | 2.16-inch, 480 × 480 AMOLED touchscreen |
| Processor | Dual-core 32-bit RISC-V ESP32-S31NRV16, up to 320 MHz |
| Memory and storage | 16 MB in-package PSRAM, 16 MB SPI NOR and 1 Gbit (128 MB) SPI NAND |
| Development | ESP-IDF target `esp32s31`, Espressif BSP and ESP-Claw resources |
| Physical testing | Not hands-on tested by Embedded Nerd; assessment is based on published documentation. |

## Who should choose it?

### It may suit you if
- You want a compact, square AMOLED touchscreen and several onboard peripherals in one platform.
- Your project benefits from motion sensing, magnetometers, audio and additional local storage.
- You want to explore the ESP32-S31, its ESP-IDF support and the modular ESP-Mosaico ecosystem.

### It may not suit you if
- You only need a low-cost Wi-Fi microcontroller or a simple display controller.
- You need a larger screen for dense dashboards, accessibility-sized controls or a conventional HMI.
- You need proven battery runtime or a hands-on reliability assessment before buying; this page does not provide physical test results.

## Specifications at a glance

| Specification | ESP-Mosaico |
|---|---|
| Main controller | ESP32-S31NRV16, dual-core 32-bit RISC-V up to 320 MHz |
| Wireless | 2.4 GHz Wi-Fi 6, Bluetooth 5.4, IEEE 802.15.4 |
| Display | 2.16-inch 480 × 480 AMOLED touchscreen, QSPI |
| Display controller | CO5300 |
| Touch controller | CST9220 series |
| PSRAM | 16 MB in-package |
| Non-volatile storage | 16 MB SPI NOR + 1 Gbit (128 MB) SPI NAND |
| IMU | BMI270, 6-axis accelerometer and gyroscope |
| Magnetometers | Two BMM150 3-axis devices |
| Audio | ES8311 codec, NS4150B 3 W mono Class-D amplifier, speaker and microphone |
| Expansion | Two 2 × 10-pin, 2.54 mm headers with GPIO and power signals |
| USB | USB Type-C / USB 2.0 High-Speed OTG |
| Battery | 3.7 V, 65 mAh Li-ion battery |
| Development platform | ESP-IDF target `esp32s31`, Espressif BSP and ESP-Claw resources |

Specifications above follow Espressif's published ESP-Mosaico V1.2 documentation. Confirm the silkscreen revision on the board and select the matching guide before wiring or using pin assignments.

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

Espressif also recommends ESP-Claw as an application framework for the kit. The store describes a Chat Coding workflow and a Vibe Coding workflow involving AI coding agents. Treat these as supported product workflows rather than a guarantee that arbitrary prompts, models or generated code will work without debugging. The AI toolchain, account requirements and model availability should be checked in the current official documentation.

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

## ESP32-S31 price and availability

We do not publish a fixed price here because marketplace prices, selected kit variants, shipping and delivery estimates can change. Use the AliExpress listing to check the current price and confirm exactly which modules are included in the selected option before checkout.

<p><a class="btn btn--primary" href="https://s.click.aliexpress.com/e/_c4Dnkhan" target="_blank" rel="nofollow sponsored noopener noreferrer">Check ESP-Mosaico price on AliExpress</a></p>

## Where to buy the ESP-Mosaico

You can check the current ESP-Mosaico listing on AliExpress using the link below. Confirm the exact kit variant, included modules, shipping cost, delivery estimate and any taxes at checkout before ordering, as listings and offers can change.

<p><a class="btn btn--primary" href="https://s.click.aliexpress.com/e/_c4Dnkhan" target="_blank" rel="nofollow sponsored noopener noreferrer">Check ESP-Mosaico on AliExpress</a></p>

*Disclosure: This page contains an AliExpress affiliate link. Embedded Nerd may earn a commission if you make a qualifying purchase through it, at no additional cost to you.*


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

### Does it include a camera?

The official Vision Combo Kit listing names the Core Unit V1.2, Camera Module and Interaction Module. Verify the current selected variant and its contents at checkout; product options can change.

### Can I use the camera module on either side?

No. Espressif's camera module guide specifies the left expansion slot (H2). Do not connect the camera module to the right slot.

### Is ESP-Mosaico suitable for battery-powered projects?

It has an onboard 3.7 V, 65 mAh Li-ion battery, but that small capacity should not be treated as evidence of long runtime. Measure power consumption for the display brightness, wireless use, audio and attached modules in your intended application.


## ESP-Mosaico vs Waveshare ESP32-S3-Touch-AMOLED-2.16

Both boards have a 2.16-inch 480 × 480 AMOLED touchscreen with a CO5300 display controller and CST9220-series capacitive touch. The main distinction is the platform and the surrounding hardware, not the panel resolution.

| Feature | ESP-Mosaico | Waveshare ESP32-S3-Touch-AMOLED-2.16 |
|---|---|---|
| SoC | ESP32-S31, dual-core RISC-V up to 320 MHz | ESP32-S3R8, dual-core Xtensa LX7 up to 240 MHz |
| Display | 2.16-inch 480 × 480 AMOLED | 2.16-inch 480 × 480 AMOLED |
| Memory | 16 MB in-package PSRAM | 8 MB PSRAM |
| Storage | 16 MB SPI NOR + 128 MB SPI NAND | 16 MB Flash and TF card slot |
| Sensors | BMI270 IMU and two BMM150 magnetometers | QMI8658 IMU and PCF85063 RTC |
| Expansion approach | Two 2 × 10-pin module headers and ESP-Mosaico modules | Board-level peripherals and TF card slot |
| Software starting point | ESP-IDF target `esp32s31`, Espressif BSP and ESP-Claw resources | ESP-IDF / Arduino IDE support and Waveshare documentation |

Choose ESP-Mosaico if you specifically want the ESP32-S31 platform, its onboard storage and modular expansion approach. Choose the Waveshare board if your project is already built around the ESP32-S3 ecosystem or its documented peripheral set. Check the current documentation and kit contents for either board before ordering.

See the [Waveshare ESP32-S3-Touch-AMOLED-2.16 product page](/products/waveshare-esp32-s3-touch-amoled-2-16/) for its specifications and buying considerations.

## Official resources

- [ESP-Mosaico V1.2 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide.html)
- [ESP-Mosaico V1.0 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_v1.0.html)
- [Camera Module User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_camera.html)
- [ESP-Mosaico on AliExpress](https://s.click.aliexpress.com/e/_c4Dnkhan) (affiliate link)

## Related ESP32 display hardware

- [Waveshare ESP32-S3-Touch-AMOLED-2.16](/products/waveshare-esp32-s3-touch-amoled-2-16/) — another compact 480 × 480 AMOLED development board.
- [Waveshare ESP32-S3-Touch-AMOLED-2.41](/products/waveshare-esp32-s3-touch-amoled-2-41/) — a larger AMOLED alternative.
- [Waveshare ESP32-P4 round touchscreen board](/products/waveshare-esp32-p4-wifi6-touch-lcd-3-4c/) — a different display-oriented platform.
- [ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/) — broader guidance on choosing display hardware.
