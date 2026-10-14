---
title: "ESP32-P4 Round Touchscreen Display Projects (with LVGL Code)"
title_tag: "ESP32-P4 Round Touchscreen Projects: 3 LVGL Examples"
description: "Build three ESP32-P4 round touchscreen projects with LVGL 9: a thermostat dial, live sensor gauge and focus timer, with setup steps and example UI code."
excerpt: "Learn the Waveshare ESP32-P4 3.4C and 4C round display hardware, then build three LVGL 9 interfaces: a thermostat dial, sensor gauge and focus timer."
date: 2026-10-12
last_modified_at: 2026-10-12
hide_post_pagination: true
layout: single
permalink: /esp32-p4-round-touchscreen-display-projects/
id: "https://embeddednerd.com/esp32-p4-round-touchscreen-display-projects/"
sidebar:
  nav: "embedded"
  related: true
  share: true
show_date: false
author: "Embedded Nerd"
read_time: false
header:
  teaser: /assets/images/products/esp32-p4-touch-lcd-3.4c-front.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/products/esp32-p4-touch-lcd-3.4c-front.webp
  og_image: /assets/images/products/esp32-p4-touch-lcd-3.4c-front.webp
  og_image_alt: "Waveshare ESP32-P4-WIFI6-Touch-LCD-3.4C round touchscreen board, front view"
categories:
  - ESP32-P4
  - Displays
tags:
  - esp32-p4
  - round display
  - touchscreen
  - lvgl
  - waveshare
toc: true
toc_label: "Contents"
toc_sticky: true
---

Round touchscreens used to mean tiny 1.28" modules with a few hundred pixels. The **ESP32-P4** changes that. It has a MIPI-DSI display interface, a lot of PSRAM and enough CPU for smooth LVGL animations, so a round screen can finally be big, sharp and responsive.

This guide covers the **ESP32-P4 round touchscreen display boards** that are available now, how a round screen changes the way you design a UI, and **three LVGL projects** you can build on them.


If you're still choosing hardware, start with our [complete ESP32 touchscreen displays guide]({{ site.baseurl }}/esp32-touchscreen-displays-guide/) for a broader comparison of screen sizes, touch technologies and display interfaces.

![Waveshare ESP32-P4-WIFI6-Touch-LCD-3.4C round touchscreen, front view](/assets/images/products/esp32-p4-touch-lcd-3.4c-front.webp)
*The 3.4-inch ESP32-P4 round touchscreen board. [View the product specifications and purchase options](/products/waveshare-esp32-p4-wifi6-touch-lcd-3-4c/).*

1. A touch thermostat dial
2. A live sensor gauge
3. A tap-to-start focus timer

> **Heads up:** the code below is the UI layer, written for LVGL 9. Display, touch and LVGL initialization come from the manufacturer's demo project for your board. I explain how to plug the UI code into it in the setup section.
{: .notice--info}

> **Testing note:** this is a project guide based on the manufacturer's documentation and LVGL 9 APIs. The UI examples have not been verified on the physical 3.4C or 4C hardware as part of this article. Start from the matching Waveshare demo, confirm display and touch initialization, and then integrate one UI at a time.

## The ESP32-P4 round display boards

At the time of writing, the board most makers find first is from Waveshare. It comes in two sizes. The specifications below are based on the [manufacturer's product listing](https://www.waveshare.com/esp32-p4-wifi6-touch-lcd-3.4c.htm). Check the exact variant before ordering, because the 3.4C and 4C have different display sizes and resolutions.

| | **ESP32-P4-WIFI6-Touch-LCD-3.4C** | **ESP32-P4-WIFI6-Touch-LCD-4C** |
|---|---|---|
| Display | 3.4" round IPS | 4" round IPS |
| Resolution | 800 × 800 | 720 × 720 |
| Touch | 10-point capacitive (GT9271) | 10-point capacitive (GT9271) |
| Brightness | 300 cd/m² | 350 cd/m² |
| Display interface | 2-lane MIPI-DSI | 2-lane MIPI-DSI |
| Board outline | 115 × 115 mm | 126 × 126 mm |

Both share the same core hardware:

- **ESP32-P4** (ESP32-P4NRW32): dual-core RISC-V at 400 MHz, 32 MB PSRAM, 32 MB flash
- **ESP32-C6 module** for Wi-Fi 6 and Bluetooth 5 (LE). The P4 has no radio of its own, so wireless goes through the C6
- Two microphones with an ES7210 front end, an ES8311 audio codec and a speaker connector
- MIPI-CSI camera connector, microSD slot, USB OTG Type-A and two USB-C ports
- A 40-pin GPIO header and an SH1.0 4-pin I²C header for external sensors
- Optical-bonded toughened glass front

For current availability and official specifications, compare the two variants on the [Waveshare product page](https://www.waveshare.com/esp32-p4-wifi6-touch-lcd-3.4c.htm). You can also [view the ESP32-P4-WIFI6-Touch-LCD-3.4C product page on Embedded Nerd](/products/waveshare-esp32-p4-wifi6-touch-lcd-3-4c/) and use the purchase link there. Prices and stock change, so confirm the selected size before ordering.

![Rear view of the Waveshare ESP32-P4-WIFI6-Touch-LCD-3.4C showing its connectors and expansion header](/assets/images/products/esp32-p4-touch-lcd-3.4c-back.webp)
*Rear view: check connector placement, expansion headers and enclosure clearance before planning a build.*

The 3.4C and 4C are two variants of the same product family, not interchangeable panels: the 3.4C is 800 × 800 in a 115 × 115 mm outline, while the 4C is 720 × 720 in a 126 × 126 mm outline. Check the exact SKU in the seller's variant selector before checkout.

**Why the P4 instead of an ESP32-S3?** Resolution and speed. An S3 round board is typically 240 × 240 over SPI. The P4 drives an 800 × 800 panel over MIPI-DSI with a 2D pixel accelerator (PPA) and plenty of PSRAM for frame buffers. If your project is a small gadget, an S3 or a plain SPI module is cheaper and simpler. If you want a polished control panel, the P4 is the better fit.

## Round display design basics

A round panel is still a square framebuffer. The corners exist in memory but never reach your eyes. Four rules make round UIs look right.

**1. Center everything.** LVGL's `lv_obj_center()` and `LV_ALIGN_CENTER` do most of the work. Think in rings and arcs, not rows and columns.

**2. Know your safe square.** The largest square that fits inside a circle has a side of about 70.7% of the diameter. That is roughly **566 px on the 800 × 800 panel** and **509 px on the 720 × 720 one**. Keep rectangular layouts and text blocks inside it.

**3. Keep touch targets away from the edge.** The bezel and the curve make edge taps unreliable. Keep buttons at least 60 px across and inside the safe square.

**4. Budget memory.** A full frame at RGB565 is about 1.3 MB at 800 × 800 (2 bytes per pixel), or about 1.9 MB at RGB888. That is easy for 32 MB of PSRAM but not for internal RAM, so make sure LVGL's buffers live in PSRAM. The demo project's configuration already does this.

## Getting set up

The manufacturer supports **ESP-IDF** with LVGL demos. Arduino is mentioned in the documentation but with little detail, so for a P4 round board the sensible path is ESP-IDF.

1. Install ESP-IDF using the version recommended on the board's [Waveshare wiki page](https://www.waveshare.com/wiki/ESP32-P4-WIFI6-Touch-LCD-4C). Both board sizes use the same family of examples.
2. Download the demo projects from the wiki and build the LVGL demo first. Confirm that the screen lights up and touch works before changing anything.
3. Find the place where the demo starts its UI. It is usually a function called from `app_main()`.
4. Replace that call with one of the `create_*_ui()` functions below. They only use LVGL, so they do not care about the display driver.
5. In `idf.py menuconfig`, open the LVGL component settings and enable `LV_FONT_MONTSERRAT_48` (used for the big numbers) if it is not already on.

**A note on locking.** LVGL is not thread-safe. If you call LVGL functions from your own FreeRTOS task, wrap them in the lock your demo provides, for example `bsp_display_lock(0)` / `bsp_display_unlock()` in Espressif-style board support packages, or `lvgl_port_lock(0)` / `lvgl_port_unlock()` with `esp_lvgl_port`. Check which one your demo uses. Code inside an LVGL timer or event callback already runs with the lock held, so it needs nothing extra. All three projects below create the UI once and then work only through callbacks and timers.

## Project 1: Touch thermostat dial

A circular dial is the textbook use of a round touchscreen. Drag around the ring to set a temperature, and the number in the middle follows.

The arc is an interactive `lv_arc`. We use tenths of a degree as the arc value, so the range 160–300 means 16.0–30.0 °C.

```c
#include "lvgl.h"

static lv_obj_t *temp_label;

static void arc_changed_cb(lv_event_t *e)
{
    lv_obj_t *arc = (lv_obj_t *)lv_event_get_target(e);
    int32_t v = lv_arc_get_value(arc);          // tenths of a degree
    lv_label_set_text_fmt(temp_label, "%d.%d °C", (int)(v / 10), (int)(v % 10));
}

void create_thermostat_ui(void)
{
    lv_obj_t *scr = lv_screen_active();
    lv_obj_set_style_bg_color(scr, lv_color_black(), 0);

    int32_t size = LV_MIN(LV_HOR_RES, LV_VER_RES) - 40;

    lv_obj_t *arc = lv_arc_create(scr);
    lv_obj_set_size(arc, size, size);
    lv_obj_center(arc);

    lv_arc_set_bg_angles(arc, 135, 45);          // 270 degree sweep, gap at the bottom
    lv_arc_set_range(arc, 160, 300);             // 16.0 to 30.0 °C
    lv_arc_set_value(arc, 215);                  // starting at 21.5 °C

    lv_obj_set_style_arc_width(arc, 36, LV_PART_MAIN);
    lv_obj_set_style_arc_width(arc, 36, LV_PART_INDICATOR);
    lv_obj_set_style_arc_color(arc, lv_color_hex(0x2A2A2E), LV_PART_MAIN);
    lv_obj_set_style_arc_color(arc, lv_color_hex(0xFF9F0A), LV_PART_INDICATOR);
    lv_obj_set_style_pad_all(arc, 24, LV_PART_KNOB);   // bigger knob, easier to grab

    temp_label = lv_label_create(scr);
    lv_obj_set_style_text_font(temp_label, &lv_font_montserrat_48, 0);
    lv_obj_set_style_text_color(temp_label, lv_color_white(), 0);
    lv_label_set_text(temp_label, "21.5 °C");
    lv_obj_center(temp_label);

    lv_obj_add_event_cb(arc, arc_changed_cb, LV_EVENT_VALUE_CHANGED, NULL);
}
```

**Make it useful.**

- In `arc_changed_cb`, send the new value over MQTT, Zigbee or HTTP to your real thermostat. The Wi-Fi link goes through the on-board ESP32-C6, so use the networking examples from the manufacturer's demo.
- Switch `0xFF9F0A` for blue below some temperature to show heating versus cooling.
- If the `°` shows up as an empty box, your selected font does not include it. Use a font that does, or write the unit as plain `C`.

## Project 2: Live sensor gauge

This is the same arc widget without the touch. It shows a value from 0 to 100 with a color that shifts from green to red.

The sketch below includes a fake sensor so you can test the display with no extra hardware. Replace `read_sensor_percent()` with a real reading from a sensor on the board's SH1.0 I²C header.

```c
#include "lvgl.h"

static lv_obj_t *gauge_arc;
static lv_obj_t *gauge_label;

// Demo data: a value that sweeps 0..100..0. Replace with a real reading.
static int read_sensor_percent(void)
{
    static int v = 0, dir = 1;
    v += dir * 2;
    if (v >= 100) { v = 100; dir = -1; }
    if (v <= 0)   { v = 0;   dir =  1; }
    return v;
}

static lv_color_t color_for(int pct)
{
    if (pct < 50) return lv_color_hex(0x30D158);   // green
    if (pct < 80) return lv_color_hex(0xFF9F0A);   // orange
    return lv_color_hex(0xFF453A);                 // red
}

static void gauge_timer_cb(lv_timer_t *t)
{
    int pct = read_sensor_percent();
    lv_arc_set_value(gauge_arc, pct);
    lv_obj_set_style_arc_color(gauge_arc, color_for(pct), LV_PART_INDICATOR);
    lv_label_set_text_fmt(gauge_label, "%d%%", pct);
}

void create_gauge_ui(void)
{
    lv_obj_t *scr = lv_screen_active();
    lv_obj_set_style_bg_color(scr, lv_color_black(), 0);

    int32_t size = LV_MIN(LV_HOR_RES, LV_VER_RES) - 40;

    gauge_arc = lv_arc_create(scr);
    lv_obj_set_size(gauge_arc, size, size);
    lv_obj_center(gauge_arc);
    lv_arc_set_bg_angles(gauge_arc, 135, 45);
    lv_arc_set_range(gauge_arc, 0, 100);
    lv_arc_set_value(gauge_arc, 0);

    lv_obj_remove_style(gauge_arc, NULL, LV_PART_KNOB);          // no knob
    lv_obj_remove_flag(gauge_arc, LV_OBJ_FLAG_CLICKABLE);        // display only
    lv_obj_set_style_arc_width(gauge_arc, 36, LV_PART_MAIN);
    lv_obj_set_style_arc_width(gauge_arc, 36, LV_PART_INDICATOR);
    lv_obj_set_style_arc_color(gauge_arc, lv_color_hex(0x2A2A2E), LV_PART_MAIN);

    gauge_label = lv_label_create(scr);
    lv_obj_set_style_text_font(gauge_label, &lv_font_montserrat_48, 0);
    lv_obj_set_style_text_color(gauge_label, lv_color_white(), 0);
    lv_label_set_text(gauge_label, "0%");
    lv_obj_center(gauge_label);

    lv_timer_create(gauge_timer_cb, 200, NULL);   // update 5 times a second
}
```

**Make it real.** Read your sensor in `read_sensor_percent()`, for example a temperature, humidity or CO₂ value mapped to 0–100. If the I²C call can block, do it in a separate FreeRTOS task and share the latest value through a variable, so the LVGL timer stays fast and the animation stays smooth.

If you need to find the I²C address of a new sensor first, use our [I²C Scanner tutorial]({{ site.baseurl }}/i2c-scanner-tutorial/) before wiring the sensor into this project.

## Project 3: Tap-to-start focus timer

A countdown ring is a nice use of a touchscreen: tap anywhere to start, tap again to pause. When the ring runs out, it turns green. Tap once more to reset.

```c
#include "lvgl.h"

#define FOCUS_SECONDS (25 * 60)

static lv_obj_t   *ring;
static lv_obj_t   *time_label;
static lv_timer_t *tick_timer;
static int         remaining = FOCUS_SECONDS;
static bool        running   = false;

static void show_time(void)
{
    lv_arc_set_value(ring, remaining);
    lv_label_set_text_fmt(time_label, "%02d:%02d", remaining / 60, remaining % 60);
}

static void tick_cb(lv_timer_t *t)
{
    if (remaining > 0) remaining--;
    show_time();

    if (remaining == 0) {
        lv_timer_pause(tick_timer);
        running = false;
        lv_obj_set_style_arc_color(ring, lv_color_hex(0x30D158), LV_PART_INDICATOR);
    }
}

static void tap_cb(lv_event_t *e)
{
    if (remaining == 0) {                       // finished: reset
        remaining = FOCUS_SECONDS;
        lv_obj_set_style_arc_color(ring, lv_color_hex(0xFF453A), LV_PART_INDICATOR);
        show_time();
        return;
    }
    running = !running;
    if (running) lv_timer_resume(tick_timer);
    else         lv_timer_pause(tick_timer);

    /* A tap on the arc can change its value; keep it synchronized with the countdown. */
    show_time();
}

void create_focus_timer_ui(void)
{
    lv_obj_t *scr = lv_screen_active();
    lv_obj_set_style_bg_color(scr, lv_color_black(), 0);

    int32_t size = LV_MIN(LV_HOR_RES, LV_VER_RES) - 40;

    ring = lv_arc_create(scr);
    lv_obj_set_size(ring, size, size);
    lv_obj_center(ring);
    lv_arc_set_bg_angles(ring, 0, 360);          // full circle
    lv_arc_set_rotation(ring, 270);              // start at 12 o'clock
    lv_arc_set_range(ring, 0, FOCUS_SECONDS);
    lv_obj_remove_style(ring, NULL, LV_PART_KNOB);
    /* Keep the arc clickable so it can receive taps; show_time() restores its value after each tap. */
    lv_obj_set_style_arc_width(ring, 30, LV_PART_MAIN);
    lv_obj_set_style_arc_width(ring, 30, LV_PART_INDICATOR);
    lv_obj_set_style_arc_color(ring, lv_color_hex(0x2A2A2E), LV_PART_MAIN);
    lv_obj_set_style_arc_color(ring, lv_color_hex(0xFF453A), LV_PART_INDICATOR);

    time_label = lv_label_create(scr);
    lv_obj_set_style_text_font(time_label, &lv_font_montserrat_48, 0);
    lv_obj_set_style_text_color(time_label, lv_color_white(), 0);
    lv_obj_center(time_label);

    show_time();

    tick_timer = lv_timer_create(tick_cb, 1000, NULL);
    lv_timer_pause(tick_timer);                  // wait for the first tap

    /* The screen handles taps on the background. Widgets need their own callbacks
       because LVGL events do not bubble to parents unless explicitly enabled. */
    lv_obj_add_flag(scr, LV_OBJ_FLAG_CLICKABLE);
    lv_obj_add_flag(time_label, LV_OBJ_FLAG_CLICKABLE);
    lv_obj_add_event_cb(time_label, tap_cb, LV_EVENT_CLICKED, NULL);
    lv_obj_add_event_cb(ring, tap_cb, LV_EVENT_CLICKED, NULL);
    lv_obj_add_event_cb(scr, tap_cb, LV_EVENT_CLICKED, NULL);
}
```

**Ideas to extend it.**

- Add a 5-minute break mode that alternates with focus time.
- Play a sound at zero. The board has a speaker connector and a codec, and the manufacturer's audio demo shows how to drive it.
- Show the next calendar event over Wi-Fi under the timer.

## Troubleshooting

**Black screen after flashing**
Build and run the manufacturer's LVGL demo unchanged first. If that works, the problem is in your UI code. If it does not, check the power and programming connection, and use the USB-C port the wiki designates for flashing.

**UI works but touch does nothing**
Touch comes from the GT9271 over I²C. Confirm that touch works in the demo, then check that your project keeps the same initialization. Also check that the object you tap is clickable. The sensor gauge is display-only and ignores touch; the focus timer keeps its arc clickable so taps can start or pause the countdown.

**Crash or watchdog reset inside LVGL calls**
You probably called LVGL from your own task without the display lock. Use the lock functions from your demo, or move the code into an `lv_timer` callback.

**Text looks tiny or missing**
Large Montserrat fonts are off by default. Enable them in the LVGL section of `menuconfig` and rebuild. Each big font adds to the firmware size.

**Wi-Fi does not connect**
Wi-Fi runs on the ESP32-C6 module, not on the P4. Use the networking example from the manufacturer's demo, and follow their instructions if the C6 firmware needs updating.

**UI feels slow**
Lower the animation load first: fewer redraws, smaller changing areas, and no full-screen redraw on every timer tick. In the demo's LVGL settings, make sure the draw buffers are in PSRAM and sized sensibly.

## Product page and buying checklist

If you want the exact 3.4-inch board shown in the photos, see the [Waveshare ESP32-P4-WIFI6-Touch-LCD-3.4C product page on Embedded Nerd](/products/waveshare-esp32-p4-wifi6-touch-lcd-3-4c/). It includes the board specifications and a purchase link for this specific model.

Before ordering, verify these details on the listing:

- **Variant:** select 3.4C (800 × 800), not 4C (720 × 720).
- **Included items:** check whether the listing includes the speaker and the two 4-pin cables; bundle contents can vary.
- **Power and programming:** review the manufacturer's documentation for the correct USB connector and flashing procedure.
- **Mechanical fit:** the board outline is about 115 × 115 mm, so plan the enclosure around the complete assembly, not only the visible glass.
- **Software support:** begin with the manufacturer's ESP-IDF demo and confirm the screen and touch work before porting custom LVGL code.

The product link may earn Embedded Nerd a commission if you buy through it, at no extra cost to you.

## Where to go next

- Use LVGL's `lv_scale` widget to build a clock face with needles. It suits round screens well.
- Combine the on-board microphones and the Wi-Fi connection for a voice-controlled panel. The manufacturer lists voice interaction as a target use.
- Stream a camera into the round screen with the MIPI-CSI connector. The manufacturer's demos include a camera-to-display example.
- On a tighter budget, a 1.28" SPI round module on a classic ESP32 or an ESP32-S3 round board is a good first step, with lower resolution and no MIPI-DSI.
- For help comparing display boards by size, touch and interface, try the [ESP32 Touchscreen Selector]({{ site.baseurl }}/tools/esp32-touchscreen-selector/).
- For another ESP32-P4 design, see our [ESP32-P4 Weather Station architecture guide]({{ site.baseurl }}/esp32-p4-weather-station/).
- If you're considering a rectangular alternative, read our [Sunton ESP32-8048S043C guide]({{ site.baseurl }}/sunton-esp32-8048s043c-guide/) for an integrated 4.3-inch ESP32-S3 touchscreen.

## FAQ

**What is the best ESP32-P4 round touchscreen display?**
The most widely available option is Waveshare's ESP32-P4-WIFI6-Touch-LCD, in a 3.4" 800 × 800 version and a 4" 720 × 720 version. Both have 10-point capacitive touch, Wi-Fi 6 and Bluetooth 5 through an ESP32-C6 module, microphones and a speaker connector.

**Does the ESP32-P4 have Wi-Fi?**
Not by itself. On these boards, Wi-Fi and Bluetooth come from a separate ESP32-C6 module connected to the P4.

**Can I use Arduino on an ESP32-P4 round display?**
It is possible on ESP32-P4 boards with displays, but for these round boards the manufacturer's main support is ESP-IDF with LVGL examples. Start there.

**Why use LVGL on a round display?**
It gives you arcs, scales, labels, touch handling and animations out of the box. Its arc widget is a natural fit for dials, gauges and progress rings.

**Do I need PSRAM for a round display?**
For a high-resolution panel like 800 × 800, yes. A single RGB565 frame is about 1.3 MB. The P4 boards listed here have 32 MB of PSRAM.

**Will this code work on other round ESP32 boards?**
The UI code uses only LVGL 9, so it ports to any round board that runs LVGL. Only the display and touch initialization changes.
