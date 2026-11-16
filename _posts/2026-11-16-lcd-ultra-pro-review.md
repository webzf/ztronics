---
title: "LCD Ultra Pro Review: A Visual LVGL Editor for ESP32 Displays"
title_tag: "LCD Ultra Pro: Visual LVGL Editor for ESP32 Displays"
layout: single
permalink: /lcd-ultra-pro-review/
lang: en
page_id: article-lcd-ultra-pro-review
translation_id: lcd-ultra-pro-review
internal_links: true
excerpt: "Explore LCD Ultra Pro, a browser-based visual editor for ESP32 displays. Design LVGL interfaces, add logic with visual rules, test in a browser and export an Arduino project."
show_date: false
read_time: false
last_modified_at: 2026-11-16
header:
  teaser: https://lcdultrapro.com/press/full/demo-smart-home.jpg
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: https://lcdultrapro.com/press/full/demo-smart-home.jpg
  og_image: https://lcdultrapro.com/press/full/demo-smart-home.jpg
  og_image_alt: "LCD Ultra Pro visual editor showing a smart home dashboard for an ESP32 touchscreen"
categories:
  - Displays
  - ESP32
tags:
  - ESP32
  - ESP32-S3
  - LVGL
  - LCD Ultra Pro
  - touchscreen
  - Arduino
  - MQTT
  - Home Assistant
sidebar:
  nav: "embedded"
related: true
related_posts:
  - /esp32-touchscreen-displays-guide/
  - /tools/esp32-touchscreen-selector/
share: true
seo_title: "LCD Ultra Pro: Visual LVGL Editor for ESP32 Displays"
seo_description: "Explore LCD Ultra Pro, a free browser-based LVGL editor for ESP32 displays. See its visual rules, USB Live preview, Arduino export and limitations."
---

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "TechArticle",
      "@id": {{ page.url | absolute_url | append: "#article" | jsonify }},
      "headline": {{ page.title | jsonify }},
      "description": {{ page.seo_description | default: page.excerpt | strip_html | strip_newlines | jsonify }},
      "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": {{ page.url | absolute_url | jsonify }}
      },
      "dateModified": {{ page.last_modified_at | date_to_xmlschema | jsonify }},
      "author": {
        "@type": "Organization",
        "name": "Embedded Nerd",
        "url": "https://embeddednerd.com/"
      },
      "publisher": {
        "@type": "Organization",
        "name": "Embedded Nerd",
        "url": "https://embeddednerd.com/"
      }
    },
    {
      "@type": "BreadcrumbList",
      "@id": {{ page.url | absolute_url | append: "#breadcrumb" | jsonify }},
      "itemListElement": [
        {
          "@type": "ListItem",
          "position": 1,
          "name": "Home",
          "item": "https://embeddednerd.com/"
        },
        {
          "@type": "ListItem",
          "position": 2,
          "name": {{ page.title | jsonify }},
          "item": {{ page.url | absolute_url | jsonify }}
        }
      ]
    }
  ]
}
</script>

Designing a touchscreen interface for an ESP32 usually involves more than arranging a few buttons. You need a display driver, a graphics library, touch input, memory configuration and application code. With **LVGL**, even a small change to the layout can mean editing C code and compiling the project again.

**LCD Ultra Pro** takes a different approach: it is a browser-based visual editor for ESP32 display boards. You arrange widgets on a canvas, define their behaviour with visual rules, test the interface in the browser and export an Arduino project.

The project is currently offered as a free open beta. This article looks at how the editor is structured, what its workflow includes and where its compatibility limits matter.

> **Disclosure and testing note:** The LCD Ultra Pro developer provided the screenshots, fact sheet and demonstration video used in this article. We have not independently tested the editor on a physical display or compiled an exported project on our own hardware. Feature descriptions and compatibility figures below are attributed to the developer's supplied material and documentation.

## What is LCD Ultra Pro?

LCD Ultra Pro is a visual UI editor built for ESP32 and ESP32-S3 display boards. It runs in a web browser and uses **LVGL 8.4 compiled to WebAssembly** for the design canvas. The exported Arduino project uses LVGL 8.4 as well.

The idea is to keep the main stages of interface development in one place:

1. Select the exact display board.
2. Design one or more screens with drag-and-drop widgets.
3. Add behaviour through visual event rules.
4. Test the layout and rules in Live Preview.
5. Export the Arduino project and upload it to the board.

The editor itself does not require a desktop application installation. USB Live is a separate feature and requires a supported board and a browser with Web Serial support.

| Item | Details |
|---|---|
| Editor | Browser-based |
| Target boards | ESP32 and ESP32-S3 |
| Graphics library | LVGL 8.4 |
| Design canvas | LVGL 8.4 compiled to WebAssembly |
| Main export | Arduino project ZIP |
| Browser for editing | Chrome, Edge or Firefox |
| Browser for USB Live | Chrome or Edge |
| Price | Free during the open beta |

[Open the LCD Ultra Pro editor](https://app.lcdultrapro.com/) or visit the [official LCD Ultra Pro website](https://lcdultrapro.com/).

![LCD Ultra Pro editor showing a smart home dashboard on a Waveshare ESP32-S3-LCD-7B display project](https://lcdultrapro.com/press/full/demo-smart-home.jpg)
*The editor canvas with a smart home dashboard. Screenshot supplied by the LCD Ultra Pro developer.*

## Step 1: Select your exact ESP32 display board

A new project starts with a board picker. Instead of creating a generic canvas and configuring the display later, you select the board first. The editor then uses that board's resolution and shape for the design canvas.

The board cards show information such as:

- Display resolution and interface.
- Touch controller.
- Flash and PSRAM.
- Available GPIO pins.
- Driver and testing status.

Some entries have status labels such as **Verified**, **Vendor Matched** or **USB Live**. These labels are important: being listed in the catalog does not automatically mean that a board can currently be exported or used with USB Live.

![LCD Ultra Pro new project window with the ESP32 display board picker](https://lcdultrapro.com/press/full/board-picker.jpg)
*The board picker helps identify the exact panel before creating a project. Screenshot supplied by the developer.*

For a first project, choose the exact model and revision rather than a similar-looking board. Display controllers, touch controllers and GPIO assignments can differ between boards that appear to belong to the same product family.

## Step 2: Build the screen with LVGL widgets

The editor has two widget categories: standard LVGL widgets and ready-made Smart components.

### Standard LVGL widgets

The supplied fact sheet lists **33 standard LVGL widgets**, including common interface elements such as:

- Button, label and switch.
- Slider, dropdown, roller and textarea.
- Button matrix, keyboard and color wheel.
- Arc, bar, meter, chart and table.
- Container, tab view, tile view and window.

You can position and resize widgets on the canvas, then adjust their geometry, text, colours and other properties. The editor also includes layers, rulers, snapping, zoom and undo controls.

### Smart widgets and ready-made screens

The Smart tab contains **20 ready-made components** in the supplied fact sheet. These are intended to provide more complete functions than a basic button or label.

Examples include:

- Wi-Fi Setup and MQTT Setup.
- Date & Time, Clock and Weather Screen.
- Weekly Schedule, On/Off Timer and Time Switch.
- PIN Lock and Settings.
- Wi-Fi Status, MQTT Value, MQTT Switch and MQTT Chart.

The available Smart widgets can depend on the selected board. The supplied screenshots, for example, show 20 Smart widgets on the 7-inch Waveshare project and 12 on the round 2.1-inch MaTouch project.

![LCD Ultra Pro Smart widget palette with WiFi, MQTT, time and settings components](https://lcdultrapro.com/press/full/smart-widgets.jpg)
*The Smart tab groups ready-made screens and components. Screenshot supplied by the developer.*

The project also includes **19 demo projects** that open directly in the editor. A smart home dashboard or thermostat is a useful starting point because you can inspect its widgets and rules instead of building everything from an empty screen.

![LCD Ultra Pro thermostat interface for the 2.1-inch round Makerfabs MaTouch display](https://lcdultrapro.com/press/full/thermostat-round.jpg)
*A thermostat demo for the round 2.1-inch MaTouch Rotary display. Screenshot supplied by the developer.*

## Step 3: Add behaviour with visual rules

A visual layout is only useful when its controls do something. LCD Ultra Pro handles this through a **What it does** editor attached to widgets and events.

For example, a button can publish an MQTT message, change a switch state or navigate to another screen. An incoming MQTT message can update a label. A timer can trigger an action after a set interval.

The rule editor has two views.

### Beginner view

The Beginner view describes actions as readable sentences and provides quick-start recipes for common tasks. Examples in the supplied material include:

- Switch a relay.
- Turn a pin on for a set time.
- Control an LED strip.
- Beep a buzzer.
- Send an MQTT command.
- Turn the display off.
- Open another screen.
- Show a message or hide a widget.

This is the more approachable starting point if you are not familiar with LVGL event callbacks.

![LCD Ultra Pro Beginner rule editor showing quick-start actions and readable event rules](https://lcdultrapro.com/press/full/rules-beginner-view.jpg)
*Beginner mode presents common actions as readable rules. Screenshot supplied by the developer.*

### Advanced view

The Advanced view exposes the individual options for each rule. Depending on the action, these can include MQTT topics, message values, formatting, delivery settings, retain options and conditions.

That extra detail matters when a project needs more than a simple button action. You can inspect and adjust the rule rather than being restricted to a fixed preset.

![LCD Ultra Pro Advanced rule editor with MQTT topic, message, QoS and widget state settings](https://lcdultrapro.com/press/full/rules-advanced-view.jpg)
*Advanced mode exposes the options behind each event rule. Screenshot supplied by the developer.*

The supplied fact sheet lists **100 ready-made rules**. They provide a starting point, but a real project still needs its topics, pins, conditions and hardware behaviour configured correctly.

## Step 4: Test the interface before exporting

LCD Ultra Pro provides two different ways to preview a project. They solve different problems and should not be confused.

### Live Preview: test the interface in the browser

Live Preview runs the interface and its visual rules inside the browser. You can click buttons, move sliders and test how the screen responds.

The supplied demonstration also shows a simulated MQTT broker. You can enter a topic and message to see how the interface reacts and what it publishes. This is useful for checking event logic without connecting a physical board.

![LCD Ultra Pro Live Preview window with a simulated MQTT broker and smart home dashboard](https://lcdultrapro.com/press/full/live-preview.jpg)
*Live Preview lets you interact with the design and simulate MQTT messages in the browser. Screenshot supplied by the developer.*

### USB Live: mirror the design onto a real display

USB Live sends the editor's canvas to a supported physical board over USB while you work. The developer's instructions describe installing a small preview program once per board, then starting a USB session from the editor.

It uses the browser's Web Serial API, so **Chrome or Edge is required**. If a board has two USB-C connectors, the instructions specify using its native USB port rather than the UART connector.

The developer lists three supported USB Live boards:

- Waveshare ESP32-S3-LCD-7B.
- Makerfabs MaTouch ESP32-S3 Parallel TFT 4.3-inch.
- Makerfabs MaTouch Rotary IPS 2.1-inch.

There are two important limitations:

1. USB Live is a **picture-only preview**. Touch input, buttons and rules do not run on the physical board in this mode.
2. The design is not stored on the board. The editor must remain open, and you still need to export and upload the Arduino project to run the finished application with touch and behaviour.

This makes USB Live useful for checking the appearance and layout on a real panel, but it is not a replacement for uploading and testing the finished firmware.

![LCD Ultra Pro USB Live setup window showing the steps to install and run the preview on a supported board](https://lcdultrapro.com/press/full/usb-live-window.jpg)
*USB Live setup and board selection. Screenshot supplied by the developer.*

The following demonstration clip was also provided by the developer:

<video controls preload="metadata" poster="https://lcdultrapro.com/press/usb-live-demo-poster.jpg" style="width:100%;height:auto;">
  <source src="https://lcdultrapro.com/videos/usb-live-demo.mp4" type="video/mp4">
  Your browser does not support embedded video. <a href="https://lcdultrapro.com/videos/usb-live-demo.mp4">Open the USB Live demonstration video</a>.
</video>

## Custom Arduino code when visual rules are not enough

The visual rule system does not remove the option to write code. LCD Ultra Pro includes a Custom Code window for adding your own Arduino code to the generated `ui_events.cpp` file.

The supplied screenshots show three insertion points:

- **Top of file:** includes, pin definitions, variables and other declarations.
- **Once at startup:** initialization code such as `pinMode()` or `sensor.begin()`.
- **In an event:** code that should run when a selected event occurs.

The editor also lists free pins for the selected board and provides clickable code examples. The supplied material specifies a limit of 16,384 characters in the custom code field.

One limitation is worth remembering: custom code runs on the physical board after the exported project is uploaded. It is not executed by Live Preview or USB Live.

![LCD Ultra Pro Custom Code window with startup, global and event code insertion points](https://lcdultrapro.com/press/full/custom-code-window.jpg)
*Custom code can be added to the generated Arduino event file. Screenshot supplied by the developer.*

## Export the Arduino project

When the interface is ready, Export generates a ZIP containing an Arduino project. The supplied example for the Waveshare ESP32-S3-LCD-7B contains 31 files, including:

- Generated UI source and header files.
- Event and rule code in `ui_events.cpp`.
- Display, touch and I/O expander driver files for the selected board.
- The LVGL configuration file, `lv_conf.h`.
- Montserrat font files.
- A README with board settings and setup instructions.
- A `secrets_example.h` file for Wi-Fi and MQTT credentials.

![LCD Ultra Pro editor showing the completed export notification](https://lcdultrapro.com/press/full/export-done.jpg)
*The editor confirms when the project export has finished. Screenshot supplied by the developer.*

![LCD Ultra Pro exported Arduino ZIP contents and generated README with board configuration](https://lcdultrapro.com/press/full/export-zip-and-readme.jpg)
*The ZIP contains the generated source, board support files and a README with configuration details. Screenshot supplied by the developer.*

### Example: Waveshare ESP32-S3-LCD-7B Arduino settings

The generated README shown in the supplied material specifies these settings for that particular board:

| Arduino IDE option | Setting |
|---|---|
| Board | ESP32S3 Dev Module |
| PSRAM | OPI PSRAM |
| Flash Size | 16MB |
| Partition Scheme | 16M Flash (3MB APP/9.9MB FATFS) |
| USB CDC On Boot | Enabled |
| Upload Speed | 921600 |
| LVGL library | 8.4.x |

These settings are for the Waveshare ESP32-S3-LCD-7B example, not universal settings for every ESP32 display in the catalog. Follow the README generated for the board you actually select.

The README also recommends extracting each new export into a **new, empty folder**. Reusing an old export directory can leave source files from deleted screens or previous versions, which may cause build problems.

Wi-Fi and MQTT credentials are kept separately in a local `secrets.h` file. The developer states that these credentials are not included in the project file or uploaded to the cloud. As with any tool that handles credentials, check the generated files and the current privacy documentation before using it with sensitive network details.

## Board support: 101 listed does not mean 101 export-ready

The board catalog is one of the most important parts of LCD Ultra Pro, but the support figures need context.

The November 2026 fact sheet supplied for this article lists the following figures:

| Support level | Boards |
|---|---:|
| Boards in the catalog | 101 |
| Boards with an export driver | 60 |
| Matched against the manufacturer's example code | 42 |
| Compiled with arduino-cli | 15 |
| Tested on the developer's own hardware | 3 |

The remaining **41 catalog entries do not have an export driver** in that snapshot. Their specifications may be available in the wiki, but you cannot currently export a project for them.

These are different levels of support. A board can be listed with specifications without having a driver. A driver matched against a manufacturer's example is not the same as a successful compile, and a successful compile is not the same as testing on the physical board.

Before choosing a display for a project, check its status in the board picker and confirm that the exact board has an export driver. If USB Live is important, check that the board is one of the three listed above.

The catalog and its status labels can change as the developer adds boards and drivers. Check the [current board list](https://lcdultrapro.com/boards) rather than treating the November 2026 figures as permanent.

## The board wiki, parts pages and other tools

LCD Ultra Pro is more than the visual editor. Its website also includes a board wiki, parts references, an I²C checker and a technical blog.

The board wiki provides specifications, pin information and connector details. The supplied material says that 50 boards had surveyed connector lists at the time of the fact sheet.

The parts section contains 62 pages covering sensors, relays and modules. For example, the BME280 page discusses the common I²C address choices (0x76 and 0x77), wiring and the possibility of sharing an I²C bus with a display's touch controller.

![LCD Ultra Pro board wiki page showing Waveshare ESP32-S3-LCD-7B specifications](https://lcdultrapro.com/press/full/web-board-wiki.jpg)
*Example board wiki page with specifications and hardware information. Screenshot supplied by the developer.*

![LCD Ultra Pro parts wiki page showing BME280 wiring and ESP32 I2C connections](https://lcdultrapro.com/press/full/web-parts-bme280.jpg)
*Example parts reference for connecting a BME280 sensor over I²C. Screenshot supplied by the developer.*

The site also publishes articles about ESP32 display hardware, LVGL and projects built with supported boards. You can browse the [LCD Ultra Pro blog](https://lcdultrapro.com/blog) separately from the editor.

## Advantages and limitations

Based on the supplied documentation and demonstrations, LCD Ultra Pro has several clear strengths:

**Advantages**
- A browser-based editor, without a separate desktop design application.
- A canvas based on LVGL 8.4 rather than a static mock-up.
- Standard LVGL widgets and ready-made Smart components.
- Beginner and Advanced views for configuring event rules.
- Live Preview with simulated MQTT messages.
- USB Live for visual checks on three supported boards.
- Arduino export with board drivers and a generated README.
- A custom code option when the visual rules are not enough.
- Board and parts references alongside the editor.

**Limitations**
- The export targets ESP32 and ESP32-S3 boards.
- The current export is based on LVGL 8.4, not LVGL 9.
- Only 60 of the 101 boards in the supplied November 2026 snapshot have an export driver.
- USB Live is limited to three boards and requires Chrome or Edge.
- USB Live mirrors the picture only; it does not test touch input or run the finished application on the board.
- The project is in open beta, and the developer says paid plans may be introduced after the beta.

The distinction between the editor preview, USB Live and the final uploaded firmware is particularly important. Each stage tests something different, and none should be mistaken for a complete hardware validation of every supported board.

## Who should consider LCD Ultra Pro?

LCD Ultra Pro is worth exploring if you want to build a dashboard, thermostat, smart home control panel or MQTT interface for an ESP32 touchscreen and prefer arranging widgets over writing every LVGL object by hand.

It may be especially useful for:

- Makers learning how LVGL screens are structured.
- Developers prototyping an ESP32 touchscreen interface.
- Home Assistant users building an MQTT-connected wall panel.
- Projects that can use one of the boards with an export driver.
- Users who want a generated Arduino project but still need the option to add custom C code.

It is less suitable if your project depends on LVGL 9, your exact board has no export driver, or you need USB Live on hardware outside the three supported models.

If you are still choosing a display, start with the [Embedded Nerd ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/) or compare boards with the [ESP32 Touchscreen Selector](/tools/esp32-touchscreen-selector/). For a larger Waveshare panel, see our [Waveshare ESP32-S3-Touch-LCD-7 product page](/products/waveshare-esp32-s3-touch-lcd-7/) and check the exact model carefully: the USB Live-supported **ESP32-S3-LCD-7B** is a distinct board designation.

## Final thoughts

LCD Ultra Pro brings several useful parts of ESP32 display development into one browser workflow: layout, LVGL widgets, event rules, preview and Arduino export. Its strongest idea is not simply drag-and-drop design; it is the connection between a visual interface and generated LVGL-based project code.

The main caveat is board support. The catalog is larger than the export-ready list, and USB Live currently covers only three boards. Treat the status labels and generated README as essential checks before committing to a hardware choice.

We have not tested the editor or exported firmware on a physical board, so this is an overview based on the developer's supplied material rather than an independent hands-on verdict. For makers with a compatible ESP32 display, the free open beta is an opportunity to explore the workflow before deciding whether it fits a project.

## Frequently asked questions

### Is LCD Ultra Pro free?

It is free during the open beta, according to the developer. The pricing page says paid plans may be introduced after the beta, so check the [current pricing information](https://lcdultrapro.com/pricing).

### Does LCD Ultra Pro use LVGL 9?

No. The supplied documentation describes an LVGL 8.4 workflow. The exported project requires LVGL 8.4.x, not LVGL 9.x.

### Which ESP32 boards can export an Arduino project?

The November 2026 fact sheet supplied for this article lists 101 boards in the catalog, of which 60 have an export driver. Check the current board picker and the status of your exact board before starting.

### Does USB Live work with every ESP32 display?

No. The supplied documentation lists three supported boards: Waveshare ESP32-S3-LCD-7B, Makerfabs MaTouch ESP32-S3 Parallel TFT 4.3-inch and Makerfabs MaTouch Rotary IPS 2.1-inch.

### Can I test touchscreen input with USB Live?

No. USB Live mirrors the picture only. Touch input and the finished application behaviour need to be tested after exporting and uploading the project to the board.

### Do I need the Arduino IDE?

You do not need the Arduino IDE to design screens in the browser or use Live Preview. The standard export workflow uses the Arduino IDE to compile and upload the generated project. USB Live uses Chrome or Edge and Web Serial.

### Can I add my own Arduino code?

Yes. The Custom Code window provides places for global declarations, startup code and event-specific code in the generated `ui_events.cpp`. That custom code runs on the physical board after upload, not in Live Preview or USB Live.

### Are Wi-Fi and MQTT passwords uploaded?

The developer states that Wi-Fi and MQTT credentials are kept in a local `secrets.h` file and are not included in the project file or sent to the cloud. Review the generated files and current privacy information before entering credentials.

## Official LCD Ultra Pro links

- [LCD Ultra Pro editor](https://app.lcdultrapro.com/)
- [LCD Ultra Pro website](https://lcdultrapro.com/)
- [Board catalog and wiki](https://lcdultrapro.com/boards)
- [Documentation](https://lcdultrapro.com/docs)
- [Press and media kit](https://lcdultrapro.com/press)
- [Pricing](https://lcdultrapro.com/pricing)
- [YouTube channel](https://www.youtube.com/@LCD-UltraPro)
