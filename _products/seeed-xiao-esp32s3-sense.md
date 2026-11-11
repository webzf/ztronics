---
layout: product
internal_links: true
title: "Seeed Studio XIAO ESP32S3 Sense: Camera, Mic and SD Card in a 21 × 17.8 mm Board"
product_verdict: "A great fit for tiny camera, audio and logging projects on ESP32-S3; plan around the shared GPIOs and the higher deep-sleep current with the expansion board attached."
editorial_review:
  rating: 8.5
  best_rating: 10
  worst_rating: 1
  author: "Embedded Nerd"
  summary: "The Seeed Studio XIAO ESP32S3 Sense puts an ESP32-S3 with 8MB PSRAM and 8MB Flash, a detachable camera board, a digital microphone and a microSD slot into a 21 × 17.8 mm module with battery charging. It is a strong choice for small camera and audio projects with good official documentation; the main caveats are shared GPIOs, a higher deep-sleep current with the expansion board attached, and camera differences between batches."
  methodology: "This editorial assessment is based on published specifications and the manufacturer's documentation. Embedded Nerd has not physically tested the specific board or seller listing covered by this page."
  pros:
    - "Camera, digital microphone and microSD slot on a board the size of a thumb"
    - "ESP32-S3 with 8MB PSRAM and 8MB Flash, enough for camera streaming and small ML demos"
    - "Built-in Li-ion battery charging and a U.FL antenna connector"
    - "Detailed official Seeed Studio documentation, pin maps and examples"
  cons:
    - "The microphone, SD card and user LED share GPIOs with header pins, so available pins must be checked before wiring"
    - "Deep-sleep current is around 3 mA with the expansion board attached, far higher than the plain XIAO ESP32S3"
    - "Boards are usually supplied without pin headers, and the camera model (OV5640 or OV3660) can vary by batch"
seo_title: "XIAO ESP32S3 Sense: Specs, Pinout & Where to Buy"
seo_description: "Seeed Studio XIAO ESP32S3 Sense specs, full D0–D12 to GPIO pinout, OV5640 camera, mic and SD card pins, power use and where to buy."
page_id: product-seeed-xiao-esp32s3-sense
product_id: seeed-xiao-esp32s3-sense
english_url: /products/seeed-xiao-esp32s3-sense/
german_url: /de/products/seeed-xiao-esp32s3-sense/
spanish_url: /es/products/seeed-xiao-esp32s3-sense/
french_url: /fr/products/seeed-xiao-esp32s3-sense/
italian_url: /it/products/seeed-xiao-esp32s3-sense/
available_languages:
  - en
  - de
  - es
  - fr
  - it
  - it
category: Development Boards
manufacturer: "Seeed Studio"

image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
header:
  teaser: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image_alt: "Front view of the Seeed Studio XIAO ESP32S3 Sense with camera module"
alt: "Seeed Studio XIAO ESP32S3 Sense board, front view with camera module"

excerpt: "Seeed Studio XIAO ESP32S3 Sense with ESP32-S3, OV5640 camera, digital microphone, microSD slot, 8MB PSRAM and 8MB Flash in a 21 × 17.8 mm board."

description: "The Seeed Studio XIAO ESP32S3 Sense is a thumb-sized ESP32-S3 development board with 8 MB PSRAM, 8 MB Flash, Wi-Fi, Bluetooth LE and battery charging, plus a detachable expansion board with a camera, digital microphone and microSD slot. Several GPIOs are shared between the header, microphone, SD card and user LED, so check the pin tables before wiring."

categories:
  - ESP32
  - ESP32-S3
  - Development Boards
  - Camera Boards
tags:
  - XIAO ESP32S3 Sense
  - Seeed Studio XIAO
  - ESP32
  - ESP32-S3
  - ESP32 Camera
  - OV5640
  - PDM Microphone
  - microSD
  - Wi-Fi
  - Bluetooth LE
  - MicroPython

permalink: /products/seeed-xiao-esp32s3-sense/

specifications:
  - name: Processor
    value: "ESP32-S3R8, dual-core Xtensa LX7, up to 240 MHz"
  - name: Flash
    value: "8 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Camera
    value: "Detachable OV5640 with auto-focus (OV3660 on some boards)"
  - name: Microphone
    value: "Digital (PDM) microphone"
  - name: Storage
    value: "microSD slot on the expansion board, 32 GB FAT supported"
  - name: Wireless
    value: "2.4 GHz Wi-Fi and Bluetooth LE 5.0 / Bluetooth Mesh"
  - name: USB
    value: "USB Type-C"
  - name: Battery
    value: "3.7 V Li-ion with onboard charge management"
  - name: Dimensions
    value: "21 × 17.8 mm; 21 × 17.8 × 15 mm with expansion board"
  - name: Operating Temperature
    value: "−20 °C to 65 °C"

links:
  - title: "Seeed Studio XIAO ESP32-S3 getting started"
    icon: "fas fa-book"
    description: "Official specifications, pin map, setup guide and troubleshooting."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/"
  - title: "Pin multiplexing for XIAO ESP32-S3 (Sense)"
    icon: "fas fa-microchip"
    description: "Official guide to GPIO, ADC, I²C, SPI, UART and touch pin usage."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/"
  - title: "Seeed Studio product page"
    icon: "fas fa-store"
    description: "Manufacturer store page for the XIAO ESP32S3 Sense."
    url: "https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link"

related:
  - arduino-nano-esp32
  - esp32-devkit
  - raspberry-pi-pico-w
---
The Seeed Studio XIAO ESP32S3 Sense is a thumb-sized ESP32-S3 board with a detachable expansion board carrying a camera, a digital microphone and a microSD slot. It is also searched for as **XIAO ESP32-S3 Sense** or **Seeed XIAO ESP32S3 Sense**. Check that the listing is the **Sense** version before ordering, because the plain XIAO ESP32S3 looks almost identical but has no camera, microphone or SD slot.

The detail to understand before wiring anything is the **shared pins**: the microphone, SD card and user LED reuse GPIOs that are also available on the header. The pin tables below show exactly which ones.

## Product photos

<div class="product-image-gallery" style="display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:1rem;margin:1.5rem 0;">
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-front.webp" alt="Front view of the Seeed Studio XIAO ESP32S3 Sense camera board" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Front view: XIAO ESP32S3 Sense with camera module</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-camera-assembly.webp" alt="Seeed Studio XIAO ESP32S3 Sense with its camera expansion board assembled" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Camera and expansion board assembly</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-back.webp" alt="Back of the Seeed Studio XIAO ESP32S3 Sense showing its pin labels and pads" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Back view: pin labels and solder pads</figcaption>
  </figure>
</div>

## Is the XIAO ESP32S3 Sense Worth Buying?

Choose this board if you want a camera, microphone or SD logging on a board the size of a thumb: a small Wi-Fi camera, a sound or voice project, a wearable or a battery-powered logger. If you only need a small ESP32-S3 without those extras, the plain XIAO ESP32S3 has the same header layout and a much lower deep-sleep current. If you need more GPIOs and 16 MB of Flash, look at the XIAO ESP32-S3 Plus.

## XIAO ESP32S3 vs Sense vs Plus: which version should you buy?

| Feature | XIAO ESP32S3 | XIAO ESP32S3 Sense | XIAO ESP32-S3 Plus |
|---|---|---|---|
| Camera and microphone | No | Yes (expansion board) | No |
| microSD slot | No | Yes (expansion board) | No |
| Flash / PSRAM | 8 MB / 8 MB | 8 MB / 8 MB | 16 MB / 8 MB |
| GPIOs with PWM | 11 | 11 | 18 |
| Deep-sleep current (Seeed figure) | 14 µA | 3 mA with expansion board | 33.5 µA |
| Best fit | Smallest, lowest-power builds | Vision, audio and logging | More pins and Flash |

Prices change by seller, destination, shipping and selected variant. Check the live listing, the included accessories and the camera model before checkout.

<div class="en-product-cta__buttons">
  <a class="en-buy-button" href="/go/hardware/seeed-xiao-esp32s3-sense/" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-cart-shopping"></i></span><span class="en-buy-text"><strong>Check price — XIAO ESP32S3 Sense</strong><small>AliExpress · verify camera version and headers</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.amazon.com/Seeed-Studio-XIAO-ESP32-Sense/dp/B0C69FFVHH?tag=embeddednerd2-20" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fab fa-amazon"></i></span><span class="en-buy-text"><strong>Check price — Amazon</strong><small>Verify the Sense version and included accessories</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-store"></i></span><span class="en-buy-text"><strong>Buy — Seeed Studio (Pre-Soldered)</strong><small>Official store · pre-soldered version</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
</div>

## Specifications at a glance

| Specification | Details |
|---|---|
| MCU | ESP32-S3R8, dual-core Xtensa LX7, up to 240 MHz |
| Flash | 8 MB |
| PSRAM | 8 MB |
| Wireless | 2.4 GHz Wi-Fi, Bluetooth LE 5.0 / Bluetooth Mesh |
| Camera | Detachable OV5640 with auto-focus (2592 × 1944); some boards ship with an OV3660 (2048 × 1536); earlier boards used an OV2640 (1600 × 1200) |
| Microphone | Digital (PDM) microphone |
| Storage | microSD slot on the expansion board, 32 GB FAT supported |
| Interfaces | 1 × UART, 1 × I²C, 1 × I²S, 1 × SPI, 11 × GPIO with PWM, 9 × ADC |
| Buttons and LEDs | Reset, Boot, user LED, charge LED |
| Power | USB Type-C 5 V, or 3.7 V Li-ion battery |
| Antenna | U.FL connector; external antenna included in the package |
| Dimensions | 21 × 17.8 mm; 21 × 17.8 × 15 mm with expansion board |
| Operating temperature | −20 °C to 65 °C |

Specifications follow the Seeed Studio Wiki (checked 7 November 2026). Seeed states that the camera is moving from the OV3660 to the OV5640 with auto-focus, and that boards may ship with either during the transition.

## Camera, microphone and microSD

The expansion board plugs into a board-to-board connector and carries the camera, the PDM microphone and the microSD slot. Seeed's camera examples support the OV5640, OV3660 and OV2640, so the same sketches work, but only the OV5640 has auto-focus. The OV5640 module is also sold separately as a replacement.

Seeed states that, since June 2025, the factory firmware enables a default Wi-Fi access point with a published name and password. Flash your own firmware before deploying the board where other people can reach it.

## XIAO ESP32S3 Sense pinout: D0–D12 to GPIO

| XIAO pin | GPIO | Functions | Note |
|---|---:|---|---|
| D0 | GPIO1 | ADC, touch | General I/O |
| D1 | GPIO2 | ADC, touch | General I/O |
| D2 | GPIO3 | ADC, touch | Strapping pin (JTAG source) |
| D3 | GPIO4 | ADC, touch | General I/O |
| D4 / SDA | GPIO5 | I²C data, ADC, touch | Default I²C. See the [I2C Address Lookup](/tools/i2c-address-lookup/) and [I2C Scanner Tutorial](/i2c-scanner-tutorial/). |
| D5 / SCL | GPIO6 | I²C clock, ADC, touch | Default I²C |
| D6 / TX | GPIO43 | UART TX | Serial output |
| D7 / RX | GPIO44 | UART RX | Serial input |
| D8 / SCK | GPIO7 | SPI clock, ADC, touch | Shared with the SD card clock |
| D9 / MISO | GPIO8 | SPI MISO, ADC, touch | Shared with the SD card data in |
| D10 / MOSI | GPIO9 | SPI MOSI, ADC, touch | Shared with the SD card data out |
| D11 | GPIO42 | Touch | Shared with the microphone clock |
| D12 | GPIO41 | Touch | Shared with the microphone data |

Seeed notes that, although D11 and D12 (GPIO42 and GPIO41) are labelled as analog pins, the ESP32-S3 does not support ADC on them. Use D0–D5 and D8–D10 for analog reads.

Power pins: **5V** is the USB 5 V rail, **3V3** is the regulated 3.3 V output and **GND** is ground. All GPIOs are 3.3 V logic and must not receive 5 V. When the board runs from a battery, the 5V pin has no voltage.

## GPIO availability: pins used by the camera, microphone and SD card

According to Seeed's pin map, the camera, microphone and SD card do not overlap with each other, but some of them share GPIOs with the header pins.

| Function | GPIO | Shared with |
|---|---|---|
| Microphone clock (PDM) | GPIO42 | Header pin D11 |
| Microphone data (PDM) | GPIO41 | Header pin D12 |
| SD card chip select | GPIO21 | User LED |
| SD card clock / MISO / MOSI | GPIO7 / GPIO8 / GPIO9 | Header SPI pins D8 / D9 / D10 |
| Camera I²C data / clock | GPIO40 / GPIO39 | JTAG pins MTDO / MTCK |
| Camera data, clock and sync | GPIO10–18, 38, 47, 48 | Board-to-board connector only |

If you use the SD card, the user LED on GPIO21 is also the card's chip-select line, and any extra SPI device on D8–D10 shares a bus with the card and needs its own chip-select pin. If you use the microphone, treat D11 and D12 as taken.

## Power consumption and battery use

Typical figures published by Seeed for the Sense **with the expansion board attached**:

| Mode | Typical current |
|---|---|
| Wi-Fi active | 110 mA |
| Bluetooth LE active | 102 mA |
| Modem-sleep | 44 mA |
| Light-sleep | 5 mA |
| Deep sleep | 3 mA |
| Camera web server (USB) | about 140 mA average, 347 mA peak |

The board can run from a 3.7 V Li-ion battery and charge it over USB-C. Seeed notes that the negative battery pad is the one closest to the USB port, so check polarity before soldering. There is no GPIO dedicated to reading the battery voltage; measuring it needs an external divider on an ADC pin.

## Arduino, MicroPython and getting started

Seeed documents Arduino and MicroPython for the XIAO ESP32-S3 series, plus ESP-IDF and Zephyr guides. In the Arduino IDE, select **XIAO_ESP32S3** as the board and use ESP32 board package 2.0.8 or newer.

```cpp
const int ledPin = LED_BUILTIN; // GPIO21 on the XIAO ESP32S3
const int analogPin = A0;       // D0 = GPIO1 (ADC)

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // The user LED is active-low: LOW turns it on.
  digitalWrite(ledPin, LOW);
  delay(500);
  digitalWrite(ledPin, HIGH);
  delay(500);

  Serial.print("A0 = ");
  Serial.println(analogRead(analogPin));
}
```

Open the Serial Monitor at **115200 baud**. Because GPIO21 is also the SD card chip-select, do not toggle the LED while the SD card is in use. If the port disappears or an upload fails, hold the **Boot** button while connecting USB to enter bootloader mode.

- [Seeed Studio getting started guide](https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/)
- [Seeed Studio pin multiplexing guide](https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/)

## Where to buy

Check that the listing is the **Sense** version, which camera is included, the seller and the delivery destination. Seeed ships the board without pin headers by default, so look for a pre-soldered option or plan to solder your own. Offers vary by region and price is not fixed on this page.

As an affiliate, Embedded Nerd may earn a commission from qualifying purchases at no extra cost to you.

- [Seeed Studio XIAO ESP32S3 Sense (Pre-Soldered) — official store](https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link)

## FAQ

### Is the XIAO ESP32S3 Sense the same as the XIAO ESP32S3?

No. They share the same main board and header layout, but the Sense adds a detachable expansion board with a camera, a digital microphone and a microSD slot. The plain XIAO ESP32S3 has none of these and uses less power in deep sleep.

### What camera does the XIAO ESP32S3 Sense use?

Current boards use a detachable OV5640 camera with auto-focus, and some shipments use an OV3660 during the supply transition. Earlier boards used an OV2640, which has been discontinued. Seeed's examples support all three.

### Is the XIAO ESP32S3 Sense 5 V tolerant?

No. The GPIO pins use 3.3 V logic and must not receive 5 V. Use a logic-level shifter for 5 V sensors or modules.

### Can I use the camera, microphone and SD card at the same time?

According to Seeed's pin map they do not overlap with each other, so they can be used together. The microphone uses the D11 and D12 pins, the SD card shares the SPI pins D8–D10, and its chip select is the same GPIO as the user LED.

### Does the XIAO ESP32S3 Sense charge a battery?

Yes. It has Li-ion battery charge management and battery pads. When running from a battery, the 5V pin has no voltage, and there is no dedicated pin for reading the battery voltage.

### Does it come with pin headers?

Seeed ships the board without pin headers by default. Check whether the listing says pre-soldered, or solder your own headers.

### Does the XIAO ESP32S3 Sense work with MicroPython?

Yes. Seeed documents Arduino and MicroPython for the XIAO ESP32-S3 series. The programming environment does not change the 3.3 V limits or the pin mapping above.

## Compare other ESP32 boards

| Board | Best for |
|---|---|
| Seeed Studio XIAO ESP32S3 Sense | Tiny camera, audio and logging projects |
| [Arduino Nano ESP32](/products/arduino-nano-esp32/) | Nano footprint with ESP32-S3 and Arduino pin names |
| [ESP32 DevKit V1](/products/esp32-devkit/) | Low-cost general-purpose prototyping |
| [Raspberry Pi Pico W](/products/raspberry-pi-pico-w/) | RP2040 with Wi-Fi, MicroPython-friendly |

Not sure which board fits your project? Read our [Best ESP32 Boards](/best-esp32-boards/) guide or browse the [Development Boards category](/products/development-boards/).
