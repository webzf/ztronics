---
layout: product

title: "KY-023 Analog Joystick Module: Pinout & Specifications"

product_id: ky-023-joystick

category: Modules

manufacturer: Generic

image: /assets/images/products/ky-023-joystick.webp

header:
  teaser: /assets/images/products/ky-023-joystick.webp

og_image: /assets/images/products/ky-023-joystick.webp

excerpt: "KY-023 Analog Joystick Module with dual-axis analog control and an integrated push button. Includes pinout, specifications and compatibility information for Arduino, ESP32 and Raspberry Pi projects."

description: "Complete KY-023 Analog Joystick Module reference with pinout, specifications, dual-axis analog outputs, integrated push button and compatibility information for Arduino, ESP32 and other microcontroller platforms."

categories:
  - Sensors

tags:
  - KY-023
  - Analog Joystick
  - Joystick Module
  - Arduino
  - ESP32
  - Raspberry Pi
  - Analog Sensor
  - Input Device

permalink: /products/ky-023-analog-joystick/

last_modified_at: 2026-09-02

specifications:

  - name: Operating Voltage
    value: 3.3V – 5V

  - name: Interface
    value: Analog + Digital

  - name: X-axis Output
    value: Analog

  - name: Y-axis Output
    value: Analog

  - name: Button Output
    value: Digital (Active Low)

  - name: Axes
    value: X and Y

  - name: Push Button
    value: Integrated

  - name: Mounting
    value: Breadboard Friendly

  - name: Operating Temperature
    value: -10°C to +70°C

  - name: Dimensions
    value: Approx. 34 × 26 mm

links:

  - title: Arduino Analog Read
    icon: fas fa-book
    description: Official Arduino Reference
    url: https://www.arduino.cc/reference/en/language/functions/analog-io/analogread/

related:
  - esp32-devkit
  - solderless-breadboard
  - jumper-wires
  - ssd1306-oled
---

The **KY-023 Analog Joystick Module** is a compact two-axis analog input device designed for embedded systems, Arduino projects and microcontroller applications. It combines two potentiometers for measuring movement along the X and Y axes with an integrated push button for an additional digital input.

The KY-023 joystick module provides a simple **analog interface** for directional control and does not require a dedicated communication protocol or software library. Its X and Y outputs can be connected to analog inputs, while the push button provides a digital switch output.

The module is commonly used with **Arduino, ESP32, Raspberry Pi-based projects and other microcontroller platforms** for robotics, game controllers, menu navigation, servo control, remote controllers and human-machine interfaces.

If you're using the **[ESP32 DevKit V1](/products/esp32-devkit/)**, our **[ESP32 Joystick Tutorial – Read an Analog Joystick (KY-023) with Arduino IDE](/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-(KY-023)-with-Arduino-IDE/)** provides a complete practical example covering wiring, analog readings and button input.

---

## KY-023 Key Features

- Two-axis analog joystick
- X-axis and Y-axis analog outputs
- Integrated push button
- Digital switch output
- Compatible with 3.3V and 5V systems
- Breadboard-friendly design
- No dedicated library required
- Simple analog interface
- Compact module
- Suitable for Arduino and ESP32 projects
- Suitable for robotics and embedded user interfaces

---

## KY-023 Pinout

The **KY-023 Analog Joystick Module** has five main connections:

| Pin | Function | Signal |
|---|---|---|
| **GND** | Ground | Power |
| **VCC** | Supply voltage | Power |
| **VRx** | X-axis position | Analog |
| **VRy** | Y-axis position | Analog |
| **SW** | Joystick push button | Digital |

The **VRx** and **VRy** pins provide analog signals corresponding to the joystick's horizontal and vertical position.

The **SW** pin is the output of the integrated push button. When the joystick is pressed, the switch connects the signal to ground, making it suitable for use with a digital input configured with a pull-up resistor.

---

## How the KY-023 Analog Joystick Works

The KY-023 contains two potentiometers positioned at approximately 90 degrees to each other.

One potentiometer measures movement along the **X axis**, while the other measures movement along the **Y axis**. Moving the joystick changes the resistance of these potentiometers and therefore changes the voltage presented at the corresponding analog output.

The integrated push button is activated when the joystick is pressed downward.

This gives the KY-023 three independent user inputs:

- **X-axis** — horizontal position
- **Y-axis** — vertical position
- **SW** — push-button input

Because the joystick uses standard analog and digital signals, it can be connected directly to compatible microcontroller inputs without requiring a dedicated communication protocol.

---

## KY-023 Specifications

| Specification | Value |
|---|---|
| Module | KY-023 Analog Joystick |
| Axes | X and Y |
| X-axis output | Analog |
| Y-axis output | Analog |
| Push button | Integrated |
| Button output | Digital, active low |
| Interface | Analog + Digital |
| Operating voltage | 3.3V – 5V |
| Mounting | Breadboard friendly |
| Dimensions | Approx. 34 × 26 mm |
| Operating temperature | -10°C to +70°C |

Actual electrical characteristics can vary between manufacturers and KY-023 module versions, so the specifications supplied with a particular module should be checked when exact limits are important.

---

## Typical KY-023 Analog Values

The KY-023 produces analog values that correspond to the position of the joystick.

Typical behavior is:

- **Left** → low X-axis reading
- **Right** → high X-axis reading
- **Down** → low Y-axis reading
- **Up** → high Y-axis reading
- **Center** → approximately half of the ADC range

The exact values depend on the microcontroller's ADC resolution and the individual joystick module.

For example, an ESP32 using a 12-bit ADC can produce values from approximately **0 to 4095**, with the joystick center typically near **2048**.

The center position is not guaranteed to be exactly half of the ADC range. Mechanical tolerances and the potentiometers inside the joystick can cause the resting value to vary.

For this reason, applications that require accurate control may benefit from **calibration and a dead zone around the center position**.

---

## KY-023 Compatibility

The KY-023 can be used with many popular development platforms, including:

- Arduino Uno
- Arduino Nano
- Arduino Mega
- **[ESP32 DevKit V1](/products/esp32-devkit/)**
- ESP8266
- Raspberry Pi with an external ADC
- STM32 development boards
- Other microcontrollers with compatible analog inputs

The analog outputs must be connected to ADC-capable inputs when using a microcontroller to measure the joystick position.

When using the KY-023 with a 3.3V microcontroller, make sure the voltage applied to the microcontroller's input pins remains within the limits of that device.

---

## Using the KY-023 with Arduino

An Arduino board with analog inputs can read the **VRx** and **VRy** outputs directly.

The push button can be connected to a digital input and configured with a pull-up resistor.

The Arduino's `analogRead()` function can then be used to measure the joystick position.

For practical wiring, code examples and joystick input handling, see our **[ESP32 Joystick Tutorial – Read an Analog Joystick (KY-023) with Arduino IDE](/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-(KY-023)-with-Arduino-IDE/)**.

---

## Using the KY-023 with ESP32

The KY-023 works well with the ESP32 because the module provides simple analog outputs that can be connected to ESP32 ADC inputs.

A typical ESP32 application can use:

- One ADC input for **VRx**
- One ADC input for **VRy**
- One digital GPIO for **SW**

The ESP32's higher-resolution ADC can provide more detailed position readings than the 10-bit ADC commonly found on classic Arduino boards.

When connecting the module to an ESP32, pay particular attention to the voltage supplied to the module and the voltage presented to the ESP32 input pins.

For a complete ESP32 implementation, including wiring, code, calibration and dead-zone handling, see the **[ESP32 Joystick Tutorial – Read an Analog Joystick (KY-023) with Arduino IDE](/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-(KY-023)-with-Arduino-IDE/)**.

---

## Common KY-023 Applications

The KY-023 Analog Joystick Module is suitable for a wide range of embedded projects, including:

- Robot control
- RC vehicles
- Game controllers
- OLED menu navigation
- Camera pan and tilt systems
- Servo motor control
- Bluetooth remote controllers
- Wi-Fi robot controllers
- Human-machine interfaces (HMI)
- Home automation interfaces
- Interactive displays
- Educational electronics projects
- Embedded gaming
- DIY electronics

The combination of two analog axes and a push button makes the KY-023 particularly useful when a project needs directional control together with a simple selection or confirmation input.

---

## Why Use the KY-023?

The KY-023 is popular because it provides several useful input functions in a small and inexpensive module.

Its main advantages include:

- Simple analog interface
- Two independent axes
- Integrated push button
- No dedicated communication protocol
- No additional library required
- Compatible with many microcontrollers
- Breadboard-friendly design
- Easy integration into robotics and interactive projects

It is particularly useful for prototypes and educational projects where a physical directional input is required.

---

## KY-023 Calibration and Dead Zone

The joystick's center position can vary slightly between individual modules. For example, an analog input may not return exactly the middle of the ADC range when the joystick is physically centered.

A **dead zone** can be used to prevent small fluctuations around the center from being interpreted as intentional movement.

Calibration can also be used to record the actual center position of the joystick and compensate for mechanical differences between modules.

These techniques are especially useful for:

- Robot control
- Servo positioning
- Game controllers
- Pan-and-tilt systems
- Menu navigation

For a practical implementation of joystick calibration and dead-zone handling, see our **[ESP32 Joystick Tutorial – Read an Analog Joystick (KY-023) with Arduino IDE](/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-(KY-023)-with-Arduino-IDE/)**.

---

## Project Ideas

The KY-023 Analog Joystick Module can be used in many embedded and IoT projects, including:

- Wi-Fi robot controllers
- OLED menu systems
- Snake games
- Servo positioning
- Camera pan and tilt systems
- Bluetooth remote controllers
- Home automation interfaces
- Interactive dashboards
- Educational robotics
- Embedded gaming projects

For a complete example combining a joystick with an OLED display and MPU6050, see our **[ESP32 Snake Game with MPU6050 and OLED Display](/ESP32-Snake-Game-with-MPU6050-and-OLED-Display/)** project.

---

## Documentation

The KY-023 does not require a dedicated software library.

The joystick position is read using standard analog input functions, while the integrated push button is read as a normal digital input.

For Arduino projects, the standard **[Arduino Analog Read Reference](https://www.arduino.cc/reference/en/language/functions/analog-io/analogread/)** explains how analog input readings are obtained.

For ESP32 projects, the joystick can be connected to appropriate ADC-capable GPIO pins.

If you're building an interactive ESP32 project using multiple components, our **[I2C Scanner Tutorial](/i2c-scanner-tutorial/)** can help when troubleshooting I2C devices such as OLED displays and MPU6050 sensors.

---

## Related Products

The KY-023 Analog Joystick Module is frequently used together with:

- **[ESP32 DevKit V1](/products/esp32-devkit/)**
- **[Solderless Breadboard](/products/solderless-breadboard/)**
- **[Jumper Wires](/products/jumper-wires/)**
- **[SSD1306 OLED Display](/products/ssd1306-oled/)**

These components provide a convenient starting point for prototyping interactive embedded systems, robotics projects and user interfaces.

---

## Related Tutorials

To get the most from your KY-023 Analog Joystick Module, see:

- **[ESP32 Joystick Tutorial – Read an Analog Joystick (KY-023) with Arduino IDE](/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-(KY-023)-with-Arduino-IDE/)**
- **[ESP32 OLED Tutorial – Wiring, Code & Display Guide](/ESP32-OLED-Tutorial-Wiring-Code-&-Display-Guide/)**
- **[I2C Scanner Tutorial](/i2c-scanner-tutorial/)**
- **[MPU6050 Arduino Guide](/mpu6050-arduino-guide/)**
- **[ESP32 Snake Game with MPU6050 and OLED Display](/ESP32-Snake-Game-with-MPU6050-and-OLED-Display/)**

These tutorials cover practical microcontroller projects involving analog inputs, displays, sensors and interactive interfaces.

---

## Frequently Asked Questions

### What is the KY-023?

The KY-023 is a dual-axis analog joystick module with X-axis and Y-axis analog outputs and an integrated push button.

### Is the KY-023 analog or digital?

The KY-023 provides **two analog outputs** for the X and Y axes and **one digital output** for the integrated push button.

### What are the KY-023 pins?

The five main pins are **GND, VCC, VRx, VRy and SW**. VRx and VRy provide the analog joystick position, while SW provides the push-button signal.

### What is the KY-023 used for?

The KY-023 can be used for robot control, game controllers, menu navigation, servo control, pan-and-tilt systems, remote controllers and other projects requiring physical directional input.

### Can the KY-023 be used with Arduino?

Yes. The KY-023 can be connected to Arduino boards with suitable analog and digital input pins.

### Can the KY-023 be used with an ESP32?

Yes. The KY-023 can be used with the **[ESP32 DevKit V1](/products/esp32-devkit/)** by connecting its analog outputs to suitable ESP32 ADC inputs and its push button to a digital GPIO.

### Does the KY-023 require a library?

No. The module uses standard analog and digital signals, so a dedicated KY-023 library is not required.

### What voltage does the KY-023 use?

The module is commonly used with **3.3V to 5V** supply systems. Always verify the specifications of the particular KY-023 module being used.

### Why isn't the joystick center exactly 2048 on an ESP32?

The center position depends on the mechanical position of the joystick and the potentiometers inside the module. Individual modules can produce different center readings, so calibration may be required for precise applications.

### Can the KY-023 control servo motors?

Yes. The X and Y analog outputs can be converted into servo positions, making the KY-023 useful for pan-and-tilt systems, robotics and other control applications.

### Can the KY-023 be used with a Raspberry Pi?

Yes, but Raspberry Pi boards generally do not have built-in analog inputs. An external ADC is therefore required to read the VRx and VRy analog outputs.

### Can the KY-023 be used for game controllers?

Yes. The two analog axes can provide directional or movement input, while the integrated push button can be used as an additional control.

---

## Summary

The **KY-023 Analog Joystick Module** is a simple and versatile input device combining two analog axes with an integrated push button. Its straightforward interface makes it easy to use with Arduino, ESP32 and other microcontroller platforms.

For the module's **pinout, specifications and basic characteristics**, this page provides a technical reference. For practical implementation, including wiring, Arduino IDE code, calibration and dead-zone handling, see our **[ESP32 Joystick Tutorial – Read an Analog Joystick (KY-023) with Arduino IDE](/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-(KY-023)-with-Arduino-IDE/)**.
