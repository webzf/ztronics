---
layout: product

title: "KY-023 Analog Joystick Module"

product_id: ky-023-joystick

category: Modules

manufacturer: Generic

image: /assets/images/products/ky-023-joystick.webp

header:
  teaser: /assets/images/products/ky-023-joystick.webp

og_image: /assets/images/products/ky-023-joystick.webp

excerpt: "KY-023 Analog Joystick Module featuring dual-axis analog control and an integrated push button for Arduino, ESP32 and Raspberry Pi projects."

description: "KY-023 Analog Joystick Module with dual-axis analog outputs and integrated push button, compatible with Arduino, ESP32 and other microcontroller platforms."

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

last_modified_at: 2026-08-04

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


The **KY-023 Analog Joystick Module** is a compact two-axis input device designed for embedded systems and microcontroller projects. It combines two precision potentiometers to measure movement along the X and Y axes while also providing an integrated push button for additional user input.

Thanks to its simple interface and wide compatibility, the KY-023 is one of the most popular joystick modules for Arduino, ESP32 and other development boards. It is commonly used in robotics, game controllers, menu navigation, servo control and interactive user interfaces.

If you're getting started with the **[ESP32 DevKit V1](/products/esp32-devkit/)**, our **[ESP32 Joystick Tutorial – Read an Analog Joystick (KY-023) with Arduino IDE](/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-(KY-023)-with-Arduino-IDE/)** explains how to connect the module, read the analog values and detect button presses.

---

## Key Features

- Two-axis analog joystick
- Integrated push button
- Analog X-axis output
- Analog Y-axis output
- Digital switch output
- Compatible with 3.3V and 5V systems
- Breadboard-friendly design
- No additional libraries required
- Fast analog response
- Easy integration with Arduino and ESP32

---

## Applications

The KY-023 Analog Joystick Module is suitable for a wide variety of embedded projects, including:

- Robot control
- RC vehicles
- Game controllers
- OLED menu navigation
- Camera pan and tilt systems
- Servo motor control
- Educational electronics projects
- Human-machine interfaces (HMI)
- IoT devices
- Interactive displays
- Remote controllers
- DIY electronics

Its intuitive operation makes it an excellent choice for projects requiring precise directional input.

---

## Pinout

The module provides five connections:

- **GND** — Ground
- **VCC** — 3.3V to 5V power supply
- **VRx** — X-axis analog output
- **VRy** — Y-axis analog output
- **SW** — Digital push button output

The X and Y outputs connect directly to analog input pins, while the push button can be connected to any digital GPIO configured with an internal pull-up resistor.

---

## How It Works

Inside the joystick are two potentiometers mounted at 90 degrees to each other.

Moving the stick changes the resistance of each potentiometer independently, generating two analog voltages that represent the joystick position on the X and Y axes.

When the joystick is pressed downward, the integrated push button connects the **SW** pin to ground, producing a digital signal that can be detected by the microcontroller.

Because the module outputs standard analog voltages, it does not require any dedicated communication protocol or driver.

---

## Compatible Boards

The KY-023 works with most popular development platforms, including:

- Arduino Uno
- Arduino Nano
- Arduino Mega
- **[ESP32 DevKit V1](/products/esp32-devkit/)**
- ESP8266
- Raspberry Pi (with an external ADC)
- STM32 development boards

Its support for both 3.3V and 5V systems makes it highly versatile across different platforms.

---

## Typical Analog Values

The joystick produces analog values proportional to its position.

Typical readings are:

- Left → Minimum value
- Right → Maximum value
- Down → Minimum value
- Up → Maximum value
- Center → Approximately half of the ADC range

On an ESP32 using the default 12-bit ADC, the center position is typically around **2048**.

---

## Why Choose the KY-023 Analog Joystick?

The KY-023 has become one of the most widely used joystick modules thanks to its simplicity, affordability and reliability.

Its main advantages include:

- No additional libraries required
- Compatible with both 3.3V and 5V systems
- Reliable analog position detection
- Integrated push button
- Breadboard-friendly design
- Supported by Arduino, ESP32 and many other platforms
- Ideal for beginners and advanced embedded developers

Whether you're building a robot, game controller or interactive user interface, the KY-023 provides an intuitive and responsive method for user input.

---

## Project Ideas

The KY-023 Analog Joystick Module is ideal for a wide range of embedded and IoT projects, including:

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

For a complete example combining a joystick with an OLED display, check out our **[ESP32 Snake Game with MPU6050 and OLED Display](/ESP32-Snake-Game-with-MPU6050-and-OLED-Display/)** project.

---

## Documentation

The KY-023 does not require a dedicated software library.

The joystick is read using standard analog input functions, while the push button is read as a normal digital input. This makes the module extremely easy to integrate into existing Arduino and **[ESP32 DevKit V1](/products/esp32-devkit/)** projects.

If you're using multiple I2C devices alongside your project, such as an OLED display and an MPU6050, our **[I2C Scanner Tutorial](/i2c-scanner-tutorial/)** explains how to detect every device connected to the bus.

---

## Related Products

The KY-023 Analog Joystick Module is frequently used together with:

- **[ESP32 DevKit V1](/products/esp32-devkit/)**
- **[Solderless Breadboard](/products/solderless-breadboard/)**
- **[Jumper Wires](/products/jumper-wires/)**
- **[SSD1306 OLED Display](/products/ssd1306-oled/)**

These components allow you to quickly prototype interactive embedded systems, robots and user interfaces.

---

## Related Tutorials

To get the most from your KY-023 Analog Joystick Module, we recommend the following guides:

- **[ESP32 Joystick Tutorial – Read an Analog Joystick (KY-023) with Arduino IDE](/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-(KY-023)-with-Arduino-IDE/)**
- **[ESP32 OLED Tutorial – Wiring, Code & Display Guide](/ESP32-OLED-Tutorial-Wiring-Code-&-Display-Guide/)**
- **[I2C Scanner Tutorial](/i2c-scanner-tutorial/)**
- **[MPU6050 Arduino Guide](/mpu6050-arduino-guide/)**
- **[ESP32 Snake Game with MPU6050 and OLED Display](/ESP32-Snake-Game-with-MPU6050-and-OLED-Display/)**

These tutorials demonstrate how to read analog values, connect displays and sensors, build interactive interfaces and develop complete ESP32 projects using the KY-023 Analog Joystick Module.

---

## Frequently Asked Questions

### Is the KY-023 an analog or digital joystick?

The KY-023 provides two analog outputs for the X and Y axes and one digital output for the integrated push button.

### Can the KY-023 be used with an ESP32?

Yes. It is fully compatible with the **[ESP32 DevKit V1](/products/esp32-devkit/)** operating at 3.3V.

### Does the KY-023 require a library?

No. The module uses standard analog and digital signals, so no additional library is required.

### Can the KY-023 be used with Arduino?

Yes. It is compatible with Arduino Uno, Nano, Mega and other Arduino-compatible boards with analog input pins.

### What is the purpose of the push button?

The integrated push button provides an additional digital input that can be used for menu selection, confirmation actions, game controls or other user interactions.

### Can the KY-023 control servo motors?

Yes. The analog outputs can be mapped to servo angles, making the joystick an excellent controller for pan-and-tilt systems, robotics and interactive control projects.
