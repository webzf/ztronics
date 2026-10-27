---
title: "ESP-Mosaico Setup Guide: ESP32-S31, Display and AI Coding"
title_tag: "ESP-Mosaico Setup Guide: ESP32-S31 and ESP-IDF"
description: "Get started with ESP-Mosaico: identify CoreBoard V1.0 or V1.2, set up ESP-IDF for esp32s31, connect over USB, flash firmware and understand the BSP and ESP-Claw workflow."
excerpt: "A documentation-led getting-started guide for ESP-Mosaico covering hardware revisions, ESP-IDF setup, USB flashing, the board support package, peripherals and AI-assisted coding."
hide_post_pagination: true
layout: single
permalink: /esp-mosaico-setup-guide/
id: "https://embeddednerd.com/esp-mosaico-setup-guide/"
sidebar:
  nav: "embedded"
  related: true
  share: true
show_date: false
author: "Embedded Nerd"
read_time: false
header:
  teaser: "https://store.mosaico.ai/cdn/shop/files/Vision_Combo_Kit.jpg?v=1792487968&width=3840"
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: "https://store.mosaico.ai/cdn/shop/files/Vision_Combo_Kit.jpg?v=1792487968&width=3840"
  og_image: "https://store.mosaico.ai/cdn/shop/files/Vision_Combo_Kit.jpg?v=1792487968&width=3840"
  og_image_alt: "ESP-Mosaico Vision Combo Kit with Core Unit, Camera Module and Interaction Module"
categories:
  - ESP32
  - ESP32-S31
  - Displays
tags:
  - esp-mosaico
  - esp32-s31
  - esp-idf
  - esp-claw
  - setup
  - ai-coding
toc: true
toc_label: "Contents"
toc_sticky: true
related: true
related_posts:
  - /products/esp-mosaico/
  - /esp32-touchscreen-displays-guide/
share: true
seo_title: "ESP-Mosaico Setup Guide: ESP32-S31, Display & AI Coding"
seo_description: "Learn how to start with ESP-Mosaico: V1.0 vs V1.2, ESP-IDF target esp32s31, USB flashing, the BSP, display, sensors, audio and ESP-Claw resources."
---

The **ESP-Mosaico** is a modular development kit based on Espressif's **ESP32-S31**. It combines a 2.16-inch 480 × 480 AMOLED touchscreen with onboard motion and magnetic sensors, audio, flash storage, USB and two expansion-module headers.

This guide focuses on the documented development path rather than a generic sales overview: identify the hardware revision, prepare an ESP-IDF environment, connect to the board, and find the official references for its display, touch, sensors, audio, expansion modules and AI-assisted application workflow.

For product details and current buying information, see the [ESP-Mosaico product page](/products/esp-mosaico/).

> **Testing note:** This is a documentation-based guide. Embedded Nerd has not physically tested the board or run the build/flash commands described here. Follow the official instructions for your exact CoreBoard revision and treat the commands below as documented examples, not as an independently verified test result.

![Official ESP-Mosaico Vision Combo Kit showing the core unit, camera module and interaction module](https://store.mosaico.ai/cdn/shop/files/Vision_Combo_Kit.jpg?v=1792487968&width=3840)

## 1. Identify your ESP-Mosaico hardware revision

Espressif publishes separate CoreBoard guides for **V1.0** and **V1.2**. Check the version printed on the CoreBoard silkscreen before choosing a pinout or following hardware instructions.

| Reference | When to use it |
|---|---|
| [ESP-Mosaico V1.2 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide.html) | Use for CoreBoard V1.2 |
| [ESP-Mosaico V1.0 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_v1.0.html) | Use for CoreBoard V1.0 |
| [Camera Module User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_camera.html) | Use when installing or developing for the camera module |

The V1.2 guide documents several differences from V1.0, including changes to LCD reset/clock GPIO assignments, removal of two status LEDs, changes to codec power control and separate internal and external I²C buses. Do not assume a pin assignment from one revision applies to the other.

**Camera-module caution:** Espressif says the camera module is supported in the left expansion slot (`H2`) only. Do not insert it in the right slot. Read the camera-specific guide before connecting or removing modules.

## 2. Understand the hardware before coding

The official V1.2 reference describes the following onboard components:

| Subsystem | Documented hardware |
|---|---|
| SoC | ESP32-S31NRV16, dual-core 32-bit RISC-V, up to 320 MHz |
| Display | 2.16-inch, 480 × 480 AMOLED, QSPI, CO5300 controller |
| Touch | CST9220-series capacitive touch controller over I²C |
| Memory and storage | 16 MB in-package PSRAM, 16 MB SPI NOR flash, 1 Gbit (128 MB) SPI NAND |
| Motion | BMI270 6-axis IMU |
| Magnetic sensing | Two BMM150 3-axis magnetometers |
| Audio | ES8311 codec, NS4150B mono Class-D amplifier, speaker and microphone |
| Connectivity | 2.4 GHz Wi-Fi 6, Bluetooth 5.4 and IEEE 802.15.4 |
| Expansion | Two 2 × 10-pin, 2.54 mm headers exposing GPIO, power and debug-related signals |
| Power | USB Type-C 5 V and a 3.7 V, 65 mAh Li-ion battery |

These are hardware capabilities, not proof that every peripheral is automatically initialized by every firmware or example. Software support depends on the BSP, driver and application being used.

## 3. Prepare the development environment

The official getting-started guide directs developers to install the Espressif **ESP-IDF** development environment and select the **`esp32s31`** target. Follow the ESP-IDF installation instructions for your operating system:

- [ESP-IDF documentation](https://docs.espressif.com/projects/esp-idf/en/latest/esp32s31/index.html)
- [ESP-Mosaico V1.2 getting started and hardware reference](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide.html)
- [ESP32-S31 Windows command-line project guide](https://docs.espressif.com/projects/esp-idf/en/latest/esp32s31/get-started/windows-start-project.html)

Use a **USB data cable**, not a charge-only cable, and make sure ESP-IDF is installed and its environment has been exported or activated as described by Espressif.

## 4. Connect the board and identify the serial port

Connect the board to your computer through its USB Type-C port. The official guide describes this USB 2.0 High-Speed connection as supporting power, debug/download and application communication.

Check which serial port appears on your computer. ESP-IDF examples often use a device name such as `/dev/ttyACM0` on Linux, while Windows uses a `COM` port. The actual port name depends on your operating system and connected devices; replace the example with the port shown on your machine.

If the board is not detected, re-check the cable and USB connection, then follow Espressif's [ESP32-S31 serial connection instructions](https://docs.espressif.com/projects/esp-idf/en/latest/esp32s31/get-started/index.html) for troubleshooting. Avoid assuming the same USB behaviour as an ESP32-S3 development board.

## 5. Set the ESP-IDF target and flash firmware

Espressif documents the following commands as a typical workflow after preparing a project and connecting the board:

```sh
idf.py set-target esp32s31
idf.py -p /dev/ttyACM0 flash monitor
```

Replace `/dev/ttyACM0` with the serial port for your computer. Run these from the root directory of the ESP-IDF project you intend to build. The first command selects the SoC target; the second requests flashing and then starts the IDF monitor.

Important notes from the official documentation:

- The **first flash may require manual entry into ROM download mode**. If flashing fails, consult the board guide's BOOT-button instructions for the revision in use.
- After reset, the USB device may disconnect briefly. The IDF monitor usually reconnects automatically.
- The guide mentions `monitor --no-reset` for attaching to the monitor without restarting the application.
- The factory firmware includes a CDC virtual serial port and support for automatic download and serial logging; behaviour can differ when running custom firmware.

Do not treat a successful command invocation as guaranteed for every ESP-IDF version, cable, host OS or firmware state. Use the matching official guide to diagnose errors.

## 6. Use the ESP-Mosaico board support package (BSP)

Espressif provides a board support package intended to simplify initialization of onboard resources, including LCD, touch, audio, sensors, battery monitoring, NAND flash, module resources and the USB console.

Start with the [ESP-Mosaico V1.2 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide.html) and its linked BSP and example resources. Check any project's README, dependency declarations and ESP-IDF version requirements before building it.

A practical workflow is:

1. Confirm that your project's target is `esp32s31`.
2. Use an ESP-Mosaico-specific example or BSP as the starting point rather than assuming a generic display demo matches this board.
3. Read the example's dependency and configuration instructions.
4. Check the CoreBoard revision and any pin assignments referenced by the example.
5. Build and flash following the example's documented instructions.
6. Verify serial output and peripheral initialisation before layering in additional functionality.

This guide does not include a fabricated demo application or claim a successful compilation. Use the exact example repository and pinned software versions when reproducing an example.

## 7. Display and touch

The V1.2 hardware guide identifies a **480 × 480 QSPI AMOLED** display driven by the CO5300 controller, with a CST9220-series touch controller using I²C. Espressif's BSP is the recommended starting point for display and touch initialization.

The V1.2 guide lists the LCD reset signal as GPIO44 and QSPI clock as GPIO42. The documentation also notes that these assignments are swapped compared with V1.0. Do not copy the V1.2 pin table into a V1.0 project without checking the V1.0 documentation.

For custom code, consult the board-specific BSP and driver example instead of inventing initialization sequences. The panel controller, touch controller, timing, power sequencing and display configuration all matter.

## 8. Sensors, audio and local storage

The documented onboard devices include:

- **BMI270 IMU:** accelerometer and gyroscope for motion sensing.
- **Two BMM150 magnetometers:** magnetic-field sensing.
- **ES8311 audio codec and NS4150B amplifier:** audio path and speaker output; the board also includes a microphone.
- **SPI NOR flash:** 16 MB for program and data storage.
- **SPI NAND flash:** 1 Gbit (128 MB) for larger assets and multimedia data.
- **Battery gauge:** BQ27220, with the official pin/device reference listing its I²C address as `0x55`.

Start from the relevant BSP component or manufacturer example for each peripheral. The presence of the chip on the board does not mean a generic I²C or I²S snippet is sufficient: clocks, pins, power controls, drivers and the particular ESP-IDF release need to match the published board support.

## 9. Expansion modules and GPIO caveats

The BaseBoard exposes two 2 × 10-pin, 2.54 mm expansion headers. The headers provide selected GPIO, power, UART and USB Serial/JTAG signals, but not every pin is interchangeable in a running application.

For V1.2, the official guide documents two I²C buses:
- Internal I²C0 connects onboard touch, audio, IMU, magnetometers and battery-gauge devices.
- External I²C1 is used for module EEPROM and expansion devices.

Some expansion pins are multiplexed with the onboard audio codec's I²S bus. Reusing them for a module can conflict with audio functionality. Always check the specific header table and pin multiplexing notes in the [V1.2 hardware reference](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide.html).

For camera integration, use the [Camera Module User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_camera.html). The camera module is designated for the left slot (`H2`); do not treat both slots as interchangeable for that module.

## 10. AI-assisted coding with ESP-Claw

Espressif's ESP-Mosaico documentation describes two workflows: **Chat Coding**, where a user describes an idea in natural language and ESP-Claw is presented as helping generate and run an application, and **Vibe Coding**, described as integrating a desktop AI coding agent into a broader code, deploy, test and observe cycle.

Espressif's board guide names **ESP-Claw** as a recommended application framework. For practical setup, follow the current ESP-Claw project instructions and review prerequisites, supported host environment, model-provider configuration, credentials and supported board revision before connecting the workflow to hardware.

AI-generated embedded code still requires engineering checks. Review GPIO assignments, electrical limits, power control, peripheral initialisation and error handling; compile and validate incrementally, and keep a known-good firmware path available. Do not assume a generated project is safe or functional just because an agent reports completion.

This guide does not claim that an AI-coding workflow was run on physical ESP-Mosaico hardware by Embedded Nerd.

## 11. Troubleshooting checklist

If the board does not flash or a peripheral does not respond, check the basics before changing pin assignments:

- Confirm CoreBoard V1.0 versus V1.2 and use the matching official guide.
- Use a USB data cable and verify the serial port name.
- Confirm ESP-IDF is active and the project targets `esp32s31`.
- Follow the documented first-flash / ROM download procedure when needed.
- Inspect the example's dependencies, configuration and expected ESP-IDF version.
- Check V1.0/V1.2 differences in LCD reset/clock pins and I²C bus assignments.
- For an expansion module, verify slot restrictions, power requirements and signal multiplexing.
- Review serial logs and the official example's troubleshooting notes before drawing conclusions.

These steps are a documentation-based checklist rather than a report of fixes tested by Embedded Nerd.

## Frequently asked questions

### Which ESP-IDF target should I use?

Espressif's ESP-Mosaico getting-started guide specifies `esp32s31`.

### Does ESP-Mosaico use the ESP32-S3?

No. It uses the ESP32-S31, based on a dual-core 32-bit RISC-V processor. Do not select an ESP32-S3 target for this board.

### Are V1.0 and V1.2 pin assignments identical?

No. The V1.2 guide documents changes from V1.0, including LCD reset/clock assignment changes and revised I²C organisation. Use the document matching the printed CoreBoard revision.

### Can I plug the camera module into either expansion slot?

No. The official camera guide says the camera module is supported in the left slot (`H2`) only.

### Have these commands been tested by Embedded Nerd?

No. The commands and workflow are drawn from Espressif's documentation and are clearly presented as documented guidance, not as a physical test or an independently verified build.

## Related resources

- [ESP-Mosaico product page](/products/esp-mosaico/) — specifications, buying considerations and AliExpress listing.
- [Official ESP-Mosaico V1.2 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide.html)
- [Official ESP-Mosaico V1.0 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_v1.0.html)
- [ESP-Mosaico Camera Module User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32s31/esp-mosaico/user_guide_camera.html)
- [ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/)
