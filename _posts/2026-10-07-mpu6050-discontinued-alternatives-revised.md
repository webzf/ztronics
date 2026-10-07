---
title: "MPU6050 Alternative 2026: 3 Replacements Compared"
description: "MPU6050 alternative for 2026: yes, it's discontinued (EOL). Compare ICM-42670-P, ICM-42688-P and BMA400 and see which to buy."
layout: single
permalink: /mpu6050-discontinued-alternatives/
show_date: true
last_modified_at: 2026-10-07
read_time: false
toc: true
toc_label: "Contents"
header:
  teaser: /assets/images/mpu6050-discontinued.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/mpu6050-discontinued.webp
  og_image: /assets/images/mpu6050-discontinued.webp
categories:
  - Sensors
  - ESP32
  - Arduino
internal_link_keywords:
  - "MPU6050 discontinued"
  - "MPU6050 alternatives"
  - "MPU6050 alternative"
  - "MPU6050 replacement"
  - "MPU6050 alternatives 2026"
tags:
  - MPU6050
  - BMA400
  - ICM-42670-P
  - ICM-42688-P
  - IMU
  - Accelerometer
  - Gyroscope
  - I2C
  - ESP32
  - Arduino
sidebar:
  nav: "embedded"
  related: true
  share: true
---

**Updated October 2026**

Yes, the MPU6050 is discontinued. TDK InvenSense issued an end-of-life notice (PCN-000614), and the last-time-ship date was December 31, 2024. GY-521 modules are still on sale, but the chip is obsolete for new designs.

**What to use instead:** the [ICM-42670-P](/products/icm-42670-p/) as a general 6-axis replacement, the [ICM-42688-P](/products/icm-42688-p/) for low noise, and the [BMA400](/products/bma400/) if you only need an accelerometer. None is pin-compatible, so expect a hardware and library change.

> **Where to buy:** [ICM-42670-P](/products/icm-42670-p/) (6-axis) · [ICM-42688-P](/products/icm-42688-p/) (low noise) · [BMA400](/products/bma400/) (low power, no gyro)
>
> *Affiliate links: I may earn a commission at no extra cost to you.*

## The Short Answer

**Yes — the MPU6050 is discontinued and now obsolete.** TDK InvenSense's official EOL notice (PCN-000614) was issued on July 23, 2023. It set January 31, 2024 as the Last Time Buy and December 31, 2024 as the Last Time Ship date.

The important part for a buyer is what comes next:

- **ICM-42670-P:** best general-purpose 6-axis alternative to investigate; TDK currently lists it as the recommended alternate for the MPU-6050.
- **ICM-42688-P:** choose it when lower sensor noise and higher performance matter more.
- **BMA400:** choose it when you only need acceleration and very low power is important.
- **Existing MPU6050/GY-521 project:** keep using it if it works; obsolescence does not make an existing sensor stop working.

None of the alternatives is a drop-in replacement. Hardware, registers, pinout and software libraries differ.

## MPU6050 Alternatives Compared

![MPU6050 vs BMA400, ICM-42670-P and ICM-42688-P comparison](/assets/images/mpu6050-alternatives-comparison.webp)

| Sensor | Interface | Current draw | Range | Best choice when | Where to buy |
|---|---|---|---|---|---|
| **MPU6050** (obsolete) | I2C | See datasheet | ±2/4/8/16 g; ±250–2000 °/s | Existing projects, learning, prototypes | [Product page](/products/mpu6050/) · [AliExpress](https://s.click.aliexpress.com/e/_c2uAjJYP){: rel="sponsored nofollow noopener"} |
| **ICM-42670-P** | I2C, SPI, I3C | ~0.55 mA low-noise 6-axis | ±2/4/8/16 g; up to ±2000 °/s | New 6-axis project, general purpose | [Product page](/products/icm-42670-p/) |
| **ICM-42688-P** | I2C, SPI, I3C | ~0.88 mA low-noise 6-axis | ±2/4/8/16 g; ±15.6–2000 °/s | Low noise, stabilization, demanding sensor fusion | [Product page](/products/icm-42688-p/) |
| **BMA400** (no gyro) | I2C, SPI | ~3.5–14.5 µA* | ±2/4/8/16 g | Battery-powered, wake-on-motion, accel only | [Product page](/products/bma400/) · [AliExpress](https://s.click.aliexpress.com/e/_c3RBiLUT){: rel="sponsored nofollow noopener"} |

\* Sensor operating figures vary by mode; breakout-board consumption can be higher.

**Not sure which one fits?** See [Which alternative should you choose?](#which-alternative-should-you-choose)

### ICM-42670-P

The [ICM-42670-P](/products/icm-42670-p/) is a modern 6-axis IMU combining a 3-axis accelerometer and 3-axis gyroscope. TDK currently lists the MPU-6050 as obsolete and identifies the ICM-42670-P as its **Recommended Alternate Part No.**, while explicitly warning that interchangeability is not guaranteed. citeturn0search0turn2search0

Key features include:

- 3-axis accelerometer and 3-axis gyroscope
- I2C, SPI and I3C
- ±2/4/8/16 g accelerometer ranges
- Up to ±2000 °/s gyroscope range
- Approximately 0.55 mA in low-noise 6-axis operation
- 3.5 µA sleep current
- Wake-on-motion, freefall, tilt, pedometer and significant-motion functions

For most new Arduino or ESP32 projects that need both acceleration and gyroscope measurements, this is the strongest general-purpose starting point among the alternatives covered here.

**Buy:** [ICM-42670-P 6-Axis IMU](/products/icm-42670-p/)

### ICM-42688-P

The [ICM-42688-P](/products/icm-42688-p/) is another current-production 6-axis IMU from TDK InvenSense, aimed more strongly at applications where sensor performance and low noise matter.

It provides:

- 3-axis accelerometer and 3-axis gyroscope
- I2C, SPI and I3C
- ±2/4/8/16 g accelerometer ranges
- Gyroscope ranges from approximately ±15.6 to ±2000 °/s
- 2.8 mdps/√Hz gyroscope noise
- 70 µg/√Hz accelerometer noise
- Approximately 0.88 mA low-noise 6-axis current
- FIFO and APEX motion-processing features

It makes the most sense for flight controllers, stabilization platforms, demanding sensor fusion and other precision-sensitive motion applications.

For a typical motion-controlled game, robot or tilt-based project, the ICM-42670-P is usually enough.

**Buy:** [ICM-42688-P 6-Axis High-Precision IMU](/products/icm-42688-p/)

### BMA400

The [BMA400](/products/bma400/) is a 3-axis accelerometer from Bosch Sensortec. It does **not** include a gyroscope.

Its main advantages are very low power consumption and built-in motion features:

- ±2/4/8/16 g acceleration ranges
- 12-bit resolution
- I2C and SPI
- Approximately 3.5–14.5 µA depending on operating mode
- Step counting
- Activity recognition
- Orientation detection
- Single/double-tap detection
- Wake-on-motion

The BMA400 is therefore a strong alternative for motion detection, tilt sensing, step counting, tap-based input, low-power IoT and battery-powered sensing.

If your application needs angular velocity, choose a 6-axis IMU instead.

**Buy:** [BMA400 Accelerometer Module](/products/bma400/) · [AliExpress](https://s.click.aliexpress.com/e/_c3RBiLUT){: rel="sponsored nofollow noopener"}

## Which Alternative Should You Choose?

**Need an accelerometer and a gyroscope for a new design?**

→ Start with the **ICM-42670-P**. It is the balanced general-purpose choice and TDK's current recommended alternate for the obsolete MPU-6050. citeturn0search0

**Need lower noise or higher precision?**

→ Evaluate the **ICM-42688-P**, particularly for stabilization, flight control and demanding sensor-fusion applications.

**Only need an accelerometer and battery life matters?**

→ Choose the **BMA400**. Its ultra-low-power operation and built-in motion functions make it especially useful for battery-powered and wake-on-motion designs.

**Already have a working MPU6050 project?**

→ Keep using it if it works and your supply situation is acceptable. The main concern is future sourcing, not current functionality.

There is no universal "best" replacement. The choice depends on sensor axes, power budget, performance, interface, software support and expected product lifetime.

## Is the MPU6050 Discontinued? What the EOL Notice Says

TDK InvenSense issued the official **EOL notification PCN-000614 on July 23, 2023**. The notice covers the MPU-6050 and states that the affected components would be discontinued. citeturn0search31

The schedule was:

- **Last Time Buy:** January 31, 2024
- **Last Time Ship:** December 31, 2024

That Last Time Ship date has now passed.

TDK's current product page lists the MPU-6050 as **Obsolete** and identifies the ICM-42670-P as the recommended alternate, with the explicit qualification that interchangeability is not guaranteed. citeturn0search0

### Discontinued vs Obsolete vs EOL

These terms are related but not identical:

- **EOL:** the formal end-of-life process used to announce a product transition.
- **Discontinued:** production has ended or is being ended.
- **Obsolete:** the component is no longer manufactured.

For the MPU-6050, the EOL schedule has already passed its Last Time Ship date, and TDK now lists the product as obsolete. citeturn0search0turn0search31

## Should You Still Buy an MPU6050 or GY-521?

**Yes, for prototypes and existing projects. No, as the default choice for a new long-life manufactured product.**

The **GY-521** is a breakout board built around the MPU6050. It remains widely available even though the semiconductor itself is obsolete.

![MPU6050 sensor module used in typical GY-521 breakout boards](/assets/images/mpu6050.webp)

A typical module provides:

- VCC
- GND
- SDA
- SCL
- INT
- AD0

GY-521 boards remain useful for:

- Arduino learning
- ESP32 experiments
- robotics prototypes
- educational projects
- testing existing MPU6050 software
- one-off builds

The availability of a finished module does **not** mean that the MPU6050 IC is still being manufactured. Different modules can also come from different suppliers and supply chains.

For marketplace modules, pay attention to seller reputation, component provenance, documentation, board quality and return policy.

> **For prototypes, a GY-521 can still be useful. For long-term production, use a traceable, actively produced component wherever possible.**

If you already have a working project, our [MPU6050 Arduino Guide](/mpu6050-arduino-guide/) remains useful. If you need to improve offsets and measurement accuracy, see our [MPU6050 Calibration Guide](/mpu6050-calibration-guide/).

## New Projects vs Existing Projects

### Existing MPU6050 project

If an existing project works, there is normally no reason to migrate solely because the component became obsolete.

The sensor will not stop working because its manufacturer ended production. The main risk is future sourcing if you need additional units for repairs, expansion or new builds.

For a one-off hobby project, continuing to use an MPU6050 can therefore be perfectly reasonable.

### New project

For prototyping and learning, the MPU6050 can still be convenient because of its mature Arduino and ESP32 ecosystem.

For a product intended for long-term manufacturing, an actively produced component is the safer starting point.

A useful rule is:

- **Prototype/learning:** MPU6050 can still make sense.
- **New long-life product:** start with a current-production alternative.
- **6-axis general purpose:** investigate ICM-42670-P.
- **Low-noise/high-performance:** investigate ICM-42688-P.
- **Acceleration only/very low power:** investigate BMA400.

## Migrating on Arduino and ESP32

The MPU6050 remains attractive because of its mature software ecosystem, but moving to a newer sensor is not a library-only change.

The alternatives have different:

- registers
- initialization sequences
- device IDs
- scaling
- interrupt configuration
- library APIs

Expect to use a different library and adapt the software.

### I2C addresses

The MPU6050 typically uses `0x68`, or `0x69` when AD0 is HIGH.

The BMA400 uses `0x14` or `0x15`.

These different addresses mean an MPU6050 and BMA400 can potentially share the same I2C bus without an address conflict.

Address compatibility is only one part of successful integration. Also check:

- supply voltage
- logic levels
- pull-up resistors
- bus capacitance
- interrupt connections
- library support

Use the [I2C Address Lookup & Compatibility Checker](/tools/i2c-address-lookup/) when planning a multi-sensor I2C bus.

### Arduino and ESP32 support

All three alternatives can be used with Arduino and ESP32, but existing MPU6050 sketches should not be expected to run unchanged.

For a practical low-power ESP32 implementation, see the [BMA400 ESP32 Tutorial](/bma400-esp32-tutorial-wiring-code-arduino-guide/).

For MPU6050 projects, see the [MPU6050 Arduino Guide](/mpu6050-arduino-guide/).

## Recommended Hardware

| Component | Recommended Product | Buy |
|---|---|---|
| MPU6050 Accelerometer & Gyroscope — legacy/prototyping | [**MPU6050 Accelerometer & Gyroscope**](/products/mpu6050/) | [AliExpress](https://s.click.aliexpress.com/e/_c2uAjJYP){: rel="sponsored nofollow noopener"} |
| ICM-42670-P — 6-axis, low power | [**ICM-42670-P 6-Axis IMU**](/products/icm-42670-p/) | [Product page](/products/icm-42670-p/) |
| ICM-42688-P — 6-axis, low noise | [**ICM-42688-P 6-Axis High-Precision IMU**](/products/icm-42688-p/) | [Product page](/products/icm-42688-p/) |
| BMA400 — low power, accel only | [**BMA400 Accelerometer Module**](/products/bma400/) | [AliExpress](https://s.click.aliexpress.com/e/_c3RBiLUT){: rel="sponsored nofollow noopener"} |
| ESP32 development board | [**ESP32 DevKit V1**](/products/esp32-devkit/) | [AliExpress](https://s.click.aliexpress.com/e/_c4n38hZ9){: rel="sponsored nofollow noopener"} |

> **Transparency Notice:** Some links on this page are affiliate links. If you purchase through them, Embedded Nerd may earn a small commission at no additional cost to you. This helps support the website and allows us to continue creating free tutorials and guides.

## Related Embedded Nerd Tutorials

- [MPU6050 Arduino Guide](/mpu6050-arduino-guide/)
- [MPU6050 Calibration Guide: How to Calibrate Accelerometer & Gyroscope](/mpu6050-calibration-guide/)
- [BMA400 vs MPU6050: Which Motion Sensor Should You Buy?](/bma400-vs-mpu6050/)
- [BMA400 ESP32 Tutorial: Wiring, Code & Arduino Guide](/bma400-esp32-tutorial-wiring-code-arduino-guide/)
- [I2C Address Lookup & Compatibility Checker](/tools/i2c-address-lookup/)
- [Best Sensors for ESP32](/products/sensors/)

## FAQ

### Is the MPU6050 discontinued?

Yes. TDK InvenSense issued an end-of-life notice (PCN-000614) with a last-time-buy of January 31, 2024 and a last-time-ship of December 31, 2024. GY-521 modules are still sold, but the original chip is obsolete.

### What is the best MPU6050 replacement?

For a 6-axis replacement, start with the ICM-42670-P, which TDK lists as a recommended alternate. For accelerometer-only, low-power projects use the BMA400. For lower noise, evaluate the ICM-42688-P.

### Is there a drop-in replacement for the MPU6050?

No. The ICM-42670-P, ICM-42688-P and BMA400 all differ in package, pinout, registers and libraries, so moving from the MPU6050 is a design migration, not a swap.

### Is there a better alternative to the MPU6050?

It depends on what better means. The ICM-42688-P offers lower noise, the BMA400 offers far lower power but has no gyroscope, and the ICM-42670-P is the balanced general-purpose choice.

### Can I still buy MPU6050 or GY-521 modules?

Yes, modules are still sold and work fine for prototypes and existing projects. Availability does not mean the chip is in production, so avoid them for long-term manufactured products.

<script type="application/ld+json">
{"@context":"https://schema.org","@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Is the MPU6050 discontinued?","acceptedAnswer":{"@type":"Answer","text":"Yes. TDK InvenSense issued an end-of-life notice (PCN-000614) with a last-time-buy of January 31, 2024 and a last-time-ship of December 31, 2024. GY-521 modules are still sold, but the original chip is obsolete."}},{"@type":"Question","name":"What is the best MPU6050 replacement?","acceptedAnswer":{"@type":"Answer","text":"For a 6-axis replacement, start with the ICM-42670-P, which TDK lists as a recommended alternate. For accelerometer-only, low-power projects use the BMA400. For lower noise, evaluate the ICM-42688-P."}},{"@type":"Question","name":"Is there a drop-in replacement for the MPU6050?","acceptedAnswer":{"@type":"Answer","text":"No. The ICM-42670-P, ICM-42688-P and BMA400 all differ in package, pinout, registers and libraries, so moving from the MPU6050 is a design migration, not a swap."}},{"@type":"Question","name":"Is there a better alternative to the MPU6050?","acceptedAnswer":{"@type":"Answer","text":"It depends on what better means. The ICM-42688-P offers lower noise, the BMA400 offers far lower power but has no gyroscope, and the ICM-42670-P is the balanced general-purpose choice."}},{"@type":"Question","name":"Can I still buy MPU6050 or GY-521 modules?","acceptedAnswer":{"@type":"Answer","text":"Yes, modules are still sold and work fine for prototypes and existing projects. Availability does not mean the chip is in production, so avoid them for long-term manufactured products."}}]}
</script>

## Conclusion

The **MPU6050 is officially obsolete**, but that does not make existing boards or projects unusable.

For a new 6-axis design, start with the **ICM-42670-P**. For lower noise and higher performance, consider the **ICM-42688-P**. If you only need acceleration and very low power matters, consider the **BMA400**.

**For an existing MPU6050 project: keep using it if it works. For a new long-term design: start with a current-production sensor.**
