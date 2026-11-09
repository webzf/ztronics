---
title: "Sunton ESP32-8048S043C: Pinout, Arduino-Code & Anleitung"
title_tag: "Sunton ESP32-8048S043C: Pinout, Arduino-Code & Setup"
seo_title: "Sunton ESP32-8048S043C: Pinout, Arduino-Code & Anleitung"
seo_description: "Sunton ESP32-8048S043C im Überblick: GPIO-Pinout, 4,3-Zoll-RGB-Display, GT911-Touch, microSD, Arduino-Beispiel, LVGL und ESPHome."
layout: single
lang: de
page_id: article-sunton-esp32-8048s043c-guide
translation_id: sunton-esp32-8048s043c-guide
available_languages:
  - en
  - de
  - es
  - fr
english_url: /sunton-esp32-8048s043c-guide/
german_url: /de/sunton-esp32-8048s043c-guide/
spanish_url: /es/sunton-esp32-8048s043c-guide/
french_url: /fr/sunton-esp32-8048s043c-guide/
internal_links: true
permalink: /de/sunton-esp32-8048s043c-guide/
id: "https://embeddednerd.com/de/sunton-esp32-8048s043c-guide/"
hide_post_pagination: true
sidebar:
  nav: "embedded"
  related: true
  share: true
excerpt: "Pinout und Arduino-Code für das Sunton ESP32-8048S043C: RGB-Display, GT911-Touch, microSD-GPIOs, LVGL, ESPHome und wichtige Hinweise zum Kauf."
show_date: false
last_modified_at: 2026-11-05
author: "Embedded Nerd"
read_time: false
toc: true
toc_label: "Inhalt"
toc_sticky: true
header:
  teaser: /assets/images/sunton-esp32-8048s043c-board.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/sunton-esp32-8048s043c-board.webp
  og_image: /assets/images/sunton-esp32-8048s043c-board.webp
  og_image_alt: "Sunton ESP32-8048S043C-I mit 4,3-Zoll-Touchdisplay, ESP32-S3 und Anschlüssen"
categories:
  - Displays
tags:
  - esp32
  - sunton
  - esp32-s3
  - touchscreen
  - lvgl
  - gt911
related: true
related_posts:
  - /esp32-touchscreen-displays-guide/
  - /esp32-p4-round-touchscreen-display-projects/
---

Das **Sunton ESP32-8048S043C** ist eine All-in-one-Platine mit ESP32-S3, einem 4,3-Zoll-IPS-Display mit 800 × 480 Pixeln und kapazitivem Touchscreen. Prozessor, Display und Touchcontroller befinden sich auf einer einzigen Platine. Damit eignet sich das Board für Projekte, bei denen ein vergleichsweise großes Touchdisplay benötigt wird, ohne einen separaten ESP32 und ein Displaymodul kombinieren zu müssen.

> **Hinweis zur Prüfung:** Dieser Leitfaden basiert auf Herstellerunterlagen, öffentlich zugänglichen Hardware-Referenzen und Beispielprojekten. Embedded Nerd hat dieses Board für diesen Artikel nicht unabhängig getestet. Die Pinbelegung kann je nach Revision abweichen. Vergleichen Sie sie vor dem Anschluss von Peripherie mit dem Schaltplan Ihrer Platine.

> **Affiliate-Hinweis:** Der AliExpress-Link in diesem Leitfaden ist ein Affiliate-Link. Embedded Nerd kann eine Provision erhalten, wenn Sie darüber einkaufen. Für Sie entstehen dadurch keine zusätzlichen Kosten.

Vor dem Kauf sollten Sie einige Details prüfen. Sunton bietet mehrere ähnlich benannte Platinen mit kapazitiver oder resistiver Touch-Technik an. Die genaue Hardware-Revision kann sich auf Pinbelegung und empfohlene Konfiguration auswirken.

Dieser Leitfaden behandelt technische Daten, Display und Touch, wichtige GPIOs, Softwarekompatibilität, häufige Probleme und die wichtigsten Entscheidungskriterien für das 8048S043C.

> **Sie sind noch unsicher, welches ESP32-Touchdisplay zu Ihrem Projekt passt?** In unserem [Leitfaden zu ESP32-Touchscreen-Displays]({{ site.url }}/esp32-touchscreen-displays-guide/) können Sie Boards nach Auflösung und Speicherbedarf vergleichen.

![Sunton ESP32-8048S043C-I mit 4,3-Zoll-kapazitivem Touchdisplay, ESP32-S3-Modul und Anschlüssen](/assets/images/sunton-esp32-8048s043c-board.webp)

*Platinenabbildung bereitgestellt von Embedded Nerd.*

## Technische Daten des Sunton ESP32-8048S043C

| Merkmal | Details |
| --- | --- |
| MCU | ESP32-S3 (Dual-Core, WLAN und Bluetooth LE) |
| Flash / PSRAM | 16 MB Flash, 8 MB Octal-PSRAM bei der verbreiteten N16R8-Version |
| Display | 4,3-Zoll-IPS, 800 × 480 Pixel |
| Display-Schnittstelle | 16-Bit-Parallel-RGB |
| Touch | Kapazitiv, GT911-Controller über I²C |
| Speicher | microSD-Steckplatz |
| USB | USB-C |
| Weitere Anschlüsse | BOOT-Taste an GPIO0, Erweiterungsheader; Lautsprecher- und Batterieanschlüsse variieren je nach Revision |

> **Prüfen Sie vor dem Kauf die genaue Revision.** Sunton verkauft mehrere ähnlich bezeichnete Platinen, darunter die 4827S043C und resistive „R“-Varianten. Vergleichen Sie den Aufdruck auf der Platine mit den Händlerunterlagen, bevor Sie sich auf GPIO-Nummern, Speicherangaben oder Demo-Projekte verlassen.
{: .notice--warning}

## Ist das Sunton ESP32-8048S043C eine gute Wahl?

Das 8048S043C ist interessant, wenn Sie ein relativ großes Touchdisplay möchten und ESP32, Display sowie Touchcontroller auf einer Platine integrieren wollen.

### Eine gute Wahl, wenn Sie Folgendes benötigen

- Ein **4,3-Zoll-Touchdisplay mit 800 × 480 Pixeln**
- Einen **ESP32-S3** mit WLAN und Bluetooth LE
- Integrierten kapazitiven Touch
- PSRAM für grafisch anspruchsvolle Benutzeroberflächen
- Eine All-in-one-Platine statt separatem ESP32 und Display
- Eine **LVGL-basierte Oberfläche**
- Ein kompaktes Touch-Bedienpanel

Typische Anwendungen sind Dashboards, Smart-Home-Oberflächen, Maschinensteuerungen, Sensoranzeigen und andere Projekte, bei denen ein größeres Touchdisplay praktischer ist als ein kleines OLED- oder Zeichen-Display.

### Ziehen Sie ein anderes Board in Betracht, wenn Sie Folgendes benötigen

- Umfangreiche offizielle Dokumentation und viele Herstellerbeispiele
- Eine andere Displaygröße oder Auflösung
- Leichter zugängliche GPIOs
- Eine andere Touch-Technologie
- Eine Platine mit einfacherer Softwarekonfiguration

## Kapazitive C- oder resistive R-Version: Welche sollten Sie kaufen?

Dies ist einer der wichtigsten Punkte, die Sie vor der Bestellung prüfen sollten.

Die **C-Version** verwendet einen **kapazitiven GT911-Touchcontroller** am I²C-Bus. Das ermöglicht die Touchbedienung, die man von modernen Smartphone-Displays kennt.

Die **R-Version** verwendet resistive Touch-Hardware und benötigt einen anderen Controller sowie einen anderen Treiber.

Wenn Sie ausdrücklich einen modernen kapazitiven Touchscreen möchten, achten Sie darauf, dass das Angebot die Platine als **8048S043C** und nicht als R-Variante ausweist.

Der übergeordnete Name **8048S043** wird in Beispiel-Repositories und Dokumentationen teilweise auch ohne Suffix verwendet. Händlerangebote nennen unter anderem drei Touch-Konfigurationen:

- **8048S043C** – kapazitiver Touch, üblicherweise mit GT911.
- **8048S043R** – resistiver Touch; verwenden Sie hier nicht die GT911-Konfiguration der C-Version.
- **8048S043N** – in einigen Produktreferenzen als Version ohne Touch aufgeführt.

Beachten Sie das Suffix und lassen Sie sich vor der Bestellung die tatsächliche Platine, den Displaycontroller und die Touch-Hardware vom Verkäufer bestätigen. Modellnamen und mitgelieferte Demos sind nicht bei allen Angeboten einheitlich.

## Datenblatt, Schaltplan und Beispielprojekte

Die folgenden Referenzen sind gute Ausgangspunkte, um die Platinenrevision zu prüfen und ein funktionierendes Projekt aufzubauen:

- [Makerfabs-/Sunton-Dokumentation und Display-Demos](https://wiki.makerfabs.com/Sunton_ESP32_S3_4.3_inch_800x400_IPS_with_Touch.html) – vom Hersteller bereitgestellte Einrichtungsanleitungen sowie Links zu Display- und LVGL-Demos.
- [ESP3D-Hardwarereferenz für ESP32-8048S043C](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/) – Pinbelegung, microSD-Anschlüsse und Hinweise zur Änderung des GT911-Interrupts.
- [Sunton-ESP32-8048S043-Datenblatt und Demo-Archiv](http://pan.jczn1688.com/directlink/1/ESP32%20module/4.3inch_ESP32-8048S043.zip) – vom Hersteller gehostetes Archiv aus Community-Dokumentationen. Prüfen Sie Inhalt und Revision, bevor Sie sich darauf verlassen.
- [Arduino_GFX- + GT911- + LVGL-Beispielprojekt](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043) – ein PlatformIO-Projekt mit Arduino_GFX, GT911 und LVGL 9.1.
- [ESP-IDF- + LVGL-Beispiel](https://github.com/limpens/esp32-8048S043) – ein separates Beispiel auf Basis von ESP-IDF und der GT911-Touchkomponente.

## Pinout: Display, Touch, microSD und Erweiterungsheader

Das Display ist über einen 16-Bit-Parallel-RGB-Bus mit dem ESP32-S3 verbunden. Der GT911-Touchcontroller verwendet I²C. Diese Verbindungen sind bereits auf der Platine hergestellt. Verwenden Sie die entsprechenden GPIOs daher nicht zusätzlich für andere Peripherie.

### Touch- und Steuerpins

| Funktion | GPIO | Hinweise |
| --- | ---: | --- |
| GT911 I²C SDA | 19 | Touch-Daten |
| GT911 I²C SCL | 20 | I²C-Takt |
| GT911 Reset (RST) | 38 | Reset des Touchcontrollers |
| GT911 Interrupt (INT) | 18 | Ohne Hardwareänderung normalerweise nicht mit dem Controller verbunden |
| LCD-Hintergrundbeleuchtung | 2 | Steuerung der Hintergrundbeleuchtung |
| BOOT-Taste | 0 | Auswahl des Boot-Modus |

Der GT911 verwendet je nach Konfiguration üblicherweise die I²C-Adresse **0x5D** oder **0x14**. Die Touch-Interrupt-Leitung kann eine Hardwareänderung erfordern. Wenn sie nicht angeschlossen ist, kann stattdessen reguläres Polling verwendet werden.

### microSD-Pins (SPI)

| Funktion | GPIO |
| --- | ---: |
| SD-Karte CS | 10 |
| SD-Karte MOSI | 11 |
| SD-Karte SCK | 12 |
| SD-Karte MISO | 13 |

### RGB-Display-Signale

| Signal | GPIO |
| --- | --- |
| DE / VSYNC / HSYNC / PCLK | 40 / 41 / 39 / 42 |
| Rot (R0–R4) | 45, 48, 47, 21, 14 |
| Grün (G0–G5) | 5, 6, 7, 15, 16, 4 |
| Blau (B0–B4) | 8, 3, 46, 9, 1 |

### Erweiterungsheader

Die veröffentlichte Hardware-Referenz beschreibt folgende Belegung der Header:

| Header | Pins / Funktionen |
| --- | --- |
| P1 (UART-ähnlich) | GND, RX, TX, +5 V |
| P2 (SPI-ähnlich) | GPIO13, GPIO12, GPIO11, GPIO19 |
| P3 | GPIO20, GPIO19, GPIO18, GPIO17 |
| P4 | GPIO18, GPIO17, 3,3 V, GND |

**Diese Pins sind nicht alle unabhängig voneinander nutzbar.** GPIO19/20 werden gemeinsam mit dem I²C-Touch verwendet, GPIO11–13 sind mit microSD belegt und GPIO18 hängt mit der optionalen GT911-Interrupt-Modifikation zusammen. Prüfen Sie vor dem Anschluss von Hardware die Ausrichtung des Steckverbinders und den Schaltplan Ihrer konkreten Revision. Der RGB-Bus belegt zahlreiche weitere GPIOs.

In der veröffentlichten ESP3D-Pinreferenz ist **GPIO17 in der Haupt-Pinliste als NC markiert, wird aber zu den Erweiterungsheadern P3/P4 geführt**. Dieser Pin ist der aussichtsreichste Kandidat für ein zusätzliches einfaches Digitalsignal. Betrachten Sie ihn jedoch nur als *möglicherweise verfügbar* und nicht als garantiert frei, bis Sie den Schaltplan Ihrer Platine geprüft haben. GPIO33/34 sind als NA und GPIO35–37 als NC/NA aufgeführt. Gehen Sie nicht davon aus, dass diese Pins herausgeführt oder nutzbar sind. Vermeiden Sie GPIO43/44 für allgemeine Peripherie, da sie für die USB-zu-UART-Seriellverbindung verwendet werden.

## Software- und Bibliothekskompatibilität

Das 8048S043C kann mit mehreren verbreiteten ESP32-Grafikbibliotheken verwendet werden:

| Bibliothek | Geeignet für | Hinweise |
| --- | --- | --- |
| **LVGL** | Vollständige Touch-Oberflächen mit Schaltflächen, Reglern und Diagrammen | Benötigt einen darunterliegenden Displaytreiber |
| **Arduino_GFX** | Einfache Grafiken, Text und schnelle Tests | Bietet einen RGB-Panel-Treiber für ESP32-S3 |
| **LovyanGFX** | Schnelles Zeichnen und flexible Konfiguration | Benötigt eine zur Platine passende Panel-Konfiguration |

Für viele Projekte ist eine Kombination aus einem RGB-Panel-Treiber auf niedriger Ebene, etwa Arduino_GFX, und **LVGL** für die Benutzeroberfläche sinnvoll.

Wichtig bei der Bewertung vor dem Kauf: Das Board kann anspruchsvolle Touch-Oberflächen darstellen, aber die Displaykonfiguration muss exakt zur verwendeten Hardware passen.

## Arduino-Codebeispiel: Display und Touch

Der folgende Sketch ist ein **minimales Testprogramm für Arduino_GFX-Display und GT911-Touch** mit der verbreiteten Pinbelegung des 8048S043C. Es zeigt eine Testmeldung an und gibt Touch-Koordinaten über Serial aus. Das Beispiel basiert auf veröffentlichten Hardware-Referenzen und wurde nicht von Embedded Nerd am Prüfstand getestet. Timing und Touch-Verhalten können je nach Platinenrevision variieren.

Installieren Sie **Arduino_GFX** und **TAMC_GT911** über den Library Manager. Installieren Sie außerdem das ESP32-Boardpaket von Espressif, wählen Sie **ESP32S3 Dev Module**, aktivieren Sie **OPI PSRAM** und stellen Sie die zur Modulvariante passende Flash-Größe ein (bei N16R8 üblicherweise 16 MB).

```cpp
#include <Arduino.h>
#include <Arduino_GFX_Library.h>
#include <TAMC_GT911.h>

#define SCREEN_WIDTH  800
#define SCREEN_HEIGHT 480
#define TFT_BL        2
#define TOUCH_SDA     19
#define TOUCH_SCL     20
#define TOUCH_RST     38
// The GT911 INT line is normally not connected on this board; use polling.
#define TOUCH_INT     -1

Arduino_ESP32RGBPanel *rgbPanel = new Arduino_ESP32RGBPanel(
  40, 41, 39, 42,                         // DE, VSYNC, HSYNC, PCLK
  45, 48, 47, 21, 14,                     // R0-R4
  5, 6, 7, 15, 16, 4,                      // G0-G5
  8, 3, 46, 9, 1,                          // B0-B4
  0, 8, 4, 8,                              // HSYNC polarity, front porch, pulse, back porch
  0, 8, 4, 8,                              // VSYNC polarity, front porch, pulse, back porch
  1, 12500000                              // PCLK active-negative, target pixel clock (12.5 MHz)
);

Arduino_RGB_Display *gfx = new Arduino_RGB_Display(
  SCREEN_WIDTH, SCREEN_HEIGHT, rgbPanel
);

TAMC_GT911 touch(TOUCH_SDA, TOUCH_SCL, TOUCH_INT, TOUCH_RST,
                 SCREEN_WIDTH, SCREEN_HEIGHT);

void setup() {
  Serial.begin(115200);
  delay(300);

  pinMode(TFT_BL, OUTPUT);
  digitalWrite(TFT_BL, HIGH);

  if (!psramFound()) {
    Serial.println("PSRAM not found: enable OPI PSRAM in Tools.");
    while (true) delay(1000);
  }

  if (!gfx->begin()) {
    Serial.println("Display initialization failed.");
    while (true) delay(1000);
  }
  gfx->fillScreen(BLACK);
  gfx->setTextColor(WHITE);
  gfx->setTextSize(2);
  gfx->setCursor(24, 24);
  gfx->println("8048S043C display OK");

  touch.begin();
  touch.setRotation(ROTATION_NORMAL);
  Serial.println("Touch initialized; tap the screen to read coordinates.");
}

void loop() {
  touch.read();
  if (touch.isTouched) {
    Serial.printf("Touch: x=%d, y=%d\n",
                  touch.points[0].x, touch.points[0].y);
    delay(100);
  }
  delay(10);
}
```

Wenn der Bildschirm schwarz bleibt oder instabil ist, sollten Sie keine neuen Timing-Werte erraten. Vergleichen Sie Display-Timing und GPIO-Belegung mit der [ESP3D-Hardwarereferenz](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/) und der Revision Ihrer Platine. Für ein vollständiges LVGL-Projekt können Sie das [Sunton-ESP32-8048S043-Beispiel](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043) verwenden, das auch die Bibliothekskonfiguration enthält.

Eine sinnvolle Reihenfolge für die erste Inbetriebnahme:

1. Vergewissern Sie sich, dass es sich um die kapazitive Version **8048S043C** handelt.
2. Installieren Sie die ESP32-S3-Boardunterstützung und öffnen Sie das Beispielprojekt in PlatformIO.
3. Kompilieren und laden Sie zuerst die unveränderte Demo hoch.
4. Prüfen Sie, ob das RGB-Display korrekt arbeitet, bevor Sie die Benutzeroberfläche ändern.
5. Kontrollieren Sie Touch-Koordinaten und Displayrotation, bevor Sie LVGL-Widgets ergänzen.
6. Schließen Sie microSD oder andere Peripherie erst an, nachdem Sie gemeinsam genutzte GPIOs geprüft haben.

**Verifizierungsstatus:** Das Beispiel stammt von einem Drittanbieter und wurde nicht von Embedded Nerd getestet. Prüfen Sie Lizenz und Abhängigkeiten, bevor Sie Code daraus in Ihrem eigenen Projekt wiederverwenden.

## SquareLine Studio und LVGL

Mit [SquareLine Studio](https://squareline.io/) können Sie eine LVGL-Oberfläche visuell gestalten und den UI-Code exportieren. Das Tool ersetzt jedoch nicht die hardwarespezifischen Display- und Touchtreiber. Der erzeugte UI-Code muss weiterhin in einen funktionierenden RGB-Panel-Treiber, den GT911-Eingabetreiber und eine kompatible LVGL-Version integriert werden. Prüfen Sie vor dem Import der generierten Dateien das Exportziel und die LVGL-Version.

## ESPHome

Das Board wird auch mit ESPHome und Home Assistant verwendet. Die [ESPHome-Devices-Referenz](https://devices.esphome.io/devices/sunton-esp32-8048s043c/) enthält eine Konfiguration für das 800 × 480-Display und den GT911-Touchcontroller. Die [LVGL-Komponentendokumentation von ESPHome](https://esphome.io/components/lvgl/) erklärt, wie interaktive Seiten erstellt werden.

ESPHome-Konfigurationen sind versionsabhängig, insbesondere bei RGB-Displays und Touchtreibern. Beginnen Sie mit einer Konfiguration, die nachweislich zu Ihrer ESPHome-Version und Platinenrevision passt. Ergänzen Sie anschließend Home-Assistant-Entitäten und Widgets.

## Arduino-IDE-Einstellungen

Für die verbreitete N16R8-Version sind folgende Arduino-IDE-Einstellungen relevant:

1. Installieren Sie das **ESP32-Boardpaket** von Espressif über den Boards Manager.
2. Wählen Sie **ESP32S3 Dev Module**.
3. Stellen Sie **PSRAM** auf **OPI PSRAM**.
4. Stellen Sie **Flash Size** auf **16 MB**.
5. Verwenden Sie für die N16R8-Version den Flash-Modus **QIO 80 MHz**.
6. Wählen Sie bei größeren Projekten ein Partitionsschema, das zum 16-MB-Flash passt.

Ohne die korrekte PSRAM-Konfiguration können Grafik-Anwendungen möglicherweise keinen Framebuffer reservieren. Das kann zu einem schwarzen Bildschirm oder einer Neustartschleife führen.

> **Wichtig:** Diese Einstellungen gelten für die verbreitete N16R8-Konfiguration. Prüfen Sie die genaue Platinenrevision und die Händlerunterlagen, bevor Sie sie übernehmen.
{: .notice--warning}

## Häufige Probleme und was Sie vor dem Kauf wissen sollten

Das 8048S043C reagiert empfindlicher auf die Konfiguration als ein einfaches SPI-Display. Die typischen Probleme sollten Sie daher bereits bei der Auswahl berücksichtigen.

### Bildschirm bleibt schwarz, obwohl das Board läuft

Eine falsche PSRAM-, Display- oder Hintergrundbeleuchtungskonfiguration kann dazu führen, dass der ESP32 funktioniert, aber kein Bild angezeigt wird.

Prüfen Sie:

- PSRAM ist auf **OPI PSRAM** eingestellt.
- Als Boardprofil ist **ESP32-S3** ausgewählt.
- Die Hintergrundbeleuchtung ist korrekt konfiguriert.
- Das Display-Timing entspricht einer funktionierenden Konfiguration für genau dieses Board.

### Neustartschleife oder Reset nach dem Upload

Häufig sind falsche PSRAM- oder Flash-Einstellungen die Ursache.

Prüfen Sie bei der verbreiteten N16R8-Version zuerst die Arduino-IDE-Einstellungen, bevor Sie den Anwendungscode ändern.

### Touchscreen reagiert nicht

Die kapazitive Version verwendet einen GT911 über I²C.

Wenn das Display funktioniert, der Touchscreen aber nicht:

1. Prüfen Sie die I²C-Pins.
2. Führen Sie einen I²C-Scan durch.
3. Suchen Sie den GT911 unter **0x5D** oder **0x14**.
4. Stellen Sie sicher, dass die Software einen GT911-Treiber und keinen Treiber für resistiven Touch verwendet.

Mit unserem [I²C-Adress-Lookup]({{ site.url }}/tools/i2c-address-lookup/) können Sie eine I²C-Adresse identifizieren. Das [I²C-Scanner-Tutorial]({{ site.url }}/i2c-scanner-tutorial/) hilft bei der Fehlersuche.

### Touch ist gespiegelt oder versetzt

Meist liegt dies an der Softwarekonfiguration. Prüfen Sie die Ausrichtung der X-/Y-Achsen sowie die Rotations-Einstellungen in der Touch- und Displaykonfiguration.

### Bild flackert oder verschiebt sich

Ursachen können das RGB-Timing oder die PSRAM-Bandbreite sein. Verwenden Sie zunächst Timing-Werte aus einer funktionierenden Demo für genau diese Platine, statt Werte zu erraten.

### Nur wenige GPIOs verfügbar

Das RGB-Display beansprucht einen erheblichen Teil der GPIOs. Wenn Ihr Projekt mehrere Sensoren, Peripheriegeräte oder Kommunikationsschnittstellen benötigt, prüfen Sie vor dem Kauf die tatsächlich verfügbaren Pins der Erweiterungsheader.

### Upload nicht möglich

Halten Sie bei Bedarf **BOOT (GPIO0)** gedrückt, während Sie das Board über USB-C verbinden, oder versuchen Sie ein anderes USB-Kabel. Einige USB-Kabel unterstützen nur das Laden und keine Datenübertragung.

## Sunton ESP32-8048S043C im Vergleich zu anderen ESP32-Touchscreen-Boards

Entscheidend ist nicht nur die Displaygröße: Auflösung, Touch-Technologie, Display-Schnittstelle, verfügbare GPIOs und Softwareunterstützung bestimmen ebenfalls, wie aufwendig ein Projekt wird.

| Board | Display | Touch / MCU | Besonders geeignet für |
| --- | --- | --- | --- |
| **Sunton ESP32-8048S043C** | 4,3 Zoll, 800 × 480 RGB | ESP32-S3, kapazitiver GT911, 16 MB Flash / 8 MB PSRAM (übliche N16R8-Version) | Integriertes 4,3-Zoll-Touchdisplay mit hoher Auflösung |
| [Waveshare ESP32-S3-Touch-LCD-4.3](https://www.waveshare.com/esp32-s3-touch-lcd-4.3.htm) | 4,3 Zoll, 800 × 480 | ESP32-S3; kapazitiver Touch bei entsprechender Produktvariante | Alternative 4,3-Zoll-Plattform mit Herstellerdokumentation |
| **Sunton ESP32-8048S070C** | 7 Zoll, 800 × 480 RGB | ESP32-S3, kapazitiver Touch bei der C-Version | Größere Displayfläche bei gleicher Pixelauflösung |
| [**Waveshare ESP32-S3-Touch-LCD-7**]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-7/) | 7 Zoll, 800 × 480 IPS | ESP32-S3, 5-Punkt-kapazitiver Touch | 7-Zoll-Alternative mit dokumentierten CAN- und RS485-Schnittstellen |

Prüfen Sie die aktuelle Dokumentation der jeweiligen Hersteller zu Speicher, Anschlüssen und Touchcontroller. Ähnliche Modellnamen bedeuten nicht, dass Pinbelegung oder Softwarekonfiguration austauschbar sind.

Für einen gezielten Vergleich können Sie den [ESP32-Touchscreen-Auswahlassistenten für 4,3-Zoll-Displays]({{ site.url }}/tools/esp32-touchscreen-selector/esp32-4-3-inch-touchscreen/) oder den [Auswahlassistenten für 800 × 480-Displays]({{ site.url }}/tools/esp32-touchscreen-selector/800x480/) verwenden.

## Preis und Verfügbarkeit des Sunton ESP32-8048S043C

**[Sunton ESP32-8048S043C auf AliExpress ansehen →](https://s.click.aliexpress.com/e/_c2zi4HDn){: rel="sponsored nofollow noopener" target="_blank"}**

Vergewissern Sie sich vor der Bestellung, dass das Angebot die **kapazitive 8048S043C-Version mit GT911** betrifft und nicht die resistive R- oder die Touch-freie N-Version. Die genaue Modellkennung hinter der verkürzten Affiliate-URL ist für Embedded Nerd nicht sichtbar. Prüfen Sie deshalb sorgfältig die Produktbilder und technischen Angaben des Verkäufers.

Preise, Versandkosten, Steuern und Lagerbestand variieren je nach Händler und Lieferziel. Vergleichen Sie den **Endpreis inklusive Lieferung** und prüfen Sie die Platinenrevision vor dem Kauf. Weitere technische Angaben und aktuelle Kaufoptionen finden Sie auf der [Produktseite des Sunton ESP32-8048S043C]({{ site.url }}/products/sunton-esp32-8048s043c/).

## FAQ

### Lohnt sich der Kauf des Sunton ESP32-8048S043C?

Das Board ist eine gute Option, wenn Sie einen ESP32-S3 und ein kapazitives 4,3-Zoll-Touchdisplay mit 800 × 480 Pixeln auf einer Platine integrieren möchten. Entscheidend ist, dass die genaue Hardware-Revision zur vorgesehenen Softwarekonfiguration passt.

### Welchen Touchcontroller verwendet das 8048S043C?

Die kapazitive Version verwendet einen **GT911** über I²C, normalerweise an GPIO19 und GPIO20.

### Hat das 8048S043C PSRAM?

Die verbreitete N16R8-Version besitzt **8 MB Octal-PSRAM** und **16 MB Flash**. Prüfen Sie vor der Bestellung das konkrete Angebot, da mehrere Varianten existieren.

### Ist das 8048S043C kapazitiv oder resistiv?

Die **C-Version** ist kapazitiv und verwendet den GT911. Die **R-Version** verwendet resistive Touch-Hardware und einen anderen Controller. Einige Angebote verwenden **8048S043** ohne Suffix als Familienbezeichnung; eine **N-Version** wird in manchen Referenzen ohne Touch aufgeführt. Prüfen Sie vor dem Kauf die genaue Platine.

### Hat die Version 8048S043N einen Touchscreen?

Die N-Variante wird in einigen Referenzen als Version ohne Touch aufgeführt. Gehen Sie nicht davon aus, dass ein GT911 vorhanden ist. Prüfen Sie das konkrete Angebot und die Platinenrevision.

### Ist das Board für LVGL geeignet?

Ja. ESP32-S3, RGB-Display und PSRAM eignen sich für grafisch anspruchsvolle LVGL-Oberflächen, sofern die Displaykonfiguration stimmt. Wenn Sie Boards für solche Projekte vergleichen, hilft der [ESP32-S3-LVGL-Display-Auswahlassistent]({{ site.url }}/tools/esp32-touchscreen-selector/esp32-s3-lvgl/).

### Sollte ich das 8048S043C oder ein anderes ESP32-Touchdisplay kaufen?

Das hängt von Displaygröße, Auflösung, Touch-Technologie, GPIO-Bedarf und Softwareunterstützung ab.

Vergleichen Sie Displaygröße, Auflösung und PSRAM mit dem [ESP32-Touchscreen-Auswahlassistenten]({{ site.url }}/tools/esp32-touchscreen-selector/).

### Kann ich zusätzliche Sensoren anschließen?

Ja. Verwenden Sie freie Pins am Erweiterungsheader und achten Sie darauf, dass I²C-Geräte keine Adresskonflikte mit dem Touchcontroller verursachen.

Beispielsweise lassen sich I²C-Sensoren wie der [MPU6050]({{ site.url }}/mpu6050-arduino-guide/) oder der [BMA400]({{ site.url }}/bma400-esp32-tutorial-wiring-code-arduino-guide/) mit dem Board verwenden, sofern geeignete Pins und I²C-Adressen verfügbar sind.

## Über den Autor

**Embedded Nerd** veröffentlicht praxisorientierte Anleitungen zu ESP32-Boards, Embedded-Hardware, Displays, Sensoren und Entwicklungstools. Dieser Leitfaden basiert auf Herstellerunterlagen und referenzierten Community-Projekten. Das Board wurde für diesen Artikel nicht unabhängig getestet.

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": {{ page.title | jsonify }},
  "description": {{ page.excerpt | strip_html | strip_newlines | jsonify }},
  "mainEntityOfPage": { "@type": "WebPage", "@id": {{ page.url | absolute_url | jsonify }} },
  "datePublished": {{ page.date | date_to_xmlschema | jsonify }},
  "dateModified": {{ page.last_modified_at | date_to_xmlschema | jsonify }},
  "author": { "@type": "Organization", "name": "Embedded Nerd", "url": {{ site.url | jsonify }} },
  "publisher": { "@type": "Organization", "name": "Embedded Nerd", "url": {{ site.url | jsonify }} },
  "image": [{{ page.image | absolute_url | jsonify }}]
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    { "@type": "ListItem", "position": 1, "name": "Startseite", "item": {{ site.url | append: "/" | jsonify }} },
    { "@type": "ListItem", "position": 2, "name": "ESP32-Touchscreen-Displays – Leitfaden", "item": {{ "/esp32-touchscreen-displays-guide/" | absolute_url | jsonify }} },
    { "@type": "ListItem", "position": 3, "name": {{ page.title | jsonify }}, "item": {{ page.url | absolute_url | jsonify }} }
  ]
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    { "@type": "Question", "name": "Lohnt sich der Kauf des Sunton ESP32-8048S043C?", "acceptedAnswer": { "@type": "Answer", "text": "Das Board ist eine gute Option, wenn Sie einen ESP32-S3 und ein kapazitives 4,3-Zoll-Touchdisplay mit 800 × 480 Pixeln auf einer Platine integrieren möchten. Prüfen Sie, ob die Hardware-Revision zur Softwarekonfiguration passt." } },
    { "@type": "Question", "name": "Welchen Touchcontroller verwendet das 8048S043C?", "acceptedAnswer": { "@type": "Answer", "text": "Die kapazitive Version verwendet einen GT911 über I²C, normalerweise an GPIO19 und GPIO20." } },
    { "@type": "Question", "name": "Hat das 8048S043C PSRAM?", "acceptedAnswer": { "@type": "Answer", "text": "Die verbreitete N16R8-Version besitzt 8 MB Octal-PSRAM und 16 MB Flash. Prüfen Sie das konkrete Angebot, da Varianten existieren." } },
    { "@type": "Question", "name": "Ist das 8048S043C kapazitiv oder resistiv?", "acceptedAnswer": { "@type": "Answer", "text": "Die C-Version ist kapazitiv und verwendet den GT911. Die R-Version verwendet resistive Touch-Hardware und einen anderen Controller." } },
    { "@type": "Question", "name": "Hat die Version 8048S043N einen Touchscreen?", "acceptedAnswer": { "@type": "Answer", "text": "Die N-Variante wird in einigen Referenzen als Version ohne Touch aufgeführt. Prüfen Sie das konkrete Angebot und die Platinenrevision." } },
    { "@type": "Question", "name": "Ist das Board für LVGL geeignet?", "acceptedAnswer": { "@type": "Answer", "text": "Ja. ESP32-S3, RGB-Display und PSRAM eignen sich für anspruchsvolle LVGL-Oberflächen, sofern die Displaykonfiguration stimmt." } },
    { "@type": "Question", "name": "Sollte ich das 8048S043C oder ein anderes ESP32-Touchdisplay kaufen?", "acceptedAnswer": { "@type": "Answer", "text": "Vergleichen Sie Displaygröße, Auflösung, Touch-Technologie, GPIO-Bedarf und Softwareunterstützung." } },
    { "@type": "Question", "name": "Kann ich zusätzliche Sensoren anschließen?", "acceptedAnswer": { "@type": "Answer", "text": "Ja. Verwenden Sie freie Pins am Erweiterungsheader und achten Sie auf mögliche I²C-Adresskonflikte mit dem Touchcontroller." } }
  ]
}
</script>

## Fazit

Das **Sunton ESP32-8048S043C** ist eine interessante Option, wenn Sie ein relativ großes **4,3-Zoll-Touchdisplay mit 800 × 480 Pixeln** zusammen mit einem **ESP32-S3** auf einer Platine nutzen möchten.

Zu den größten Vorteilen zählen das integrierte Display und die Touch-Hardware, der PSRAM sowie die Unterstützung grafisch anspruchsvoller Oberflächen wie LVGL.

Der wichtigste Kompromiss: RGB-Display, PSRAM-Konfiguration und die unterschiedlichen Hardwarevarianten erfordern mehr Sorgfalt als ein einfacheres ESP32-Displaymodul.

Wenn diese Eigenschaften zu Ihrem Projekt passen, ist das 8048S043C eine Überlegung wert. Achten Sie vor dem Kauf darauf, dass Suffix und Hardware-Revision zu Ihrer Software passen.

### Verwandte Anleitungen und Tools

- [Leitfaden zu ESP32-Touchscreen-Displays]({{ site.url }}/esp32-touchscreen-displays-guide/) – Displaygrößen, Touch-Technologien, Schnittstellen und Speicheranforderungen vergleichen.
- [ESP32-Touchscreen-Auswahlassistent]({{ site.url }}/tools/esp32-touchscreen-selector/) – Boards nach Auflösung, PSRAM, Touch-Typ und Schnittstelle filtern.
- [Waveshare ESP32-S3-Touch-LCD-4.3 – Produktseite]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-4-3/) – eine weitere integrierte 4,3-Zoll-ESP32-S3-Displayplattform vergleichen.
- [Waveshare ESP32-S3-Touch-LCD-7 – Produktseite]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-7/) – eine 7-Zoll-Alternative mit 800 × 480 Pixeln für mehr physische Displayfläche.
- [I²C-Scanner für Arduino, ESP32 und ESP8266]({{ site.url }}/i2c-scanner-tutorial/) – prüfen, welche I²C-Geräte beim Debuggen von Touch- oder Sensorverbindungen auf dem Bus antworten.
- [I²C-Adress-Lookup und Kompatibilitätsprüfung]({{ site.url }}/tools/i2c-address-lookup/) – I²C-Adressen prüfen und mögliche Konflikte mit dem GT911 untersuchen.
- [Sunton ESP32-8048S043C – Produktseite]({{ site.url }}/products/sunton-esp32-8048s043c/) – technische Daten und aktuelle Kaufoptionen ansehen.
