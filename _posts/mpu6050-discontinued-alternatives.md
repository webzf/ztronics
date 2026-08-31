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

That doesn't mean the sensor has vanished. MPU6050 breakout boards and modules can still be found through distributors, retailers and marketplaces, and existing MPU6050 projects will keep working. But if you're starting a new design today, you should know exactly what "discontinued" means here — and what to use instead.

This guide covers the MPU6050's real status, what its EOL means for availability, and which modern alternative — the [BMA400](#bma400), [ICM-42670-P](#icm-42670-p) or [ICM-42688-P](#icm-42688-p) — fits your project.

If you're still using an MPU6050 and want to build with it, our [MPU6050 Arduino Guide](https://embeddednerd.com/mpu6050-arduino-guide/) and [MPU6050 Calibration Guide](https://embeddednerd.com/mpu6050-calibration-guide/) cover wiring, code and offset calibration in detail.

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

Distributor listings independently confirm the lifecycle status — DigiKey and Microchip USA both list the MPU-6050 as **Obsolete**; CDI lists it as **Discontinued**.

### Discontinued vs Obsolete vs EOL: What's the Difference?

These terms get used loosely, so it's worth being precise:

- **NRND (Not Recommended for New Designs):** the manufacturer still produces the part but discourages using it in new projects.
- **Discontinued:** the manufacturer has ended, or is ending, production.
- **EOL (End of Life):** the formal lifecycle process used to announce a product is being phased out, typically including Last Time Buy and Last Time Ship dates.
- **Obsolete:** the status distributors typically show once a part is no longer manufactured at all.
- **Unavailable:** simply means stock can't currently be found — this can happen even to parts still in active production.

For the MPU-6050, the EOL process has already passed its Last Time Ship date. It is now genuinely obsolete, not just temporarily hard to find.

---

## Can You Still Buy the MPU6050?

**Yes — but the chip and the module are two different things.**

**The chip is discontinued.** No new wafers are being produced, and the Last Time Ship date has already passed.

**Breakout boards and modules are still sold widely.** You'll still find GY-521 boards, generic MPU6050 modules and older distributor stock through retailers and marketplaces. That's possible because a component can remain commercially available as a finished module long after the underlying chip has reached the end of its production lifecycle — sellers are working through existing inventory, not sourcing newly manufactured silicon.

The exact provenance of a module can vary by seller, which matters more for this chip now than it did while it was in active production — see [GY-521 and Clones](#are-mpu6050-modules-and-gy-521-boards-still-worth-buying) below.

---

## MPU6050 Alternatives

Three sensors are particularly relevant when looking for a modern MPU6050 alternative, each solving a slightly different problem: **BMA400** (low-power 3-axis accelerometer), **ICM-42670-P** (modern 6-axis IMU, TDK's recommended alternate) and **ICM-42688-P** (higher-performance 6-axis IMU).

**None of these is pin-compatible with the MPU6050.** Every one involves a different package, pinout and register map, so treat all three as design migrations rather than drop-in swaps — this applies across the board and won't be repeated for each sensor below.

### BMA400

The [BMA400](https://embeddednerd.com/products/bma400/) is a **3-axis accelerometer** from Bosch Sensortec, actively produced and built around ultra-low power consumption.

Key specs (Bosch Sensortec datasheet):

- Accelerometer only — **no gyroscope**
- Acceleration ranges: ±2g / ±4g / ±8g / ±16g
- 12-bit resolution
- Current consumption from ~3.5 µA (low-power mode) to ~14.5 µA (highest performance), ~5.8 µA typical
- I2C and SPI support
- Built-in step counting, activity recognition, orientation detection, single/double-tap detection, and wake-on-motion interrupts

**The BMA400 cannot replace the MPU6050's gyroscope** — it simply doesn't have one. If your project needs angular velocity (a self-balancing robot, a gesture controller, anything measuring rotation), look at the ICM-42670-P or ICM-42688-P instead. Where the BMA400 shines is any project that only ever used the MPU6050's accelerometer side: motion detection, tilt sensing, wake-on-motion, step counting, or tap-based input.

For a full head-to-head, see [BMA400 vs MPU6050: Which Motion Sensor Should You Buy?](https://embeddednerd.com/bma400-vs-mpu6050/) and [BMA400 ESP32 Tutorial: Wiring, Code & Arduino Guide](https://embeddednerd.com/bma400-esp32-tutorial-wiring-code-arduino-guide/) — this article keeps the comparison brief and points there for the deep dive.

### ICM-42670-P

The **ICM-42670-P** is the part most commonly suggested as a modern successor to the MPU-6050, and TDK's own product information names it as the recommended alternate.

Confirmed specs (TDK InvenSense datasheet and distributor listings):

- 3-axis accelerometer + 3-axis gyroscope
- Interfaces: I2C, SPI, and I3C
- Accelerometer range: ±2g to ±16g; gyroscope range up to ±2000°/s
- Low-noise mode current consumption around 0.55 mA; sleep current around 3.5 µA
- On-chip APEX motion features: pedometer, tilt detection, freefall detection, wake-on-motion, significant motion detection
- Part status: **Active**
- Official Arduino library available (`ICM42670P`), plus ESP-IDF component support

For most new Arduino or ESP32 projects that need both an accelerometer and a gyroscope, this is the strongest general-purpose starting point among the alternatives covered here.

### ICM-42688-P

The **ICM-42688-P** is TDK InvenSense's higher-performance 6-axis IMU, aimed at applications that need lower noise and higher precision than the ICM-42670-P provides.

Confirmed specs (TDK InvenSense datasheet):

- 3-axis accelerometer + 3-axis gyroscope
- Interfaces: I2C (up to 1 MHz), SPI (up to 24 MHz), I3C (up to 12.5 MHz)
- Gyroscope range: ±15.625°/s up to ±2000°/s across eight selectable ranges
- Accelerometer range: ±2g / ±4g / ±8g / ±16g
- Gyroscope noise: 2.8 m°/s/√Hz; accelerometer noise: 70 µg/√Hz
- 6-axis current consumption around 0.88 mA in low-noise mode
- 2 KB FIFO, APEX motion engine (pedometer, tilt, tap, wake-on-motion)
- Part status: **Active**; widely used in FPV flight controllers for its low gyro noise

Don't reach for it just because the datasheet numbers look better — it's more sensor than most hobbyist projects need. It makes sense specifically when your project is noise-sensitive or precision-sensitive: flight controllers, stabilization platforms, serious sensor fusion. For a typical motion-controlled game, robot or tilt-based project, the ICM-42670-P is usually enough.

### Other Alternatives

Depending on your exact requirements, you may also come across the **MPU6500/MPU9250** (later InvenSense parts in the same family — check current availability, as some are also being phased out), the **ICM-20948** (9-axis, if you need a magnetometer too), or Bosch's **BMI270/BMI160** (6-axis IMUs used in some wearables). This guide focuses on the BMA400, ICM-42670-P and ICM-42688-P because they're most directly relevant to Embedded Nerd's projects and have clear, verifiable production status.

---

## MPU6050 vs Modern Alternatives

| Feature | MPU6050 | BMA400 | ICM-42670-P | ICM-42688-P |
|---|---|---|---|---|
| Lifecycle status | **Discontinued (EOL)** | Active | Active | Active |
| Sensor type | 6-axis IMU | 3-axis accelerometer | 6-axis IMU | 6-axis IMU |
| Accelerometer | Yes | Yes | Yes | Yes |
| Gyroscope | Yes | **No** | Yes | Yes |
| Interfaces | I2C | I2C, SPI | I2C, SPI, I3C | I2C, SPI, I3C |
| Accel range | ±2/4/8/16 g | ±2/4/8/16 g | ±2/4/8/16 g | ±2/4/8/16 g |
| Gyro range | ±250–2000 °/s | — | Up to ±2000 °/s | ±15.6–2000 °/s |
| Low-power focus | Limited | Very strong (~3.5–14.5 µA) | Strong (~0.55 mA, 6-axis) | Moderate (~0.88 mA, 6-axis) |
| Built-in motion features | Basic interrupts | Step counting, tap, activity recognition | APEX: pedometer, tilt, wake-on-motion | APEX: pedometer, tilt, tap, wake-on-motion |
| Pin-compatible with MPU6050 | — | No | No | No |
| Arduino/ESP32 library support | Extensive | Good | Good (official library) | Good |
| Best for | Legacy projects, learning | Battery-powered accel-only sensing | General-purpose 6-axis replacement | Noise-sensitive/high-precision projects |

For a deeper technical breakdown between the BMA400 and MPU6050 specifically — including I2C addresses, calibration differences and project-by-project recommendations — see [BMA400 vs MPU6050: Which Motion Sensor Should You Buy?](https://embeddednerd.com/bma400-vs-mpu6050/)

---

## Which MPU6050 Alternative Should You Choose?

**Need an accelerometer and a gyroscope, and want an actively produced modern part?**
→ Consider the **ICM-42670-P** — TDK's recommended alternate, covering the same accelerometer + gyroscope role as the MPU6050 for most Arduino and ESP32 projects.

**Only need an accelerometer, and battery life or motion-triggered wake-up matters?**
→ The **BMA400** is a strong option for wearables, step counters or wake-on-motion designs. Remember it has no gyroscope.

**Need lower noise or higher precision — stabilization, flight control, serious sensor fusion?**
→ Evaluate the **ICM-42688-P**.

No single alternative is universally "better." The choice comes down to whether you need a gyroscope, your power budget, and how much sensor performance the project actually requires. For the separate question of whether you need to change anything at all, see the next section.

---

## New Projects vs Existing Projects

This is the single most important distinction in this whole guide, so it's worth stating plainly once.

**If you already have a working MPU6050 project:** you almost certainly don't need to do anything right now. The obsolete status doesn't make a working sensor stop working, and existing GY-521 modules or stock on hand will keep functioning exactly as before. The only real risk is future sourcing — if you'll need more units later for repairs, expansion, or additional builds of the same product, genuine parts will only get harder to find over time now that the Last Time Ship date has passed. Weigh that against how many units you still need, how long the project needs to stay in service, and how expensive a driver/software migration would be — for a one-off hobby build, it's rarely worth the effort to switch.

**If you're starting a new project:** the calculus depends on what "new" means. For prototyping, learning or a one-off build, the MPU6050 remains a fine, inexpensive, extremely well-documented choice — there's no urgency to avoid it. For a product you intend to manufacture or sell at scale, start with an actively produced part instead (ICM-42670-P, ICM-42688-P or BMA400, per the [decision guide](#which-mpu6050-alternative-should-you-choose) above). Designing a new production run around a discontinued chip means depending entirely on remaining stock and modules of inconsistent quality, with no path back to genuine new supply.

---

## Best MPU6050 Alternatives for 2026

This shortlist reflects currently active, in-production parts. Because chip lifecycles change, this is the section to revisit in future years — the rest of this article, its title and its permalink are intended to stay evergreen.

| If your priority is… | Consider |
|---|---|
| Acceleration only, very low power | **BMA400** |
| Acceleration + gyroscope, general-purpose | **ICM-42670-P** |
| Acceleration + gyroscope, lowest noise / highest precision | **ICM-42688-P** |
| An existing MPU6050 project that already works | **Keep using the MPU6050** |

---

## Are MPU6050 Modules and GY-521 Boards Still Worth Buying?

The **GY-521** is the small breakout board most hobbyists actually buy — it's not the bare MPU-6050 chip, but a module that places the chip on a PCB with supporting components (typically a voltage regulator and pull-up resistors) and breaks out pins for I2C, power and ground.

A few things worth knowing before buying one:

- **The continued sale of GY-521 boards does not mean the MPU-6050 chip is back in production.** Sellers are working through stock accumulated before the Last Time Ship date, not sourcing newly manufactured silicon.
- **Quality varies between sellers.** Because the underlying chip is discontinued, the market for loose MPU-6050 chips increasingly includes remarked or counterfeit parts alongside genuine remaining stock. That doesn't mean every GY-521 module for sale is fake — many sellers use genuine remaining inventory — but provenance and seller reputation matter more than they would for an actively produced part.
- **For learning and prototyping, a GY-521 module is still a perfectly reasonable buy.** The [MPU6050 Arduino Guide](https://embeddednerd.com/mpu6050-arduino-guide/) and [MPU6050 Calibration Guide](https://embeddednerd.com/mpu6050-calibration-guide/) cover exactly how to wire and calibrate one.
- **For a product you intend to manufacture or sell**, the uncertain long-term supply of genuine chips is a real risk worth avoiding by starting with an actively produced alternative instead.

---

## Arduino and ESP32 Compatibility

The MPU6050 remains particularly attractive for Arduino and ESP32 thanks to its mature software ecosystem — years of libraries, tutorials, example sketches and calibration guides, including the Embedded Nerd [MPU6050 Arduino Guide](https://embeddednerd.com/mpu6050-arduino-guide/).

All three alternatives here also work with Arduino and ESP32, but **don't assume an existing MPU6050 sketch will run unchanged on a new sensor.** Each alternative has different registers, initialization sequences, device IDs, scaling and interrupt configuration, so migration means a different library, not just a different sensor name in the same code.

- **BMA400 + ESP32:** particularly strong for deep-sleep, battery-powered IoT, wake-on-motion and activity-tracking designs — see the [BMA400 ESP32 Tutorial](https://embeddednerd.com/bma400-esp32-tutorial-wiring-code-arduino-guide/).
- **ICM-42670-P + ESP32:** a solid choice for new 6-axis projects needing both acceleration and gyroscope data, with I2C, SPI and I3C support.
- **ICM-42688-P + ESP32:** the better fit when low noise and high-performance motion sensing matter more than simplicity.

### I2C Addresses

The MPU6050 typically uses `0x68` (or `0x69` with AD0 high); the BMA400 uses `0x14` or `0x15`. That means an MPU6050 and BMA400 can potentially share the same I2C bus without an address conflict — though address compatibility is only one part of a successful integration; also check supply voltage, logic levels, pull-up resistors and library support. Use the [I2C Address Lookup & Compatibility Checker](https://embeddednerd.com/tools/i2c-address-lookup/) when planning a multi-sensor bus.

---

## What to Look for When Choosing a Replacement

- **Does it actually need a gyroscope?** This single question eliminates the BMA400 immediately if the answer is yes.
- **Interface support** — I2C only, or does the project need SPI or I3C as well?
- **Library and documentation quality** for your platform (Arduino IDE, ESP-IDF, PlatformIO).
- **Power budget** — battery-powered projects benefit enormously from the BMA400's low-power modes or the ICM-42670-P's low-noise current draw.
- **Manufacturer part status** — confirm "Active" from the datasheet or distributor listing, rather than assuming based on marketplace availability alone.
- **Breakout board quality**, not just the sensor IC — voltage regulation, pull-ups and physical footprint all vary between sellers.
- **Actual interchangeability** — package, pinout, registers, device ID and axis orientation all differ between these parts and the MPU6050. Budget for a redesign, not a footprint swap.

---

## Recommended Hardware

| Component | Recommended Product | Buy |
|---|---|---|
| MPU6050 Accelerometer & Gyroscope (legacy/prototyping) | [**MPU6050 Accelerometer & Gyroscope**](https://embeddednerd.com/products/mpu6050/) | [🛒 AliExpress](https://s.click.aliexpress.com/e/_c2uAjJYP) |
| BMA400 Accelerometer Module (low-power, accel-only) | [**BMA400 Accelerometer Module**](https://embeddednerd.com/products/bma400/) | [🛒 AliExpress](https://s.click.aliexpress.com/e/_c3RBiLUT) |
| ESP32 Development Board | [**ESP32 DevKit V1**](https://embeddednerd.com/products/esp32-devkit/) | [🛒 AliExpress](https://s.click.aliexpress.com/e/_c4n38hZ9) |

ICM-42670-P and ICM-42688-P breakout board recommendations will be added once verified product listings are available on Embedded Nerd.

**Transparency Notice**

Some links on this page are affiliate links. If you purchase through them, Embedded Nerd may earn a small commission at no additional cost to you. This helps support the website and allows us to continue creating free tutorials and guides. Thank you for your support!

---

## Related Embedded Nerd Tutorials

- [MPU6050 Arduino Guide](https://embeddednerd.com/mpu6050-arduino-guide/)
- [MPU6050 Calibration Guide: How to Calibrate Accelerometer & Gyroscope](https://embeddednerd.com/mpu6050-calibration-guide/)
- [BMA400 vs MPU6050: Which Motion Sensor Should You Buy?](https://embeddednerd.com/bma400-vs-mpu6050/)
- [BMA400 ESP32 Tutorial: Wiring, Code & Arduino Guide](https://embeddednerd.com/bma400-esp32-tutorial-wiring-code-arduino-guide/)
- [I2C Address Lookup & Compatibility Checker](https://embeddednerd.com/tools/i2c-address-lookup/)
- [Best Sensors for ESP32](https://embeddednerd.com/best-esp32-sensors/)

---

## Frequently Asked Questions

### Is the MPU6050 discontinued?

Yes. TDK InvenSense issued an official EOL notification (PCN-000614) on July 23, 2023, with a Last Time Buy of January 31, 2024 and a Last Time Ship of December 31, 2024.

### Is the MPU6050 obsolete?

Yes — distributors including DigiKey and Microchip USA list its product status as Obsolete, consistent with TDK's own discontinuation notice.

### When was the MPU6050 discontinued?

TDK InvenSense's EOL notification was dated July 23, 2023, with production ending after the December 31, 2024 Last Time Ship date.

### Can I still buy MPU6050 modules?

Yes. GY-521 breakout boards and MPU6050 modules remain widely available through distributors and marketplaces, built from remaining chip stock rather than newly manufactured silicon.

### Is GY-521 still worth buying?

For prototyping and learning, yes. For a product intended for manufacturing or long-term production, an actively produced alternative is the safer choice.

### What is the best MPU6050 replacement?

For most 6-axis (accelerometer + gyroscope) use cases, the **ICM-42670-P** is the most commonly recommended successor. For accelerometer-only, low-power projects, the **BMA400** is the stronger option.

### What is the best MPU6050 alternative for ESP32?

Both the BMA400 and ICM-42670-P work well with the ESP32 over I2C. Choose based on whether your project needs a gyroscope.

### Is BMA400 a replacement for MPU6050?

Only for projects that don't need a gyroscope. The BMA400 is accelerometer-only and cannot replace the MPU6050's rotational sensing.

### Does BMA400 have a gyroscope?

No. The BMA400 is a 3-axis accelerometer with no gyroscope.

### Is ICM-42670-P a replacement for MPU6050?

It's the part TDK names as its recommended alternate, but it is not pin-compatible or a guaranteed drop-in replacement — expect to rewire and use a different library.

### Is MPU6050 still good for Arduino?

For learning and prototyping, yes — it remains well documented with a large library ecosystem. For new production designs, an actively produced alternative is recommended.

### Should I use MPU6050 in a new project?

For prototyping, it's a reasonable and inexpensive choice. For a product intended for long-term manufacturing, start with an actively produced sensor such as the ICM-42670-P or BMA400 instead.

---

## Conclusion

The MPU6050 is genuinely discontinued — confirmed directly by TDK InvenSense's own EOL notification, not just by marketplace impressions. But discontinued doesn't mean gone: GY-521 modules built from remaining stock are still on sale, existing projects will keep working, and for pure prototyping the MPU6050 remains a fine, well-documented choice.

What the EOL status does mean is that any new design meant to last should be built around an actively produced part. Need both an accelerometer and a gyroscope? The **ICM-42670-P** is the closest thing to a modern successor. Only need an accelerometer and care about power? The **BMA400** is the better fit. Need lower noise or higher precision than either provides? The **ICM-42688-P** is worth the extra complexity.

Whichever direction you take, match the sensor to what your project actually needs — not to whichever chip has the longest spec sheet.
