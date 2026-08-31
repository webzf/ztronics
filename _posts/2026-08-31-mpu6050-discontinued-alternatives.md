---
title: "Is the MPU6050 Discontinued? Best Alternatives and Replacements"
layout: single
permalink: /mpu6050-discontinued-alternatives/
excerpt: "Is the MPU6050 discontinued or obsolete? Here's what TDK InvenSense's official EOL notice actually says, whether GY-521 modules are still worth buying, and which alternative — BMA400, ICM-42670-P or ICM-42688-P — fits your next Arduino or ESP32 project."
show_date: false
read_time: false
last_modified_at: false
toc: true
toc_label: "Contents"
header:
  teaser: /assets/images/mpu6050-discontinued.webp
  overlay_image: /assets/images/mpu6050-discontinued.webp
  overlay_filter: 0.5
  image: /assets/images/mpu6050-discontinued.webp
  og_image: /assets/images/mpu6050-discontinued.webp
categories:
  - Sensors
  - ESP32
  - Arduino
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

## Is the MPU6050 Discontinued?

**Yes. The MPU-6050 chip has been formally discontinued by its manufacturer, TDK InvenSense, and is no longer in production.**

This isn't just a distributor guess. TDK InvenSense issued an official End-of-Life notification confirming the discontinuation, with a defined Last Time Buy and Last Time Ship schedule — see [What Happened to the MPU6050?](#what-happened-to-the-mpu6050) for the details.

In other words, the MPU6050 is obsolete for new production designs, even though MPU6050 modules can still be available.

That doesn't mean the sensor has vanished. MPU6050 breakout boards and modules can still be found through distributors, retailers and marketplaces, and existing MPU6050 projects will keep working. But if you're starting a new design today, you should know exactly what "discontinued" means here — and what to use instead.

This guide covers the MPU6050's real status, what its EOL means for availability, and which modern alternative — the [BMA400](#bma400), [ICM-42670-P](#icm-42670-p) or [ICM-42688-P](#icm-42688-p) — fits your project.

If you're still using an MPU6050 and want to build with it, our [MPU6050 Arduino Guide](/mpu6050-arduino-guide/) and [MPU6050 Calibration Guide](/mpu6050-calibration-guide/) cover wiring, code and offset calibration in detail.

### The short answer

| Question | Answer |
|---|---|
| Is the MPU6050 discontinued? | **Yes** |
| Is the MPU6050 obsolete? | **Yes** |
| Is it still possible to buy modules? | **Yes** |
| Is the original chip still in production? | **No** |
| Can existing projects keep using it? | **Yes** |
| Recommended for a new long-life design? | **Generally no** |
| Is there an officially named drop-in replacement? | **No** |

---

## What Happened to the MPU6050?

The MPU6050 belongs to InvenSense's original generation of 6-axis MotionTracking devices, and for over a decade it was a go-to IMU for hobbyist robotics, self-balancing robots and motion-controlled Arduino and ESP32 projects.

**TDK InvenSense issued an official EOL notification (PCN-000614) on July 23, 2023**, covering the MPU-6050 along with several related parts and evaluation boards. The notice established:

- **Last Time Buy: January 31, 2024**
- **Last Time Ship: December 31, 2024**

The EOL notice itself does not name a specific replacement — it directs customers to contact their local TDK sales office regarding alternatives. Separately, **TDK's product information identifies the ICM-42670-P as a recommended alternate for the MPU-6050**, while explicitly noting that interchangeability is not guaranteed.

Distributor listings independently confirm the lifecycle status. DigiKey and Microchip USA list the MPU-6050 as **Obsolete**, while other component distributors may use the term **Discontinued**.

### Discontinued vs Obsolete vs EOL: What's the Difference?

These terms get used loosely, so it's worth being precise:

- **NRND (Not Recommended for New Designs):** the manufacturer may still produce the part but discourages using it in new projects.
- **Discontinued:** the manufacturer has ended, or is ending, production.
- **EOL (End of Life):** the formal lifecycle process used to announce that a product is being phased out, typically including Last Time Buy and Last Time Ship dates.
- **Obsolete:** a lifecycle status indicating that the component is no longer manufactured.
- **Unavailable:** simply means stock can't currently be found — this can happen even to parts still in active production.

For the MPU-6050, the EOL process has already passed its Last Time Ship date.

**The MPU-6050 is now obsolete, not merely temporarily difficult to find.**

---

## Can You Still Buy the MPU6050?

**Yes — but the chip and the module are two different things.**

**The chip is discontinued.** The manufacturer's Last Time Ship date has already passed.

**Breakout boards and modules can still be sold.** You'll still find GY-521 boards, generic MPU6050 modules and distributor or marketplace listings.

The continued availability of a finished module does **not** change the official lifecycle status of the semiconductor inside it.

The exact provenance of a module can vary by seller and supply chain, so marketplace availability should not be interpreted as evidence that the original MPU6050 IC is still being manufactured.

For this reason, buyers should pay attention to:

- seller reputation;
- component provenance;
- documentation;
- board quality;
- return policy;
- whether the module is intended for prototyping or production.

See [Are MPU6050 Modules and GY-521 Boards Still Worth Buying?](#are-mpu6050-modules-and-gy-521-boards-still-worth-buying) below.

---

## Should You Use the MPU6050 in a New Project?

**For prototyping, learning or a one-off hobby build:** the MPU6050 is still a reasonable choice. It's inexpensive, well documented, and has an enormous ecosystem of libraries, tutorials and example code.

**For a new product or a design you plan to manufacture at scale:** an obsolete component is generally a poor starting point. The main problem is future supply rather than current functionality.

For anything beyond prototyping, an actively produced part such as the [ICM-42670-P](#icm-42670-p), [ICM-42688-P](#icm-42688-p) or, where appropriate, [BMA400](#bma400) is a safer foundation.

The right answer depends heavily on whether this is a prototype or a production design — see [New Projects vs Existing Projects](#new-projects-vs-existing-projects) below.

---

## MPU6050 Alternatives

Three sensors are particularly relevant when looking for a modern MPU6050 alternative, each solving a slightly different problem:

- **BMA400** — low-power 3-axis accelerometer.
- **ICM-42670-P** — modern 6-axis IMU and TDK-recommended alternate.
- **ICM-42688-P** — higher-performance 6-axis IMU.

**None of these is pin-compatible with the MPU6050.**

Every one involves a different package, pinout and register map, so treat all three as design migrations rather than drop-in swaps.

### BMA400

The [BMA400](/products/bma400/) is a **3-axis accelerometer** from Bosch Sensortec, actively produced and built around ultra-low power consumption.

Key specifications include:

- Accelerometer only — **no gyroscope**
- Acceleration ranges: ±2g / ±4g / ±8g / ±16g
- 12-bit resolution
- Current consumption from ~3.5 µA in low-power operation to ~14.5 µA in higher-performance operation
- Approximately 5.8 µA in a typical low-power use case
- I2C and SPI support
- Built-in step counting
- Activity recognition
- Orientation detection
- Single/double-tap detection
- Wake-on-motion functionality

**The BMA400 cannot replace the MPU6050's gyroscope** — it simply doesn't have one.

If your project needs angular velocity, such as a self-balancing robot, gesture controller or application measuring rotation, look at a 6-axis IMU such as the ICM-42670-P or ICM-42688-P instead.

Where the BMA400 shines is any project that only needs acceleration:

- motion detection;
- tilt sensing;
- wake-on-motion;
- step counting;
- tap-based input;
- low-power IoT;
- battery-powered sensing.

For a full head-to-head, see [BMA400 vs MPU6050: Which Motion Sensor Should You Buy?](/bma400-vs-mpu6050/) and [BMA400 ESP32 Tutorial: Wiring, Code & Arduino Guide](/bma400-esp32-tutorial-wiring-code-arduino-guide/).

---

### ICM-42670-P

The **ICM-42670-P** is one of the most important modern alternatives to consider when the project requires both acceleration and gyroscope measurements.

There is a particularly strong reason for considering it:

**TDK InvenSense identifies the ICM-42670-P as a recommended alternate for the MPU-6050.**

The ICM-42670-P is a 6-axis IMU with:

- 3-axis accelerometer;
- 3-axis gyroscope;
- I2C;
- SPI;
- I3C;
- programmable digital filters;
- wake-on-motion;
- freefall detection;
- pedometer;
- tilt detection;
- significant-motion detection.

TDK specifies:

- accelerometer ranges of ±2g, ±4g, ±8g and ±16g;
- gyroscope ranges up to ±2000 °/s;
- approximately 0.55 mA for 6-axis low-noise operation;
- approximately 3.5 µA in sleep mode.

**It is not a drop-in replacement for the MPU6050.**

Its package, pinout, register map and software interface differ from those of the MPU6050.

TDK's recommendation should therefore be understood as a **recommended alternate for new designs**, not a guarantee that an MPU6050 board or software implementation can be reused unchanged.

For most new Arduino or ESP32 projects that need both an accelerometer and a gyroscope, the ICM-42670-P is the strongest general-purpose starting point among the alternatives covered here.

---

### ICM-42688-P

The **ICM-42688-P** is another current-production 6-axis IMU from TDK InvenSense.

It is aimed more strongly at applications where sensor performance and low noise are important.

The ICM-42688-P provides:

- 3-axis accelerometer;
- 3-axis gyroscope;
- I2C;
- SPI;
- I3C;
- ±2g, ±4g, ±8g and ±16g accelerometer ranges;
- gyroscope ranges from approximately ±15.6 to ±2000 °/s;
- programmable digital filters;
- pedometer;
- tilt detection;
- tap detection;
- wake-on-motion;
- significant-motion detection.

TDK specifies approximately:

- 2.8 mdps/√Hz gyroscope noise;
- 70 µg/√Hz accelerometer noise;
- 0.88 mA low-noise 6-axis current consumption;
- up to 24 MHz SPI;
- up to 1 MHz I2C.

Don't reach for it just because the datasheet numbers look better — it's more sensor than most hobbyist projects need.

It makes sense specifically when your project is noise-sensitive or precision-sensitive:

- flight controllers;
- stabilization platforms;
- demanding sensor fusion;
- high-performance motion tracking.

For a typical motion-controlled game, robot or tilt-based project, the ICM-42670-P is usually enough.

---

### Other Alternatives

Depending on your exact requirements, you may also come across the **MPU6500/MPU9250**, the **ICM-20948**, or Bosch's **BMI270/BMI160**.

However, lifecycle status and availability vary between these parts, so they should be evaluated individually rather than assumed to be long-term replacements for the obsolete MPU6050.

This guide focuses on the BMA400, ICM-42670-P and ICM-42688-P because they are the alternatives most directly relevant to the projects covered by Embedded Nerd.

---

## MPU6050 vs Modern Alternatives

![MPU6050 vs BMA400, ICM-42670-P and ICM-42688-P comparison](/assets/images/mpu6050-alternatives-comparison.webp)

| Feature | MPU6050 | BMA400 | ICM-42670-P | ICM-42688-P |
|---|---|---|---|---|
| Lifecycle status | **Obsolete** | Active | Active | Active |
| Sensor type | 6-axis IMU | 3-axis accelerometer | 6-axis IMU | 6-axis IMU |
| Accelerometer | Yes | Yes | Yes | Yes |
| Gyroscope | Yes | **No** | Yes | Yes |
| I2C | Yes | Yes | Yes | Yes |
| SPI | No | Yes | Yes | Yes |
| I3C | No | No | Yes | Yes |
| Accel range | ±2/4/8/16g | ±2/4/8/16g | ±2/4/8/16g | ±2/4/8/16g |
| Gyro range | ±250–2000 °/s | — | Up to ±2000 °/s | ±15.6–2000 °/s |
| Low-power focus | Limited | **Excellent** | Strong | Strong |
| Motion features | Yes | Extensive | Extensive | Extensive |
| Step counting | No dedicated feature | Yes | Yes | Yes |
| Arduino ecosystem | **Extensive** | Good | Available | Available |
| ESP32 suitability | Excellent | Excellent | Excellent | Excellent |
| Drop-in MPU6050 replacement | — | No | No | No |
| Best suited to | Existing projects and learning | Low-power acceleration | New 6-axis designs | High-performance 6-axis designs |

The alternatives use different architectures and software interfaces, so similar specifications do not imply hardware or software compatibility.

For a deeper technical comparison between the BMA400 and MPU6050, see [BMA400 vs MPU6050: Which Motion Sensor Should You Buy?](/bma400-vs-mpu6050/).

---

## Which MPU6050 Alternative Should You Choose?

**Need an accelerometer and a gyroscope, and want an actively produced modern part?**

→ Consider the **ICM-42670-P**. It is TDK's recommended alternate for the MPU-6050 and provides the same basic sensor category: 3-axis acceleration plus 3-axis angular velocity.

**Only need an accelerometer, and battery life or motion-triggered wake-up matters?**

→ The **BMA400** is a strong option for wearables, step counters or wake-on-motion designs. Remember that it has no gyroscope.

**Need lower noise or higher precision?**

→ Evaluate the **ICM-42688-P**, particularly for stabilization, flight control and demanding sensor-fusion applications.

**Already have a working MPU6050 project?**

→ You generally don't need to change anything immediately. Existing modules can continue functioning normally. The main concern is future availability rather than current sensor performance.

No single alternative is universally "better."

The choice depends on:

- required sensor axes;
- power budget;
- performance requirements;
- interface;
- software support;
- expected product lifetime.

---

## New Projects vs Existing Projects

This is the single most important distinction in this guide.

**If you already have a working MPU6050 project:** you almost certainly don't need to do anything right now. The obsolete status doesn't make a working sensor stop working, and existing GY-521 modules or stock on hand will continue functioning normally.

The main risk is future sourcing. If you'll need more units later for repairs, expansion or additional builds, reliable sourcing may become increasingly difficult as available supply decreases.

For a one-off hobby build, it is rarely worth migrating solely because the component is obsolete.

**If you're starting a new project:** the decision depends on the intended lifetime.

For prototyping, learning or a one-off build, the MPU6050 remains a practical and inexpensive choice.

For a product intended for long-term manufacturing, start with an actively produced component instead. The ICM-42670-P, ICM-42688-P and BMA400 can each make sense depending on the application.

---

## Best MPU6050 Alternatives for 2026

This shortlist reflects the alternatives covered in this guide.

Because semiconductor lifecycles change, this is the section to revisit in future years. The article title and permalink are intentionally evergreen.

| If your priority is… | Consider |
|---|---|
| Acceleration only, very low power | **BMA400** |
| Acceleration + gyroscope, general-purpose | **ICM-42670-P** |
| Acceleration + gyroscope, low noise / high performance | **ICM-42688-P** |
| An existing MPU6050 project that already works | **Keep using the MPU6050** |

---

## Are MPU6050 Modules and GY-521 Boards Still Worth Buying?

The **GY-521** is the small breakout board most hobbyists actually buy.

It is not a new version of the MPU6050.

It is a module designed to make the MPU6050 easier to connect to a microcontroller.

![MPU6050 sensor module used in typical GY-521 breakout boards](/assets/images/mpu6050.webp)

A typical board provides connections for:

- VCC;
- GND;
- SDA;
- SCL;
- INT;
- AD0.

### Are GY-521 modules still useful?

**Yes, for many hobby projects.**

They remain useful for:

- Arduino learning;
- ESP32 experiments;
- robotics prototypes;
- educational projects;
- testing existing MPU6050 software;
- one-off builds.

### Does the availability of GY-521 mean the MPU6050 is still being manufactured?

**No.**

The availability of a finished module does not change the semiconductor's official lifecycle status.

Modules can remain on the market after the original IC has become obsolete.

### What about module quality?

Different modules can come from different suppliers and supply chains.

The presence of an MPU6050 module on a marketplace therefore does not, by itself, establish the provenance or authenticity of the IC used on that board.

This does **not** mean that every inexpensive GY-521 is counterfeit.

The practical advice is simple:

> **For prototypes, a GY-521 can still be useful. For long-term production, use a traceable, actively produced component wherever possible.**

---

## Arduino and ESP32 Compatibility

The MPU6050 remains particularly attractive for Arduino and ESP32 thanks to its mature software ecosystem — years of libraries, tutorials, example sketches and calibration guides, including the Embedded Nerd [MPU6050 Arduino Guide](/mpu6050-arduino-guide/).

All three alternatives covered here can also be used with Arduino and ESP32, but **don't assume an existing MPU6050 sketch will run unchanged on a new sensor.**

Each alternative has different:

- registers;
- initialization sequences;
- device IDs;
- scaling;
- interrupt configuration;
- library APIs.

Migration therefore normally means using a different library and adapting the software.

### BMA400 + ESP32

Particularly strong for:

- deep-sleep applications;
- battery-powered IoT;
- wake-on-motion;
- activity tracking;
- low-power motion detection.

See the [BMA400 ESP32 Tutorial](/bma400-esp32-tutorial-wiring-code-arduino-guide/) for a practical implementation.

### ICM-42670-P + ESP32

A strong choice for new 6-axis projects requiring both acceleration and gyroscope measurements.

The device supports I2C, SPI and I3C.

### ICM-42688-P + ESP32

A better fit when low noise and high-performance motion sensing matter more than simplicity.

### I2C Addresses

The MPU6050 typically uses `0x68`, or `0x69` when AD0 is HIGH.

The BMA400 uses `0x14` or `0x15`.

That means an MPU6050 and BMA400 can potentially share the same I2C bus without an address conflict.

However, address compatibility is only one part of successful integration. Also check:

- supply voltage;
- logic levels;
- pull-up resistors;
- bus capacitance;
- interrupt connections;
- library support.

Use the [I2C Address Lookup & Compatibility Checker](/tools/i2c-address-lookup/) when planning a multi-sensor I2C bus.

---

## What to Look for When Choosing an MPU6050 Replacement

### 1. Does it have a gyroscope?

This is the first question.

If the application requires angular velocity, an accelerometer-only sensor such as the BMA400 is not enough.

### 2. Which interface do you need?

Check whether the project requires:

- I2C;
- SPI;
- I3C.

### 3. What measurement ranges are required?

Compare:

- accelerometer range;
- gyroscope range;
- noise;
- resolution;
- output data rate.

### 4. What is the power budget?

This is especially important for battery-powered ESP32 applications.

### 5. Is the component still in production?

Do not judge lifecycle status based only on marketplace availability.

Check the manufacturer's current product information.

### 6. What software support exists?

Check:

- Arduino;
- PlatformIO;
- ESP-IDF;
- vendor drivers;
- documentation;
- examples.

### 7. Is it actually interchangeable?

Check:

- package;
- pinout;
- supply voltage;
- registers;
- device ID;
- initialization;
- axis orientation.

In most cases, an MPU6050 replacement is a **design migration**, not a component swap.

---

## Recommended Hardware

| Component | Recommended Product | Buy |
|---|---|---|
| MPU6050 Accelerometer & Gyroscope (legacy/prototyping) | [**MPU6050 Accelerometer & Gyroscope**](/products/mpu6050/) | [🛒 AliExpress](https://s.click.aliexpress.com/e/_c2uAjJYP) |
| BMA400 Accelerometer Module (low-power, accel-only) | [**BMA400 Accelerometer Module**](/products/bma400/) | [🛒 AliExpress](https://s.click.aliexpress.com/e/_c3RBiLUT) |
| ESP32 Development Board | [**ESP32 DevKit V1**](/products/esp32-devkit/) | [🛒 AliExpress](https://s.click.aliexpress.com/e/_c4n38hZ9) |

ICM-42670-P and ICM-42688-P breakout board recommendations can be added once verified product listings are available on Embedded Nerd.

**Transparency Notice**

Some links on this page are affiliate links. If you purchase through them, Embedded Nerd may earn a small commission at no additional cost to you. This helps support the website and allows us to continue creating free tutorials and guides. Thank you for your support!

---

## Related Embedded Nerd Tutorials

- [MPU6050 Arduino Guide](/mpu6050-arduino-guide/)
- [MPU6050 Calibration Guide: How to Calibrate Accelerometer & Gyroscope](/mpu6050-calibration-guide/)
- [BMA400 vs MPU6050: Which Motion Sensor Should You Buy?](/bma400-vs-mpu6050/)
- [BMA400 ESP32 Tutorial: Wiring, Code & Arduino Guide](/bma400-esp32-tutorial-wiring-code-arduino-guide/)
- [I2C Address Lookup & Compatibility Checker](/tools/i2c-address-lookup/)
- [Best Sensors for ESP32](/best-esp32-sensors/)

---

## Frequently Asked Questions

### Is the MPU6050 discontinued?

Yes. TDK InvenSense issued an official EOL notification (PCN-000614) on July 23, 2023, with a Last Time Buy of January 31, 2024 and a Last Time Ship of December 31, 2024.

### Is the MPU6050 obsolete?

Yes. The MPU-6050 is now obsolete and is no longer in active production.

### When was the MPU6050 discontinued?

TDK InvenSense's EOL notification was issued on July 23, 2023. The notice established January 31, 2024 as the Last Time Buy date and December 31, 2024 as the Last Time Ship date.

### Can I still buy MPU6050 modules?

Yes. GY-521 breakout boards and MPU6050 modules can still be available through distributors and marketplaces even though the original IC is obsolete.

### Is GY-521 still worth buying?

For prototyping, learning and existing projects, yes.

For a product intended for long-term manufacturing, an actively produced alternative is generally the safer choice.

### What is the best MPU6050 replacement?

There is no universal replacement.

For a modern 6-axis design, the **ICM-42670-P** is the strongest candidate to investigate because TDK identifies it as a recommended alternate for the MPU-6050.

For accelerometer-only low-power applications, consider the **BMA400**.

For higher-performance motion sensing, consider the **ICM-42688-P**.

### What is the best MPU6050 alternative for ESP32?

If the project needs only acceleration, the **BMA400** is an excellent low-power option.

If the project needs both acceleration and gyroscope measurements, the **ICM-42670-P** is a strong modern choice.

For higher-performance applications, evaluate the **ICM-42688-P**.

### Is BMA400 a replacement for MPU6050?

Only for applications that do not require a gyroscope.

The BMA400 is a 3-axis accelerometer, while the MPU6050 is a 6-axis IMU with both acceleration and gyroscope sensing.

### Does BMA400 have a gyroscope?

No.

The BMA400 is an accelerometer-only sensor.

### Is ICM-42670-P a replacement for MPU6050?

It is a modern 6-axis replacement candidate and is specifically identified by TDK as a recommended alternate.

However, it should not be treated as a drop-in replacement. Hardware and software changes should be expected when migrating from the MPU6050.

### Is MPU6050 still good for Arduino?

Yes, especially for learning, prototyping and existing projects.

Its mature software ecosystem remains one of its biggest advantages.

For new long-term designs, an actively produced alternative is preferable.

### Is MPU6050 still good for ESP32?

Yes.

The MPU6050 remains fully usable for existing and hobby ESP32 projects.

The main disadvantage is its obsolete lifecycle rather than its current technical functionality.

### Should I use MPU6050 in a new project?

For a short-term prototype or educational project, it can still be a practical choice.

For a new product or long-term design, an actively produced sensor such as the ICM-42670-P, BMA400 or ICM-42688-P is generally the safer choice.

---

## Conclusion

The **MPU6050 is officially obsolete and its production lifecycle has ended**.

TDK InvenSense issued the formal EOL notification in 2023, with the final scheduled Last Time Buy in January 2024 and Last Time Ship in December 2024.

That does not mean MPU6050 modules have disappeared.

GY-521 boards and other MPU6050 breakout modules can still be available, and existing projects will continue to work normally.

For learning, prototyping and one-off Arduino or ESP32 projects, there can still be good reasons to use an MPU6050.

For a new design intended to remain in production for years, however, starting with an actively produced sensor is generally the better strategy.

If you need both an accelerometer and a gyroscope, the **ICM-42670-P** is the main modern alternative to investigate and is specifically identified by TDK as a recommended alternate for the MPU-6050.

If you only need acceleration and very low power is important, the **BMA400** is a strong alternative.

If lower sensor noise and higher performance are important, the **ICM-42688-P** is worth considering.

None of these should be treated as a drop-in replacement for the MPU6050.

The right replacement depends on what your project actually needs.

**For an existing MPU6050 project: keep using it if it works and your supply situation is acceptable.**

**For a new long-term design: start with a current-production sensor.**
