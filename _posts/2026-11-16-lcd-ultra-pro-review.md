---
title: "LCD Ultra Pro Overview: Visual LVGL Editor for ESP32 Displays"
title_tag: "LCD Ultra Pro Overview: Visual LVGL Editor for ESP32 Displays"
layout: single
permalink: /lcd-ultra-pro-overview/
lang: en
page_id: article-lcd-ultra-pro-overview
translation_id: lcd-ultra-pro-overview
internal_links: true
excerpt: "Explore LCD Ultra Pro, a browser-based visual editor for ESP32 displays. Design LVGL interfaces, add logic with visual rules, test in a browser and export an Arduino project."
show_date: false
read_time: false
last_modified_at: 2026-11-16
header:
  teaser: /assets/images/esp32-touchscreen-lvgl-gui.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/esp32-touchscreen-lvgl-gui.webp
  og_image: /assets/images/esp32-touchscreen-lvgl-gui.webp
  og_image_alt: "ESP32 touchscreen interface designed with LVGL"
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
seo_title: "LCD Ultra Pro Overview: LVGL Editor for ESP32"
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
      "datePublished": "2026-11-16",
      "dateModified": {{ page.last_modified_at | date_to_xmlschema | jsonify }},
      "image": {{ "/assets/images/esp32-touchscreen-lvgl-gui.webp" | absolute_url | jsonify }},
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

The project is currently offered as a free open beta. This overview explains its workflow, checks the current documentation and identifies the compatibility limits that matter before choosing a board.

> **Editorial scope:** This is an independently researched overview, not a hands-on review. We checked the public editor information, documentation, board catalog, pricing page and press kit. We could not sign in, operate Live Preview, export a ZIP or inspect its contents in this session, and we did not test firmware on a physical display. Screenshots and export-file details below are attributed to the developer's published material, not presented as our own test results.

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

The Smart tab contains **more than 20 ready-made components**, according to the current fact sheet. These are intended to provide more complete functions than a basic button or label.

Examples include:

- Wi-Fi Setup and MQTT Setup.
- Date & Time, Clock and Weather Screen.
- Weekly Schedule, On/Off Timer and Time Switch.
- PIN Lock and Settings.
- Wi-Fi Status, MQTT Value, MQTT Switch and MQTT Chart.

The available Smart widgets can depend on the selected board. The supplied screenshots, for example, show 20 Smart widgets on the 7-inch Waveshare project and 12 on the round 2.1-inch MaTouch project.

![LCD Ultra Pro Smart widget palette with WiFi, MQTT, time and settings components](https://lcdultrapro.com/press/full/smart-widgets-palette.jpg)
*The Smart tab groups ready-made screens and components. Screenshot supplied by the developer.*

The project also includes **19 demo projects** that open directly in the editor. A smart home dashboard or thermostat is a useful starting point because you can inspect its widgets and rules instead of building everything from an empty screen.

![LCD Ultra Pro thermostat interface for the 2.1-inch round Makerfabs MaTouch display](https://lcdultrapro.com/press/full/round-thermostat.jpg)
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

The current documentation describes about **100 ready-made rules**. They provide a starting point, but a real project still needs its topics, pins, conditions and hardware behaviour configured correctly.

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

<video controls preload="metadata" poster="https://lcdultrapro.com/press/full/usb-live-on-board.jpg" style="width:100%;height:auto;">
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

## Board support: 102 selectable does not mean 102 export-ready

The board catalog is one of the most important parts of LCD Ultra Pro, but the support figures need context. The current [board list](https://lcdultrapro.com/boards) says there are 173 wiki entries, 102 selectable boards and 61 boards with a driver in the Arduino export.

The current press kit lists the following support figures (checked 16 November 2026):

| Support level | Boards |
|---|---:|
| Boards documented in the wiki | 173 |
| Boards selectable in the editor | 102 |
| Boards with a driver included in export | 61 |
| Boards tested by the developer on physical hardware | 3 |

The current public figures distinguish 173 boards documented in the wiki, 102 available in the editor and 61 with a display driver included in the export. A selectable board is therefore not necessarily export-ready.

These figures describe different levels of support. A board can be documented in the wiki without being selectable in the editor, and a selectable board may still have no export driver. The three hardware-tested boards are a much smaller group than the 61 boards with an export driver.

Before choosing a display for a project, check its status in the board picker and confirm that the exact board has an export driver. If USB Live is important, check that the board is one of the three listed above.

The catalog and its status labels can change as the developer adds boards and drivers. Check the [current board list](https://lcdultrapro.com/boards) rather than treating the November 2026 figures as permanent.


### Examples already in the Embedded Nerd catalog

We checked the public board list against display products already covered by Embedded Nerd. These three exact models appear in the catalog with a **ready** export driver:

- [Waveshare ESP32-S3-Touch-LCD-4.3](/products/waveshare-esp32-s3-touch-lcd-4-3/) — 4.3-inch, 800×480, capacitive touch. The LCD Ultra Pro board list marks this family as ready; the driver is included in the export, but the ready label does not mean it has been physically tested by the developer.
- [Sunton ESP32-8048S043C](/products/sunton-esp32-8048s043c/) — 4.3-inch, 800×480, capacitive touch. The board list marks this exact CYD variant as ready.
- [Guition ESP32-S3-4848S040](/products/guition-esp32-s3-4848s040/) — 4-inch, 480×480, capacitive touch. The board list marks it as ready.

This gives Embedded Nerd readers a practical starting point: these products are already documented on our site and have an export driver listed by LCD Ultra Pro. Check the exact revision and current board status before relying on the generated driver.

**Important Waveshare naming detail:** the USB Live board picker and press-kit screenshot use the name **ESP32-S3-LCD-7B**. LCD Ultra Pro's board wiki says Waveshare's touch-equipped version is called **ESP32-S3-Touch-LCD-7B**, while the shorter **ESP32-S3-LCD-7B** name refers to the version without touch. However, the current board-list table labels the ESP32-S3-LCD-7B entry as capacitive touch. That is an inconsistency between the public sources, so confirm the exact hardware with the developer before assuming which touch variant the USB Live profile targets. Do not confuse either 1024×600 model with Embedded Nerd's [Waveshare ESP32-S3-Touch-LCD-7](/products/waveshare-esp32-s3-touch-lcd-7/), which is an 800×480 display. See the [LCD Ultra Pro board entry](https://lcdultrapro.com/boards/waveshare-7b-1024x600) for the distinction.

## The board wiki, parts pages and other tools

LCD Ultra Pro is more than the visual editor. Its website also includes a board wiki, parts references, an I²C checker and a technical blog.

The board wiki provides specifications, pin information and connector details. The supplied material says that 50 boards had surveyed connector lists at the time of the fact sheet.

The parts section contains 62 pages covering sensors, relays and modules. For example, the BME280 page discusses the common I²C address choices (0x76 and 0x77), wiring and the possibility of sharing an I²C bus with a display's touch controller.

![LCD Ultra Pro board wiki page showing Waveshare ESP32-S3-LCD-7B specifications](https://lcdultrapro.com/press/full/web-board-wiki.jpg)
*Example board wiki page with specifications and hardware information. Screenshot supplied by the developer.*

![LCD Ultra Pro parts wiki page showing BME280 wiring and ESP32 I2C connections](https://lcdultrapro.com/press/full/web-parts-bme280.jpg)
*Example parts reference for connecting a BME280 sensor over I²C. Screenshot supplied by the developer.*

The site also publishes articles about ESP32 display hardware, LVGL and projects built with supported boards. You can browse the [LCD Ultra Pro blog](https://lcdultrapro.com/blog) separately from the editor.


## What to check before committing to a project

The public documentation suggests three separate checks rather than one single preview step:

1. **Live Preview** is the place to exercise the UI rules in the browser. The documentation says pins used by rules appear as virtual controls, which is useful for trying logic without a physical board.
2. **USB Live** mirrors the canvas to one of the three supported displays. It only checks the picture: touch, rules and timers do not run on the board in this mode.
3. **Arduino export** is the step that produces the firmware project. The ZIP should include the sketch, generated screen and event code, board display/touch drivers, `lv_conf.h`, images as C arrays and a README with the board settings and library versions.

That separation is the most important practical detail to understand before starting. A successful browser preview does not prove that the export compiles, and USB Live does not validate touch input or the final firmware. The documentation recommends Arduino IDE 2.x and LVGL 8.4.x for compiling the export.

We could not independently run those three stages in this session. In particular, we did not open or compile the ZIP; the file list and README description above are based on the developer's press-kit screenshot and published documentation.

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
- Only 61 of the 102 selectable boards currently have a display driver in the export.
- USB Live is limited to three boards and requires Chrome or Edge.
- USB Live mirrors the picture only; it does not test touch input or run the finished application on the board.
- The project is still in open beta; the pricing page says paid plans will be introduced after the beta.

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

If you are still choosing a display, start with the [Embedded Nerd ESP32 Touchscreen Displays Guide](/esp32-touchscreen-displays-guide/) or compare boards with the [ESP32 Touchscreen Selector](/tools/esp32-touchscreen-selector/). Check the exact model name carefully: the USB Live-supported **Waveshare ESP32-S3-LCD-7B** is a specific board, and similarly named Waveshare displays are not automatically interchangeable.

## Final thoughts

LCD Ultra Pro brings several useful parts of ESP32 display development into one browser workflow: layout, LVGL widgets, event rules, preview and Arduino export. Its strongest idea is not simply drag-and-drop design; it is the connection between a visual interface and generated LVGL-based project code.

The main caveat is board support. The catalog is larger than the export-ready list, and USB Live currently covers only three boards. Treat the status labels and generated README as essential checks before committing to a hardware choice.

We have not tested the editor or exported firmware on a physical board, so this is an overview based on the developer's supplied material rather than an independent hands-on verdict. For makers with a compatible ESP32 display, the free open beta is an opportunity to explore the workflow before deciding whether it fits a project.

## Frequently asked questions

### Is LCD Ultra Pro free?

It is free during the open beta. The [pricing page](https://lcdultrapro.com/pricing) says paid plans will be introduced after the beta; pricing has not yet been announced.

### Does LCD Ultra Pro use LVGL 9?

No. The supplied documentation describes an LVGL 8.4 workflow. The exported project requires LVGL 8.4.x, not LVGL 9.x.

### Which ESP32 boards can export an Arduino project?

The current public press kit lists 173 boards in the wiki, 102 selectable in the editor and 61 with an export driver. Check the current board picker and the status of your exact board before starting.

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
