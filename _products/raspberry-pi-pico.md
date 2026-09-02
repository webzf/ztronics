---
layout: product

title: "Raspberry Pi Pico"

product_id: raspberry-pi-pico

category: Raspberry Pi

manufacturer: Raspberry Pi

image: /assets/images/products/raspberry-pi-pico.webp

header:
  teaser: /assets/images/products/raspberry-pi-pico.webp

og_image: /assets/images/products/raspberry-pi-pico.webp

excerpt: "Raspberry Pi Pico is a compact RP2040 microcontroller board with 26 GPIO pins, USB connectivity and flexible interfaces for embedded and electronics projects."

description: "Raspberry Pi Pico is a compact microcontroller development board based on the RP2040. With dual-core processing, 264 KB SRAM, 2 MB flash, 26 GPIO pins, ADC, PWM, SPI, I2C, UART and programmable I/O, it is suitable for Arduino-style electronics, automation, robotics and embedded projects."

categories:
  - Raspberry Pi

tags:
  - Raspberry Pi Pico
  - Pico
  - RP2040
  - Microcontroller
  - GPIO
  - Arduino
  - Embedded Projects
  - Electronics

permalink: /products/raspberry-pi-pico/

last_modified_at: 2026-09-02

specifications:
  - name: "Microcontroller"
    value: "Raspberry Pi RP2040"
  - name: "CPU"
    value: "Dual-core Arm Cortex-M0+"
  - name: "Maximum clock speed"
    value: "133 MHz"
  - name: "SRAM"
    value: "264 KB"
  - name: "Flash memory"
    value: "2 MB QSPI"
  - name: "GPIO"
    value: "26 multifunction GPIO"
  - name: "ADC"
    value: "3 × 12-bit ADC inputs"
  - name: "PWM"
    value: "16 channels"
  - name: "SPI"
    value: "2"
  - name: "I2C"
    value: "2"
  - name: "UART"
    value: "2"
  - name: "PIO"
    value: "8 state machines"
  - name: "USB"
    value: "USB 1.1 host and device"
  - name: "Input power"
    value: "1.8–5.5 V DC"
  - name: "Board dimensions"
    value: "21 × 51 mm"
  - name: "Programming"
    value: "MicroPython, C and C++"
  - name: "Wireless connectivity"
    value: "None"

links:
  - title: "Raspberry Pi Pico Documentation"
    icon: "fas fa-book"
    description: "Official Raspberry Pi documentation for the Pico microcontroller series."
    url: "https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html"
  - title: "Raspberry Pi Pico Datasheet"
    icon: "fas fa-file-pdf"
    description: "Official technical documentation and specifications for Raspberry Pi Pico."
    url: "https://datasheets.raspberrypi.com/pico/pico-datasheet.pdf"
  - title: "Raspberry Pi Pico SDK"
    icon: "fab fa-github"
    description: "Official Raspberry Pi Pico SDK for C and C++ development."
    url: "https://github.com/raspberrypi/pico-sdk"
  - title: "MicroPython for Raspberry Pi Pico"
    icon: "fas fa-code"
    description: "MicroPython firmware and documentation for Raspberry Pi Pico."
    url: "https://micropython.org/download/RPI_PICO/"

related:
  - raspberry-pi-pico-w
  - esp32-devkit
  - dht22
  - mpu6050
  - ssd1306-oled
---

## Introduction

The **Raspberry Pi Pico** is a compact and affordable microcontroller development board based on the Raspberry Pi **RP2040**.

Unlike Raspberry Pi single-board computers, the Pico is designed to run firmware directly rather than a general-purpose operating system such as Linux. This makes it particularly suitable for electronics projects where direct control of sensors, motors, displays and other hardware is more important than running a full operating system.

The original Raspberry Pi Pico provides **26 multifunction GPIO pins**, USB connectivity, analog inputs, PWM, SPI, I2C, UART and programmable I/O. It does not include wireless connectivity; the wireless version is the **Raspberry Pi Pico W**.

The Pico is suitable for beginners learning embedded programming as well as more advanced applications requiring precise hardware control.

## Key Features

- Raspberry Pi RP2040 microcontroller
- Dual-core Arm Cortex-M0+ processor
- Up to 133 MHz clock speed
- 264 KB SRAM
- 2 MB on-board QSPI flash
- 26 multifunction GPIO pins
- 3 × 12-bit ADC inputs
- 16 PWM channels
- 2 × SPI interfaces
- 2 × I2C interfaces
- 2 × UART interfaces
- 8 programmable PIO state machines
- USB 1.1 host and device support
- Low-power sleep and dormant modes
- On-chip temperature sensor
- SWD debugging interface
- Drag-and-drop USB programming
- MicroPython, C and C++ support
- Compact 21 × 51 mm form factor

The official Raspberry Pi documentation confirms these core specifications for the first-generation non-wireless Pico. citeturn0search0turn0search12

## Applications

Raspberry Pi Pico is suitable for applications such as:

- Embedded electronics
- Sensor projects
- Robotics
- Motor control
- Home automation
- Data logging
- LED control
- Display projects
- USB devices
- Custom controllers
- Educational electronics
- Prototyping
- Industrial control prototypes
- DIY instruments
- Maker projects

## GPIO and Pinout

The Raspberry Pi Pico exposes **26 multifunction GPIO pins** from the RP2040.

The GPIO pins can be configured for digital input and output and can also provide several peripheral functions.

| Interface | Available |
|---|---:|
| GPIO | 26 |
| ADC | 3 × 12-bit |
| PWM | 16 channels |
| SPI | 2 |
| I2C | 2 |
| UART | 2 |
| PIO | 8 state machines |

The three user-accessible ADC inputs are provided through GPIO26, GPIO27 and GPIO28. The RP2040 also contains an internal temperature sensor.

The Pico GPIO operates at **3.3 V**, so external devices must be electrically compatible with the board's logic levels. The official datasheet should be checked when connecting modules with different voltage requirements. citeturn0search13

## How It Works

The Raspberry Pi Pico stores firmware in its on-board flash memory.

When powered on, the RP2040 executes that firmware and can immediately begin controlling connected hardware.

This makes the Pico different from a Raspberry Pi computer. There is no Linux operating system that needs to boot before the application starts.

A typical embedded application can therefore follow a simple cycle:

1. Read sensors or inputs.
2. Process the data.
3. Control outputs.
4. Communicate with peripherals.
5. Repeat continuously.

This architecture is well suited to dedicated hardware projects.

## RP2040 Microcontroller

The **RP2040** is Raspberry Pi's first microcontroller chip.

It contains two Arm Cortex-M0+ processor cores and supports clock speeds up to 133 MHz.

The RP2040 includes:

- 264 KB SRAM
- Multiple SPI interfaces
- Multiple I2C interfaces
- Multiple UART interfaces
- 12-bit ADC
- PWM
- DMA
- Timers
- Temperature sensor
- Programmable I/O

The combination of conventional peripherals and programmable I/O makes the RP2040 unusually flexible for a low-cost microcontroller.

## Programmable I/O

One of the most distinctive features of the Raspberry Pi Pico is its **Programmable I/O (PIO)** system.

The RP2040 provides eight PIO state machines that can be programmed to implement custom digital interfaces and precise timing operations.

PIO can be useful for:

- Custom communication protocols
- Addressable LED control
- Parallel interfaces
- Precise digital signal generation
- Specialized peripherals
- Protocol emulation

Raspberry Pi specifically highlights PIO as a way to implement custom peripheral functionality, including interfaces such as SD card and VGA. citeturn0search0

## USB Connectivity

The Raspberry Pi Pico includes a **USB 1.1 controller and PHY** with both host and device support.

USB can be used for:

- Power
- Firmware programming
- Serial communication
- USB device projects
- Development and debugging

One of the easiest features for beginners is drag-and-drop firmware installation.

The Pico can enter USB mass-storage boot mode and appear as a drive on a computer. A compatible `.uf2` firmware file can then be copied to the board to program it. citeturn0search13

## Programming the Raspberry Pi Pico

The Pico can be programmed using **MicroPython, C or C++**.

### MicroPython

MicroPython is an accessible way to start developing embedded applications with the Pico.

It allows developers to write Python-style programs that interact directly with GPIO and peripherals.

MicroPython is particularly useful for:

- Beginners
- Prototyping
- Sensor projects
- Educational projects
- Quick experiments

### C and C++

The Raspberry Pi Pico SDK provides C and C++ development support.

This is useful when an application requires greater control over performance, memory or low-level hardware functionality.

The official Pico SDK also provides APIs for GPIO, ADC, SPI, I2C, PWM, PIO and other RP2040 peripherals.

## Raspberry Pi Pico vs Pico W

The Raspberry Pi Pico and Pico W use the same first-generation RP2040 platform and have the same core processing resources.

The major difference is wireless connectivity.

| Feature | Raspberry Pi Pico | Raspberry Pi Pico W |
|---|---|---|
| Microcontroller | RP2040 | RP2040 |
| CPU | Dual-core Cortex-M0+ | Dual-core Cortex-M0+ |
| Maximum clock | 133 MHz | 133 MHz |
| SRAM | 264 KB | 264 KB |
| Flash | 2 MB | 2 MB |
| GPIO | 26 | 26 |
| Wi-Fi | No | 2.4 GHz 802.11n |
| Bluetooth | No | Bluetooth 5.2 |
| SPI | 2 | 2 |
| I2C | 2 | 2 |
| UART | 2 | 2 |
| PIO | 8 state machines | 8 state machines |

If wireless connectivity is not required, the standard Pico can be a simpler and potentially more appropriate choice.

If a project needs Wi-Fi or Bluetooth, the **Raspberry Pi Pico W** is the more suitable version. Raspberry Pi's current documentation distinguishes the W variants by their wireless connectivity. citeturn0search0turn0search5

## Raspberry Pi Pico vs ESP32

The Raspberry Pi Pico and ESP32 are both popular microcontroller platforms, but they have different strengths.

| Feature | Raspberry Pi Pico | ESP32 |
|---|---|---|
| Main MCU | RP2040 | ESP32 family |
| CPU | Dual-core Cortex-M0+ | Depends on model |
| Maximum clock | 133 MHz | Depends on model |
| Wi-Fi | No | Usually available |
| Bluetooth | No | Depends on model |
| GPIO | 26 exposed | Depends on model |
| ADC | 3 × 12-bit | Depends on model |
| PIO | 8 state machines | No direct equivalent |
| USB | USB 1.1 | Depends on model |
| Programming | MicroPython, C, C++ | Arduino, ESP-IDF, MicroPython and others |

The Pico is a strong choice for projects focused on GPIO control, PIO, deterministic embedded behavior and the RP2040 ecosystem.

An ESP32 can be preferable when built-in wireless connectivity is required or when a specific ESP32 variant provides the peripherals needed by the project.

## Power

The Raspberry Pi Pico supports an input power range of **1.8–5.5 V DC** according to Raspberry Pi's product brief. citeturn0search12

The board provides regulated 3.3 V power for the RP2040 and compatible external circuitry.

When connecting sensors, displays or other modules, their individual voltage and current requirements must always be checked.

Particular care is required with GPIO signals because the Pico's GPIO operates at 3.3 V logic levels.

## Raspberry Pi Pico Projects

The Pico can be combined with many common electronics modules.

### Temperature and Humidity Monitor

Connect a **DHT22** to the Pico and display or log temperature and humidity measurements.

### MPU6050 Motion Sensor

The **MPU6050** can communicate with the Pico through I2C to provide accelerometer and gyroscope measurements.

This can be used for:

- Motion detection
- Orientation experiments
- Robotics
- Data logging
- Gesture detection

### OLED Display

An **SSD1306 OLED display** can be connected through I2C to create a compact local interface.

The display can show sensor readings, menus, status information and measurements.

### Motor Controller

The Pico's PWM outputs can be used to control compatible motor drivers and servos.

This makes the board useful for robotics and automation projects.

### Custom USB Controller

Because the Pico provides USB device functionality, it can be used to experiment with custom USB devices and controllers.

## Sensors and Modules

The Pico's GPIO and peripheral interfaces make it compatible with a wide variety of common electronics modules.

Examples include:

- DHT11 and DHT22 sensors
- MPU6050
- SSD1306 OLED displays
- HC-SR04 ultrasonic sensors
- PIR motion sensors
- Joystick modules
- RFID modules
- LEDs
- Buttons
- Relays
- Servo motors
- Motor drivers

The exact interface depends on the module. I2C, SPI, UART, PWM and digital GPIO can all be used depending on the application.

## Advantages of Raspberry Pi Pico

The Pico offers several practical advantages:

- Low-cost microcontroller platform
- Dual-core RP2040
- 264 KB SRAM
- 2 MB flash
- 26 exposed GPIO
- Three user ADC inputs
- Hardware SPI, I2C and UART
- 16 PWM channels
- Programmable I/O
- USB host and device support
- MicroPython support
- C and C++ support
- Small 21 × 51 mm board
- Large Raspberry Pi community
- Suitable for both learning and advanced embedded development

## Limitations

The Raspberry Pi Pico is a microcontroller board rather than a Linux computer.

It does not provide:

- A general-purpose Linux operating system
- HDMI output
- Built-in Wi-Fi
- Built-in Bluetooth
- The processing and memory resources of a Raspberry Pi single-board computer

If wireless connectivity is required, the **Pico W** is the natural alternative.

If a project requires a full operating system, graphical desktop applications or substantially more memory, a Raspberry Pi computer may be a better choice.

## Raspberry Pi Pico and Arduino

The Raspberry Pi Pico can be used for many of the same types of electronics projects traditionally built around Arduino boards.

Both platforms can control:

- Sensors
- LEDs
- Motors
- Displays
- Buttons
- Relays
- Communication modules

The Pico is particularly attractive when more flexible peripheral configuration, dual-core processing or RP2040 PIO functionality is useful.

It can also be programmed using environments and languages familiar to embedded developers, including C/C++ and MicroPython.

## Raspberry Pi Pico and Embedded Systems

The Pico is more than a beginner development board.

The RP2040 was designed to provide flexible hardware control in a low-cost microcontroller.

The combination of:

- Dual CPU cores
- DMA
- Multiple hardware peripherals
- Programmable I/O
- Low-power modes
- USB support

allows the Pico to be used in increasingly sophisticated embedded applications.

The castellated edges also allow the board to be soldered directly onto a custom carrier or product PCB, making the Pico useful beyond simple breadboard prototypes.

## Frequently Asked Questions

### What is Raspberry Pi Pico?

Raspberry Pi Pico is a compact microcontroller development board based on the RP2040. It provides 26 GPIO pins, USB connectivity, analog inputs and several hardware communication interfaces.

### Does Raspberry Pi Pico have Wi-Fi?

No. The standard Raspberry Pi Pico does not include wireless connectivity. The Raspberry Pi Pico W adds 2.4 GHz Wi-Fi and Bluetooth.

### Does Raspberry Pi Pico have Bluetooth?

No. Bluetooth is available on the Pico W, not on the standard first-generation Pico.

### What processor does Raspberry Pi Pico use?

The Pico uses the Raspberry Pi RP2040, a dual-core Arm Cortex-M0+ microcontroller running at up to 133 MHz.

### How much RAM does Raspberry Pi Pico have?

The RP2040 provides 264 KB of on-chip SRAM.

### How much flash does Raspberry Pi Pico have?

The Raspberry Pi Pico includes 2 MB of on-board QSPI flash memory.

### How many GPIO pins does Raspberry Pi Pico have?

The Pico exposes 26 multifunction GPIO pins.

### Can Raspberry Pi Pico run MicroPython?

Yes. MicroPython is officially supported and is widely used for Pico projects.

### Can Raspberry Pi Pico be programmed in C++?

Yes. The Raspberry Pi Pico SDK supports C and C++ development.

### Is Raspberry Pi Pico a computer?

No. It is a microcontroller board and does not run Linux like Raspberry Pi single-board computers.

### Can Raspberry Pi Pico connect to the Internet?

The standard Pico has no built-in wireless connectivity. Internet connectivity can be added using an external communication module, or the Pico W can be used instead.

### What is the difference between Pico and Pico W?

The main difference is wireless connectivity. Pico W adds Wi-Fi and Bluetooth while retaining the RP2040-based architecture.

### Is Raspberry Pi Pico good for beginners?

Yes. Its low cost, simple USB programming, MicroPython support and large ecosystem make it a good platform for learning embedded electronics.

### Can Raspberry Pi Pico be used with Arduino projects?

Yes. The Pico can be used for many Arduino-style projects involving sensors, displays, motors and other hardware. Development can be done using supported Arduino tooling as well as MicroPython, C and C++.

### What is PIO on Raspberry Pi Pico?

PIO, or Programmable I/O, is a hardware subsystem in the RP2040 containing programmable state machines that can implement custom digital interfaces and precise timing operations.

## Documentation

The official Raspberry Pi documentation provides the most reliable reference for Pico hardware, software and development.

The **Raspberry Pi Pico datasheet** contains detailed electrical, mechanical and hardware information, while the Pico SDK provides APIs and development resources for C and C++ applications.

For MicroPython projects, the official MicroPython firmware and documentation provide a convenient starting point.

When designing hardware around the Pico, always check the official documentation for GPIO electrical limits, power requirements and peripheral configuration.

## Related Products

The Raspberry Pi Pico can be combined with many components in the Embedded Nerd catalog.

- [Raspberry Pi Pico W](/products/raspberry-pi-pico-w/)
- [ESP32 DevKit V1](/products/esp32-devkit/)
- [DHT22 Temperature & Humidity Sensor](/products/dht22/)
- [MPU6050](/products/mpu6050/)
- [SSD1306 OLED Display](/products/ssd1306-oled/)

## Summary

The **Raspberry Pi Pico** is a compact RP2040-based microcontroller board designed for flexible embedded hardware development.

With a dual-core 133 MHz processor, 264 KB SRAM, 2 MB flash, 26 GPIO pins, ADC, PWM, SPI, I2C, UART, USB and programmable I/O, it provides a surprisingly capable platform for its size.

The standard Pico does not include Wi-Fi or Bluetooth, making it particularly suitable for projects where wireless connectivity is not required.

For wireless applications, the **Raspberry Pi Pico W** adds Wi-Fi and Bluetooth while retaining the core RP2040 platform.

The Pico's combination of low cost, flexible hardware, USB programming, MicroPython support and powerful PIO subsystem makes it a strong choice for both beginner electronics projects and more advanced embedded applications.
