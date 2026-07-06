---
title: "ESP32 Snake Game with MPU6050 and OLED Display"

layout: single

sidebar:
   nav: "embedded"

excerpt: "Build an ESP32 Snake Game controlled by an MPU6050 motion sensor using an SSD1306 OLED display. Includes wiring, code, libraries and GitHub."

show_date: false
read_time: false
last_modified_at: false

toc: true
toc_sticky: true
toc_label: "Contents"

header:
  teaser: /assets/images/Esp32-snake-game.webp
  overlay_image: /assets/images/headnerd2.webp
  overlay_filter: 0.4

categories:
  - ESP32
  - Projects
  - Games

tags:
  - ESP32
  - Snake Game
  - MPU6050
  - OLED
  - SSD1306
  - Arduino IDE
  - I2C
  - ESP32 Projects

related: true
share: true
---

# ESP32 Snake Game with MPU6050 and OLED Display

![ESP32 Snake Game]({{ '/assets/images/ESP32-Snake-Game.png' | relative_url }})

Learn how to build a classic Snake game using an ESP32, an MPU6050 motion sensor and a 0.96-inch SSD1306 OLED display.

Instead of pressing buttons, you control the snake by tilting the [MPU6050 sensor](/mpu6050-arduino-guide/), making this a fun project for learning ESP32 graphics, sensors and game programming.

In this tutorial you'll learn:

- ESP32 Snake Game wiring
- MPU6050 tilt controls
- [OLED display connections](/ESP32-OLED-Tutorial-Wiring-Code-&-Display-Guide/)
- Required libraries
- Complete Arduino code
- GitHub source code
- Project improvements

---

# Project Overview

This project combines three popular ESP32 modules:

- ESP32 development board
- MPU6050 accelerometer and gyroscope
- SSD1306 OLED display

The MPU6050 detects the board's orientation and changes the snake's direction.

The OLED display shows:

- Snake
- Food
- Score
- Game Over screen

---

# Required Hardware

| Component | Link |
|---|---|
| ESP32 Development Board | [Recommended ESP32 Board](https://YOUR-AFFILIATE-LINK.com) |
| MPU6050 Module | [MPU6050 Motion Sensor](https://YOUR-AFFILIATE-LINK.com) |
| SSD1306 OLED Display | [0.96" OLED Display](https://YOUR-AFFILIATE-LINK.com) |
| Breadboard | [Breadboard Kit](https://YOUR-AFFILIATE-LINK.com) |
| Jumper Wires | [Jumper Wire Kit](https://YOUR-AFFILIATE-LINK.com) |

---

# ESP32 Snake Game Wiring

![ESP32 Snake Wiring]({{ '/assets/images/esp32-snake-game-wiring.webp' | relative_url }})

## ESP32 Connections

| ESP32 | MPU6050 | OLED SSD1306 |
|-------|----------|--------------|
| 3.3V | VCC | VCC |
| GND | GND | GND |
| GPIO21 | SDA | SDA |
| GPIO22 | SCL | SCL |

Since both devices use I2C communication, they can share the same SDA and SCL pins.

---

# How the Game Works

The snake moves continuously across the OLED display.

Tilting the MPU6050 changes its direction:

- Tilt Left → Move Left
- Tilt Right → Move Right
- Tilt Forward → Move Up
- Tilt Backward → Move Down

Every time the snake eats food:

- Score increases
- Snake becomes longer
- Game speed gradually increases

If the snake hits:

- A wall
- Itself

The game ends and displays the final score.

---

# Install Required Libraries

Open Arduino IDE.

Go to:

```
Sketch
→ Include Library
→ Manage Libraries
```

Install the following libraries:

- Adafruit SSD1306
- Adafruit GFX
- MPU6050
- Wire

---

# ESP32 Snake Game Code

The complete project is available on GitHub.

```cpp
// =====================================================
// Embedded Nerd
// ESP32 Snake Game
// MPU6050 + OLED Display
// https://embeddednerd.com
// =====================================================

#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <MPU6050.h>

// Complete project available on GitHub
```

The complete sketch includes:

- Snake movement
- Food generation
- Collision detection
- Score counter
- MPU6050 controls
- OLED graphics

---

# Reading the MPU6050

The MPU6050 continuously measures acceleration on three axes.

Typical logic:

```cpp
if(ax > 8000)
    direction = RIGHT;

if(ax < -8000)
    direction = LEFT;

if(ay > 8000)
    direction = DOWN;

if(ay < -8000)
    direction = UP;
```

Threshold values help prevent accidental direction changes caused by small movements.

---

# Drawing the Snake

Each snake segment is represented as a small square.

The OLED is refreshed every frame by:

- Clearing the display
- Drawing the snake
- Drawing food
- Updating the score

This creates smooth movement while keeping memory usage low.

---

# Game Features

Current features include:

- Tilt controls
- Score counter
- Random food generation
- Snake growth
- Collision detection
- Game Over screen

---

# Possible Improvements

You can easily expand this project by adding:

- High score memory
- Sound effects with a buzzer
- Difficulty levels
- Animated splash screen
- RGB LED effects
- Wi-Fi leaderboard
- Bluetooth multiplayer
- Touch button controls

---

# Troubleshooting

## OLED Not Displaying

Check:

- SDA and SCL connections
- OLED I2C address
- Display library installation

---

## MPU6050 Not Detected

Verify:

- Wiring
- I2C address (0x68)
- Power supply

Run an I2C scanner if necessary.

---

## Snake Moves Randomly

Possible causes:

- MPU6050 not calibrated
- Sensor vibration
- Threshold values too low

Increasing the tilt threshold usually improves stability.

---

# Why Use an MPU6050?

Compared to push buttons, the MPU6050 provides a much more interactive gaming experience.

Advantages include:

- No mechanical buttons
- Natural motion control
- Fast response
- Great introduction to accelerometers
- Easy integration with ESP32

---

# GitHub Source Code

The complete ESP32 Snake Game source code is available in the GitHub repository.

The repository includes:

- Complete Arduino sketch
- Wiring diagram
- Required libraries
- Images
- Project files

---

# Related Tutorials

- [MPU6050 Arduino Guide](../mpu6050-arduino-guide/)
- [ESP32 OLED Display Guide](../ESP32-OLED-Tutorial-Wiring-Code-&-Display-Guide/)
- [I2C Scanner Tutorial](../i2c-scanner/)
- [ESP32 Joystick Tutorial](../esp32-joystick/)

---

# Conclusion

Building a Snake game with an ESP32, MPU6050 and OLED display is an excellent way to learn embedded programming while creating a fun interactive project.

This project introduces several important concepts including I2C communication, motion sensing, OLED graphics, game logic and real-time input handling.

Once completed, you can extend it with additional features such as sound effects, wireless scoreboards or even multiplayer gameplay, making it a great foundation for more advanced ESP32 game development.
