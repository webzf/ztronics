---
author: Embedded Nerd
description: An engineering deep dive into Harald Kreuzer's ESP32-P4
  Weather Station, covering its multi-MCU architecture, MIPI-DSI
  display, ESP-NOW, LoRa, I2C protocol, LVGL and OTA design.
slug: esp32-p4-weather-station
title: "ESP32-P4 Weather Station: How MIPI-DSI, LoRa, ESP-NOW and LVGL
  Work Together"
---

# ESP32-P4 Weather Station: How MIPI-DSI, LoRa, ESP-NOW and LVGL Work Together

*An engineering deep dive into Harald Kreuzer's ESP32-P4 Weather Station
& Environmental Monitor.*

![Harald Kreuzer's ESP32-P4 Weather Station & Environmental
Monitor](https://github.com/user-attachments/assets/f58d5611-99e7-4674-8ca6-b77585577fb7)

*Photo: Harald Kreuzer --- used with permission. Source: [project
repository](https://github.com/HarryVienna/ESP32-Weather-Station-and-Air-Quality-Monitor).*

> **Editorial note:** This article is an engineering analysis of Harald
> Kreuzer's project, not a replacement for the original build guide.
> Hardware details and behavior described as "current" refer to the
> project state observed during preparation of this article.

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

------------------------------------------------------------------------

## Architecture at a Glance

  -----------------------------------------------------------------------
  Component               Primary responsibility  Main interfaces
  ----------------------- ----------------------- -----------------------
  **ESP32-P4**            Application processor,  MIPI-DSI, I²C, SDIO
                          graphics, system        
                          management              

  **ESP32-C6**            Wi-Fi connectivity      ESP-Hosted-MCU / SDIO

  **ESP32-S3**            Sensor/radio receiver   ESP-NOW, LoRa, I²C

  **Sensor nodes**        Measurement and         ESP-NOW or LoRa
                          transmission            

  **10.1-inch display**   Main user interface     MIPI-DSI

  **Touch controller**    Capacitive touch input  I²C

  **SEN66**               Indoor environmental    I²C
                          monitoring              

  **BH1750**              Ambient-light           I²C
                          measurement             

  **C4001**               Presence detection      I²C

  **LVGL**                GUI                     Runs on P4
  -----------------------------------------------------------------------

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

``` text
                         ┌──────────────────────┐
                         │      GitHub          │
                         │      Releases        │
                         └──────────┬───────────┘
                                    │
                                    │ Wi-Fi
                                    ▼
┌─────────────────────────────────────────────────────────┐
│                       ESP32-P4                           │
│                                                         │
│  Application │ LVGL │ Weather │ OTA │ Sensor handling │
│                                                         │
└──────────────┬────────────────────────┬─────────────────┘
               │                        │
             MIPI-DSI                 I²C
               │                        │
               ▼                        ▼
        ┌───────────────┐       ┌────────────────┐
        │ 10.1" Display │       │ ESP32-S3       │
        │ + Touch       │       │ Radio Receiver │
        └───────────────┘       └───────┬────────┘
                                        │
                              ┌─────────┴─────────┐
                              │                   │
                           ESP-NOW              LoRa
                              │                   │
                              └─────────┬─────────┘
                                        │
                               Wireless sensors
```

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

``` text
┌──────────────────────────────┐
│ Packet Header                │
│ 4 bytes                      │
├──────────────────────────────┤
│ Sensor-specific Payload      │
│ up to 64 bytes               │
├──────────────────────────────┤
│ Receiver Link Metadata       │
│ RSSI / SNR / timestamp       │
└──────────────────────────────┘
```

The key design decision is that the receiver **does not interpret the
sensor payload**.

It transports it.

The P4 interprets it.

This means a new sensor type can be transported by the receiver without
requiring the receiver firmware to understand the new measurement
structure.

------------------------------------------------------------------------

## 6. Why the Receiver Buffers Packets

The receiver acts as a boundary between two different worlds.

On one side:

``` text
ESP-NOW / LoRa
```

On the other:

``` text
I²C / ESP32-P4
```

These systems do not operate at the same timing.

A radio packet can arrive whenever a sensor wakes up.

The P4, however, reads the receiver periodically.

The receiver therefore needs buffering.

The current design stores packets per sensor slot and lets the P4
retrieve them later.

This means the radio subsystem does not have to wait for the application
processor.

``` text
Sensor
   │
   ▼
Radio packet
   │
   ▼
ESP32-S3 receiver
   │
   ├── validate
   ├── add metadata
   └── buffer
          │
          │ later
          ▼
       I²C read
          │
          ▼
       ESP32-P4
```

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

  Register   Function
  ---------- ------------------------
  `0x00`     Packet count
  `0x01`     Read packet
  `0x10`     Set time
  `0x11`     Set timezone
  `0x12`     Wi-Fi SSID
  `0x13`     Wi-Fi password
  `0x14`     Start OTA
  `0x23`     Reset drop counter
  `0x24`     Received statistics
  `0x28`     Overwritten statistics

This is essentially a small custom peripheral protocol.

The P4 does not need to know how the receiver works internally.

It just reads and writes registers.

------------------------------------------------------------------------

## 9. The Interesting I²C Detail: ISR → Queue → Task

The I²C slave interface does not simply process everything synchronously
inside an interrupt.

The architecture is effectively:

``` text
I²C transaction
      │
      ▼
   ISR/callback
      │
      ▼
 FreeRTOS queue
      │
      ▼
 Processing task
      │
      ▼
 Prepare response
```

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

``` text
WRITE
  ↓
STOP
  ↓
~50 ms delay
  ↓
READ
```

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

The touch controller communicates through I²C.

The software rotates the display into the desired landscape orientation.

The project therefore combines two very different display-related
interfaces:

``` text
P4
 │
 ├── MIPI-DSI → Display pixels
 │
 └── I²C → Touch controller
```

MIPI-DSI is responsible for moving large amounts of pixel data.

I²C is appropriate for relatively small control/input transactions.

This is a good example of choosing an interface around the workload
rather than trying to standardize everything onto one bus.

> **Embedded Nerd related guide:** [ESP32 Touchscreen Displays: Complete
> Guide to Choosing and Using a
> Touchscreen](/esp32-touchscreen-displays-guide/)

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
-   presence detection through the C4001 mmWave sensor;
-   automatic display dimming;
-   a temperature correction approach for the SEN66.

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

``` text
Display brightness
       ↓
Heat generation
       ↓
Sensor temperature
       ↓
Measurement accuracy
```

The display is therefore not merely a UI component.

It becomes part of the sensing environment.

------------------------------------------------------------------------

## 13. LVGL as the UI Layer

The graphical interface uses **LVGL 9.5**, with the layout designed
using **EEZ Studio**. The project uses ESP-IDF 6.x.

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

``` text
Open-Meteo ───────┐
OpenWeatherMap ──┼──> Internal weather model ──> LVGL
Visual Crossing ─┘
```

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

``` text
Wake
 ↓
Initialize hardware
 ↓
Measure
 ↓
Build packet
 ↓
Transmit
 ↓
Deep sleep
```

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

``` text
                 GitHub Release
                       │
                       ▼
                  ESP32-P4
                       │
              ┌────────┴────────┐
              │                 │
           Update P4         Update S3
                                │
                              I²C
                                │
                                ▼
                         Receiver firmware
```

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
individual components.

Think about the runtime data flow.

``` text
        ┌───────────────────────┐
        │ Battery Sensor Node   │
        │                       │
        │ Measure → Packet      │
        │ → Sleep               │
        └───────────┬───────────┘
                    │
              ESP-NOW / LoRa
                    │
                    ▼
        ┌───────────────────────┐
        │ ESP32-S3 Receiver     │
        │                       │
        │ Receive               │
        │ Validate              │
        │ Timestamp             │
        │ Add RSSI/SNR          │
        │ Buffer                │
        └───────────┬───────────┘
                    │
                   I²C
                    │
             periodic polling
                    │
                    ▼
        ┌───────────────────────┐
        │ ESP32-P4              │
        │                       │
        │ Parse                 │
        │ Process               │
        │ Store                 │
        │ Render                │
        └───────┬────────┬──────┘
                │        │
          MIPI-DSI       │ Wi-Fi
                │        │
                ▼        ▼
            Display    ESP32-C6
                         │
                         ├── Weather APIs
                         └── OTA
```

This diagram reveals the key idea:

**No processor needs to do everything.**

Each processor owns a particular responsibility.

------------------------------------------------------------------------

## 24. What This Project Teaches Us About ESP32-P4

The ESP32-P4 is sometimes discussed simply as a more powerful ESP32.

This project shows a more interesting interpretation.

The P4 can act as the **application processor of an embedded system**.

That changes how it should be evaluated.

The relevant question is not:

> "How many peripherals does the P4 have compared with another ESP32?"

Instead:

> "Which part of my system is actually limiting the architecture?"

For this project, that bottleneck was the combination of:

-   a large display;
-   graphics performance;
-   MIPI-DSI;
-   application complexity.

Once the P4 solved that problem, the lack of integrated wireless became
a manageable architectural decision rather than a showstopper.

------------------------------------------------------------------------

## 25. The Bigger Picture

There is a broader lesson hidden inside this weather station.

Modern embedded systems are increasingly becoming collections of
specialized processors.

One processor handles graphics.

Another handles wireless connectivity.

Another handles real-time sensor acquisition.

Another might handle motor control.

Communication buses then become the boundaries between those
responsibilities.

That is exactly what is happening here.

The ESP32-P4 is not replacing every other MCU.

It is becoming one processor inside a larger embedded system.

And that is probably the most valuable lesson from Harald's project:

> **Good embedded architecture is not about minimizing the number of
> chips. It is about minimizing unnecessary coupling between
> responsibilities.**

The weather station demonstrates this at several levels:

-   P4 ↔ C6 for Wi-Fi;
-   P4 ↔ S3 for wireless sensors;
-   S3 ↔ sensors through ESP-NOW/LoRa;
-   P4 ↔ display through MIPI-DSI;
-   P4 ↔ local sensors through I²C;
-   application ↔ weather providers through an abstraction layer;
-   sensor firmware ↔ receiver ↔ base station through a shared packet
    protocol;
-   P4 ↔ receiver firmware through an OTA control protocol.

The result is more hardware and more software than a simple weather
station.

But it is also a much more interesting architecture.

------------------------------------------------------------------------

# Final Thoughts

Harald Kreuzer's ESP32-P4 Weather Station is interesting not because it
puts a weather dashboard on a large touchscreen.

It is interesting because of **how the system is divided**.

The P4 handles the demanding application and graphics workload.

The C6 supplies Wi-Fi.

The S3 handles ESP-NOW and LoRa.

The receiver buffers and timestamps wireless packets.

I²C provides a deliberately simple boundary between the application
processor and radio subsystem.

MIPI-DSI handles the display workload.

LVGL provides the graphical abstraction.

And OTA extends the architecture beyond runtime operation into the
entire firmware lifecycle.

Even the thermal problem illustrates the same principle: a display is
not isolated from the sensors around it, so UI behavior becomes part of
measurement accuracy.

That is what makes this project valuable as an engineering case study.

It demonstrates that once a project grows beyond a single sensor and a
single MCU, **architecture becomes more important than individual
components**.

And the ESP32-P4 fits particularly well into that kind of
architecture---not necessarily as the only processor, but as the
processor responsible for the part of the system where application
complexity and graphics performance matter most.

------------------------------------------------------------------------

# Frequently Asked Questions

## Why does this weather station use three ESP32 chips?

The ESP32-P4 handles the main application and graphics, the ESP32-C6
provides Wi-Fi connectivity, and the ESP32-S3 handles ESP-NOW and LoRa
reception.

## Why not use only an ESP32-S3?

Harald's move to the P4 was driven largely by the requirements of the
10.1-inch display and its MIPI-DSI interface. Earlier S3-based designs
had encountered display flickering and shifted-pixel issues with the
previous approach.

## What is ESP-NOW used for?

ESP-NOW is used for low-power communication with wireless sensor nodes.

## Why is LoRa included?

LoRa provides an alternative long-range radio path. The receiver
abstracts the radio source from the application processor.

## Does the ESP32-P4 have Wi-Fi?

No. In this design the ESP32-C6 provides Wi-Fi connectivity for the P4
through Espressif's ESP-Hosted-MCU mechanism.

## How does the P4 communicate with the ESP32-S3?

Through a custom register-based I²C interface. The current
implementation uses the P4 as master and the S3 at address `0x38`.

## Why does the P4 wait before reading?

The receiver needs time to process the preceding I²C request and prepare
its response. The current protocol uses a roughly 50 ms interval between
the write and subsequent read.

## How are sensor packets structured?

They use a compact common header followed by a sensor-specific payload.
The receiver adds link metadata such as RSSI, SNR and timestamp.

## How long can the battery-powered sensors run?

Harald reports average-current figures that correspond to theoretical
multi-year runtimes for the stated 2000 mAh battery. Actual field
lifetime will depend on battery and operating conditions.

## Does the weather station support OTA updates?

Yes. The current project uses GitHub Releases for firmware distribution
and supports updating both the base station and receiver, with rollback
protection.

## What makes this project particularly interesting?

The architecture. It demonstrates how several specialized embedded
processors can cooperate through well-defined interfaces instead of
forcing one MCU to handle every responsibility.

------------------------------------------------------------------------

# Photo Credits and Sources

**Project and photography:** Harald Kreuzer\
**Photography used in this article:** used with permission.

The main project photograph is hosted in the project's GitHub README and
is attributed to Harald's project.

**Original build guide:**\
https://www.haraldkreuzer.net/en/news/build-guide-esp32-weather-station-and-environmental-monitor

**Source code:**\
https://github.com/HarryVienna/ESP32-Weather-Station-and-Air-Quality-Monitor

**Embedded Nerd related article:**\
`/esp32-touchscreen-displays-guide/`

> **Image note:** This draft currently embeds the project photograph
> that is directly available from the public GitHub project README. When
> Harald supplies the original high-resolution photographs, replace the
> image URLs in this Markdown without changing the article structure or
> captions.

------------------------------------------------------------------------

# Suggested Image Plan

1.  **Hero image:** complete ESP32-P4 Weather Station --- currently
    embedded above.
2.  **Hardware/base-station photograph:** replace/add when Harald
    provides the original high-resolution image.
3.  **Wireless sensor photograph:** replace/add when Harald provides the
    original image.
4.  **Display/UI photograph:** replace/add when Harald provides the
    original image.

For every Harald photograph, use the caption:

> *Photo: Harald Kreuzer --- used with permission.*
