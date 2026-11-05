---
title: "Guition ESP32-S3-4848S040: Pinout, GPIOs & ESPHome"
title_tag: "Guition 4848S040: Pinout & ESPHome-Einrichtung"
seo_title: "Guition ESP32-S3-4848S040: Pinout, GPIO-Belegung & ESPHome"
seo_description: "Pinout des Guition ESP32-S3-4848S040: RGB-GPIOs, ST7701S-Initialisierung, GT911-Touch, Hintergrundbeleuchtung und ESPHome-Konfiguration."
layout: single
lang: de
page_id: article-guition-esp32-s3-4848s040-pinout-esphome
translation_id: guition-esp32-s3-4848s040-pinout-esphome
available_languages:
  - en
  - de
english_url: /guition-esp32-s3-4848s040-pinout-esphome/
german_url: /de/guition-esp32-s3-4848s040-pinout-esphome/
internal_links: true
permalink: /de/guition-esp32-s3-4848s040-pinout-esphome/
id: "https://embeddednerd.com/de/guition-esp32-s3-4848s040-pinout-esphome/"
hide_post_pagination: true
sidebar:
  nav: "embedded"
  related: true
  share: true
excerpt: "Pinout und GPIO-Belegung des Guition ESP32-S3-4848S040 mit RGB-Display, ST7701S, GT911-Touch und Hinweisen zur ESPHome-Einrichtung."
show_date: false
last_modified_at: 2026-11-05
author: "Embedded Nerd"
read_time: false
toc: true
toc_label: "Inhalt"
toc_sticky: true
header:
  teaser: /assets/images/guition-esp32-s3-4848s040-back.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image_alt: "Rückseite des Guition ESP32-S3-4848S040-Touchscreen-Boards"
categories:
  - Displays
  - ESP32
tags:
  - esp32-s3
  - guition
  - touchscreen
  - esphome
  - pinout
related: true
related_posts:
  - /de/products/guition-esp32-s3-4848s040/
  - /esp32-touchscreen-displays-guide/
---
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "TechArticle",
  "@id": {{ page.url | absolute_url | append: "#article" | jsonify }},
  "headline": {{ page.title | jsonify }},
  "description": {{ page.seo_description | default: page.excerpt | strip_html | strip_newlines | jsonify }},
  "mainEntityOfPage": { "@type": "WebPage", "@id": {{ page.url | absolute_url | jsonify }} },
  "image": {{ page.header.og_image | default: page.header.image | absolute_url | jsonify }},
  "dateModified": {{ page.last_modified_at | date_to_xmlschema | jsonify }},
  "author": { "@type": "Organization", "name": "Embedded Nerd", "url": "https://embeddednerd.com/" },
  "publisher": { "@type": "Organization", "name": "Embedded Nerd", "url": "https://embeddednerd.com/" }
}
</script>

Für die vollständigen technischen Daten, die redaktionelle Bewertung, die verfügbaren Varianten und die Kaufoptionen besuchen Sie die [Produktseite des Guition ESP32-S3-4848S040](/de/products/guition-esp32-s3-4848s040/).

Dieser Leitfaden konzentriert sich auf die Pinbelegung des 4848S040, die Display- und Touch-Schnittstellen, wichtige GPIO-Hinweise sowie die Verwendung einer vorhandenen ESPHome-Konfiguration als Ausgangspunkt.

![Rückseite des Guition ESP32-S3-4848S040-Boards](/assets/images/guition-esp32-s3-4848s040-back.webp)

> **Wichtig:** Pinbelegung und verfügbare GPIOs können je nach Platinenrevision variieren. Verwenden Sie die Tabellen als Referenz und gleichen Sie sie vor dem Anschluss externer Hardware mit der Dokumentation Ihrer konkreten Platine ab.

## Hardware im Überblick

Diese Boardfamilie kombiniert einen ESP32-S3 mit einem 480 × 480 RGB-Display auf Basis des ST7701S und kapazitivem GT911-Touch. Speicher, Relais-Hardware und Gehäuseoptionen müssen anhand der genauen Revision und des Händlerangebots geprüft werden. Die [Produktseite enthält die vollständigen technischen Daten und Kaufoptionen](/de/products/guition-esp32-s3-4848s040/).

## Pinout des Guition ESP32-S3-4848S040

Die folgenden Zuordnungen sind im ESPHome-Devices-Profil aufgeführt. Prüfen Sie die Revision Ihres Boards, bevor Sie diese Angaben für Hardwareanschlüsse verwenden.

### RGB-Display-Pins

| Display-Signal | GPIO |
|---|---:|
| Rote Daten | 11, 12, 13, 14, 0 |
| Grüne Daten | 8, 20, 3, 46, 9, 10 |
| Blaue Daten | 4, 5, 6, 7, 15 |
| Display Enable (DE) | 18 |
| Horizontale Synchronisation (HSYNC) | 16 |
| Vertikale Synchronisation (VSYNC) | 17 |
| Pixeltakt (PCLK) | 21 |

### Initialisierung des ST7701S-Displays

| Signal | GPIO |
|---|---:|
| CS | 39 |
| CLK | 48 |
| DATA | 47 |

Diese Signale dienen der Displayinitialisierung. Sie sind von den RGB-Pixeldaten- und Timing-Signalen getrennt.

### GT911-Touchcontroller und Hintergrundbeleuchtung

| Funktion | GPIO |
|---|---:|
| Touch I²C SDA | 19 |
| Touch I²C SCL | 45 |
| PWM-Hintergrundbeleuchtung | 38 |

Der GT911 kommuniziert über I²C. Im referenzierten Profil ist GPIO 38 für die PWM-Steuerung der Hintergrundbeleuchtung vorgesehen.

![Bildschirmdemonstration des Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-screen-demo.webp)

*Bildschirmdemonstration des Guition ESP32-S3-4848S040.*

### GPIO-Referenz auf einen Blick

Das Profil weist **26 unterschiedliche GPIOs** dem Display, der Displayinitialisierung, dem Touchcontroller und der Hintergrundbeleuchtung zu:

`GPIO0, GPIO3, GPIO4, GPIO5, GPIO6, GPIO7, GPIO8, GPIO9, GPIO10, GPIO11, GPIO12, GPIO13, GPIO14, GPIO15, GPIO16, GPIO17, GPIO18, GPIO19, GPIO20, GPIO21, GPIO38, GPIO39, GPIO45, GPIO46, GPIO47, GPIO48`

Diese Liste beschreibt die Zuordnungen in der referenzierten Konfiguration. Sie beweist **nicht**, dass alle anderen GPIOs für externe Komponenten verfügbar sind. Weitere Pins können für Flash oder PSRAM, integrierte Komponenten oder boardspezifische Funktionen reserviert sein.

## Welche GPIOs sind frei?

Gehen Sie nicht davon aus, dass ein GPIO verfügbar ist, nur weil er in den obigen Tabellen nicht aufgeführt ist. Bevor Sie einen Pin für einen Sensor, ein Relais, einen Taster oder ein anderes Peripheriegerät verwenden:

1. Prüfen Sie Schaltplan und Dokumentation Ihrer konkreten Boardrevision.
2. Stellen Sie fest, welche GPIOs physisch auf dem Board herausgeführt sind.
3. Prüfen Sie, ob ein Pin für Flash, PSRAM, USB, Boot-Konfiguration oder eine andere integrierte Komponente reserviert ist.
4. Vergleichen Sie Ihre geplante Pinbelegung mit der verwendeten ESPHome-Konfiguration.

Das Boardprofil ist ein hilfreicher Ausgangspunkt, ersetzt aber nicht den Schaltplan Ihrer konkreten Hardwareversion.

## Versionen mit und ohne Relais

Das 4848S040 wird in Varianten angeboten, die ein Relaismodul und unterschiedliche Montageoptionen enthalten können. Wenn Sie zwischen den Ausführungen wählen, finden Sie auf der [Produktseite Details zu den Varianten und Hinweise zur Kaufentscheidung](/de/products/guition-esp32-s3-4848s040/).

- **Version ohne Relais:** Prüfen Sie in der Dokumentation der konkreten Platine, welche Anschlüsse herausgeführt sind und welche Peripherie unterstützt wird.
- **Version mit Relais:** Gehen Sie nicht von einer bestimmten GPIO-Zuordnung oder elektrischen Belastbarkeit des Relais aus. Prüfen Sie Schaltplan und Dokumentation dieser Variante, bevor Sie eine Last anschließen.
- **Wandmontage:** Die Relaisversion passt möglicherweise nicht in eine runde europäische Unterputzdose mit 60 mm Durchmesser. Prüfen Sie vor dem Kauf die Abmessungen und die vorgesehene Montage.

Schließen Sie niemals eine Netzspannungs-Last allein anhand eines allgemeinen Pinouts an. Prüfen Sie Relais-Nennwerte, Isolation, Gehäuse und Verdrahtungsanforderungen für das konkrete Produkt.

## Einstieg in ESPHome

Eine vorhandene ESPHome-Konfiguration kann den Einstieg erleichtern, sollte aber vor dem Flashen geprüft werden. Die folgenden Community-Ressourcen sind sinnvolle Ausgangspunkte:

- [ESPHome Devices: Guition ESP32-S3-4848S040](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [ESPHome-Konfiguration aus der Community](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

Die folgende Vorgehensweise reduziert das Risiko, eine Konfiguration zu verwenden, die für eine andere Boardrevision gedacht ist:

1. Öffnen Sie die Konfiguration und lesen Sie die YAML-Dateien sowie alle eingebundenen Pakete.
2. Prüfen Sie, ob Display-, Touch- und Hintergrundbeleuchtungs-GPIOs zu Ihrer Platine passen.
3. Ersetzen Sie Beispiel-Gerätenamen, WLAN-Zugangsdaten und Secrets durch Ihre eigenen Werte.
4. Prüfen Sie zusätzliche Komponenten und externe Pakete, die von der Konfiguration verwendet werden.
5. Validieren Sie die Konfiguration in ESPHome, bevor Sie die Firmware flashen.
6. Beachten Sie die dokumentierte Vorgehensweise für den ersten Flashvorgang Ihrer Platine und Revision.

Dieser Leitfaden behauptet nicht, dass die Community-Konfiguration auf jeder Boardrevision getestet wurde. Wenn das Board nicht startet oder das Display schwarz bleibt, prüfen Sie die Konfiguration erneut und gleichen Sie die Pinbelegung mit der Hardwaredokumentation ab, bevor Sie Änderungen an der Verdrahtung vornehmen.

![Dashboard auf dem Touchscreen des Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-dashboard.webp)

*Beispiel eines Dashboards auf dem Touchscreen.*

## Häufige Frage

### Kann ich dieses Display mit ESPHome verwenden?

Das verlinkte ESPHome-Devices-Profil und die Community-Konfiguration bieten einen Ausgangspunkt. Prüfen Sie die YAML-Dateien, gleichen Sie die GPIO-Zuordnungen mit Ihrer Boardrevision ab und validieren Sie die Konfiguration vor dem Flashen.

## Nächste Schritte

Möchten Sie ein Board auswählen? Besuchen Sie die [Produktseite des Guition ESP32-S3-4848S040](/de/products/guition-esp32-s3-4848s040/) mit technischen Daten, redaktioneller Bewertung, Varianteninformationen und Kaufoptionen.

## Weiterführende Ressourcen

- [Guition JC8048W550: 5-Zoll-ESP32-S3-Display](/products/guition-jc8048w550/) — eine größere Alternative im Querformat mit 800 × 480 Pixeln.
- [Guition ESP32-S3-4848S040 – Produktseite](/de/products/guition-esp32-s3-4848s040/)
- [ESP32-Touchscreen-Auswahlassistent](/tools/esp32-touchscreen-selector/)
- [Leitfaden zu ESP32-Touchscreen-Displays](/esp32-touchscreen-displays-guide/)
- [ESPHome-Devices-Profil](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [ESPHome-Konfiguration aus der Community](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

## Über den Autor

**Embedded Nerd** veröffentlicht praxisorientierte Anleitungen zu ESP32-Boards, Embedded-Hardware, Displays, Sensoren und Entwicklungstools. Dieser Leitfaden basiert auf veröffentlichten Hardware-Referenzen und Community-Ressourcen. Das Board wurde für diesen Artikel nicht unabhängig getestet.
