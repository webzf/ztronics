---
layout: product
lang: de
toc_label: Inhalt
page_id: product-seeed-xiao-esp32s3-sense
available_languages:
  - en
  - de
  - es
  - fr
english_url: /products/seeed-xiao-esp32s3-sense/
german_url: /de/products/seeed-xiao-esp32s3-sense/
spanish_url: /es/products/seeed-xiao-esp32s3-sense/
french_url: /fr/products/seeed-xiao-esp32s3-sense/
internal_links: true
title: "Seeed Studio XIAO ESP32S3 Sense: Kamera, Mikrofon und microSD auf 21 × 17,8 mm"
product_verdict: "Eine sehr kompakte ESP32-S3-Platine für Kamera-, Audio- und Datenlogger-Projekte. Beachten Sie die gemeinsam genutzten GPIOs und den höheren Deep-Sleep-Stromverbrauch mit angeschlossener Erweiterungsplatine."
editorial_review:
  rating: 8.5
  best_rating: 10
  worst_rating: 1
  author: "Embedded Nerd"
  summary: "Das Seeed Studio XIAO ESP32S3 Sense kombiniert einen ESP32-S3 mit 8 MB PSRAM und 8 MB Flash, eine abnehmbare Kamera-Erweiterungsplatine, ein digitales Mikrofon und einen microSD-Steckplatz in einem 21 × 17,8 mm kleinen Modul mit Ladefunktion für einen Akku. Die wichtigsten Einschränkungen sind gemeinsam genutzte GPIOs, ein höherer Deep-Sleep-Stromverbrauch mit angeschlossener Erweiterungsplatine und mögliche Kameraunterschiede zwischen Produktionschargen."
  methodology: "Diese redaktionelle Einschätzung basiert auf veröffentlichten technischen Daten und der Dokumentation des Herstellers. Embedded Nerd hat die hier beschriebene Platine und das konkrete Händlerangebot nicht physisch getestet."
  pros:
    - "Kamera, digitales Mikrofon und microSD-Steckplatz auf einer nur daumengroßen Platine"
    - "ESP32-S3 mit 8 MB PSRAM und 8 MB Flash für Kamerastreaming und kleine ML-Demos"
    - "Integrierte Ladeelektronik für Li-Ionen-Akkus und U.FL-Antennenanschluss"
    - "Ausführliche offizielle Dokumentation, Pinbelegungen und Beispiele von Seeed Studio"
  cons:
    - "Mikrofon, SD-Karte und Benutzer-LED teilen sich GPIOs mit den Header-Pins; die verfügbaren Pins müssen vor dem Verdrahten geprüft werden"
    - "Der Deep-Sleep-Stromverbrauch beträgt mit angeschlossener Erweiterungsplatine etwa 3 mA und liegt damit deutlich über dem einfachen XIAO ESP32S3"
    - "Die Platine wird üblicherweise ohne Stiftleisten geliefert; das Kameramodul (OV5640 oder OV3660) kann je nach Charge variieren"
seo_title: "XIAO ESP32S3 Sense: Datenblatt, Pinout und Bezugsquellen"
seo_description: "Technische Daten und Pinout des Seeed Studio XIAO ESP32S3 Sense: D0–D12 zu GPIO, OV5640-Kamera, Mikrofon, microSD, Stromverbrauch und Bezugsquellen."
product_id: seeed-xiao-esp32s3-sense
category: Development Boards
manufacturer: "Seeed Studio"
image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
header:
  teaser: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image_alt: "Vorderseite des Seeed Studio XIAO ESP32S3 Sense mit Kameramodul"
alt: "Seeed Studio XIAO ESP32S3 Sense, Vorderansicht mit Kameramodul"
excerpt: "Seeed Studio XIAO ESP32S3 Sense mit ESP32-S3, OV5640-Kamera, digitalem Mikrofon, microSD-Steckplatz, 8 MB PSRAM und 8 MB Flash auf 21 × 17,8 mm."
description: "Das Seeed Studio XIAO ESP32S3 Sense ist eine daumengroße ESP32-S3-Entwicklungsplatine mit 8 MB PSRAM, 8 MB Flash, WLAN, Bluetooth LE und Akku-Ladefunktion. Die abnehmbare Erweiterungsplatine ergänzt eine Kamera, ein digitales Mikrofon und einen microSD-Steckplatz. Mehrere GPIOs werden gemeinsam von Header, Mikrofon, SD-Karte und Benutzer-LED genutzt. Prüfen Sie daher vor dem Anschließen die Pin-Tabellen."
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
  - name: Prozessor
    value: "ESP32-S3R8, Dual-Core Xtensa LX7, bis zu 240 MHz"
  - name: Flash
    value: "8 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Kamera
    value: "Abnehmbare OV5640 mit Autofokus (bei einigen Platinen OV3660)"
  - name: Mikrofon
    value: "Digitales PDM-Mikrofon"
  - name: Speicher
    value: "microSD-Steckplatz auf der Erweiterungsplatine, FAT mit bis zu 32 GB unterstützt"
  - name: Funkverbindungen
    value: "2,4-GHz-WLAN und Bluetooth LE 5.0 / Bluetooth Mesh"
  - name: USB
    value: "USB Type-C"
  - name: Akku
    value: "3,7-V-Li-Ionen-Akku mit integrierter Ladeelektronik"
  - name: Abmessungen
    value: "21 × 17,8 mm; mit Erweiterungsplatine 21 × 17,8 × 15 mm"
  - name: Betriebstemperatur
    value: "−20 °C bis 65 °C"
links:
  - title: "Seeed Studio XIAO ESP32-S3 – Erste Schritte"
    icon: "fas fa-book"
    description: "Offizielle technische Daten, Pinbelegung, Einrichtungsanleitung und Fehlerbehebung."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/"
  - title: "Pin-Multiplexing des XIAO ESP32-S3 (Sense)"
    icon: "fas fa-microchip"
    description: "Offizielle Hinweise zur Verwendung von GPIO, ADC, I²C, SPI, UART und Touch-Pins."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/"
  - title: "Produktseite von Seeed Studio"
    icon: "fas fa-store"
    description: "Offizielle Produktseite des XIAO ESP32S3 Sense."
    url: "https://www.seeedstudio.com/XIAO-ESP32S3-Sense-p-5639.html"
related:
  - arduino-nano-esp32
  - esp32-devkit
  - raspberry-pi-pico-w
---

Das **Seeed Studio XIAO ESP32S3 Sense** ist eine daumengroße ESP32-S3-Platine mit einer abnehmbaren Erweiterungsplatine, auf der sich eine Kamera, ein digitales Mikrofon und ein microSD-Steckplatz befinden. Das Modell wird auch als **XIAO ESP32-S3 Sense** oder **Seeed XIAO ESP32S3 Sense** gesucht. Achten Sie beim Kauf ausdrücklich auf die **Sense**-Version: Das äußerlich sehr ähnliche normale XIAO ESP32S3 besitzt keine Kamera, kein Mikrofon und keinen SD-Steckplatz.

Wichtig vor dem Anschließen externer Hardware sind die **gemeinsam genutzten Pins**: Mikrofon, SD-Karte und Benutzer-LED verwenden teilweise dieselben GPIOs wie die Header-Pins. Die folgenden Tabellen zeigen die genaue Zuordnung.

## Produktbilder

<div class="product-image-gallery" style="display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:1rem;margin:1.5rem 0;">
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-front.webp" alt="Vorderansicht des Seeed Studio XIAO ESP32S3 Sense mit Kameraplatine" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Vorderansicht: XIAO ESP32S3 Sense mit Kameramodul</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-camera-assembly.webp" alt="Seeed Studio XIAO ESP32S3 Sense mit montierter Kamera-Erweiterungsplatine" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Kamera und Erweiterungsplatine im montierten Zustand</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-back.webp" alt="Rückseite des Seeed Studio XIAO ESP32S3 Sense mit Pin-Beschriftungen und Lötpads" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Rückseite: Pin-Beschriftungen und Lötpads</figcaption>
  </figure>
</div>

## Lohnt sich der Kauf des XIAO ESP32S3 Sense?

Diese Platine ist eine gute Wahl, wenn Sie eine Kamera, ein Mikrofon oder SD-Datenspeicherung auf einer daumengroßen Platine benötigen – etwa für eine kleine WLAN-Kamera, ein Audio- oder Sprachprojekt, ein Wearable oder einen batteriebetriebenen Datenlogger. Wenn Sie lediglich einen kleinen ESP32-S3 ohne diese Zusatzfunktionen benötigen, ist das normale XIAO ESP32S3 interessant: Es besitzt dasselbe Header-Layout und einen deutlich geringeren Deep-Sleep-Stromverbrauch. Für mehr GPIOs und 16 MB Flash sollten Sie sich das XIAO ESP32-S3 Plus ansehen.

## XIAO ESP32S3, Sense oder Plus: Welche Version ist die richtige?

| Merkmal | XIAO ESP32S3 | XIAO ESP32S3 Sense | XIAO ESP32-S3 Plus |
|---|---|---|---|
| Kamera und Mikrofon | Nein | Ja (Erweiterungsplatine) | Nein |
| microSD-Steckplatz | Nein | Ja (Erweiterungsplatine) | Nein |
| Flash / PSRAM | 8 MB / 8 MB | 8 MB / 8 MB | 16 MB / 8 MB |
| GPIOs mit PWM | 11 | 11 | 18 |
| Deep-Sleep-Strom (Angabe von Seeed) | 14 µA | 3 mA mit Erweiterungsplatine | 33,5 µA |
| Geeignet für | Kleine Projekte mit niedrigem Stromverbrauch | Bildverarbeitung, Audio und Datenlogging | Mehr Pins und Flash |

Preise unterscheiden sich je nach Händler, Lieferland, Versand und ausgewählter Variante. Prüfen Sie vor dem Kauf das aktuelle Angebot, das Zubehör und das enthaltene Kameramodell.

<div class="en-product-cta__buttons">
  <a class="en-buy-button" href="/go/hardware/seeed-xiao-esp32s3-sense/" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-cart-shopping"></i></span><span class="en-buy-text"><strong>Preis prüfen – XIAO ESP32S3 Sense</strong><small>AliExpress · Kameraversion und Stiftleisten prüfen</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.amazon.com/Seeed-Studio-XIAO-ESP32-Sense/dp/B0C69FFVHH?tag=embeddednerd2-20" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fab fa-amazon"></i></span><span class="en-buy-text"><strong>Preis prüfen – Amazon</strong><small>Sense-Version und Lieferumfang prüfen</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
</div>

## Technische Daten im Überblick

| Spezifikation | Details |
|---|---|
| Mikrocontroller | ESP32-S3R8, Dual-Core Xtensa LX7, bis zu 240 MHz |
| Flash | 8 MB |
| PSRAM | 8 MB |
| Funkverbindungen | 2,4-GHz-WLAN, Bluetooth LE 5.0 / Bluetooth Mesh |
| Kamera | Abnehmbare OV5640 mit Autofokus (2592 × 1944); einige Platinen werden mit OV3660 (2048 × 1536) ausgeliefert; frühere Platinen nutzten OV2640 (1600 × 1200) |
| Mikrofon | Digitales PDM-Mikrofon |
| Speicher | microSD-Steckplatz auf der Erweiterungsplatine, FAT mit bis zu 32 GB unterstützt |
| Schnittstellen | 1 × UART, 1 × I²C, 1 × I²S, 1 × SPI, 11 × GPIO mit PWM, 9 × ADC |
| Taster und LEDs | Reset, Boot, Benutzer-LED, Lade-LED |
| Stromversorgung | 5 V über USB Type-C oder 3,7-V-Li-Ionen-Akku |
| Antenne | U.FL-Anschluss; externe Antenne im Lieferumfang |
| Abmessungen | 21 × 17,8 mm; mit Erweiterungsplatine 21 × 17,8 × 15 mm |
| Betriebstemperatur | −20 °C bis 65 °C |

Die technischen Angaben basieren auf dem Seeed Studio Wiki (Stand: 7. November 2026). Seeed stellt die Kamera derzeit von OV3660 auf OV5640 mit Autofokus um. Während dieser Umstellung können Platinen mit beiden Kameravarianten ausgeliefert werden.

## Kamera, Mikrofon und microSD

Die Erweiterungsplatine wird über einen Board-to-Board-Steckverbinder angeschlossen und enthält Kamera, PDM-Mikrofon und microSD-Steckplatz. Die Kamerabeispiele von Seeed unterstützen OV5640, OV3660 und OV2640. Die gleichen Programme können daher verwendet werden; nur die OV5640 besitzt Autofokus. Das OV5640-Modul ist auch separat als Ersatzteil erhältlich.

Laut Seeed aktiviert die ab Juni 2025 ausgelieferte Werksfirmware standardmäßig einen WLAN-Access-Point mit veröffentlichtem Namen und Passwort. Installieren Sie vor dem Einsatz an einem öffentlich zugänglichen Ort eine eigene Firmware.

## Pinout des XIAO ESP32S3 Sense: D0–D12 zu GPIO

| XIAO-Pin | GPIO | Funktionen | Hinweis |
|---|---:|---|---|
| D0 | GPIO1 | ADC, Touch | Allgemeine Ein-/Ausgabe |
| D1 | GPIO2 | ADC, Touch | Allgemeine Ein-/Ausgabe |
| D2 | GPIO3 | ADC, Touch | Strapping-Pin (JTAG-Quelle) |
| D3 | GPIO4 | ADC, Touch | Allgemeine Ein-/Ausgabe |
| D4 / SDA | GPIO5 | I²C-Daten, ADC, Touch | Standard-I²C. Siehe [I²C-Adressübersicht](/tools/i2c-address-lookup/) und [I²C-Scanner-Tutorial](/i2c-scanner-tutorial/). |
| D5 / SCL | GPIO6 | I²C-Takt, ADC, Touch | Standard-I²C |
| D6 / TX | GPIO43 | UART TX | Serielle Ausgabe |
| D7 / RX | GPIO44 | UART RX | Serielle Eingabe |
| D8 / SCK | GPIO7 | SPI-Takt, ADC, Touch | Wird auch vom SD-Kartentakt verwendet |
| D9 / MISO | GPIO8 | SPI MISO, ADC, Touch | Wird auch für SD-Kartendaten verwendet |
| D10 / MOSI | GPIO9 | SPI MOSI, ADC, Touch | Wird auch für SD-Kartendaten verwendet |
| D11 | GPIO42 | Touch | Gemeinsam mit dem Mikrofontakt |
| D12 | GPIO41 | Touch | Gemeinsam mit den Mikrofondaten |

Seeed weist darauf hin, dass D11 und D12 (GPIO42 und GPIO41) zwar als Analog-Pins gekennzeichnet sind, der ESP32-S3 dort aber keine ADC-Messung unterstützt. Verwenden Sie für analoge Messungen D0–D5 und D8–D10.

Versorgungspins: **5V** ist die USB-5-V-Schiene, **3V3** der geregelte 3,3-V-Ausgang und **GND** Masse. Alle GPIOs arbeiten mit 3,3-V-Logik und dürfen nicht mit 5 V beaufschlagt werden. Im Akkubetrieb liegt am 5V-Pin keine Spannung an.

## GPIO-Verfügbarkeit: Pins für Kamera, Mikrofon und SD-Karte

Laut Pinbelegung von Seeed überschneiden sich Kamera, Mikrofon und SD-Karte nicht gegenseitig. Einige dieser Funktionen teilen sich jedoch GPIOs mit den Header-Pins.

| Funktion | GPIO | Gemeinsam genutzt mit |
|---|---|---|
| Mikrofontakt (PDM) | GPIO42 | Header-Pin D11 |
| Mikrofondaten (PDM) | GPIO41 | Header-Pin D12 |
| Chip-Select der SD-Karte | GPIO21 | Benutzer-LED |
| SD-Kartentakt / MISO / MOSI | GPIO7 / GPIO8 / GPIO9 | SPI-Header-Pins D8 / D9 / D10 |
| Kamera-I²C-Daten / Takt | GPIO40 / GPIO39 | JTAG-Pins MTDO / MTCK |
| Kameradaten, Takt und Synchronisation | GPIO10–18, 38, 47, 48 | Nur Board-to-Board-Steckverbinder |

Wenn Sie die SD-Karte verwenden, dient die Benutzer-LED an GPIO21 gleichzeitig als Chip-Select-Leitung der Karte. Zusätzliche SPI-Geräte an D8–D10 teilen sich den Bus mit der SD-Karte und benötigen einen eigenen Chip-Select-Pin. Bei Verwendung des Mikrofons gelten D11 und D12 als belegt.

## Stromverbrauch und Akkubetrieb

Typische von Seeed veröffentlichte Werte für das Sense **mit angeschlossener Erweiterungsplatine**:

| Betriebsmodus | Typischer Strom |
|---|---:|
| WLAN aktiv | 110 mA |
| Bluetooth LE aktiv | 102 mA |
| Modem-Sleep | 44 mA |
| Light-Sleep | 5 mA |
| Deep Sleep | 3 mA |
| Kamera-Webserver (USB) | etwa 140 mA im Durchschnitt, 347 mA Spitze |

Die Platine kann mit einem 3,7-V-Li-Ionen-Akku betrieben und über USB-C geladen werden. Laut Seeed befindet sich das negative Batterie-Lötpad am nächsten zum USB-Anschluss. Prüfen Sie die Polarität vor dem Löten sorgfältig. Es gibt keinen eigenen GPIO zum Auslesen der Akkuspannung; dafür ist ein externer Spannungsteiler an einem ADC-Pin erforderlich.

## Arduino, MicroPython und erste Schritte

Seeed dokumentiert Arduino und MicroPython für die XIAO-ESP32-S3-Serie sowie Anleitungen für ESP-IDF und Zephyr. Wählen Sie in der Arduino IDE das Board **XIAO_ESP32S3** und verwenden Sie das ESP32-Boardpaket ab Version 2.0.8.

Beispiel für die integrierte LED und einen analogen Eingang:

```cpp
const int ledPin = LED_BUILTIN; // GPIO21 am XIAO ESP32S3
const int analogPin = A0;       // D0 = GPIO1 (ADC)

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // Die Benutzer-LED ist aktiv LOW: LOW schaltet sie ein.
  digitalWrite(ledPin, LOW);
  delay(500);
  digitalWrite(ledPin, HIGH);
  delay(500);

  Serial.print("A0 = ");
  Serial.println(analogRead(analogPin));
}
```

Öffnen Sie den seriellen Monitor mit **115200 Baud**. Da GPIO21 auch als Chip-Select der SD-Karte dient, darf die LED nicht geschaltet werden, während die SD-Karte verwendet wird. Wenn der Port verschwindet oder ein Upload fehlschlägt, halten Sie beim Anschließen des USB-Kabels die Taste **Boot** gedrückt, um den Bootloader-Modus zu starten.

- [Seeed Studio – Erste Schritte](https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/)
- [Seeed Studio – Pin-Multiplexing](https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/)

## Bezugsquellen

Prüfen Sie, ob das Angebot ausdrücklich die **Sense**-Version enthält, welches Kameramodell verbaut ist, wer der Verkäufer ist und wohin geliefert wird. Seeed liefert die Platine standardmäßig ohne Stiftleisten. Achten Sie daher auf eine bereits bestückte Variante oder planen Sie das eigene Löten der Header ein. Angebote unterscheiden sich je nach Region; auf dieser Seite wird kein fester Preis angegeben.

Als Affiliate kann Embedded Nerd bei qualifizierten Käufen eine Provision erhalten. Für Sie entstehen dadurch keine zusätzlichen Kosten.

- [Seeed Studio XIAO ESP32S3 Sense im Seeed-Store](https://www.seeedstudio.com/XIAO-ESP32S3-Sense-p-5639.html)

## Häufig gestellte Fragen

### Ist das XIAO ESP32S3 Sense dasselbe wie das XIAO ESP32S3?

Nein. Beide verwenden dieselbe Hauptplatine und dasselbe Header-Layout. Das Sense besitzt jedoch eine abnehmbare Erweiterungsplatine mit Kamera, digitalem Mikrofon und microSD-Steckplatz. Beim normalen XIAO ESP32S3 fehlen diese Komponenten; außerdem ist dessen Stromverbrauch im Deep Sleep geringer.

### Welche Kamera verwendet das XIAO ESP32S3 Sense?

Aktuelle Platinen verwenden eine abnehmbare OV5640-Kamera mit Autofokus. Während der Umstellung können einige Lieferungen noch die OV3660 enthalten. Frühere Platinen verwendeten die inzwischen eingestellte OV2640. Die Beispiele von Seeed unterstützen alle drei Modelle.

### Sind die GPIOs des XIAO ESP32S3 Sense 5-V-tolerant?

Nein. Die GPIOs arbeiten mit 3,3-V-Logik und dürfen nicht mit 5 V beaufschlagt werden. Verwenden Sie für 5-V-Sensoren oder -Module einen Pegelwandler.

### Können Kamera, Mikrofon und SD-Karte gleichzeitig verwendet werden?

Laut Pinbelegung von Seeed überschneiden sich diese Funktionen nicht gegenseitig und können zusammen verwendet werden. Das Mikrofon belegt D11 und D12, die SD-Karte teilt sich die SPI-Pins D8–D10; ihr Chip-Select liegt auf demselben GPIO wie die Benutzer-LED.

### Kann das XIAO ESP32S3 Sense einen Akku laden?

Ja. Die Platine verfügt über eine Ladeelektronik für Li-Ionen-Akkus und entsprechende Batterieanschlüsse. Im Akkubetrieb liegt am 5V-Pin keine Spannung an. Außerdem gibt es keinen dedizierten Pin zum Auslesen der Akkuspannung.

### Werden Stiftleisten mitgeliefert?

Seeed liefert die Platine standardmäßig ohne Stiftleisten. Prüfen Sie, ob das Angebot eine bereits bestückte Variante enthält, oder löten Sie eigene Header an.

### Funktioniert das XIAO ESP32S3 Sense mit MicroPython?

Ja. Seeed dokumentiert Arduino und MicroPython für die XIAO-ESP32-S3-Serie. Die verwendete Entwicklungsumgebung ändert jedoch nichts an den 3,3-V-Grenzen oder der oben gezeigten Pinbelegung.

## Vergleich mit anderen ESP32-Boards

| Board | Besonders geeignet für |
|---|---|
| Seeed Studio XIAO ESP32S3 Sense | Sehr kompakte Kamera-, Audio- und Datenlogger-Projekte |
| [Arduino Nano ESP32](/products/arduino-nano-esp32/) | Nano-Format mit ESP32-S3 und Arduino-Pinbezeichnungen |
| [ESP32 DevKit V1](/products/esp32-devkit/) | Preisgünstige Allzweck-Prototypen |
| [Raspberry Pi Pico W](/products/raspberry-pi-pico-w/) | RP2040 mit WLAN und MicroPython-Unterstützung |

Sie sind unsicher, welches Board zu Ihrem Projekt passt? Lesen Sie unseren Leitfaden [Die besten ESP32-Boards](/best-esp32-boards/) oder besuchen Sie die Kategorie [Entwicklungsboards](/products/development-boards/).
