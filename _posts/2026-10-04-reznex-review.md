---
title: "Reznex Review: ESP32 Pinouts, Hardware Tools, CLI and More"
excerpt: "Reznex review covering ESP32 pinouts, hardware comparison, CLI, RF calculators, LoRa, RFID and the Engineering Vault — plus where datasheets remain essential."
layout: single
permalink: /reznex-review/
show_date: false
read_time: false
last_modified_at: false
toc: true
toc_label: "Contents"
toc_sticky: true
toc_levels: 2
header:
  teaser: /assets/images/reznex-cli-terminal.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/reznex-cli-terminal.webp
  og_image: /assets/images/reznex-cli-terminal.webp
categories:
  - ESP32
  - Embedded Systems
  - Electronics
  - Tools
internal_link_keywords:
  - "Reznex"
  - "Reznex review"
  - "ESP32 pinout"
  - "ESP32 GPIO"
  - "ESP32 hardware tools"
  - "ESP32 CLI"
  - "ESP32 tools"
  - "RF calculators"
  - "LoRa"
  - "RFID"
tags:
  - Reznex
  - ESP32
  - ESP32 Pinout
  - ESP32 GPIO
  - Embedded Systems
  - Electronics
  - Hardware Tools
  - CLI
  - LoRa
  - RFID
  - RF
  - Amateur Radio
  - Engineering Tools
sidebar:
  nav: "embedded"
related: true
share: true

---

# Reznex Review: ESP32 Pinouts, Hardware Tools, CLI and More

*Last updated: October 2026 · Reznex CLI version covered: 1.2.0*

Choosing a GPIO for an ESP32 project rarely happens in one place.

You start with a pinout diagram, open Espressif's documentation to check boot-strapping behavior, look at the schematic of your development board, compare another microcontroller, run a resistor calculation, and then search GitHub for an example that actually works.

For a small project, that is manageable. For a project with an ESP32, a display, a touchscreen, an SD card, sensors and wireless connectivity, it quickly becomes a pile of browser tabs and reference documents.

**[Reznex](https://www.reznex.ro/) is trying to bring several of those tasks together.** It offers interactive hardware pinouts, board comparison, electronics and RF calculators, a command-line interface, an API, project resources and an Engineering Vault, with a scope that reaches into LoRa, RFID, cybersecurity, amateur radio and smart-home technologies.

Breadth alone does not make an engineering resource reliable, so this review asks a more useful question than "is it the best?":

> **Does Reznex actually save time on embedded and electronics projects, and where do you still need the manufacturer's documentation?**

This review is based on the current Reznex website and its published CLI documentation, with hardware claims cross-checked against official Espressif documentation. I did not run the CLI for this review, so every command below is described as Reznex documents it.

## Quick verdict

**Good for:** quick ESP32 pinout lookups, shortlisting boards, simple electronics and antenna calculations, and starter projects.

**Not good for:** final design decisions. The web pinout covers essentially one classic ESP32 board, sources and revisions are not shown per page, and the API is for account data, not hardware data.

**Bottom line:** a convenient research layer that cuts down tab-hopping. For anything that goes onto a PCB, the Espressif datasheet, the technical reference manual and your board's schematic remain the source of truth.

---

# What Is Reznex?

[Reznex](https://www.reznex.ro/) is an electronics, embedded, RF and maker-oriented platform that combines reference material, tools, calculators, projects and community resources. It has a noticeably Romanian and amateur-radio orientation (the site is in Romanian, with an English version available), but most of its hardware resources are useful internationally. It also states that it is ad-free.

| Feature | What it provides | Who it helps |
|---|---|---|
| [Interactive pinouts](https://www.reznex.ro/pinouts) | Board-level pin references with filters | Makers, embedded developers |
| [Hardware comparison](https://www.reznex.ro/compare) | Side-by-side board specifications | Hardware selection |
| [Reznex CLI](https://www.reznex.ro/terminal) | Pinouts, calculators and guides in the terminal | Terminal-oriented developers |
| [REST API](https://www.reznex.ro/api-key) | Access to account and activity data | Developers, portfolio builders |
| [Electronics and RF calculators](https://www.reznex.ro/resurse) | Ohm's law, voltage divider, antenna and coax | Learners, RF hobbyists |
| [Engineering Vault](https://www.reznex.ro/vault) | Code, ESPHome configurations, 3D models | Makers and prototypers |
| Other resources | LoRa, RFID, Zigbee, Home Assistant, cybersecurity | IoT and radio enthusiasts |

Not every feature has the same technical depth, which matters when deciding what to trust it for.

---

# Reznex ESP32 Pinout Tools

<figure>
  <img src="/assets/images/reznex-esp32-devkit-v1-pinout.webp" alt="Reznex ESP32 DevKit v1 interactive pinout showing 30 pins and GPIO36 input-only details" loading="lazy" width="1485" height="768">
  <figcaption>Reznex's Esp32 DevKit v1 pinout, including GPIO filters and the GPIO36 input-only warning.</figcaption>
</figure>

The ESP32 is where Reznex is most relevant to Embedded Nerd readers. The [web pinout](https://www.reznex.ro/pinouts) focuses on the **ESP32 DevKit V1 / ESP-WROOM-32** and offers filters for GPIO, ADC, PWM, I2C, SPI, UART, input-only pins, boot-related pins, power and ground. Selecting a pin shows its characteristics. GPIO36, for example, is flagged as input-only.

That matters because a classic mistake with the original ESP32 is treating every GPIO as equivalent. They are not.

## The classic ESP32 has real GPIO restrictions

According to [Espressif's GPIO documentation](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/gpio.html) and the [ESP32 datasheet](https://www.espressif.com/sites/default/files/documentation/esp32_datasheet_en.pdf), the original ESP32 has 34 physical GPIOs, with these restrictions:

- **GPIO34–39 are input-only.**
- **GPIO0, 2, 5, 12 and 15 are strapping pins** that affect boot behavior.
- **GPIO6–11 are connected to the SPI flash** on typical modules and should not be used.
- **GPIO16 and 17 are used by the PSRAM** on WROVER-type modules, and are free on WROOM-32 modules.
- **ADC2 cannot be used while Wi-Fi is active.**

These details can change a hardware design. Reznex makes the first step, finding them, quicker. But:

> **The original ESP32 is not the same GPIO platform as the rest of the ESP32 family.**

The ESP32-S3, ESP32-C3, ESP32-C6 and others have different GPIO arrangements and restrictions. A generic "ESP32 pinout" is never a universal map. Before selecting GPIOs, identify the exact SoC, the module, the development board, which GPIOs the board actually exposes, and which peripherals are already wired on it.

---

# Reznex vs an ESP32 Datasheet

A pinout page answers one question: "What does this pin do?"

A datasheet and technical reference manual answer the deeper ones: electrical limits, boot conditions, alternate peripheral functions, behavior during reset and power-up, timing requirements, package differences and silicon errata. Only your board's schematic tells you which pins are actually exposed and what else is connected to them.

So the sensible workflow is:

**Reznex → shortlist → official documentation → board schematic → prototype and test**

and not:

**Reznex → production PCB**

## A real GPIO example

Take an ESP32 project with an SPI display, an SPI touch controller, a microSD card, an I2C sensor, a touch interrupt and a display reset. The three SPI devices can share SCLK, MOSI and MISO, but each needs its own chip-select:

```text
ESP32
 │
 ├── SPI SCLK ───── Display, Touch controller, SD card
 ├── SPI MOSI ───── Display, Touch controller, SD card
 ├── SPI MISO ───── Touch controller, SD card
 │
 ├── GPIO ───────── Display CS
 ├── GPIO ───────── Touch CS
 ├── GPIO ───────── SD CS
 ├── GPIO ───────── Touch IRQ
 └── GPIO ───────── Display RESET
```

Finding the SPI pins is the easy part. You then have to account for exposed GPIOs, strapping pins, input-only pins, flash and PSRAM pins, chip-select availability, board-specific wiring, pull-ups and pull-downs, and conflicts between modules.

**Where Reznex helps:** quickly spotting candidate GPIOs and seeing which pins carry which functions. Visual filtering is much faster than searching a datasheet when the question is "which pins should I look at?"

**Where it stops being enough:** it cannot know your exact hardware. A display breakout may hang extra circuitry on a GPIO, an SD module may include level shifting or pull resistors, and two boards using the same ESP32 can route a pin differently. That information comes from the actual board schematic. All-in-one display boards are a good example: on a board like the [Sunton ESP32-8048S043C](/sunton-esp32-8048s043c-guide/), many GPIOs are already committed to the display and touch interface, so the pins left for your own peripherals are a small subset.

If this is the kind of project you are planning, see the Embedded Nerd [ESP32 touchscreen display guide](/esp32-touchscreen-displays-guide/), and use the [ESP32 Touchscreen Selector](/tools/esp32-touchscreen-selector/) to narrow down boards before you start assigning pins.

---

# Reznex Hardware Comparison

<figure>
  <img src="/assets/images/reznex-hardware-comparison.webp" alt="Reznex hardware comparison showing ESP32 WROOM-32, Raspberry Pi Pico W and Arduino Uno R3" loading="lazy" width="1485" height="768">
  <figcaption>Reznex hardware comparison view for ESP32 WROOM-32, Raspberry Pi Pico W and Arduino Uno R3.</figcaption>
</figure>

The [comparison tool](https://www.reznex.ro/compare) handles up to four boards at once and covers architecture, clock frequency, flash, SRAM, Wi-Fi, Bluetooth, GPIO, ADC, DAC, USB, communication interfaces, logic voltage, power consumption, estimated price and recommended applications. Besides the ESP32, Pico W and Arduino Uno shown above, boards such as the ESP32-S3 and STM32F103C8T6 are available.

It is good for first-pass questions: do I need Wi-Fi, 5 V logic, a DAC, how much GPIO, USB? A comparison table answers those faster than four datasheets.

The caveat is that tables flatten important differences. Flash capacity depends on the module, usable GPIO depends on the board, and power consumption can differ enormously between a bare chip and a full development board. Interface counts depend on how the tool defines them, and a single number says nothing about peripheral routing flexibility. Use it for **shortlisting**, not **final selection**.

---

# Reznex CLI

<figure>
  <img src="/assets/images/reznex-cli-terminal.webp" alt="Reznex CLI documentation showing npx reznex menu and the interactive terminal menu" loading="lazy" width="1485" height="768">
  <figcaption>Reznex's documented CLI interface, including the <code>npx reznex</code> menu command.</figcaption>
</figure>

The CLI is one of Reznex's most interesting differentiators. Its [documentation](https://www.reznex.ro/terminal) lists version 1.2.0 and an `npx reznex` workflow. Everything in this section comes from that documentation, and I have not run these commands myself.

```bash
npx reznex              # entry point
npx reznex menu         # interactive menu
npx reznex pinout esp32 # also: nano, pico, stm32
npx reznex calc ohm 5 0.02
npx reznex calc divider 5 10000 20000
npx reznex calc dipole 145.5
npx reznex calc yagi 433.92
npx reznex calc coax h155 15 145
```

The documentation also lists pinouts for SX1276/SX1278, RC522, nRF24L01 and DHT22, plus commands for radio, RFID, cybersecurity, smart-home topics and terminology.

## Why the CLI is interesting

If you already live in VS Code, PlatformIO, ESP-IDF or Arduino CLI, a command like `npx reznex pinout esp32` saves you opening another browser tab. The advantage is not accuracy, since the data is the same, but **less context switching**. That is a legitimate differentiator for a developer-oriented reference.

It is also notable that the CLI documents more hardware pinouts than the web pinout section currently offers.

---

# Reznex API

Reznex advertises a [REST API](https://www.reznex.ro/api-key) (v1) with API keys, scoped permissions, CORS support, an activity endpoint and cURL and web integration examples.

Its documented purpose is syncing **your Reznex account activity**, such as published projects, saved antennas and account statistics, with another site or portfolio.

It is not a general-purpose hardware database API. Nothing in the documentation shows that you can programmatically query something like `ESP32 → GPIO → peripheral → restriction`. That would be a valuable direction, but it is not an existing capability.

---

# Electronics Calculators

The [resources hub](https://www.reznex.ro/resurse) lists eight technical tools: Ohm's law, voltage divider, LED series resistor, passive RC filter cutoff, battery life, capacitor unit converter, resistor color code and frequency-to-period conversion. They are not circuit simulators. Their value is speed. I checked the Ohm's law and voltage divider examples by hand.

**Ohm's law.** `npx reznex calc ohm 5 0.02` means 5 V and 20 mA:

```text
R = V / I = 5 / 0.02 = 250 Ω
P = V × I = 5 × 0.02 = 0.1 W
```

That is a good sanity check, but it does not choose a resistor for you: tolerance, power rating, temperature and voltage rating still matter.

**Voltage divider.** `npx reznex calc divider 5 10000 20000` means Vin = 5 V, R1 = 10 kΩ, R2 = 20 kΩ:

```text
Vout = Vin × R2 / (R1 + R2) = 5 × 20000 / 30000 ≈ 3.33 V
```

The math is right, but be careful with this exact example on an ESP32. 3.33 V is slightly above the ESP32's nominal 3.3 V supply level, so it is not a sensible target for a divider intended to protect a 3.3 V input. The ADC's usable range also depends on the ESP32 variant and attenuation configuration. For a 5 V signal into an ESP32 input, a 10 kΩ / 15 kΩ divider gives about 3.0 V and is a safer starting point; the exact values should still be checked against the target input and ADC configuration. Beyond the equation you also need to think about ADC input impedance, resistor tolerance, loading, filtering and protection. The calculator handles the formula, not the circuit.

---

# RF and Antenna Calculators

<figure>
  <img src="/assets/images/reznex-antenna-calculator.webp" alt="Reznex dipole antenna calculator at 145.5 MHz showing estimated 485 mm arms" loading="lazy" width="1485" height="768">
  <figcaption>Reznex dipole calculator example at 145.5 MHz, showing an estimated 485 mm arm length on each side.</figcaption>
</figure>

The RF tools are arguably more distinctive. The [antenna calculator](https://www.reznex.ro/radio/calculator-antene) covers half-wave dipole, 3-element Yagi, Slim Jim and J-Pole designs, takes frequency and conductor information, and returns estimated dimensions.

**Independent check at 145.5 MHz:**

```text
Wavelength        = 299.79 / 145.5 ≈ 2.06 m
Half-wave         ≈ 1.03 m total, so ≈ 515 mm per arm
With velocity factor ≈ 0.95: 515 mm × 0.95 ≈ 490 mm per arm
```

That is very close to the 485 mm the calculator shows, so the result is plausible. An RF calculator should never be trusted just because a web page printed a number, and Reznex itself presents these values as starting estimates. Real dimensions still depend on conductor diameter, end effects, mounting environment, feed arrangement and matching.

---

# Engineering Vault

<figure>
  <img src="/assets/images/reznex-engineering-vault.webp" alt="Reznex Engineering Vault showing ESP32 C++ projects, 3D models and ESPHome YAML resources" loading="lazy" width="1485" height="768">
  <figcaption>Reznex Engineering Vault with C++/Arduino code, 3D models and ESPHome YAML resources.</figcaption>
</figure>

The [Engineering Vault](https://www.reznex.ro/vault) is one of the more practical parts of Reznex. At the time of this review, it lists **15 code sketches and 8 3D models** (23 resources) in C++/Arduino, MicroPython, ESPHome YAML, STL and SCAD. Examples include ESP32 + DHT22, a BME280 weather station, ESP32 + RC522, relay control, an OLED interface, a PIR alarm, water-leak detection, an MQ-2 gas sensor, WS2812B effects, BLE scanning and enclosures for ESP32 and Arduino boards.

It connects reference information with projects you can actually build. But this is not GitHub: the library is small and aimed at beginner-to-intermediate makers. Reznex describes the sketches as tested, but I did not run or audit them.

**Mains voltage warning.** The Vault includes a dual 230 V relay project. A hobby project is not a production-safe mains design. Isolation, enclosure, clearances, protection and the relevant electrical standards still apply, and you should not wire mains voltage unless you know how to do it safely.

---

# Other Resources: LoRa, RFID, Smart Home and Security

These sections are broader than they are deep, and I only evaluated them as reference material.

- **LoRa and RF.** Hardware references for SX1276/SX1278 and nRF24L01, plus antennas, coax, radio bands and RTL-SDR. A pinout helps with SPI wiring, but a real LoRa design also involves frequency, bandwidth, spreading factor, coding rate, transmit power, antenna, RF layout, regulation and link budget. For a complete ESP32 build that combines LoRa, ESP-NOW and a display, see the Embedded Nerd [ESP32-P4 weather station](/esp32-p4-weather-station/).
- **[RFID](https://www.reznex.ro/rfid).** An RC522 pinout in the CLI, an ESP32 + RC522 access-control project in the Vault, and general material on 125 kHz and 13.56 MHz RFID, MIFARE Classic and DESFire. A pinout helps with wiring; it does not replace the RC522 datasheet or a security analysis.
- **[Home Assistant, ESPHome, Zigbee and MQTT](https://www.reznex.ro/smarthome).** A natural extension of the usual ESP32 → Wi-Fi → MQTT → Home Assistant path, useful as quick reference. Official documentation remains authoritative.
- **[Cybersecurity](https://www.reznex.ro/cybersecurity).** Educational material on Wi-Fi security, MITM concepts, BadUSB and phishing. Relevant to IoT developers, but serious security work needs vendor advisories, CVEs and specialist tools.

---

# Reznex vs Traditional Research

| Task | Traditional workflow | Reznex approach | Best use |
|---|---|---|---|
| Find GPIO information | Datasheet + board schematic | Interactive pinout | Reznex for quick lookup |
| Verify GPIO restrictions | Datasheet / TRM | Summary information | Manufacturer documentation |
| Compare MCUs | Several datasheets | Comparison table | Reznex for shortlisting |
| Electronics calculations | Separate calculator | Integrated tools | Reznex for quick checks |
| RF calculations | Dedicated calculators | Integrated RF tools | Reznex for estimates |
| CLI workflow | Scripts / browser | `npx reznex` | Terminal-based lookup |
| Project examples | GitHub / tutorials | Engineering Vault | Starter projects |
| Production design | Manufacturer documentation | Reference only | Manufacturer remains primary |

You do not have to pick one. Use each for what it does well.

## Alternatives

If your main need is an ESP32 pinout, there are other options worth knowing: [esp32pin.com](https://esp32pin.com), an interactive reference for the whole ESP32 family, and Espressif's own GPIO documentation linked above. Reznex's edge is the combination of tools and the CLI, rather than the depth of any single pinout.

---

# What I Like

1. **It reduces context switching.** Pinouts, comparison, calculators, RF resources and projects in one place is the central value, and it helps most in early development.
2. **The CLI is a real differentiator.** A terminal interface for electronics references is unusual.
3. **The calculators are practical.** They cover calculations makers actually do, as sanity checks rather than simulation.
4. **The Vault links theory to projects**, with code and 3D-printable hardware next to the documentation.
5. **The scope is unusually broad.** ESP32, Arduino, Pico, STM32, LoRa, RFID, smart home and security are normally spread over many unrelated sites.

# What Could Be Improved

- **More ESP32 variants.** A single classic ESP32 pinout is not enough today. Coverage of the S3, C3 and C6 would be highly valuable, especially for display projects.
- **Source and revision info on each page**, for example "Source: Espressif ESP32 documentation · Revision · Last checked", so readers can judge how current the data is.
- **Clearer comparison caveats.** Mark whether a value is chip-level, module-level, board-level, estimated or market-dependent, particularly for power consumption and flash.
- **A structured hardware API.** Being able to query MCU, board, GPIO, peripheral and restrictions programmatically would be a bigger opportunity than the current account API, and could enable GPIO planners and conflict checkers.
- **Example output in the CLI docs.** The documentation shows what to type, but not what you get back.

---

# Who Should Use Reznex?

- **Beginners:** visual pinouts and calculators remove friction, but you still need to learn voltage, current, logic levels, pull-ups and how to read a datasheet.
- **Makers:** the clearest fit. Inspect a pinout, compare boards, calculate a resistor, check an RF module, grab example code, download an enclosure.
- **Embedded developers:** the value is workflow efficiency, mainly through the pinouts, CLI, comparison and calculators.
- **RF and LoRa users:** useful for quick estimates and references. Serious RF work still needs measurement and manufacturer data.
- **Professional engineers:** an index and research layer, not a source of record. For production hardware use datasheets, reference manuals, schematics, errata, application notes and lab measurements.

---

# A Practical ESP32 Workflow

1. **Define the requirements**, for example an SPI display, SPI touchscreen, SD card, I2C sensor, touch interrupt and three chip-selects.
2. **Identify the exact ESP32.** Not just "ESP32", but the actual SoC and development board.
3. **Check the board schematic** to see which GPIOs are exposed and what the board already connects to them.
4. **Use Reznex to shortlist** candidate GPIOs through the web pinout or the CLI.
5. **Check restrictions:** strapping pins, flash and PSRAM pins, input-only pins, ADC limits, debug interfaces and existing board connections.
6. **Verify against Espressif** in the datasheet and technical reference manual.
7. **Prototype and test** the real combination of peripherals. For I2C devices, an [I2C scanner](/i2c-scanner-tutorial/) confirms what actually responds on the bus, and the [I2C Address Lookup & Compatibility Checker](/tools/i2c-address-lookup/) helps you spot address conflicts before you wire everything together.
8. **Document the final assignment**, because a project-specific map is more useful than any generic pinout:

| Function | GPIO | Notes |
|---|---:|---|
| SPI SCLK | GPIOx | Shared |
| SPI MOSI | GPIOx | Shared |
| SPI MISO | GPIOx | Shared |
| Display CS | GPIOx | Dedicated |
| Touch CS | GPIOx | Dedicated |
| SD CS | GPIOx | Dedicated |
| Touch IRQ | GPIOx | Input |
| Display RESET | GPIOx | Output |

---

# Reznex Review: FAQ

## What is Reznex?

An electronics, embedded, RF and maker-oriented platform combining hardware references, calculators, projects, guides, CLI tools and API functionality.

## Is Reznex useful for ESP32 projects?

Yes, particularly for quick pinout research, hardware comparisons, calculators and starter projects. Use it alongside Espressif's documentation, not instead of it.

## Does Reznex provide ESP32 pinouts?

Yes. The web resource provides an interactive ESP32 DevKit V1 / ESP-WROOM-32 pinout, and the CLI documentation lists an ESP32 pinout command.

## Can Reznex replace an ESP32 datasheet?

No. A pinout is a convenient reference, while the datasheet and technical reference manual contain the detailed electrical and peripheral information.

## Does Reznex have a CLI?

Yes. The documentation describes version 1.2.0 with `npx reznex` commands. I could not run them for this review.

## Does Reznex have an API?

Yes, a REST API with API keys for account and activity information. It is not currently a general hardware-data API.

## Can Reznex compare microcontrollers?

Yes, up to four boards at once, across architecture, memory, connectivity, GPIO and other parameters.

## Does Reznex include RF, LoRa or RFID tools?

Yes. It includes antenna and RF calculators, hardware references for SX1276/SX1278 and nRF24L01, RC522/RFID resources and an ESP32 + RC522 project in the Vault.

## Is Reznex free?

The platform currently offers free resources, including the Engineering Vault. Some areas are presented separately as premium or workshop content, so check the site for the current status of individual features.

---

# Final Assessment

Reznex addresses a genuine problem in embedded development: **technical information is scattered across many resources.** Its strengths are the combination of ESP32 and other pinouts, hardware comparison, calculators, RF tools, the CLI and the Engineering Vault. The CLI in particular takes it beyond a typical browser-based reference.

The limitations are clear. The web pinout coverage is narrow, especially for the wider ESP32 family. Source and revision information is not shown per page. The API is for account data, not hardware. The project library is useful but small next to large open-source repositories.

Most importantly, Reznex should not replace manufacturer documentation. The workflow that works is:

**Reznex for fast research → official documentation for verification → board schematic for hardware-specific details → testing for validation.**

For makers and embedded developers, that can genuinely save time. For production hardware, the final authority is still the manufacturer's documentation and the hardware itself.
