---
title: "Seeed reTerminal E Series Compared: E1001 vs E1002 vs E1003 vs E1004"
title_tag: "Seeed reTerminal E Series: E1001 vs E1002 vs E1003 vs E1004"
layout: single
permalink: /seeed-reterminal-e-series-comparison/
lang: en
page_id: article-seeed-reterminal-e-series-comparison
translation_id: seeed-reterminal-e-series-comparison
internal_links: true
excerpt: "Compare all four Seeed reTerminal E Series ePaper displays: E1001, E1002, E1003 and E1004. Check screen size, color, touch, refresh speed, battery and software compatibility."
show_date: false
read_time: false
last_modified_at: 2026-11-10
header:
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
categories:
  - Displays
  - ESP32
  - ePaper
tags:
  - Seeed Studio
  - reTerminal E Series
  - reTerminal E1001
  - reTerminal E1002
  - reTerminal E1003
  - reTerminal E1004
  - ESP32-S3
  - ePaper
  - ESPHome
  - Home Assistant
  - Arduino
sidebar:
  nav: "embedded"
related: true
related_posts:
  - /products/seeed-reterminal-e1004/
seo_title: "Seeed reTerminal E Series: E1001–E1004 Compared"
seo_description: "Compare Seeed reTerminal E1001, E1002, E1003 and E1004: ePaper size, color, touch, refresh time, battery life, ESPHome and Home Assistant support."
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

The **Seeed Studio reTerminal E Series** is a family of ESP32-S3-powered ePaper terminals. The four models share a common software ecosystem, but they are designed for different projects: from compact monochrome information boards to large full-color displays and a touchscreen dashboard.

The main decision is not simply which model has the biggest screen. You also need to consider whether you need color, capacitive touch, partial refresh, a longer battery runtime or compatibility with a particular dashboard platform.

This guide compares the **reTerminal E1001, E1002, E1003 and E1004** using Seeed Studio's published specifications and documentation.

## Quick comparison: E1001 vs E1002 vs E1003 vs E1004

| Feature | E1001 | E1002 | E1003 | E1004 |
|---|---|---|---|---|
| Display size | 7.5-inch | 7.3-inch | 10.3-inch | 13.3-inch |
| Display technology | Monochrome ePaper | E Ink Spectra 6 color | Monochrome ePaper | E Ink Spectra 6 color |
| Grayscale / color | 4-level grayscale | 6 colors | 16-level grayscale | 6 colors |
| Resolution | 800 × 480 | 800 × 480 | 1404 × 1872 | 1200 × 1600 |
| Partial refresh | Yes | No | Yes | No |
| Published refresh time | 2–5 s | 15–20 s | 2–3 s | Approximately 20–40 s* |
| Capacitive touchscreen | No | No | Yes | No |
| Battery capacity | 2000 mAh | 2000 mAh | 3000 mAh | 5000 mAh |
| Published battery estimate | Up to 3 months | Up to 3 months | Up to 6 months | Up to 6 months |
| Processor | ESP32-S3 | ESP32-S3 | ESP32-S3 | ESP32-S3 |
| PSRAM / Flash | 8 MB / 32 MB | 8 MB / 32 MB | 8 MB / 32 MB | 8 MB / 32 MB |
| Wireless | Wi-Fi 2.4 GHz + Bluetooth 5.0 | Wi-Fi 2.4 GHz + Bluetooth 5.0 | Wi-Fi 2.4 GHz + Bluetooth 5.0 | Wi-Fi 2.4 GHz + Bluetooth 5.0 |

**Important:** Refresh times and battery runtimes are manufacturer-published figures, not independent measurements. Actual results depend on firmware, screen content, refresh frequency, wireless activity and operating conditions. Color models require full-screen refreshes; the monochrome E1001 and E1003 support partial refresh. *For the E1004, Seeed's family overview lists around 20 seconds, while its Arduino cookbook gives a 25–40-second range for six-color panels. The range above reflects this difference between official references.*

## What is shared across the reTerminal E Series?

All four devices use an ESP32-S3 platform with 8 MB PSRAM and 32 MB Flash. The family also shares 2.4 GHz Wi-Fi, Bluetooth 5.0, a temperature and humidity sensor, a buzzer, USB-C power input and a microSD card slot.

The devices are designed as complete terminals rather than bare ePaper panels. They include a rechargeable battery, enclosure, controls and expansion connections. The exact enclosure dimensions, battery capacity and expansion connector differ by model.

The common platform also means that the same broad development options are available across the family: Seeed's SenseCraft HMI, Arduino and ESPHome. There are, however, version and feature differences to check before choosing a model.

## reTerminal E1001: compact monochrome ePaper

The **E1001** is the straightforward option for text-heavy information boards, calendars, simple dashboards and status displays.

Its 7.5-inch monochrome panel has a resolution of 800 × 480 and supports four grayscale levels. The key advantage is partial refresh: Seeed lists a refresh time of approximately 2–5 seconds, making it better suited to changing text and status information than the color models.

- 7.5-inch monochrome ePaper
- 800 × 480 resolution and 4-level grayscale
- Partial refresh supported
- 2000 mAh battery; manufacturer estimate of up to 3 months
- No capacitive touchscreen

**Choose the E1001 if:** you want a relatively compact, low-power information display and do not need color or touchscreen interaction.

## reTerminal E1002: compact full-color ePaper

The **E1002** keeps a similar compact format but replaces the monochrome panel with a 7.3-inch E Ink Spectra 6 full-color display. Its resolution is 800 × 480.

Color is useful for photo-style content, visual notices, recipes and dashboards where categories or images benefit from different colors. The trade-off is refresh behavior: the E1002 does not support partial refresh, and Seeed lists a full refresh time of approximately 15–20 seconds.

- 7.3-inch E Ink Spectra 6 full-color display
- 800 × 480 resolution
- Full refresh only; no partial refresh
- 2000 mAh battery; manufacturer estimate of up to 3 months
- No capacitive touchscreen

**Choose the E1002 if:** you want color in a smaller ePaper terminal and can accept slower full-screen updates.

## reTerminal E1003: large monochrome touchscreen

The **E1003** is the model to consider when touch interaction matters. It has a 10.3-inch monochrome display with 16 grayscale levels, a resolution of 1404 × 1872 and a capacitive touchscreen.

Unlike the color models, the E1003 supports partial refresh. Seeed lists a refresh time of approximately 2–3 seconds. Its 3000 mAh battery is associated with a manufacturer estimate of up to six months, depending on use.

- 10.3-inch monochrome ePaper
- 1404 × 1872 resolution and 16-level grayscale
- Capacitive touchscreen
- Partial refresh supported
- 3000 mAh battery; manufacturer estimate of up to 6 months

Seeed's comparison notes that capacitive touch support in SenseCraft HMI requires version 1.1.2 or later. Check the current software documentation for the exact feature support in the firmware you intend to use.

**Choose the E1003 if:** you want a large, high-resolution monochrome display with direct touch interaction and faster partial updates.

## reTerminal E1004: large full-color ePaper

The **E1004** is the largest model in the family. Its 13.3-inch E Ink Spectra 6 panel has a resolution of 1200 × 1600 and is designed for large visual dashboards, digital photo frames, artwork, schedules and information boards.

It has the largest battery in the range at 5000 mAh, with Seeed publishing an estimate of up to six months. The main trade-off is refresh speed: the E1004 does not support partial refresh, and its color panel needs a full-screen update. Seeed's family overview lists approximately 20 seconds, while its Arduino cookbook gives a 25–40-second range for six-color panels. Treat roughly 20–40 seconds as practical published guidance, not a guaranteed update time.

The E1004 **does not have a capacitive touchscreen**. It has physical touch buttons for basic interaction, which should not be confused with the E1003's touch-sensitive display.

- 13.3-inch E Ink Spectra 6 full-color display
- 1200 × 1600 resolution
- Full refresh only; no partial refresh
- No capacitive touchscreen; physical touch buttons
- 5000 mAh battery; manufacturer estimate of up to 6 months

For the complete product review, hardware details and purchase information, see the [Embedded Nerd reTerminal E1004 product page](/products/seeed-reterminal-e1004/).

**Choose the E1004 if:** screen size and full-color ePaper matter more than touch input or frequent screen updates.

## Refresh speed: why monochrome and color behave differently

Refresh behavior is one of the most important differences between these four devices.

The E1001 and E1003 use monochrome panels and support partial refresh. This allows parts of the screen to be updated without redrawing the entire display, which is useful for clocks, sensor readings, text and status changes.

The E1002 and E1004 use E Ink Spectra 6 full-color panels. They do not support partial refresh in Seeed's published comparison, so updates require a full-screen refresh. This is suitable for images and dashboards that change occasionally, but not for interfaces that need rapid visual feedback.

| Model | Panel | Partial refresh | Published refresh time |
|---|---|---:|---:|
| E1001 | Monochrome | Yes | 2–5 seconds |
| E1002 | Spectra 6 color | No | 15–20 seconds |
| E1003 | Monochrome | Yes | 2–3 seconds |
| E1004 | Spectra 6 color | No | Approximately 20–40 seconds* |

*Seeed's overview lists around 20 seconds for the E1004, while the Arduino cookbook gives 25–40 seconds for six-color panels.* These values are useful for comparing the models, but should not be treated as guaranteed end-to-end update latency for every firmware or display operation.

## Battery life: which model lasts longer?

Seeed publishes approximate battery runtimes of up to three months for the E1001 and E1002, and up to six months for the E1003 and E1004.

| Model | Battery | Manufacturer estimate |
|---|---:|---:|
| E1001 | 2000 mAh | Up to 3 months |
| E1002 | 2000 mAh | Up to 3 months |
| E1003 | 3000 mAh | Up to 6 months |
| E1004 | 5000 mAh | Up to 6 months |

These are manufacturer estimates, not guaranteed runtimes. A dashboard that refreshes often or keeps wireless connections active may use more power than a display that changes only a few times per day. Plan around your expected refresh schedule rather than choosing solely by the advertised month count.

## ESPHome and Home Assistant compatibility

All four reTerminal E Series models are covered by Seeed's ESPHome documentation and can be used with Home Assistant through ESPHome.

There is one important version requirement: **the E1003 and E1004 display drivers require ESPHome 2026.7.0 or later** according to Seeed's current cookbook. Check the model-specific examples and generated configuration before flashing.

Official resources:

- [Seeed Studio ESPHome display cookbook](https://wiki.seeedstudio.com/reterminal_e10xx_esphome/)
- [ESPHome hardware controls, battery and touch cookbook](https://wiki.seeedstudio.com/reterminal_e10xx_with_esphome_advanced/)
- [Seeed Studio reTerminal E Series overview](https://wiki.seeedstudio.com/reterminal_e10xx_main_page/)

## Arduino and SenseCraft HMI

Seeed also documents Arduino support for the reTerminal E Series. Arduino is a suitable route if you want to build a custom application and control the display and hardware directly.

[Seeed Studio Arduino ePaper cookbook](https://wiki.seeedstudio.com/reterminal_e10xx_with_arduino/)

For a more visual, low-code workflow, SenseCraft HMI lets you create and deploy display interfaces. Check its current supported-hardware and feature documentation, particularly if you need capacitive touch on the E1003.

[SenseCraft HMI supported hardware](https://sensecraft-hmi-docs.seeed.cc/en/supported_hardware/)

## What about TRMNL compatibility?

Seeed lists the reTerminal E Series among the devices supported by its TRMNL integration guidance. There is an important limitation for the color models: the E1002 and E1004 currently operate in monochrome mode under TRMNL, so choosing a Spectra 6 panel does not necessarily mean you will get color output in that workflow.

If TRMNL is your main reason for buying, check the latest integration notes before ordering and compare the monochrome models as well.

See the [official reTerminal E Series overview](https://wiki.seeedstudio.com/reterminal_e10xx_main_page/) for the current compatibility notes.

## Which Seeed reTerminal E Series should you buy?

The best model depends on the display behavior you need, not simply on screen size.

| Your priority | Recommended model | Why |
|---|---|---|
| Compact monochrome display and quick partial updates | **E1001** | 7.5-inch panel, partial refresh and 2–5 second published refresh time |
| Full color in a compact format | **E1002** | 7.3-inch Spectra 6 color panel |
| Capacitive touchscreen and fast partial updates | **E1003** | 10.3-inch monochrome touchscreen with partial refresh |
| Largest full-color ePaper display | **E1004** | 13.3-inch Spectra 6 panel and 5000 mAh battery |
| Frequent text/status changes | **E1001 or E1003** | Monochrome panels support partial refresh |
| Photo frames and visual notices | **E1002 or E1004** | Full-color Spectra 6 panels |
| Direct touch interaction | **E1003** | It is the model with a capacitive touchscreen |
| TRMNL in color | **Check before buying** | E1002 and E1004 are currently monochrome in the TRMNL workflow |

### Our practical recommendation

- **For a simple information board:** start with the E1001.
- **For a compact color display:** choose the E1002.
- **For a touch-enabled dashboard:** choose the E1003.
- **For a large color photo frame or dashboard:** choose the E1004.

If you are building a Home Assistant display, decide first how often the screen needs to change. A monochrome model with partial refresh may feel much more responsive for frequently updated sensor data, while a color model is better for visual content that can remain on screen for longer.

## Frequently asked questions

### Which reTerminal E Series model has a touchscreen?

The reTerminal E1003 has a 10.3-inch capacitive touchscreen. The E1001 and E1002 do not have a capacitive touchscreen. The E1004 has physical touch buttons, but its display is not a touchscreen.

### Which models support partial refresh?

The E1001 and E1003 support partial refresh. The E1002 and E1004 use full-color Spectra 6 panels and do not support partial refresh in Seeed's published comparison.

### Which reTerminal has the largest display?

The E1004 has the largest display at 13.3 inches. It is a full-color E Ink Spectra 6 panel with a resolution of 1200 × 1600.

### Do all four models work with Home Assistant?

Yes. Seeed documents ESPHome support for all four models, allowing integration with Home Assistant. The E1003 and E1004 require ESPHome 2026.7.0 or later for their display drivers.

### Can I program the reTerminal E Series with Arduino?

Yes. Seeed provides an Arduino ePaper cookbook covering the reTerminal E Series. Use the examples for the exact model you have.

### Which model has the longest battery life?

Seeed publishes estimates of up to six months for the E1003 and E1004. Actual runtime depends on refresh frequency, wireless activity, firmware and operating conditions.

### Is the E1004 a touchscreen?

No. The E1004 has physical touch buttons, but no capacitive touchscreen. Choose the E1003 if you need to interact directly with the display.

## Official Seeed Studio documentation

- [reTerminal E Series: model comparison and compatibility](https://wiki.seeedstudio.com/reterminal_e10xx_main_page/)
- [E1004 hardware and getting started](https://wiki.seeedstudio.com/getting_started_with_reterminal_e1004/)
- [ESPHome display cookbook](https://wiki.seeedstudio.com/reterminal_e10xx_esphome/)
- [ESPHome hardware controls cookbook](https://wiki.seeedstudio.com/reterminal_e10xx_with_esphome_advanced/)
- [Arduino ePaper cookbook](https://wiki.seeedstudio.com/reterminal_e10xx_with_arduino/)
- [SenseCraft HMI supported hardware](https://sensecraft-hmi-docs.seeed.cc/en/supported_hardware/)

For specifications, firmware requirements and supported features, always check the latest manufacturer documentation before purchasing or starting a hardware project.
