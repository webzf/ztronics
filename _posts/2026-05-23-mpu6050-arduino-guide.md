---
title: "MPU6050 Arduino Guide: Code, Wiring & GitHub"

layout: single

sidebar: 
   nav: "embedded"

excerpt: "Learn how to connect MPU6050 to Arduino Uno and Nano with wiring diagrams, working code examples and GitHub downloads."

show_date: false
read_time: false
last_modified_at: false


toc: true
toc_sticky: true
toc_label: "Contents"

header:
  teaser: /assets/images/mpu6050-sensor-guide.webp
  overlay_image: /assets/images/headnerd2.webp
  overlay_filter: 0.4

categories:
  - Arduino
  - Sensors
  - ESP32

tags:
  - MPU6050
  - Arduino
  - Arduino Uno
  - ESP32
  - ESP32-projects
  - Gyroscope
  - Accelerometer
  - I2C

related: true
share: true
---

# MPU6050 Arduino Guide: Code, Wiring & GitHub

![MPU6050 arduino esp32]({{ '/assets/images/MPU6050-Arduino-Guide.png' | relative_url }})

Learn how to connect the MPU6050 sensor to Arduino Uno or Nano using simple wiring, working Arduino code examples, and I2C communication.

The MPU6050 is one of the most popular motion sensors for Arduino because it combines:
- 3-axis accelerometer
- 3-axis gyroscope
- Temperature sensor
- I2C communication

This tutorial includes:
- MPU6050 Arduino wiring
- Working Arduino code
- Arduino Uno and Nano notes
- Troubleshooting tips
- GitHub source code

---

# What is the MPU6050?

The MPU6050 is a motion tracking sensor used in:
- Arduino projects
- Robotics
- Gesture control systems
- [Motion-controlled games](https://embeddednerd.com/ESP32-Snake-Game-with-MPU6050-and-OLED-Display/)
- Drone stabilization
- DIY electronics

It can measure:
- Acceleration
- Rotation
- Tilt
- Motion

The sensor communicates using the I2C protocol and works with both Arduino and ESP32 boards.

---

# Required Hardware

| Component | Link |
|---|---|
| MPU6050 Sensor | [Recommended MPU6050 Module](https://YOUR-AFFILIATE-LINK.com) |
| Arduino Uno | [Compatible Arduino Uno Board](https://YOUR-AFFILIATE-LINK.com) |
| Arduino Nano | [Arduino Nano for Compact Projects](https://YOUR-AFFILIATE-LINK.com) |
| Jumper Wires | [Male to Female Jumper Wires](https://YOUR-AFFILIATE-LINK.com) |
| Breadboard | [Breadboard for Arduino Projects](https://YOUR-AFFILIATE-LINK.com) |

---

# MPU6050 Arduino Wiring

![MPU6050 arduino wiring]({{ '/assets/images/mpu6050-wiring.webp' | relative_url }})

## Arduino Uno / Nano Connections

| MPU6050 Pin | Arduino Uno/Nano |
|---|---|
| VCC | 5V |
| GND | GND |
| SDA | A4 |
| SCL | A5 |

---

# Wiring Notes

- SDA is the I2C data pin
- SCL is the I2C clock pin
- Default I2C address is `0x68`
- Most MPU6050 modules support both 3.3V and 5V

The MPU6050 connects easily to Arduino Uno and Nano using the built-in I2C pins.

---

# Install the MPU6050 Library

Open Arduino IDE and install a compatible MPU6050 library.

## Arduino IDE Steps

1. Open Arduino IDE
2. Go to:

    Sketch → Include Library → Manage Libraries

3. Search for:

    MPU6050

4. Install a compatible library

---

# MPU6050 Arduino Code Example

The following example reads accelerometer and gyroscope values from the MPU6050 sensor.
```cpp

    // =====================================================
    // Embedded Nerd - https://embeddednerd.com
    // MPU6050 Arduino Example
    // Tutorial: https://embeddednerd.com/mpu6050-arduino-tutorial/
    // =====================================================

    #include <Wire.h>
    #include <MPU6050.h>

    MPU6050 mpu;

    void setup() {
      Serial.begin(115200);

      Wire.begin();

      mpu.initialize();

      if (mpu.testConnection()) {
        Serial.println("MPU6050 connected successfully");
      } else {
        Serial.println("MPU6050 connection failed");
      }
    }

    void loop() {

      int16_t ax, ay, az;
      int16_t gx, gy, gz;

      mpu.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);

      Serial.print("Accel X: ");
      Serial.print(ax);

      Serial.print(" | Accel Y: ");
      Serial.print(ay);

      Serial.print(" | Accel Z: ");
      Serial.print(az);

      Serial.print(" | Gyro X: ");
      Serial.print(gx);

      Serial.print(" | Gyro Y: ");
      Serial.print(gy);

      Serial.print(" | Gyro Z: ");
      Serial.println(gz);

      delay(500);
    }

    // -----------------------------------------------------
    // More Arduino, ESP32 and Raspberry Pi tutorials:
    // https://embeddednerd.com
    // -----------------------------------------------------
```
---

# How the Code Works

## Wire.begin()

Starts I2C communication between Arduino and MPU6050.

## mpu.initialize()

Initializes the sensor.

## getMotion6()

Reads:
- Accelerometer X/Y/Z
- Gyroscope X/Y/Z

The values are printed to the Arduino Serial Monitor.

---

# Serial Monitor Output

Example output:

    Accel X: -120 | Accel Y: 340 | Accel Z: 16384 | Gyro X: 12 | Gyro Y: -8 | Gyro Z: 3

---

# MPU6050 Arduino Uno Notes

The MPU6050 works very well with:
- Arduino Uno
- Arduino Nano
- ESP32
- Raspberry Pi

For Arduino Uno:
- SDA uses pin A4
- SCL uses pin A5

For ESP32:
- SDA usually uses GPIO21
- SCL usually uses GPIO22

---

# Common Problems

## MPU6050 Not Detected

Possible causes:
- Wrong wiring
- Incorrect I2C address
- Loose jumper wires

---

## Random Values

Possible causes:
- Electrical noise
- Bad power supply
- Sensor movement during startup

---

## Upload Failed

Try:
- Selecting the correct COM port
- Pressing RESET on Arduino
- Changing USB cable

---

# MPU6050 Projects

You can use MPU6050 for:
- Motion-controlled games
- Gesture control
- Robotics
- Self-balancing systems
- Tilt measurement
- Drone stabilization
- ESP32 projects

---

# Recommended Starter Kits

Useful kits for beginners:

- [Arduino Starter Kit](https://YOUR-AFFILIATE-LINK.com)
- [ESP32 Development Board](https://YOUR-AFFILIATE-LINK.com)
- [Electronics Breadboard Kit](https://YOUR-AFFILIATE-LINK.com)

---

# GitHub Source Code

The complete MPU6050 Arduino code is available in the GitHub repository.

You can expand this project with:
- OLED displays
- ESP32 boards
- [Motion-controlled games](https://embeddednerd.com/ESP32-Snake-Game-with-MPU6050-and-OLED-Display/)
- Wireless communication
- Sensor-based automation

---

# Related Tutorials

- [MPU6050 Calibration Guide](../mpu6050-calibration/)
- [ESP32 MPU6050 Snake Game Projects](https://embeddednerd.com/ESP32-Snake-Game-with-MPU6050-and-OLED-Display/)
- [SSD1306 OLED Guide](../ESP32-OLED-Tutorial-Wiring-Code-&-Display-Guide/)
- [I2C Scanner Tutorial](../i2c-scanner-tutorial/)

---

# Conclusion

The MPU6050 is one of the best beginner-friendly motion sensors for Arduino and ESP32 projects.

With simple wiring and a few lines of code, you can build:
- Motion tracking systems
- Arduino games
- Robotics projects
- Gesture control interfaces
- DIY electronics applications

The combination of Arduino + MPU6050 remains one of the most popular setups for embedded electronics and maker projects.
