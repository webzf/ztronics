---
title: "ESP32-P4 Weather Station: How MIPI-DSI, LoRa, ESP-NOW and LVGL Work Together"
excerpt: "An engineering deep dive into Harald Kreuzer's ESP32-P4 Weather Station, exploring its multi-MCU architecture, MIPI-DSI display, ESP-NOW, LoRa, I2C protocol, LVGL interface and OTA design."
layout: single
permalink: /esp32-p4-weather-station/
show_date: false
read_time: false
last_modified_at: false
toc: true
toc_label: "Contents"
toc_sticky: true
toc_levels: 2
header:
  teaser: https://github.com/user-attachments/assets/f58d5611-99e7-4674-8ca6-b77585577fb7
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: https://github.com/user-attachments/assets/f58d5611-99e7-4674-8ca6-b77585577fb7
  og_image: https://github.com/user-attachments/assets/f58d5611-99e7-4674-8ca6-b77585577fb7
categories:
  - ESP32
  - Embedded Systems
  - IoT
internal_link_keywords:
  - "ESP32-P4 weather station"
  - "ESP32-P4"
  - "ESP32 weather station"
  - "ESP32 touchscreen"
  - "ESP-NOW"
  - "LoRa"
  - "LVGL"
  - "MIPI-DSI"
tags:
  - ESP32-P4
  - ESP32-C6
  - ESP32-S3
  - ESP-NOW
  - LoRa
  - MIPI-DSI
  - LVGL
  - I2C
  - ESP-IDF
  - Weather Station
  - Environmental Monitoring
  - IoT
  - Embedded Systems
sidebar:
  nav: "embedded"
related: true
share: true
---

## ESP32-P4 Weather Station: How MIPI-DSI, LoRa, ESP-NOW and LVGL Work Together

*An engineering deep dive into Harald Kreuzer's ESP32-P4 Weather Station & Environmental Monitor.*

This article is an engineering case study of [Harald Kreuzer's ESP32-P4 Weather Station & Environmental Monitor](https://www.haraldkreuzer.net/en/news/build-guide-esp32-weather-station-and-environmental-monitor), based on his original project and build guide. Harald has kindly granted permission to use project photography. The photographs currently used are from Harald’s published project article and can be opened at higher resolution.

<div class="en-photo-crop"><img src="https://www.haraldkreuzer.net/download_file/view_inline/783138de-b8e7-4e34-8119-e1a50f606875" alt="Harald Kreuzer's ESP32-P4 Weather Station & Environmental Monitor"></div>

*Photo: Harald Kreuzer — used with permission. [Read Harald’s original project article](https://www.haraldkreuzer.net/en/news/build-guide-esp32-weather-station-and-environmental-monitor).*

> **Editorial note:** This article is an engineering analysis of Harald Kreuzer's project, not a replacement for the original build guide. For the complete step-by-step build instructions, wiring, component details and latest project state, see [Harald Kreuzer's original build guide](https://www.haraldkreuzer.net/en/news/build-guide-esp32-weather-station-and-environmental-monitor). Hardware details and behavior described as "current" refer to the project state observed during preparation of this article.

## Introduction

At first glance, Harald Kreuzer's latest ESP32 weather station looks
like a particularly elaborate touchscreen weather display.

It has a 10.1-inch screen, environmental sensors, weather forecasts,
wireless sensor nodes and a 3D-printed enclosure.

But that description misses what makes the project technically
interesting.

The Weather Station 3.0 is effectively a **small distributed embedded
system** built around three different ESP32-class microcontrollers,
several communication layers and multiple independent firmware
components.

At its center is an **ESP32-P4**, chosen primarily because the project
had outgrown the display capabilities of earlier ESP32-S3 designs.

An **ESP32-C6** provides Wi-Fi connectivity to the P4.

A separate **ESP32-S3** handles ESP-NOW and LoRa reception.

The P4 communicates with that receiver over I²C, drives the display over
MIPI-DSI, runs the LVGL interface and manages the main application.

Meanwhile, battery-powered sensor nodes wake up, measure their
environment, transmit a compact packet and return to deep sleep.

That architecture creates a much more interesting engineering case study
than a conventional "ESP32 weather station."

The real question is not *how do you read a temperature sensor?*

It is:

> **How do you divide a complex embedded system into processors,
> communication interfaces and software responsibilities so that each
> part solves the problem it is actually good at solving?**

That is what we will examine here.

### The Project Evolved Before the ESP32-P4

The current Weather Station 3.0 is the result of several hardware and
software iterations. Harald's earlier ESP32 weather-station generations
already established the combination of a dedicated display, environmental
sensors and low-power wireless sensor nodes. The move to the P4 represents
an architectural response to the requirements of the larger display and
the resulting communication split.

![Earlier generation of Harald Kreuzer's ESP32 Weather Station](https://www.haraldkreuzer.net/application/files/7316/9125/1012/ESP32-Weather-Station-DSC_8226.jpg)

*Photo: Harald Kreuzer — earlier-generation Weather Station, shown as
historical context for the evolution toward Weather Station 3.0. Source:
Harald Kreuzer's website.*

<style>
.en-diagram{margin:1.75rem 0;padding:1.1rem;border:1px solid rgba(127,127,127,.28);border-radius:12px;background:rgba(127,127,127,.045);overflow:hidden}
.en-diagram-title{font-size:.78rem;font-weight:700;letter-spacing:.06em;text-transform:uppercase;opacity:.7;margin:0 0 .9rem}
.en-diagram-subtitle{font-size:.8rem;opacity:.68;margin:-.45rem 0 .9rem}
.en-diagram-node{padding:.8rem 1rem;border:1px solid rgba(127,127,127,.38);border-radius:10px;background:rgba(127,127,127,.08);text-align:center}
.en-diagram-node strong{display:block;font-size:.95rem}
.en-diagram-node span{display:block;margin-top:.25rem;font-size:.78rem;opacity:.72}
.en-diagram-arrow{font-weight:700;opacity:.65;font-size:1.05rem;text-align:center;line-height:1}
.en-diagram-stack{display:flex;flex-direction:column;align-items:stretch;gap:.55rem;max-width:520px;margin-inline:auto}
.en-diagram-pipeline{display:grid;grid-template-columns:minmax(0,1fr) auto minmax(0,1fr) auto minmax(0,1fr);align-items:center;gap:.55rem;max-width:900px;margin-inline:auto}
.en-diagram-pipeline .en-diagram-node{min-width:0}
.en-diagram-branches{display:grid;grid-template-columns:repeat(2,minmax(130px,1fr));gap:.7rem;width:100%;max-width:620px;margin-inline:auto}
.en-diagram-branches.three{grid-template-columns:repeat(3,minmax(100px,1fr));max-width:720px}
.en-diagram-lane{display:grid;grid-template-columns:minmax(0,1fr) auto minmax(0,1fr);align-items:center;gap:.7rem;max-width:760px;margin:.35rem auto}
.en-diagram-boundary{margin:.9rem 0;padding:.8rem;border-top:1px dashed rgba(127,127,127,.38);border-bottom:1px dashed rgba(127,127,127,.38);text-align:center;font-size:.75rem;letter-spacing:.05em;text-transform:uppercase;opacity:.68}
.en-diagram-note{font-size:.78rem;opacity:.7;text-align:center;margin-top:.7rem}
.en-photo-crop{margin:1.5rem 0;overflow:hidden;border-radius:12px}.en-photo-crop img{display:block;width:100%;height:auto;aspect-ratio:2/1;object-fit:cover;object-position:center}
@media(max-width:700px){
  .en-diagram{padding:.8rem}
  .en-diagram-pipeline,.en-diagram-lane{grid-template-columns:1fr;gap:.4rem}
  .en-diagram-pipeline .en-diagram-arrow,.en-diagram-lane .en-diagram-arrow{transform:rotate(90deg)}
  .en-diagram-branches,.en-diagram-branches.three{grid-template-columns:1fr}
}
</style>
------------------------------------------------------------------------

## Architecture at a Glance

| Component | Primary responsibility | Main interfaces |
|---|---|---|
| **ESP32-P4** | Application processor, graphics, system management | MIPI-DSI, I²C, SDIO |
| **ESP32-C6** | Wi-Fi connectivity | ESP-Hosted-MCU / SDIO |
| **ESP32-S3** | Sensor/radio receiver | ESP-NOW, LoRa, I²C |
| **Sensor nodes** | Measurement and transmission | ESP-NOW or LoRa |
| **10.1-inch display** | Main user interface | MIPI-DSI |
| **Touch controller** | Capacitive touch input | I²C |
| **SEN66** | Indoor environmental monitoring | I²C |
| **BH1750** | Ambient-light measurement | I²C |
| **C4001** | Presence detection | I²C |
| **LVGL** | GUI | Runs on P4 |

Harald describes the P4 as the central component of the station, with
the C6 providing Wi-Fi and a separate S3-based receiver handling ESP-NOW
and LoRa.

------------------------------------------------------------------------

## 1. This Is More Than an ESP32 Weather Station

The first interesting design decision happened before any software was
written.

The project needed a substantially larger display.

Harald chose a 10.1-inch Waveshare panel with a native resolution of
**800 × 1280 pixels** and a two-lane MIPI-DSI interface.

This immediately changed the hardware architecture.

Earlier versions based on the ESP32-S3 had encountered display
flickering and shifted-pixel problems with the chosen display approach.
Harald's explanation is that the ESP32-P4 provides both the MIPI-DSI
interface and the processing capability required for this display.

This is an important embedded-systems lesson:

> **The display requirement became the hardware-selection requirement.**

The P4 was not selected simply because it was newer or faster.

It was selected because the system's most demanding peripheral had
changed.

And once the P4 became the application processor, another problem
appeared.

The ESP32-P4 does not provide integrated Wi-Fi.

That led directly to the second processor.

------------------------------------------------------------------------

## 2. Why the ESP32-P4 Works for This Weather Station

The P4 is particularly interesting for embedded UI applications because
it is designed around application processing rather than being an
all-in-one wireless MCU.

In this project, that distinction is useful.

The P4 can concentrate on:

-   graphics;
-   LVGL;
-   display management;
-   sensor processing;
-   application logic;
-   weather data;
-   configuration;
-   OTA coordination.

The wireless subsystem can be moved elsewhere.

This is almost the opposite of the common ESP32 architecture where one
MCU handles:

> application + Wi-Fi + Bluetooth + sensors + display.

Here the design says:

> **Let the application processor concentrate on the application.**

That makes the system more complex physically, but it also establishes
much clearer boundaries.

------------------------------------------------------------------------

## 3. Why Three ESP32-Class MCUs?

This is probably the most interesting architectural decision in the
entire project.

The station contains:

### ESP32-P4

The main application and graphics processor.

### ESP32-C6

The Wi-Fi coprocessor.

### ESP32-S3

The dedicated wireless sensor receiver.

At first this can look excessive.

Why not put everything on one ESP32?

Because the three processors are solving three different problems.

The P4 needs high-speed display connectivity.

The C6 supplies Wi-Fi.

The S3 needs direct access to ESP-NOW while also supporting the LoRa
radio used by the receiver hardware.

Harald specifically notes that ESP-NOW is not supported through
`esp-hosted-mcu`, which is why a dedicated receiver is used.

The resulting architecture looks roughly like this:

<div class="en-diagram en-diagram-wide" role="img" aria-label="System architecture"><div class="en-diagram-title">Who does what?</div><div class="en-diagram-subtitle">The P4 runs the application; the other processors handle specialized I/O.</div><div class="en-diagram-node"><strong>ESP32-P4</strong><span>Application • LVGL • system management</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-branches three"><div class="en-diagram-node"><strong>10.1″ display</strong><span>MIPI-DSI • touch</span></div><div class="en-diagram-node"><strong>ESP32-S3</strong><span>ESP-NOW • LoRa receiver</span></div><div class="en-diagram-node"><strong>ESP32-C6</strong><span>Wi-Fi via SDIO</span></div></div></div>

Meanwhile, the ESP32-C6 sits beside the P4 and provides Wi-Fi through
Espressif's ESP-Hosted-MCU mechanism.

The important design principle is therefore:

> **Multiple MCUs can reduce coupling even when they increase hardware
> complexity.**

------------------------------------------------------------------------

## 4. ESP-NOW + LoRa

The wireless sensor architecture is deliberately abstracted.

Sensor nodes can communicate through:

-   **ESP-NOW**
-   **LoRa**

The receiver understands both.

The P4 does not need to care.

That separation is excellent architecture.

From the application's perspective, the question becomes:

> "Did I receive a valid sensor packet?"

rather than:

> "Was this packet transmitted through ESP-NOW or LoRa?"

Harald also notes that LoRa is not necessary for his apartment use case,
where ESP-NOW would be sufficient. Its presence instead gives the
project a longer-range communication option.

LoRa is therefore not necessarily present because the application
requires LoRa.

It is there because the architecture supports a wider class of
deployments.

------------------------------------------------------------------------

## 5. The Packet Protocol

One of the strongest parts of the design is the shared packet format.

The sensor firmware, receiver and base station share a common
`packet_format.h` definition.

The packet begins with a compact four-byte header:

``` c
typedef struct __attribute__((packed)) {
    uint8_t msg_type;
    uint8_t sensor_nr;
    uint8_t sensor_type;
    uint8_t payload_len;
} packet_header_t;
```

The fields answer four basic questions:

1.  What type of message is this?
2.  Which sensor is it?
3.  What type of sensor generated it?
4.  How many payload bytes follow?

The actual measurement data then follows in a sensor-specific payload.

The receiver subsequently adds link-related metadata such as:

-   RSSI;
-   SNR;
-   receiver timestamp.

The result is a useful separation:

<div class="en-diagram en-diagram-wide" role="img" aria-label="Sensor packet lifecycle"><div class="en-diagram-title">What happens to a sensor packet?</div><div class="en-diagram-pipeline"><div class="en-diagram-node"><strong>Header</strong><span>4 bytes</span></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>Sensor payload</strong><span>up to 64 bytes</span></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>Receiver metadata</strong><span>RSSI • SNR • timestamp</span></div></div><div class="en-diagram-note">The receiver adds link metadata without needing to understand the sensor payload.</div></div>

The key design decision is that the receiver **does not interpret the
sensor payload**.

It transports it.

The P4 interprets it.

This means a new sensor type can be transported by the receiver without
requiring the receiver firmware to understand the new measurement
structure.

------------------------------------------------------------------------

## 6. Why the Receiver Buffers Packets

The receiver acts as a gateway between two systems with very different timing.

A radio packet can arrive whenever a sensor wakes up. The P4, however, reads the receiver periodically.

<div class="en-diagram en-diagram-wide" role="img" aria-label="Receiver gateway between wireless sensors and the application"><div class="en-diagram-title">The receiver is the gateway</div><div class="en-diagram-pipeline"><div class="en-diagram-node"><strong>Sensor nodes</strong><span>Measurement</span></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>ESP32-S3</strong><span>Receive • validate • buffer</span></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>ESP32-P4</strong><span>Process • display</span></div></div><div class="en-diagram-boundary">Wireless network → local application bus</div><div class="en-diagram-note">ESP-NOW / LoRa arrive asynchronously; the P4 retrieves buffered data over I²C.</div></div>

The receiver therefore needs buffering.

The current design stores packets per sensor slot and lets the P4
retrieve them later.

This means the radio subsystem does not have to wait for the application
processor.

<div class="en-diagram en-diagram-wide" role="img" aria-label="Sensor data flow"><div class="en-diagram-title">From measurement to the UI</div><div class="en-diagram-stack"><div class="en-diagram-node"><strong>1. Sensor measures</strong><span>Temperature, humidity, air quality, etc.</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>2. Radio transmits</strong><span>ESP-NOW or LoRa</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>3. S3 receives and buffers</strong><span>Validates packet and adds link metadata</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>4. P4 polls over I²C</strong><span>Retrieves the buffered packet when ready</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>5. Application updates</strong><span>Process data and refresh the LVGL UI</span></div></div></div>

That decoupling is one of the strongest architectural aspects of the
system.

------------------------------------------------------------------------

## 7. The Timestamp Is More Important Than It Looks

There is another subtle detail in the receiver architecture.

The timestamp associated with a sensor packet belongs to the
**receiver**, not to the moment when the P4 happens to process the
packet.

That matters for offline detection.

The receiver records the interval between packets for each sensor.

The current implementation considers a sensor offline when the gap
exceeds approximately three times its learned normal interval.

This is much more robust than simply asking:

> "When did the P4 last display a value?"

The P4 might be busy rendering graphics, communicating with Wi-Fi or
performing another task.

None of those activities should change whether the sensor itself is
considered online.

This is a good example of putting state ownership in the subsystem that
actually understands it.

------------------------------------------------------------------------

## 8. The I²C Link Between the P4 and S3

The receiver appears to the P4 as an I²C peripheral.

In the current implementation:

-   P4 = I²C master
-   S3 = I²C slave
-   address = `0x38`
-   bus speed = **50 kHz**

The interface is register-based.

Important registers include:

| Register | Function |
|---|---|
| `0x00` | Packet count |
| `0x01` | Read packet |
| `0x10` | Set time |
| `0x11` | Set timezone |
| `0x12` | Wi-Fi SSID |
| `0x13` | Wi-Fi password |
| `0x14` | Start OTA |
| `0x23` | Reset drop counter |
| `0x24` | Received statistics |
| `0x28` | Overwritten statistics |

This is essentially a small custom peripheral protocol.

The P4 does not need to know how the receiver works internally.

It just reads and writes registers.

For readers debugging their own I²C hardware, the [Embedded Nerd I²C Scanner Tutorial](/i2c-scanner-tutorial/) is useful for checking whether devices respond on the bus. The [I²C Address Lookup Tool](/tools/i2c-address-lookup/) can also help identify common device addresses.

------------------------------------------------------------------------

## 9. The Interesting I²C Detail: ISR → Queue → Task

The I²C slave interface does not simply process everything synchronously
inside an interrupt.

The architecture is effectively:

<div class="en-diagram en-diagram-wide" role="img" aria-label="I2C request handling"><div class="en-diagram-title">I²C request handling</div><div class="en-diagram-stack"><div class="en-diagram-node"><strong>I²C transaction</strong><span>Hardware event</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>ISR / callback</strong><span>Capture quickly</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>FreeRTOS queue</strong><span>Defer processing</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>Processing task</strong><span>Prepare the response</span></div></div><div class="en-diagram-note">Fast interrupt context on the left; normal task context on the right.</div></div>

That matters because interrupt handlers should remain lightweight.

The ISR detects the transaction and hands the work to the task.

The task can then perform the more substantial processing without
keeping interrupt context occupied.

This is a classic embedded-systems pattern:

> **Interrupts capture events; tasks perform the work.**

------------------------------------------------------------------------

## 10. Why the P4 Waits Before Reading

The current ESP-IDF I²C slave implementation does not provide the
clock-stretching behavior this protocol would otherwise rely on.

The receiver therefore needs time to prepare its response after the P4's
preceding write.

The P4 performs:

<div class="en-diagram en-diagram-wide" role="img" aria-label="I2C request response timing"><div class="en-diagram-title">Why is there a delay?</div><div class="en-diagram-pipeline"><div class="en-diagram-node"><strong>1. WRITE</strong><span>P4 requests data</span></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>2. STOP</strong><span>Transaction ends</span></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>3. ~50 ms</strong><span>S3 task prepares response</span></div></div><div class="en-diagram-arrow" aria-hidden="true" style="margin:.55rem 0">↓</div><div class="en-diagram-node" style="max-width:260px;margin:auto"><strong>4. READ</strong><span>P4 retrieves the prepared response</span></div><div class="en-diagram-note">The pause gives the receiver's task time to prepare data because the slave driver does not provide clock stretching.</div></div>

rather than attempting an immediate repeated-start read.

The receiver's task gets the request through the queue and prepares the
response during that interval.

The approximately 50 ms delay is therefore not arbitrary.

It is part of the software protocol created around the characteristics
of the I²C slave implementation.

This is a good reminder that:

> **A communication protocol is defined by timing as well as bytes.**

------------------------------------------------------------------------

## 11. The 10.1-Inch Touchscreen

The display is one of the reasons the whole architecture exists.

The panel used in the current design is a **10.1-inch IPS display with
800 × 1280 native resolution**, connected through a two-lane MIPI-DSI
interface.

For a broader look at the hardware decisions involved in ESP32 touchscreen projects, see the [ESP32 Touchscreen Displays guide](/esp32-touchscreen-displays-guide/). When the display requirements are not yet fixed, the [ESP32 Touchscreen Selector](/tools/esp32-touchscreen-selector/) can help narrow down compatible hardware.

The touch controller communicates through I²C.

The software rotates the display into the desired landscape orientation.

The project therefore combines two very different display-related
interfaces:

<div class="en-diagram en-diagram-wide" role="img" aria-label="Display and touch interfaces"><div class="en-diagram-title">Two interfaces, two jobs</div><div class="en-diagram-node"><strong>ESP32-P4</strong><span>Application processor</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-branches"><div class="en-diagram-node"><strong>MIPI-DSI</strong><span>High-bandwidth display pixels</span></div><div class="en-diagram-node"><strong>I²C</strong><span>Low-bandwidth touch input</span></div></div></div>

MIPI-DSI is responsible for moving large amounts of pixel data.

I²C is appropriate for relatively small control/input transactions.

This is a good example of choosing an interface around the workload
rather than trying to standardize everything onto one bus.

------------------------------------------------------------------------

## 12. Display Heat Becomes a Sensor Problem

Large displays introduce another engineering issue that is easy to
overlook:

**heat.**

The SEN66 is being used to measure environmental conditions.

But the display, P4 and other electronics are inside the same enclosure.

That means the electronics can influence the very measurement the system
is trying to make.

Harald addresses this with a combination of:

-   ambient-light sensing through the BH1750;

![BH1750 ambient light sensor module](https://www.haraldkreuzer.net/download_file/view_inline/99c67edc-6590-4053-a3b9-c8f2ce996212)

*BH1750 ambient-light sensor module used for display brightness control. Photo: Harald Kreuzer — used with permission.*
-   presence detection through the C4001 mmWave sensor;
-   automatic display dimming;
-   a temperature correction approach for the SEN66.

![SHT45 temperature and humidity sensor used in the thermal test](https://www.haraldkreuzer.net/download_file/view_inline/6b85f5da-4acb-4174-b8d6-366262a145c4)

*SHT45 sensor used in Harald Kreuzer's thermal comparison test. Photo: Harald Kreuzer — used with permission.*

When nobody is present, the display can be dimmed significantly.

When somebody approaches, normal brightness can be restored.

This simultaneously improves the user experience and reduces unnecessary
display heating.

Harald also performed a test with SHT45 sensors positioned beside the
weather station. Under his stated test conditions, he reported a **1.4
°C difference**, which he attributed mainly to heat from the P4 and S3
electronics.

That number should be interpreted correctly:

**it is Harald's reported test result, not an independent Embedded Nerd
measurement.**

The more interesting engineering lesson is the feedback loop:

<div class="en-diagram en-diagram-wide" role="img" aria-label="Display thermal feedback loop"><div class="en-diagram-title">A display can affect the measurement</div><div class="en-diagram-pipeline"><div class="en-diagram-node"><strong>Higher brightness</strong></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>More heat</strong></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>Warmer sensor environment</strong></div></div><div class="en-diagram-arrow" aria-hidden="true" style="margin:.55rem 0">↓</div><div class="en-diagram-node" style="max-width:360px;margin:auto"><strong>Potential measurement error</strong><span>Brightness and presence control can reduce unnecessary heat.</span></div></div>

The display is therefore not merely a UI component.

It becomes part of the sensing environment.

------------------------------------------------------------------------

## 13. LVGL as the UI Layer

The graphical interface uses **LVGL 9.5**, with the layout designed
using **EEZ Studio**. The project uses ESP-IDF 6.x.

![ESP32-P4 Weather Station setup screen](https://www.haraldkreuzer.net/download_file/view_inline/0a7a05dc-5268-4547-bb6d-c011a779fd5c)

*ESP32-P4 Weather Station setup screen. Screenshot: Harald Kreuzer — used with permission.*

The interface is intentionally focused rather than menu-heavy.

There are two primary screens:

1.  Setup
2.  Weather station

The main screen combines:

-   current weather;
-   hourly forecasts;
-   daily forecasts;
-   air-quality measurements;
-   wireless sensors;
-   charts;
-   sensor status;
-   signal information.

The larger display allows up to six sensor slots to be represented
simultaneously in the current implementation.

The important architectural point is that LVGL sits above the hardware
abstraction.

It does not need to know whether a temperature value arrived from:

-   a BME280;
-   an SHT45;
-   ESP-NOW;
-   LoRa;
-   the local SEN66.

The application layer converts those sources into information the UI can
display.

------------------------------------------------------------------------

## 14. EEZ Studio Reveals a Different Kind of Constraint

EEZ Studio also exposes an interesting software-engineering trade-off.

The current layout system generates widgets into static structures.

That means the sensor widget type for a slot is not completely free to
change dynamically at runtime.

Harald explicitly identifies this as a limitation of the current
workflow.

The result is an interesting distinction:

> **The communication architecture is highly extensible, while the UI
> architecture has a more static constraint.**

A new sensor can pass through the receiver without modifying the
receiver.

But displaying that sensor may still require changes to:

-   the base-station rendering code;
-   the sensor-slot configuration;
-   the EEZ Studio layout.

This is a good example of how extensibility is never a property of "the
system" as a whole.

Different layers can have different extension costs.

------------------------------------------------------------------------

## 15. Weather APIs Are Also Abstracted

The current implementation supports:

-   Open-Meteo
-   OpenWeatherMap
-   Visual Crossing

The UI does not need to fundamentally change when the provider changes.

Instead, provider-specific data is mapped into the application's
internal representation.

<div class="en-diagram en-diagram-wide" role="img" aria-label="Weather provider abstraction"><div class="en-diagram-title">External APIs stop at the boundary</div><div class="en-diagram-branches three"><div class="en-diagram-node"><strong>Open-Meteo</strong><span>Provider API</span></div><div class="en-diagram-node"><strong>OpenWeatherMap</strong><span>Provider API</span></div><div class="en-diagram-node"><strong>Visual Crossing</strong><span>Provider API</span></div></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node" style="max-width:360px;margin:auto"><strong>Internal weather model</strong><span>Provider-neutral application data</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node" style="max-width:240px;margin:auto"><strong>LVGL</strong><span>UI layer</span></div></div>

Again, the architectural lesson is bigger than the weather station.

> **External interfaces should be translated at the boundary instead of
> leaking provider-specific details throughout the application.**

------------------------------------------------------------------------

## 16. Battery-Powered Sensor Nodes

The remote sensors follow a very different design philosophy from the
base station.

The base station is performance-oriented.

The sensor nodes are energy-oriented.

A typical sensor node performs roughly:

<div class="en-diagram en-diagram-wide" role="img" aria-label="Battery sensor node lifecycle"><div class="en-diagram-title">The sensor node spends most of its life asleep</div><div class="en-diagram-pipeline"><div class="en-diagram-node"><strong>Wake</strong></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>Measure</strong></div><div class="en-diagram-arrow" aria-hidden="true">→</div><div class="en-diagram-node"><strong>Transmit</strong></div></div><div class="en-diagram-arrow" aria-hidden="true" style="margin:.55rem 0">↓</div><div class="en-diagram-node" style="max-width:260px;margin:auto"><strong>Deep sleep</strong><span>Wait for the next measurement interval</span></div></div>

This is exactly what a battery-powered embedded node should be doing.

The processor does not need to remain awake waiting for something that
may not happen for several minutes.

The current project contains different radio/sensor combinations,
including BME280/ESP-NOW and SHT45/LoRa configurations.

The system also supports other sensor types, including a
Geiger-counter-based node.

------------------------------------------------------------------------

## 17. Four to Five Years of Battery Life --- With an Important Qualification

Harald reports average currents of approximately:

-   **51 µA** for an ESP-NOW/BME280 configuration
-   **41.93 µA** for a LoRa/SHT45 configuration

Using a 2000 mAh battery, these figures correspond to theoretical
runtimes of roughly:

-   **4.5 years**
-   **5.5 years**

respectively.

These should not be presented as measured four- or five-year field
lifetimes.

They are calculations based on the reported average consumption.

Real battery life depends on factors such as:

-   battery self-discharge;
-   temperature;
-   cell quality;
-   regulator losses;
-   radio conditions;
-   transmission frequency;
-   battery aging;
-   deep-sleep behavior;
-   solar charging where used.

The engineering point is nevertheless clear:

> **The dominant power-saving technique is not a tiny optimization in
> the sensor driver. It is turning the entire node off between
> measurements.**

------------------------------------------------------------------------

## 18. OTA Without a USB Cable

OTA is another feature that changes the architecture.

Harald's current system checks GitHub Releases periodically for firmware
updates. The release process builds firmware for both the base station
and receiver.

The OTA architecture can be understood as:

<div class="en-diagram en-diagram-wide" role="img" aria-label="OTA update architecture"><div class="en-diagram-title">OTA update architecture</div><div class="en-diagram-stack"><div class="en-diagram-node"><strong>GitHub Release</strong><span>New firmware</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>ESP32-P4</strong><span>Wi-Fi through ESP32-C6 • update coordinator</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>I²C control link</strong><span>Credentials and OTA command</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>ESP32-S3 receiver</strong><span>Temporarily connects to Wi-Fi and updates</span></div></div></div>

The important detail is that the receiver itself is not the component
doing the complete cloud-facing update process.

The P4 has Wi-Fi connectivity through the C6.

It therefore becomes the system's update coordinator.

------------------------------------------------------------------------

## 19. Updating the Receiver Through the P4

Updating the receiver is particularly interesting because the S3 does
not need to independently maintain the same network infrastructure as
the P4.

The P4 can provide the receiver with the Wi-Fi credentials through the
I²C control interface.

The receiver can then:

1.  pause normal ESP-NOW operation;
2.  connect to Wi-Fi;
3.  download the new firmware;
4.  write the OTA image;
5.  reboot;
6.  resume normal operation if the update fails.

This creates a temporary role reversal.

The receiver normally exists to transport sensor data toward the P4.

During OTA, the P4 temporarily uses the same communication link to
control the receiver's lifecycle.

That is an excellent example of why the register protocol was useful
beyond simple sensor data transfer.

------------------------------------------------------------------------

## 20. What Happens If an Update Fails?

A remotely updated embedded device needs to assume that updates can
fail.

Power can disappear.

A download can be interrupted.

An image can be invalid.

A reboot can happen at the wrong time.

The current project uses ESP-IDF OTA mechanisms with rollback
protection.

Harald describes the system as automatically switching back to the
previous firmware if an update does not work.

That changes OTA from:

> "download a new binary"

into:

> **"manage two versions of a running embedded system safely."**

This distinction matters enormously in real products.

------------------------------------------------------------------------

## 21. The Engineering Challenges

Several challenges stand out in this project.

### I²C stability

The P4/S3 interface is not simply a standard sensor connection.

It is a custom command/response protocol implemented over I²C.

That introduces timing considerations, buffering and synchronization.

### Display integration

The jump to a 10.1-inch panel drove the move to the P4 and MIPI-DSI.

The display was therefore an architectural constraint rather than just
another peripheral.

### Thermal behavior

The electronics influence the environmental sensor.

That means mechanical design, display brightness and sensor accuracy are
interconnected.

### Mechanical design

The enclosure has to hold a large display, electronics, sensors and
receiver while remaining practical to print and assemble.

### Firmware lifecycle

With multiple processors, an update is no longer necessarily one binary.

The firmware architecture has to understand which processor is being
updated and in what order.

These are exactly the kinds of problems that distinguish a serious
embedded system from a simple sensor demo.

------------------------------------------------------------------------

## 22. What Would We Change?

This project is also useful because its trade-offs are visible.

### Three MCUs

A single-MCU design would be simpler from a hardware perspective.

The three-MCU architecture, however, separates graphics, Wi-Fi and
sensor/radio reception into distinct responsibilities.

The trade-off is therefore **simplicity versus separation of concerns**.

### LoRa

For an apartment, ESP-NOW may be sufficient.

LoRa becomes more useful when the sensor network extends beyond the
normal range expected for ESP-NOW.

The architecture supports both without forcing the application layer to
care about the transport.

### I²C

I²C is reasonable for a local board-to-board control/data interface.

But once it becomes a custom protocol rather than a simple sensor bus,
timing and state management become important.

### Static UI structures

The current EEZ Studio workflow makes some dynamic sensor-widget
scenarios less convenient.

The communication layer is more flexible than the UI-generation layer.

That is a useful limitation to identify rather than hide.

------------------------------------------------------------------------

## 23. The Runtime Architecture Is the Real Story

The most useful way to understand this project is to stop thinking about
it as a weather station with a large display.

It is a distributed embedded system in which each processor has a
specific role:

<div class="en-diagram en-diagram-wide" role="img" aria-label="Runtime architecture"><div class="en-diagram-title">The runtime architecture</div><div class="en-diagram-stack"><div class="en-diagram-node"><strong>Sensor nodes</strong><span>Measure • transmit • sleep</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>ESP32-S3</strong><span>Receive • validate • timestamp • buffer</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>ESP32-P4</strong><span>Process • render • coordinate</span></div><div class="en-diagram-arrow" aria-hidden="true">↓</div><div class="en-diagram-node"><strong>User interface</strong><span>MIPI-DSI display • touch • LVGL</span></div></div></div>

The C6 adds Wi-Fi without making the P4 responsible for implementing the
wireless stack itself.

The S3 isolates the timing-sensitive radio reception from the application
processor.

The P4 then operates at a higher level, consuming already-buffered sensor
data and turning it into an application experience.

That separation is the central engineering idea behind the project.

### Related ESP32-P4 Hardware

If you are evaluating the **ESP32-P4** for a touchscreen HMI rather than this exact weather-station hardware, the [Waveshare ESP32-P4-WIFI6-Touch-LCD-7B](/products/waveshare-esp32-p4-wifi6-touch-lcd-7b/) is a relevant 7-inch platform to compare. It combines the P4 with a 1024×600 capacitive display, MIPI-DSI, 32 MB PSRAM and an ESP32-C6 wireless subsystem.

This is a related platform, not the hardware used in Harald Kreuzer's Weather Station, which uses a different 10.1-inch MIPI-DSI display.

### The broader embedded-systems lessons

Several lessons from the Weather Station 3.0 apply well beyond weather
monitoring:

- **Choose the processor around the system bottleneck.** Here, the large
  MIPI-DSI display helped drive the move to the P4.
- **Separate responsibilities when timing or interfaces differ.** The
  radio receiver does not have to run at the same pace as the UI.
- **Abstract transport details at the boundary.** The P4 can consume
  sensor packets without caring whether they arrived over ESP-NOW or
  LoRa.
- **Treat communication protocols as both data and timing.** The custom
  I²C interface depends on transaction sequencing as well as register
  definitions.
- **Design for maintenance, not just first boot.** OTA support affects
  firmware boundaries, control interfaces and failure handling.
- **Remember the physical system.** A display that produces heat can
  influence an environmental sensor inside the same enclosure.

The project is therefore interesting not because it uses three ESP32
chips, a 10.1-inch display or two wireless technologies individually.

It is interesting because those pieces have been turned into a set of
clearly separated subsystems with explicit communication boundaries.

That is the real engineering story.
