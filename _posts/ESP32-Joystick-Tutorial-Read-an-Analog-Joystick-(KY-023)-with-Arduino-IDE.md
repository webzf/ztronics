---
title: "ESP32 Joystick Tutorial: Read an Analog Joystick (KY-023) with Arduino IDE"
howto: true
layout: single

sidebar:
  nav: "embedded"

excerpt: "Learn how to wire and program an analog joystick module (KY-023) with the ESP32. Includes wiring diagrams, pinout, complete Arduino code, calibration, dead zone, servo projects, OLED navigation, troubleshooting, and FAQs."

description: "Complete ESP32 joystick tutorial for beginners and makers. Learn how to connect the KY-023 analog joystick to an ESP32, read the X and Y axes, use the built-in push button, calibrate the joystick, eliminate noise, create a dead zone, and build real projects."

categories:
  - ESP32

tags:
  - ESP32
  - KY-023
  - Analog Joystick
  - Arduino IDE
  - ADC
  - Servo
  - OLED
  - Robotics

toc: true
toc_sticky: true
toc_label: "Table of Contents"

show_date: false
read_time: false
last_modified_at: false

header:
  image: images/esp32-joystick-hero.webp
  teaser: images/esp32-joystick-hero.webp
  overlay_image: images/header.webp
  overlay_filter: 0.35

related: true
share: true
---

# ESP32 Joystick Tutorial

![ESP32 Analog Joystick connected to an ESP32](images/esp32-joystick-hero.webp)

*Learn how to connect, calibrate, and program an analog joystick module with the ESP32 using the Arduino IDE.*

---

## What You'll Learn

By the end of this tutorial you will be able to:

✔ Understand how an analog joystick works

✔ Connect a KY-023 joystick to any ESP32 board

✔ Read the X and Y analog axes

✔ Detect the built-in push button

✔ Understand how the ESP32 ADC works

✔ Improve accuracy using calibration

✔ Remove unwanted joystick jitter

✔ Create a dead zone

✔ Convert joystick movement into percentages

✔ Control an SG90 servo

✔ Navigate OLED menus

✔ Control robot movement

✔ Build your own joystick-based projects

---

> **Skill Level**
>
> Beginner → Intermediate

> **Estimated Reading Time**
>
> 20–30 minutes

> **Project Time**
>
> Less than one hour

---

## Why Read This Guide?

The analog joystick is one of the most useful input devices available for embedded systems. Although it looks simple, it can be used in hundreds of projects ranging from small menu navigation systems to autonomous robots.

Unlike digital push buttons, which only detect ON and OFF states, an analog joystick provides proportional movement. This means your ESP32 can determine not only the direction of movement but also **how far** the joystick has been moved.

That capability opens the door to projects such as:

- Robot control
- Camera pan and tilt systems
- CNC controllers
- RC vehicles
- Drone transmitters
- OLED menu navigation
- Game controllers
- Robotic arms
- Industrial HMIs
- Home automation interfaces

Many beginners simply connect the joystick and call `analogRead()`. While that works, it rarely produces professional results because analog signals are affected by electrical noise, manufacturing tolerances, and ADC characteristics.

This guide goes much further.

Instead of only showing how to read the joystick, you'll learn how to build robust applications by calibrating the joystick, filtering noisy readings, implementing a dead zone, and converting analog values into useful engineering units.

---

## Why Use the ESP32?

The ESP32 is one of the most powerful microcontrollers available for hobbyists and professionals.

Compared with traditional Arduino boards, it offers:

| Feature | ESP32 | Arduino UNO |
|----------|---------|-------------|
| CPU | Dual-Core 240 MHz | 16 MHz |
| ADC Resolution | 12-bit | 10-bit |
| ADC Values | 0–4095 | 0–1023 |
| Wi-Fi | ✔ | ✘ |
| Bluetooth | ✔ | ✘ |
| RAM | 520 KB | 2 KB |
| PWM Channels | 16 | 6 |
| Price | Low | Low |

For joystick-based projects, the higher ADC resolution makes a significant difference because movements become smoother and more precise.

---

## What Is an Analog Joystick?

An analog joystick is essentially two potentiometers mounted at 90 degrees from each other.

One potentiometer measures horizontal movement (X-axis).

The second measures vertical movement (Y-axis).

A small mechanical switch located underneath the stick detects when the joystick is pressed downward.

Internally, each potentiometer behaves like a voltage divider.

When the joystick moves, the output voltage changes continuously between ground and the supply voltage.

The ESP32 converts that voltage into a digital value using its built-in Analog-to-Digital Converter (ADC).

For a 12-bit ADC, that value ranges from:

| Voltage | ADC Reading |
|----------|------------:|
| 0 V | 0 |
| 1.65 V | ≈2048 |
| 3.3 V | 4095 |

Because the joystick produces continuous values instead of simple HIGH or LOW signals, it allows smooth proportional control.

For example:

- Push slightly forward → Robot moves slowly
- Push fully forward → Robot moves at maximum speed
- Move halfway left → Servo rotates halfway
- Return to center → Robot stops

This proportional control is what makes analog joysticks far more versatile than directional buttons.

---

## Typical Applications

The KY-023 joystick module is commonly found in projects such as:

- Mobile robots
- Robot arms
- RC vehicles
- Drone controllers
- Camera stabilizers
- CNC machine controllers
- OLED menu navigation
- Smart home interfaces
- Electronic games
- Industrial operator panels
- Educational robotics
- DIY game consoles

If you have ever used a PlayStation, Xbox, or Nintendo controller, you have already used the same basic principle explained in this tutorial.

---

## How Does the KY-023 Work?

The KY-023 module combines three independent devices on a single board:

1. X-axis potentiometer
2. Y-axis potentiometer
3. Push button

Each potentiometer has approximately 10 kΩ of resistance.

When the joystick moves, the resistance changes, creating a different output voltage that the ESP32 measures using its ADC.

The push button is completely independent of the analog outputs.

It simply connects the SW pin to GND whenever the joystick is pressed downward.

Using the ESP32's internal pull-up resistor, reading the button becomes extremely simple:

- HIGH → Not pressed
- LOW → Pressed

No external resistor is required.

---

> **Tip**
>
> Although the module is often labeled **+5V**, it is strongly recommended to power it from **3.3V** when using an ESP32. This ensures the analog outputs never exceed the ESP32's maximum input voltage.

---

# Hardware Overview

Before connecting the joystick, it's worth taking a few minutes to understand how the hardware works. Knowing what each pin does and why specific GPIOs are chosen will help you avoid unstable readings, Wi-Fi conflicts, and damaged inputs.

In this section you'll learn:

- The joystick pinout
- The ESP32 ADC architecture
- Why ADC1 is preferred
- GPIOs to avoid
- Recommended wiring
- Power supply recommendations

---

## Hardware Required

| Component | Quantity | Notes | Amazon |
|-----------|---------:|-------|--------|
| ESP32 Development Board | 1 | ESP32-WROOM-32 or equivalent | Affiliate Link |
| KY-023 Analog Joystick Module | 1 | 5-pin module | Affiliate Link |
| Breadboard | 1 | Half or full size | Affiliate Link |
| Jumper Wires | 5 | Male-Male | Affiliate Link |
| USB Cable | 1 | Data cable | Affiliate Link |

---

## Joystick Module Pinout

The KY-023 joystick module exposes five pins.

| Pin | Function |
|------|----------|
| GND | Ground |
| +5V | Power Supply |
| VRx | Analog X-axis Output |
| VRy | Analog Y-axis Output |
| SW | Push Button Output |

![Joystick Pinout](images/esp32-joystick-pinout.webp)

Although many modules print **+5V**, the joystick works perfectly from **3.3V**.

Powering it from 3.3V is actually recommended because the ESP32 ADC inputs are **not 5V tolerant**.

> **Warning**
>
> Never connect analog outputs exceeding 3.3V directly to ESP32 GPIOs.

---

## Understanding Each Pin

### GND

Ground is the common voltage reference shared between the ESP32 and the joystick.

Without a common ground, the analog readings become unpredictable.

Always connect:

```
Joystick GND
      │
      ▼
ESP32 GND
```

---

### VCC

This powers both potentiometers.

Recommended:

```
ESP32 3V3
      │
      ▼
Joystick VCC
```

Although the board usually says **+5V**, the internal potentiometers operate perfectly at 3.3V.

---

### VRx

Outputs an analog voltage representing horizontal movement.

Typical values:

| Position | Voltage | ADC Reading |
|-----------|---------|------------:|
| Left | 0V | ~0 |
| Center | 1.65V | ~2048 |
| Right | 3.3V | ~4095 |

---

### VRy

Exactly the same concept applies to the vertical axis.

| Position | Voltage | ADC Reading |
|-----------|---------|------------:|
| Down | 0V | ~0 |
| Center | 1.65V | ~2048 |
| Up | 3.3V | ~4095 |

---

### SW

The push button is completely independent.

It behaves like a normal switch.

When pressed:

```
SW
 │
 ▼
GND
```

Using INPUT_PULLUP:

| Button | Reading |
|---------|---------|
| Released | HIGH |
| Pressed | LOW |

No external resistor is required.

---

# Understanding the ESP32 ADC

This is one of the biggest differences between an ESP32 and a traditional Arduino.

The ESP32 contains two independent Analog-to-Digital Converters:

- ADC1
- ADC2

Although both can read analog voltages, they behave differently.

---

## ADC Resolution

The ADC converts an analog voltage into a digital number.

For the default 12-bit resolution:

| Voltage | Digital Reading |
|----------|----------------:|
| 0V | 0 |
| 0.825V | ~1024 |
| 1.65V | ~2048 |
| 2.475V | ~3072 |
| 3.3V | 4095 |

This gives the ESP32 four times the precision of an Arduino UNO.

| Board | ADC Bits | Values |
|--------|---------:|-------:|
| Arduino UNO | 10 | 1024 |
| ESP32 | 12 | 4096 |

The higher resolution allows much smoother joystick movement.

---

# ADC1 vs ADC2

This topic confuses many beginners.

The ESP32 contains two ADC peripherals.

## ADC1

GPIO32

GPIO33

GPIO34

GPIO35

GPIO36

GPIO39

✅ Safe to use with Wi-Fi

---

## ADC2

GPIO0

GPIO2

GPIO4

GPIO12

GPIO13

GPIO14

GPIO15

GPIO25

GPIO26

GPIO27

⚠ These pins stop providing reliable analog readings whenever Wi-Fi is active.

Since most ESP32 projects eventually use Wi-Fi or Bluetooth, it is good practice to always use ADC1 whenever possible.

That is why this tutorial uses:

- GPIO34
- GPIO35

---

> **Tip**
>
> Even if your current project doesn't use Wi-Fi, choosing ADC1 makes your code future-proof.

---

# Choosing the GPIOs

Our wiring will be:

| Joystick | ESP32 |
|-----------|--------|
| GND | GND |
| VCC | 3V3 |
| VRx | GPIO34 |
| VRy | GPIO35 |
| SW | GPIO32 |

These pins provide:

✔ Stable ADC readings

✔ No Wi-Fi conflicts

✔ Clean layout

✔ Easy expansion

---

# Wiring Diagram

![ESP32 Wiring](images/esp32-joystick-wiring.webp)

Follow the connections exactly as shown.

Double-check every wire before powering the ESP32.

Most joystick problems are simply caused by swapped VCC and GND connections.

---

# Power Supply Considerations

The joystick itself consumes very little current.

Typical current consumption:

| Device | Current |
|----------|---------:|
| KY-023 | <5 mA |

This makes it perfectly safe to power directly from the ESP32's 3.3V regulator.

No external power supply is required.

---

# Analog Noise

One thing beginners often notice is that the joystick values are never perfectly stable.

Instead of reading:

```
2048
2048
2048
2048
```

you may observe:

```
2043
2049
2052
2046
2048
```

This is completely normal.

Small variations are caused by:

- ADC quantization
- Electrical noise
- Potentiometer tolerances
- Breadboard contact resistance

Later in this tutorial we'll eliminate most of this noise using software filtering and a dead zone.

---

> **Note**
>
> Small variations of ±10 to ±30 ADC counts are completely normal and do not indicate a faulty joystick.

---

# Before Continuing

At this point you should have:

✅ ESP32 connected

✅ Joystick wired

✅ Correct GPIOs selected

✅ Powered from 3.3V

✅ Common ground connected

In the next section we'll configure the Arduino IDE, upload the first sketch, and verify that the joystick is working correctly before building more advanced projects.

---

In the next section we'll examine every pin of the joystick module, understand what each one does, and see why choosing the correct ESP32 GPIOs is important for reliable analog readings.


---

# Reading the Joystick with the ESP32

Now that the hardware is connected correctly, it's time to write our first program.

Our initial goal is simple:

- Read the X-axis
- Read the Y-axis
- Read the push button
- Display everything on the Serial Monitor

Although this sounds straightforward, there are a few ESP32-specific details worth understanding before writing any code.

By the end of this section, you'll have a reliable test program that can serve as the foundation for every joystick-based project.

---

# Preparing the Arduino IDE

If you have already installed ESP32 support in the Arduino IDE, you can skip this section.

Otherwise:

1. Open **Arduino IDE**
2. Go to **File → Preferences**
3. Add the ESP32 Boards Manager URL:

```
https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json
```

4. Open:

```
Tools
    ↓
Board
    ↓
Boards Manager
```

5. Search for:

```
esp32
```

6. Install the package published by Espressif Systems.

After installation, select your board.

For most users:

```
Tools
    ↓
Board
    ↓
ESP32 Dev Module
```

If you own another ESP32 variant, choose the appropriate board.

---

# Understanding the ADC Resolution

The ESP32 converts voltages into numbers.

By default, the ADC uses 12-bit resolution.

That means:

| Voltage | Reading |
|----------|---------:|
| 0V | 0 |
| 3.3V | 4095 |

This gives:

```
4096 possible values
```

instead of only

```
1024 values
```

available on an Arduino UNO.

The higher resolution produces smoother joystick movement.

---

# ADC Attenuation

One feature many ESP32 tutorials ignore is ADC attenuation.

Attenuation changes the voltage range that the ADC can measure.

For joystick applications powered from 3.3V, the recommended setting is:

```cpp
analogSetPinAttenuation(xAxisPin, ADC_11db);
analogSetPinAttenuation(yAxisPin, ADC_11db);
```

Why?

Because it allows the ADC to measure almost the full voltage range generated by the joystick.

Without proper attenuation, the ADC may saturate earlier than expected depending on the ESP32 model.

> **Tip**
>
> Most ESP32 development boards work well without explicitly setting attenuation, but configuring it makes your code more portable across different ESP32 variants.

---

# The First Test Program

Upload the following sketch.

```cpp
/*
    Embedded Nerd
    ESP32 Analog Joystick Test
*/

const byte xAxisPin = 34;
const byte yAxisPin = 35;
const byte buttonPin = 32;

void setup()
{
    Serial.begin(115200);

    pinMode(buttonPin, INPUT_PULLUP);

    analogSetPinAttenuation(xAxisPin, ADC_11db);
    analogSetPinAttenuation(yAxisPin, ADC_11db);

    Serial.println();
    Serial.println("ESP32 Analog Joystick Test");
    Serial.println("--------------------------");
}

void loop()
{
    int xValue = analogRead(xAxisPin);

    int yValue = analogRead(yAxisPin);

    bool buttonPressed =
        digitalRead(buttonPin) == LOW;

    Serial.print("X: ");
    Serial.print(xValue);

    Serial.print("    Y: ");
    Serial.print(yValue);

    Serial.print("    Button: ");

    if(buttonPressed)
        Serial.println("Pressed");
    else
        Serial.println("Released");

    delay(100);
}
```

Upload the sketch and open the Serial Monitor.

Set the baud rate to:

```
115200 baud
```

---

# Expected Output

With the joystick untouched, you should observe something similar to:

```
X: 2048    Y: 2055    Button: Released

X: 2052    Y: 2044    Button: Released

X: 2046    Y: 2050    Button: Released
```

Do not worry if your values are slightly different.

Every joystick has small manufacturing tolerances.

Typical center values are anywhere between:

```
1980

and

2120
```

This is perfectly normal.

---

# Moving the Joystick

Try moving the joystick slowly.

You should notice:

Moving left:

```
X decreases
```

Moving right:

```
X increases
```

Moving down:

```
Y decreases
```

Moving up:

```
Y increases
```

At the extremes, values should approach:

```
0

and

4095
```

although they rarely reach these exact numbers.

---

# Testing the Push Button

Press the joystick downward.

The Serial Monitor should display:

```
Button: Pressed
```

Release it.

The message changes back to:

```
Button: Released
```

No external resistor is required because we enabled the ESP32's internal pull-up resistor.

---

# Why Aren't the Center Values Exactly 2048?

Many beginners expect:

```
2048
2048
2048
```

every time.

Real joysticks don't work like that.

Several factors affect the reading:

- Potentiometer tolerance
- ADC offset
- Temperature
- Electrical noise
- USB power quality

Seeing values such as:

```
2036

2051

2044

2060
```

is completely normal.

Professional projects always compensate for these variations using calibration.

We'll implement that later.

---

# Monitoring the Analog Signal

Spend a minute moving the joystick in every direction.

Observe how smoothly the values change.

Notice that:

Small movement

↓

Small change

Large movement

↓

Large change

This proportional behaviour is exactly what makes analog joysticks so useful.

Unlike digital buttons, they provide continuous position information instead of only ON and OFF states.

---

# Common Beginner Mistakes

## Values Stay at Zero

Possible causes:

- Missing power
- Broken wire
- Wrong GPIO
- Poor breadboard connection

---

## Values Stay Near 4095

Usually indicates:

- VCC and GND swapped
- Short circuit
- Wrong wiring

---

## Button Never Changes

Verify:

```cpp
pinMode(buttonPin, INPUT_PULLUP);
```

If omitted, the button input will float and produce random readings.

---

## Random Numbers

Random values usually indicate:

- Loose jumper wires
- Missing GND connection
- Faulty breadboard

Always verify the wiring before changing the software.

---

> **Note**
>
> If your readings vary by ±20 counts while the joystick is stationary, don't worry. This is completely normal and will be corrected in the next section using software filtering.

---

# What's Next?

At this point your joystick is working correctly.

However, the readings still aren't suitable for professional applications.

The next section will dramatically improve their quality by implementing:

- Automatic joystick calibration
- Center detection
- Dead zone
- Moving Average filtering
- Noise reduction
- Stable analog readings

These techniques are used in game controllers, robotics, drones, CNC machines, and industrial control systems, and they will make your projects feel much smoother and more responsive.


---

# Calibrating the Joystick and Eliminating Noise

If you've watched the Serial Monitor while the joystick is at rest, you've probably noticed that the values are never perfectly stable.

Instead of always reading:

```
X = 2048
Y = 2048
```

you'll typically see something like:

```
2045
2048
2052
2047
2044
2050
```

This behavior is completely normal.

It does **not** mean that your joystick is faulty.

Professional game controllers, drone transmitters, RC radios, and industrial joysticks all experience small variations in their analog signals. The difference is that they process those signals before using them.

In this section, you'll learn the same techniques used in professional systems:

- Automatic center calibration
- Dead zone implementation
- Moving average filtering
- Value normalization
- Direction detection

Once these techniques are applied, the joystick will feel significantly smoother and more accurate.

---

# Why Analog Signals Are Noisy

An analog joystick is built around two mechanical potentiometers.

Unlike digital components, potentiometers are never perfectly stable.

Several factors contribute to small fluctuations:

- Mechanical tolerances
- ADC conversion error
- Electrical noise
- USB power ripple
- Breadboard contact resistance
- Temperature changes

Because of this, it is unrealistic to expect the center position to always produce exactly the same value.

Even expensive industrial joysticks exhibit some degree of analog noise.

---

# Automatic Center Calibration

Every joystick is slightly different.

One joystick may rest at:

```
X = 2034
Y = 2058
```

Another might rest at:

```
X = 2086
Y = 2012
```

For this reason, professional software never assumes that the center is exactly **2048**.

Instead, it measures the center automatically during startup.

---

## Calibration Code

```cpp
int centerX;
int centerY;

void calibrateJoystick()
{
    long sumX = 0;
    long sumY = 0;

    const int samples = 100;

    Serial.println("Calibrating joystick...");

    for(int i = 0; i < samples; i++)
    {
        sumX += analogRead(xAxisPin);
        sumY += analogRead(yAxisPin);

        delay(5);
    }

    centerX = sumX / samples;
    centerY = sumY / samples;

    Serial.print("Center X: ");
    Serial.println(centerX);

    Serial.print("Center Y: ");
    Serial.println(centerY);
}
```

Call the function once inside `setup()` after initializing the Serial port.

```cpp
calibrateJoystick();
```

The joystick should remain untouched during calibration.

---

> **Tip**
>
> Averaging many samples produces a much more accurate center value than taking a single reading.

---

# Creating a Dead Zone

Even after calibration, the joystick may continue producing tiny movements while resting.

Imagine the center value is:

```
2048
```

The ADC may still report:

```
2045

2051

2047

2053
```

Although these changes are insignificant, your software might interpret them as real movement.

A **dead zone** solves this problem.

Any movement smaller than a predefined threshold is ignored.

---

## Dead Zone Example

```cpp
const int deadZone = 40;

int x = analogRead(xAxisPin);

if(abs(x - centerX) < deadZone)
{
    x = centerX;
}
```

The same logic should be applied to the Y axis.

---

### Why Use a Dead Zone?

Without one, a robot may slowly drift across the floor, a servo may continuously vibrate, or a cursor on an OLED display may move on its own.

A dead zone ensures that small fluctuations around the center are treated as intentional "no movement."

---

## Choosing the Right Dead Zone

| Dead Zone | Feel |
|-----------|------|
| 10 | Very sensitive |
| 20 | Sensitive |
| 40 | Recommended |
| 60 | Smooth |
| 100 | Less responsive |

For most projects, a value between **30 and 50 ADC counts** works very well.

---

# Moving Average Filter

Another way to reduce noise is by averaging multiple consecutive readings.

Instead of using:

```cpp
analogRead()
```

once,

we calculate the average of several measurements.

---

## Moving Average Function

```cpp
int readAverage(int pin)
{
    long total = 0;

    const int samples = 10;

    for(int i = 0; i < samples; i++)
    {
        total += analogRead(pin);
    }

    return total / samples;
}
```

Now read the joystick like this:

```cpp
int x = readAverage(xAxisPin);
int y = readAverage(yAxisPin);
```

The movement becomes noticeably smoother.

---

## Advantages

✔ Reduced electrical noise

✔ More stable readings

✔ Better servo movement

✔ Better robot control

✔ More professional feel

---

## Disadvantages

A larger average also makes the joystick slightly slower to respond.

Typical values are:

| Samples | Response |
|----------|----------|
| 4 | Fast |
| 8 | Recommended |
| 10 | Smooth |
| 20 | Very smooth |
| 50 | Slow |

Eight to ten samples provide an excellent balance between smoothness and responsiveness.

---

# Normalizing the Values

Once the joystick is calibrated, it is useful to convert the readings into values relative to the center.

Instead of working with:

```
2035

2052

1988
```

we subtract the center value.

```cpp
int normalizedX =
    analogRead(xAxisPin) - centerX;

int normalizedY =
    analogRead(yAxisPin) - centerY;
```

Now the center becomes:

```
0
```

Moving left produces negative values.

Moving right produces positive values.

For example:

| Position | Value |
|-----------|-------:|
| Full Left | -2048 |
| Center | 0 |
| Full Right | +2047 |

This representation is much easier to use in robotics and control systems.

---

# Detecting Direction

Using the normalized values, detecting movement direction becomes straightforward.

```cpp
if(normalizedX > 300)
{
    Serial.println("RIGHT");
}

else if(normalizedX < -300)
{
    Serial.println("LEFT");
}

if(normalizedY > 300)
{
    Serial.println("UP");
}

else if(normalizedY < -300)
{
    Serial.println("DOWN");
}
```

Diagonal movements can also be detected by combining both axes.

For example:

```
UP + RIGHT

↓

UP-RIGHT
```

This technique is widely used in games and robotic navigation.

---

# Combining Everything

A professional joystick reading typically follows this sequence:

1. Read the ADC
2. Average multiple samples
3. Apply calibration
4. Normalize the values
5. Apply the dead zone
6. Detect the direction
7. Use the processed values in the application

This processing pipeline produces smooth, accurate, and repeatable results.

---

> **Best Practice**
>
> Avoid using raw `analogRead()` values directly in real projects. Applying calibration, filtering, and a dead zone significantly improves the user experience with very little additional code.

---

# What's Next?

Your joystick is now producing clean and reliable data.

In the next section, we'll use these processed values to control real hardware.

We'll start by driving an SG90 servo motor smoothly, then expand the project to control DC motors, navigate OLED menus, and build more advanced applications.


---

# Mini Project: Smooth Servo Control with the ESP32 Joystick

Now that we have clean, calibrated joystick readings, it's time to control a real actuator.

In this project, the joystick's X-axis will control the position of an SG90 micro servo.

Unlike many basic tutorials, we won't simply map the joystick directly to the servo angle. Instead, we'll implement:

- Smooth movement
- Dead zone support
- Servo speed limiting
- Stable operation
- Proper power recommendations

These improvements produce much more natural movement and prevent the servo from constantly vibrating around its center position.

---

# Hardware Required

| Component | Quantity |
|-----------|---------:|
| ESP32 Dev Board | 1 |
| KY-023 Joystick | 1 |
| SG90 Servo | 1 |
| Breadboard | 1 |
| Jumper Wires | Several |

---

# Servo Wiring

| SG90 Wire | ESP32 |
|------------|--------|
| Brown | GND |
| Red | External 5V* |
| Orange | GPIO18 |

*An external 5V power supply is strongly recommended.

![ESP32 Servo Wiring](images/esp32-servo-wiring.webp)

---

> **Warning**
>
> Never power multiple servos directly from the ESP32's 3.3V pin. Even a small SG90 can draw over 500 mA during startup or when stalled. An overloaded power supply may cause random ESP32 resets or unstable operation.

---

# Why Use an External Power Supply?

Many beginners connect the servo directly to the ESP32.

Although this may work for quick tests, it often causes problems.

An SG90 typically consumes:

| Condition | Current |
|------------|---------:|
| Idle | 10–20 mA |
| Moving | 150–250 mA |
| Stall | Up to 650 mA |

The ESP32 cannot safely provide this current under all conditions.

The recommended wiring is:

```
External 5V
      │
      ├──── Servo VCC

ESP32 GND
      │
      ├──── Servo GND
      └──── Power Supply GND
```

The grounds **must** be connected together.

Without a common ground, the PWM control signal will not have a proper voltage reference.

---

# Installing the Servo Library

The standard Arduino Servo library is not fully compatible with the ESP32.

Instead, install:

```
ESP32Servo
```

by Kevin Harrington.

Open:

```
Sketch

↓

Include Library

↓

Manage Libraries
```

Search for:

```
ESP32Servo
```

Install the latest version.

---

# Complete Project Code

```cpp
#include <ESP32Servo.h>

const byte xAxisPin = 34;
const byte servoPin = 18;

Servo myServo;

int centerX;
int currentAngle = 90;

const int deadZone = 40;

void calibrateJoystick()
{
    long sum = 0;

    for(int i = 0; i < 100; i++)
    {
        sum += analogRead(xAxisPin);
        delay(5);
    }

    centerX = sum / 100;
}

void setup()
{
    Serial.begin(115200);

    analogSetPinAttenuation(xAxisPin, ADC_11db);

    calibrateJoystick();

    ESP32PWM::allocateTimer(0);

    myServo.setPeriodHertz(50);

    myServo.attach(servoPin,500,2400);

    myServo.write(currentAngle);
}

void loop()
{
    int x = analogRead(xAxisPin);

    if(abs(x-centerX)<deadZone)
        x=centerX;

    int targetAngle=
        map(x,0,4095,0,180);

    if(targetAngle>currentAngle)
        currentAngle++;

    if(targetAngle<currentAngle)
        currentAngle--;

    myServo.write(currentAngle);

    delay(10);
}
```

---

# How the Code Works

The program begins by calibrating the joystick.

Instead of assuming the center is exactly **2048**, it measures the actual center value during startup.

After calibration, each loop performs the following sequence:

1. Read the joystick.
2. Apply the dead zone.
3. Convert the ADC value into an angle.
4. Move the servo smoothly toward the target.
5. Repeat.

Instead of instantly jumping to the new position, the servo moves one degree at a time.

This creates much smoother movement.

---

# Why Smooth Movement Matters

Many beginner examples use:

```cpp
servo.write(map(analogRead(...)));
```

Although simple, this produces abrupt movement.

Even tiny ADC fluctuations cause constant servo corrections.

The result is:

- Jitter
- Noise
- Excessive wear
- Higher current consumption

By gradually moving toward the target position, the servo behaves much more naturally.

---

# Understanding the map() Function

The joystick produces values between:

```
0

↓

4095
```

The servo expects:

```
0°

↓

180°
```

The `map()` function converts one range into another.

```cpp
int angle =
map(x,0,4095,0,180);
```

Examples:

| ADC | Servo Angle |
|------|------------:|
| 0 | 0° |
| 1024 | 45° |
| 2048 | 90° |
| 3072 | 135° |
| 4095 | 180° |

---

# Limiting the Servo Range

Some mechanical systems should not rotate through the full 180°.

You can limit the travel easily.

Instead of:

```cpp
map(x,0,4095,0,180);
```

use:

```cpp
map(x,0,4095,20,160);
```

This protects gears and mechanical linkages.

---

# Adjusting the Servo Speed

The movement speed depends on this section:

```cpp
currentAngle++;
```

or

```cpp
currentAngle--;
```

Increasing by one degree per loop creates smooth motion.

Increasing by:

```cpp
currentAngle+=3;
```

makes the servo respond faster.

Experiment to find the best balance for your application.

---

# Returning to the Center

Because we implemented a dead zone, releasing the joystick causes the servo to return smoothly to approximately 90°.

This behaviour is ideal for:

- Camera pan systems
- Robot steering
- Turret control
- RC transmitters

---

# Troubleshooting

## Servo Doesn't Move

Check:

- External power supply
- Common ground
- Correct GPIO
- ESP32Servo installed

---

## Servo Vibrates

Possible causes:

- No dead zone
- Poor power supply
- Loose wiring

---

## ESP32 Keeps Resetting

Almost always caused by powering the servo from the ESP32.

Use an external 5V supply.

---

## Servo Only Moves Partially

Verify:

```cpp
myServo.attach(servoPin,500,2400);
```

Different servos require slightly different pulse widths.

---

# Ideas for Further Improvements

Now that the servo is working reliably, you can extend the project in several ways.

- Use the Y-axis to control a second servo and build a pan-tilt camera platform.
- Press the joystick button to store preset positions.
- Add acceleration and deceleration for even smoother movement.
- Display the current angle on an OLED screen.
- Send joystick commands wirelessly over Wi-Fi or Bluetooth.
- Control a robotic arm with multiple joints.

These ideas all build upon the same concepts you've learned in this chapter.

---

# What's Next?

Controlling a servo is an excellent introduction, but many real projects require controlling motors rather than position.

In the next chapter, you'll learn how to use the joystick to drive a DC motor through an H-bridge driver, enabling proportional speed and direction control. The same principles can then be applied to mobile robots, RC vehicles, conveyor systems, and other motion-control applications.

