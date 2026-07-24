---
title: "ESP32 OLED Tutorial: Wiring, Code & Display Guide"

howto: true

layout: single

sidebar:
  nav: "embedded"

excerpt: "Learn how to connect an SSD1306 OLED display to an ESP32 with wiring diagrams, Arduino IDE code examples, and troubleshooting tips."

show_date: false
read_time: true
last_modified_at: false

toc: true
toc_sticky: true
toc_label: "Contents"

header:
  teaser: /assets/images/esp32-oled-tutorial.webp
  image: /assets/images/esp32-oled-tutorial.webp
  og_image: /assets/images/esp32-oled-tutorial.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.25

categories:
  - ESP32
  - Displays
  - Arduino

tags:
  - ESP32
  - OLED
  - SSD1306
  - I2C
  - Arduino IDE
  - ESP32 Projects
  - Display
  - Electronics

related: true
share: true
---

![ESP32 SSD1306 OLED display connected using I2C communication showing text on the screen]({{ '/assets/images/esp32-oled-tutorial.webp' | relative_url }})

The ESP32 paired with an SSD1306 OLED display is one of the most popular combinations for IoT, robotics, and embedded systems.

In this tutorial, you'll learn how to connect an SSD1306 OLED display to an ESP32 using I2C communication, install the required Arduino IDE libraries, upload working example code, and display text on the screen.

## ESP32 OLED Code Example

```cpp
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

void setup() {

  Serial.begin(115200);

  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println("OLED allocation failed");
    while (true);
  }

  display.clearDisplay();
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(0,0);
  display.println("Embedded");
  display.println("Nerd");
  display.display();
}

void loop() {
}
```
## How the Code Works

Let's break down the example code to understand what each section does.

### Include the Required Libraries

```cpp
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
```

- **Wire.h** enables I2C communication.
- **Adafruit_GFX.h** provides graphics functions such as text, lines, circles, and rectangles.
- **Adafruit_SSD1306.h** controls the OLED display.

---

### Define the Display Size

```cpp
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
```

These values define your display resolution.

If you're using a 128×32 OLED, change:

```cpp
#define SCREEN_HEIGHT 32
```

---

### Create the Display Object

```cpp
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);
```

This creates an OLED display object using the default I2C interface.

---

### Initialize the Display

```cpp
display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
```

This starts communication with the display using I2C address **0x3C**.

If your display uses **0x3D**, simply replace:

```cpp
0x3C
```

with

```cpp
0x3D
```

---

### Clear the Screen

```cpp
display.clearDisplay();
```

This removes anything currently shown.

---

### Set the Text Size

```cpp
display.setTextSize(2);
```

Available values include:

- 1 = Small
- 2 = Medium
- 3 = Large
- 4 = Extra Large

---

### Set Text Color

```cpp
display.setTextColor(SSD1306_WHITE);
```

OLED displays are monochrome, so the available color is white.

---

### Position the Cursor

```cpp
display.setCursor(10,20);
```

Coordinates are:

- X = Horizontal position
- Y = Vertical position

---

### Print Text

```cpp
display.println("Hello!");
```

Displays text on the screen.

---

### Update the Display

```cpp
display.display();
```

Nothing appears until this command is executed.

Think of it as pressing **Refresh** after drawing everything.

---

## Complete Example Output

After uploading the sketch, your OLED should display:

```
Hello!
ESP32 OLED
```

---

## Display Graphics

The Adafruit GFX library makes it easy to draw graphics.

### Draw a Pixel

```cpp
display.drawPixel(64,32,SSD1306_WHITE);
display.display();
```

---

### Draw a Line

```cpp
display.drawLine(0,0,127,63,SSD1306_WHITE);
display.display();
```

---

### Draw a Rectangle

```cpp
display.drawRect(10,10,50,30,SSD1306_WHITE);
display.display();
```

---

### Draw a Filled Rectangle

```cpp
display.fillRect(10,10,50,30,SSD1306_WHITE);
display.display();
```

---

### Draw a Circle

```cpp
display.drawCircle(64,32,20,SSD1306_WHITE);
display.display();
```

---

### Draw a Filled Circle

```cpp
display.fillCircle(64,32,20,SSD1306_WHITE);
display.display();
```

---

### Draw a Triangle

```cpp
display.drawTriangle(
0,63,
64,0,
127,63,
SSD1306_WHITE);

display.display();
```

---

## Display Images

You can display logos and icons using bitmap arrays.

Example:

```cpp
display.drawBitmap(
0,
0,
logo_bitmap,
128,
64,
SSD1306_WHITE);

display.display();
```

Bitmap images can be created using tools such as:

- LCD Assistant
- Image2CPP

---

## OLED Text Sizes

| Size | Description |
|------|-------------|
| 1 | Small text |
| 2 | Medium |
| 3 | Large |
| 4 | Very large |

---

## Useful Adafruit GFX Functions

| Function | Description |
|----------|-------------|
| clearDisplay() | Clears the screen |
| display() | Updates the display |
| setCursor() | Sets text position |
| setTextSize() | Changes text size |
| setTextColor() | Sets text color |
| println() | Prints text with newline |
| print() | Prints text |
| drawPixel() | Draws one pixel |
| drawLine() | Draws a line |
| drawRect() | Rectangle |
| fillRect() | Filled rectangle |
| drawCircle() | Circle |
| fillCircle() | Filled circle |
| drawTriangle() | Triangle |
| drawBitmap() | Bitmap image |

---

## Finding the OLED I2C Address

Not every OLED uses the same address.

Upload this I2C Scanner sketch:

```cpp
#include <Wire.h>

void setup()
{
  Wire.begin();
  Serial.begin(115200);

  Serial.println("Scanning...");

  for(byte address=1; address<127; address++)
  {
    Wire.beginTransmission(address);

    if(Wire.endTransmission()==0)
    {
      Serial.print("Found I2C device at 0x");
      Serial.println(address, HEX);
    }
  }

  Serial.println("Done");
}

void loop()
{
}
```

Open the Serial Monitor.

Typical result:

```
Found I2C device at 0x3C
```

or

```
Found I2C device at 0x3D
```

---

## Troubleshooting

### OLED stays blank

Possible causes:

- Wrong wiring
- Wrong I2C address
- Missing libraries
- Power supply issue

---

### "SSD1306 allocation failed"

Your display object may not match your OLED size.

Check:

```cpp
#define SCREEN_WIDTH
#define SCREEN_HEIGHT
```

---

### No device found

Verify:

- SDA connection
- SCL connection
- GND
- 3.3V power
- USB cable

---

### Garbled text

Usually caused by:

- Incorrect display resolution
- Wrong initialization
- Damaged display

---

## Applications

SSD1306 OLED displays are commonly used in:

- Weather stations
- IoT projects
- Smart home devices
- Robotics
- Sensor dashboards
- GPS trackers
- Battery monitors
- Data loggers
- ESP32 web server status displays
- Menu systems

---

## Frequently Asked Questions

### Does the SSD1306 work with ESP8266?

Yes.

---

### Can I use SPI instead of I2C?

Yes.

The SSD1306 is available in both I2C and SPI versions.

---

### Does it work with Arduino Uno?

Absolutely.

---

### Does it work with Raspberry Pi Pico?

Yes.

It supports both Arduino IDE and MicroPython.

---

### Can I display images?

Yes.

Bitmap images are fully supported.

---

### Can I display custom fonts?

Yes.

The Adafruit GFX library supports custom fonts.

---

## Conclusion

The SSD1306 OLED is one of the best displays for ESP32 and Arduino projects thanks to its low cost, excellent readability, and simple I2C interface.

In this tutorial, you learned how to:

- Connect an SSD1306 OLED to an ESP32
- Install the required Arduino libraries
- Upload your first example
- Display text
- Draw graphics and shapes
- Display bitmap images
- Scan for the correct I2C address
- Troubleshoot common issues

Once you've mastered these basics, you can create professional-looking interfaces for IoT devices, robotics projects, weather stations, and countless other embedded applications.

Happy coding!

---

## Download the Example Code

You can download the complete source code used in this tutorial from our GitHub repository.

> **Coming Soon**

---

## Related Tutorials

If you enjoyed this guide, check out these tutorials:

- ESP32 I2C Scanner Tutorial
- ESP32 BME280 Sensor Guide
- ESP32 MPU6050 Tutorial
- ESP32 Web Server Tutorial
- ESP32 WiFi Manager Guide
- Arduino OLED Menu System
- ESP32 DS18B20 Temperature Sensor
- ESP32 DHT22 Tutorial

---

## Recommended Products

- ESP32 DevKit V1
- SSD1306 OLED Display (128×64)
- Breadboard Kit
- Jumper Wire Kit
- USB Type-C Cable
- Logic Level Converter
- Portable USB Power Bank

---

## Share This Tutorial

If this tutorial helped you, consider sharing it with other makers and developers.

Happy building!
