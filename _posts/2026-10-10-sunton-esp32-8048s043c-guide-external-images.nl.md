---
title: "Sunton ESP32-8048S043C Arduino-pinout, code en installatiehandleiding"
title_tag: "Sunton ESP32-8048S043C Arduino-pinout en installatie"
hide_post_pagination: true
layout: single
lang: nl
locale: nl-NL
translation_id: sunton-esp32-8048s043c-guide
available_languages:
  - en
  - de
  - es
  - fr
  - it
  - nl
english_url: /sunton-esp32-8048s043c-guide/
german_url: /de/sunton-esp32-8048s043c-guide/
spanish_url: /es/sunton-esp32-8048s043c-guide/
french_url: /fr/sunton-esp32-8048s043c-guide/
italian_url: /it/sunton-esp32-8048s043c-guide/
dutch_url: /nl/sunton-esp32-8048s043c-guide/
permalink: /nl/sunton-esp32-8048s043c-guide/
id: "https://embeddednerd.com/nl/sunton-esp32-8048s043c-guide/"
sidebar:
  nav: "embedded"
  related: true
  share: true
excerpt: "Arduino-code en pinout voor de Sunton ESP32-8048S043C: RGB-schermconfiguratie, GT911-aanraking, microSD-GPIO's, LVGL, ESPHome en kooptips."
show_date: false
last_modified_at: 2026-10-11
author: "Embedded Nerd"
read_time: false
toc: true
toc_label: "Inhoud"
toc_sticky: true
header:
  teaser: /assets/images/sunton-esp32-8048s043c-board.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/sunton-esp32-8048s043c-board.webp
  og_image: /assets/images/sunton-esp32-8048s043c-board.webp
  og_image_alt: "Sunton ESP32-8048S043C met gele printplaat en 4,3-inch 800x480-touchscreen en ESP32-S3"
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

De **Sunton ESP32-8048S043C** is een alles-in-één-bord met een ESP32-S3, een 4,3-inch 800×480 IPS-scherm en een capacitief aanraakpaneel op één printplaat. Het is bedoeld voor projecten waarvoor een relatief groot touchscreen nodig is zonder een afzonderlijke ESP32 en schermmodule te combineren.

> **Opmerking over het testen:** deze handleiding is gebaseerd op documentatie van de fabrikant en openbaar beschikbare hardwareverwijzingen en voorbeeldprojecten. Embedded Nerd heeft dit bord niet onafhankelijk getest voor dit artikel. Pinindelingen kunnen per revisie verschillen; controleer ze daarom aan de hand van het schema van jouw bord voordat je randapparatuur aansluit.

> **Affiliatevermelding:** de AliExpress-link in deze handleiding is een affiliatelink. Embedded Nerd kan een commissie ontvangen wanneer je via deze link iets koopt, zonder extra kosten voor jou.

Controleer vóór aankoop wel een paar zaken. Sunton verkoopt verschillende vergelijkbare borden, waaronder capacitieve en resistieve versies. De exacte hardwarerevisie kan invloed hebben op de pinout en de aanbevolen configuratie.

Deze handleiding behandelt de specificaties, scherm- en aanraakhardware, belangrijke pinnen, softwarecompatibiliteit, veelvoorkomende problemen en de belangrijkste aandachtspunten bij de keuze voor de 8048S043C.

> **Weet je niet zeker welk ESP32-touchscreen bij je project past?** Begin met onze [handleiding voor ESP32-touchscreens]({{ site.url }}/esp32-touchscreen-displays-guide/) en vergelijk borden op basis van resolutie en geheugenvereisten.

![Sunton ESP32-8048S043C-I 4,3-inch capacitief touchscreenbord, met aanduidingen voor de ESP32-S3-module en connectoren](/assets/images/sunton-esp32-8048s043c-board.webp)

*Bordafbeelding aangeleverd door Embedded Nerd.*

## Specificaties van de Sunton ESP32-8048S043C

| **Eigenschap** | **Details** |
| --- | --- |
| MCU | ESP32-S3 (dual-core, Wi-Fi + Bluetooth LE) |
| Flash / PSRAM | 16 MB Flash, 8 MB octale PSRAM op de gangbare N16R8-versie |
| Scherm | 4,3-inch IPS, 800×480 |
| Scherminterface | 16-bits parallel RGB |
| Aanraking | Capacitief, GT911-controller via I2C |
| Opslag | microSD-kaartsleuf |
| USB | USB-C |
| Overig | BOOT-knop op GPIO0, uitbreidingsconnector, luidspreker- en batterijconnectoren verschillen per revisie |

> **Controleer vóór aankoop de exacte revisie.** Sunton verkoopt verschillende vergelijkbare borden met verwarrend gelijkende namen, waaronder de 4827S043C en resistieve R-versies. Vergelijk de opdruk op de printplaat met de documentatie van de verkoper voordat je vertrouwt op een pinnummer, geheugenconfiguratie of demo.
{: .notice--warning}

## Is de Sunton ESP32-8048S043C een goede keuze?

De 8048S043C is een logische keuze als je een relatief groot touchscreen wilt waarbij de ESP32, het scherm en de aanraakcontroller op één bord zijn geïntegreerd.

### Een goede keuze als je nodig hebt

- Een **4,3-inch 800×480-touchscreen**
- Een **ESP32-S3** met Wi-Fi en Bluetooth LE
- Geïntegreerde capacitieve aanraking
- PSRAM voor grafisch veeleisende interfaces
- Een alles-in-één-bord in plaats van een afzonderlijke ESP32 en display
- Een **LVGL-interface**
- Een compact touchscreen-bedieningspaneel

Typische toepassingen zijn dashboards, smart-home-interfaces, machinebedieningen, sensordisplays en andere projecten waarbij een groter touchscreen nuttiger is dan een klein OLED- of tekendisplay.

### Overweeg een ander bord als je nodig hebt

- Uitgebreide officiële documentatie en voorbeelden
- Een ander schermformaat of een andere resolutie
- GPIO-pinnen die gemakkelijker toegankelijk zijn
- Een andere aanraaktechnologie
- Een bord met een eenvoudigere softwareconfiguratie

## Capacitieve C versus resistieve R: welke moet je kopen?

Dit is een van de belangrijkste zaken om vóór het bestellen te controleren.

De **C-versie** gebruikt een **GT911-capacitieve aanraakcontroller** op de I2C-bus. Die biedt de aanraakervaring die de meeste gebruikers van een modern touchscreen verwachten.

De **R-versie** gebruikt resistieve aanraakhardware en vereist een andere controller en driver.

Als je specifiek een moderne capacitieve touchscreeninterface wilt, controleer dan of de aanbieding het bord als **8048S043C** vermeldt en niet als een R-variant.

De bredere naam **8048S043** wordt in voorbeeldrepositories en documentatie ook zonder achtervoegsel gebruikt. Aanbiedingen kunnen drie aanraakconfiguraties vermelden:

- **8048S043C** — capacitieve aanraking, doorgaans met GT911.
- **8048S043R** — resistieve aanraking; gebruik niet de GT911-configuratie voor de C-versie.
- **8048S043N** — in sommige productreferenties vermeld als versie zonder aanraking.

Behandel het achtervoegsel als belangrijk en controleer vóór aankoop bij de verkoper het daadwerkelijke bord, de schermcontroller en de aanraakhardware. Namen en meegeleverde demo's zijn niet bij elke aanbieding consistent.

## Datasheet, schema en voorbeelden downloaden

Deze bronnen zijn nuttige uitgangspunten om de bordrevisie te controleren en een werkend project op te bouwen:

- [Makerfabs / Sunton-documentatie en schermdemo's](https://wiki.makerfabs.com/Sunton_ESP32_S3_4.3_inch_800x400_IPS_with_Touch.html) — door de fabrikant verspreide installatie-instructies, schermdemo en links naar LVGL-demo's.
- [ESP3D ESP32-8048S043C-hardwarereferentie](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/) — pinindelingen, microSD-aansluitingen en opmerkingen over aanpassingen aan de GT911-interrupt.
- [Sunton ESP32-8048S043-datasheet en demo-archief](http://pan.jczn1688.com/directlink/1/ESP32%20module/4.3inch_ESP32-8048S043.zip) — door de fabrikant gehost archief waarnaar in communitydocumentatie wordt verwezen; controleer de inhoud en revisie voordat je erop vertrouwt.
- [Arduino_GFX + GT911 + LVGL-voorbeeldproject](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043) — een PlatformIO-project met Arduino_GFX, GT911 en LVGL 9.1.
- [ESP-IDF + LVGL-voorbeeld](https://github.com/limpens/esp32-8048S043) — een afzonderlijk voorbeeld op basis van ESP-IDF en de GT911-aanraakcomponent.

## Pinout: scherm, aanraking, microSD en uitbreidingsconnectoren

Het scherm is via een 16-bits parallelle RGB-bus met de ESP32-S3 verbonden. De GT911-aanraakcontroller gebruikt I2C. Deze verbindingen zijn al op het bord aangelegd; gebruik ze niet opnieuw voor andere randapparatuur.

### Aanraak- en bedieningspinnen

| Functie | GPIO | Opmerkingen |
| --- | ---: | --- |
| GT911 I2C SDA | 19 | Aanraakgegevens |
| GT911 I2C SCL | 20 | Aanraakklok |
| GT911 reset (RST) | 38 | Reset van de aanraakcontroller |
| GT911 interrupt (INT) | 18 | Doorgaans niet met de controller verbonden zonder hardwareaanpassing |
| LCD-achtergrondverlichting | 2 | Regeling van de achtergrondverlichting |
| BOOT-knop | 0 | Selectie van de opstartmodus |

Het GT911-adres op I2C is doorgaans **0x5D** of **0x14**, afhankelijk van de configuratie. De interruptlijn voor aanraking kan een hardwareaanpassing vereisen; wanneer de interruptlijn niet is aangesloten, kan gewone polling worden gebruikt.

### microSD-pinnen (SPI)

| Functie | GPIO |
| --- | ---: |
| SD-kaart CS | 10 |
| SD-kaart MOSI | 11 |
| SD-kaart SCK | 12 |
| SD-kaart MISO | 13 |

### RGB-schermsignalen

| Signaal | GPIO |
| --- | --- |
| DE / VSYNC / HSYNC / PCLK | 40 / 41 / 39 / 42 |
| Rood (R0–R4) | 45, 48, 47, 21, 14 |
| Groen (G0–G5) | 5, 6, 7, 15, 16, 4 |
| Blauw (B0–B4) | 8, 3, 46, 9, 1 |

### Uitbreidingsconnectoren

De gepubliceerde hardwarereferentie beschrijft de volgende pinindeling:

| Connector | Pinnen / functies |
| --- | --- |
| P1 (UART-achtig) | GND, RX, TX, +5 V |
| P2 (SPI-achtig) | GPIO13, GPIO12, GPIO11, GPIO19 |
| P3 | GPIO20, GPIO19, GPIO18, GPIO17 |
| P4 | GPIO18, GPIO17, 3,3 V, GND |

**Dit zijn niet allemaal onafhankelijke GPIO's.** GPIO19/20 worden gedeeld met touch-I2C, GPIO11–13 worden gebruikt door microSD en GPIO18 is gekoppeld aan de optionele GT911-interruptaanpassing. Controleer de oriëntatie van de connector en het schema van jouw exacte revisie voordat je hardware aansluit. De RGB-bus gebruikt veel andere GPIO's.

In de gepubliceerde ESP3D-pinreferentie is **GPIO17 op de hoofdpinlijst als NC gemarkeerd, maar wel doorverbonden met de P3/P4-uitbreidingsconnectoren**. Dit is de meest veelbelovende kandidaat voor een eenvoudig extra digitaal signaal, maar beschouw de pin als *mogelijk beschikbaar* en niet als gegarandeerd vrij totdat je het schema van jouw bord hebt gecontroleerd. GPIO33/34 staan vermeld als NA en GPIO35–37 als NC/NA; ga er niet van uit dat ze beschikbaar of bruikbaar zijn. Gebruik GPIO43/44 liever niet voor algemene randapparatuur, omdat ze worden gebruikt door de USB-naar-UART-seriële verbinding.

## Software- en bibliotheekcompatibiliteit

De 8048S043C kan met verschillende gangbare ESP32-grafische bibliotheken worden gebruikt:

| **Bibliotheek** | **Geschikt voor** | **Opmerkingen** |
| --- | --- | --- |
| **LVGL** | Volledige touch-interfaces met knoppen, schuifregelaars en grafieken | Heeft een onderliggende displaydriver nodig |
| **Arduino_GFX** | Eenvoudige graphics, tekst en snelle tests | Heeft een RGB-paneeldriver voor ESP32-S3 |
| **LovyanGFX** | Snel tekenen en flexibele configuratie | Vereist een paneelconfiguratie die bij het bord past |

Voor de meeste projecten is een logische aanpak een RGB-paneeldriver op laag niveau, zoals Arduino_GFX, in combinatie met **LVGL** voor de interface.

Het belangrijkste bij de beoordeling vóór aankoop is dat het bord geavanceerde touchscreeninterfaces aankan, maar dat de schermconfiguratie moet overeenkomen met de exacte hardware.

## Arduino-codevoorbeeld: scherm en aanraking

De onderstaande sketch is een **minimale Arduino_GFX-schermtest met GT911-aanraking** voor de gangbare pinindeling van de 8048S043C. De sketch tekent een testbericht en toont aanraakcoördinaten in Serial. Het voorbeeld is gebaseerd op gepubliceerde hardwarereferenties en is niet op een testbank door Embedded Nerd getest; timing en aanraakgedrag kunnen per bordrevisie verschillen.

Installeer **Arduino_GFX** en **TAMC_GT911** via Library Manager, installeer het ESP32-bordpakket van Espressif, selecteer **ESP32S3 Dev Module**, schakel **OPI PSRAM** in en selecteer de Flash-grootte die bij jouw module past (doorgaans 16 MB voor N16R8).

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
// De GT911 INT-lijn is op dit bord doorgaans niet aangesloten; gebruik polling.
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
    Serial.printf("Touch: x=%d, y=%d\\n",
                  touch.points[0].x, touch.points[0].y);
    delay(100);
  }
  delay(10);
}
```

Als het scherm leeg of instabiel blijft, ga dan niet op goed geluk andere timingwaarden proberen: vergelijk de schermtiming en GPIO-indeling met de [ESP3D-hardwarereferentie](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/) en jouw exacte revisie. Gebruik voor een volledig LVGL-project het [Sunton-ESP32-8048S043-voorbeeld](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043), dat ook de bibliotheekconfiguratie bevat.

Een verstandige opstartvolgorde is:

1. Controleer of het bord de capacitieve **8048S043C**-versie is.
2. Installeer ESP32-S3-bordondersteuning en open het voorbeeldproject in PlatformIO.
3. Bouw en upload eerst de ongewijzigde demo.
4. Controleer of het RGB-scherm beeld weergeeft voordat je de interface aanpast.
5. Controleer de aanraakcoördinaten en schermrotatie en voeg daarna LVGL-widgets toe.
6. Voeg microSD of andere randapparatuur pas toe nadat je de gedeelde GPIO's hebt gecontroleerd.

**Verificatiestatus:** het voorbeeld is een project van derden en geen code die door Embedded Nerd is getest. Beschouw het als referentie-implementatie en controleer de licentie en afhankelijkheden voordat je code hergebruikt in je eigen project.

## SquareLine Studio en LVGL

[SquareLine Studio](https://squareline.io/) kan worden gebruikt om visueel een LVGL-interface te ontwerpen en UI-code te exporteren. Het vervangt de bordafhankelijke scherm- en aanraakdrivers niet: de gegenereerde interface moet nog steeds worden geïntegreerd met een werkende RGB-paneeldriver, GT911-invoerdriver en compatibele LVGL-versie. Controleer het exportdoel en de LVGL-versie voordat je de gegenereerde bestanden importeert.

## ESPHome

Het bord wordt ook gebruikt met ESPHome en Home Assistant. De [ESPHome Devices-referentie](https://devices.esphome.io/devices/sunton-esp32-8048s043c/) bevat een configuratie voor het 800×480-scherm en GT911-aanraking. De [LVGL-componentdocumentatie van ESPHome](https://esphome.io/components/lvgl/) legt uit hoe je interactieve pagina's bouwt.

ESPHome-configuraties zijn versiegevoelig, vooral voor RGB-schermen en aanraakdrivers. Begin met een configuratie waarvan bekend is dat die werkt met jouw ESPHome-versie en bordrevisie. Voeg daarna Home Assistant-entiteiten en widgets toe.

## Arduino IDE-instellingen

Voor de gangbare N16R8-versie zijn de relevante Arduino IDE-instellingen:

1. Installeer het **ESP32-bordpakket** van Espressif via Boards Manager.
2. Selecteer **ESP32S3 Dev Module**.
3. Stel **PSRAM** in op **OPI PSRAM**.
4. Stel **Flash Size** in op **16 MB**.
5. Gebruik de Flash-modus **QIO 80 MHz** voor de N16R8-versie.
6. Kies een partitieschema dat bij grote projecten past bij het Flash-geheugen van 16 MB.

Zonder de juiste PSRAM-configuratie kunnen grafische toepassingen de framebuffer mogelijk niet toewijzen, wat kan leiden tot een leeg scherm of een herstartlus.

> **Belangrijk:** deze instellingen gelden voor de gangbare N16R8-configuratie. Controleer de exacte bordrevisie en documentatie van de verkoper voordat je ze overneemt.
{: .notice--warning}

## Veelvoorkomende problemen om vóór aankoop te kennen

Het is nuttig om de veelvoorkomende problemen te begrijpen voordat je dit bord kiest, omdat de 8048S043C meer configuratieaandacht vraagt dan een eenvoudig ESP32-scherm met SPI.

### Zwart scherm terwijl het bord wel werkt

Een verkeerde PSRAM-configuratie, schermconfiguratie of instelling van de achtergrondverlichting kan ervoor zorgen dat de ESP32 werkt maar er geen beeld zichtbaar is.

Controleer of:

- PSRAM is ingesteld op **OPI PSRAM**
- Het bordprofiel **ESP32-S3** is
- De achtergrondverlichting correct is geconfigureerd
- De schermtiming overeenkomt met een bekende werkende configuratie voor het bord

### Herstartlus of reset na het uploaden

Dit wordt vaak veroorzaakt door onjuiste PSRAM- of Flash-instellingen.

Controleer voor de gangbare N16R8-versie de Arduino IDE-instellingen voordat je de applicatiecode wijzigt.

### Aanraking werkt niet

De capacitieve versie gebruikt een GT911 via I2C.

Als het scherm werkt maar aanraking niet:

1. Controleer de I2C-pinnen.
2. Voer een I2C-scan uit.
3. Zoek naar de GT911 op **0x5D** of **0x14**.
4. Controleer of de software een GT911-driver gebruikt en geen resistieve aanraakdriver.

Je kunt ook onze [I2C-adreszoeker]({{ site.url }}/tools/i2c-address-lookup/) gebruiken om een I2C-adres te identificeren, en de [I2C-scannerhandleiding]({{ site.url }}/i2c-scanner-tutorial/) raadplegen voor probleemoplossing.

### Aanraking is gespiegeld of verschoven

Dit is meestal een softwareconfiguratieprobleem. Controleer de X/Y-asoriëntatie en de instellingen voor schermrotatie in de configuratie van de aanraking en het scherm.

### Flikkerend of verschuivend beeld

RGB-timing of PSRAM-bandbreedte kan de oorzaak zijn. Begin met timingwaarden uit een goed werkende demo voor het exacte bord in plaats van te gokken.

### Beperkte beschikbaarheid van GPIO's

Het RGB-scherm gebruikt een aanzienlijk aantal GPIO's. Als je project ook meerdere sensoren, randapparaten of communicatie-interfaces nodig heeft, controleer dan de beschikbare uitbreidingspinnen voordat je het bord kiest.

### Uploaden lukt niet

Houd indien nodig **BOOT (GPIO0)** ingedrukt terwijl je USB-C aansluit, of probeer een andere USB-kabel. Sommige USB-kabels zijn alleen geschikt om op te laden.

## Sunton ESP32-8048S043C versus andere ESP32-touchscreenborden

De belangrijkste afweging gaat niet alleen over schermformaat: resolutie, aanraaktechnologie, scherminterface, beschikbare GPIO's en softwareondersteuning bepalen allemaal hoeveel werk een project vraagt.

| Bord | Scherm | Aanraking / MCU | Meest geschikt voor |
| --- | --- | --- | --- |
| **Sunton ESP32-8048S043C** | 4,3-inch, 800×480 RGB | ESP32-S3, capacitieve GT911, 16 MB Flash / 8 MB PSRAM (gangbare N16R8-versie) | Geïntegreerd 4,3-inch touchscreen met hoge resolutie |
| [Waveshare ESP32-S3-Touch-LCD-4.3](https://www.waveshare.com/esp32-s3-touch-lcd-4.3.htm) | 4,3-inch, 800×480 | ESP32-S3; capacitieve aanraking bij de betreffende productvariant | Alternatief 4,3-inch platform met leveranciersdocumentatie |
| **Sunton ESP32-8048S070C** | 7-inch, 800×480 RGB | ESP32-S3, capacitieve aanraking op de C-versie | Groter fysiek scherm met dezelfde pixelresolutie |
| [**Waveshare ESP32-S3-Touch-LCD-7**](/products/waveshare-esp32-s3-touch-lcd-7/) | 7-inch, 800×480 IPS | ESP32-S3, 5-punts capacitieve aanraking | 7-inch alternatief met gedocumenteerde CAN- en RS485-interfaces |

Controleer de actuele documentatie van elke leverancier voor details over geheugen, connectoren en aanraakcontrollers; vergelijkbare modelnamen garanderen geen uitwisselbare pinouts of softwareconfiguraties.

Gebruik voor een gerichte vergelijking de [ESP32 4,3-inch-touchscreenkiezer]({{ site.url }}/tools/esp32-touchscreen-selector/esp32-4-3-inch-touchscreen/) of de [800×480-schermkiezer]({{ site.url }}/tools/esp32-touchscreen-selector/800x480/).

## Prijs en beschikbaarheid van de Sunton ESP32-8048S043C

**[Bekijk de Sunton ESP32-8048S043C op AliExpress →](https://s.click.aliexpress.com/e/_c2zi4HDn){: rel="sponsored nofollow noopener" target="_blank"}**

Controleer vóór aankoop of de aanbieding de **8048S043C-capacitieve GT911-variant** betreft en niet de resistieve R- of de versie zonder aanraking N. Het exacte model-ID achter de korte affiliatelink is niet zichtbaar voor Embedded Nerd. Controleer daarom zorgvuldig de foto's en specificaties van de verkoper.

Prijzen, verzendkosten, belastingen en voorraad verschillen per verkoper en bestemming. Vergelijk de **totale prijs inclusief levering** en controleer de bordrevisie vóór aankoop. Je kunt ook de [technische productpagina]({{ site.url }}/products/sunton-esp32-8048s043c/) bekijken voordat je beslist.

## Veelgestelde vragen

### Is de Sunton ESP32-8048S043C het kopen waard?

Het is een goede optie als je een geïntegreerd ESP32-S3-bord met een capacitief 4,3-inch 800×480-touchscreen wilt. Het belangrijkste aandachtspunt is dat de exacte hardwarerevisie overeenkomt met de softwareconfiguratie die je wilt gebruiken.

### Welke aanraakcontroller gebruikt de 8048S043C?

De capacitieve versie gebruikt een **GT911** via I2C, doorgaans op GPIO19 en GPIO20.

### Heeft de 8048S043C PSRAM?

De gangbare N16R8-versie heeft **8 MB octale PSRAM** en **16 MB Flash**. Controleer vóór aankoop de exacte aanbieding, want er bestaan verschillende varianten.

### Is de 8048S043C capacitief of resistief?

De **C**-versie is capacitief en gebruikt de GT911. De **R**-versie gebruikt resistieve aanraakhardware en een andere controller. Sommige aanbiedingen gebruiken ook **8048S043** zonder achtervoegsel als familienaam; een **N**-variant wordt zonder aanraking vermeld. Controleer het exacte bord vóór aankoop.

### Heeft de 8048S043N-versie touchscreenfunctionaliteit?

De N-variant wordt in sommige referenties vermeld als versie zonder aanraking. Ga er niet van uit dat deze een GT911 heeft; controleer de aanbieding en bordrevisie.

### Is het bord geschikt voor LVGL?

Ja. De ESP32-S3, het RGB-scherm en de PSRAM maken het geschikt voor grafisch veeleisende LVGL-interfaces, mits de schermconfiguratie correct is. Als je borden voor dit soort projecten vergelijkt, gebruik dan de [ESP32-S3 LVGL-schermkiezer]({{ site.url }}/tools/esp32-touchscreen-selector/esp32-s3-lvgl/) om de opties op familie en geheugenvereisten te filteren.

### Moet ik de 8048S043C of een ander ESP32-touchscreen kopen?

Dat hangt af van het schermformaat, de resolutie, de aanraaktechnologie, de GPIO-vereisten en de softwareondersteuning die je nodig hebt.

Vergelijk schermformaat, resolutie en PSRAM met de [ESP32-touchscreenkiezer]({{ site.url }}/tools/esp32-touchscreen-selector/).

### Kan ik andere sensoren aansluiten?

Ja. Gebruik de vrije pinnen op de uitbreidingsconnector en zorg ervoor dat I2C-apparaten geen conflicterende adressen hebben met de aanraakcontroller.

I2C-sensoren zoals de [MPU6050]({{ site.url }}/mpu6050-arduino-guide/) of [BMA400]({{ site.url }}/bma400-esp32-tutorial-wiring-code-arduino-guide/) kunnen bijvoorbeeld met het bord worden gebruikt, mits de beschikbare pinnen en I2C-adressen geschikt zijn.

## Over de auteur

**Embedded Nerd** publiceert praktische handleidingen over ESP32-borden, embedded hardware, displays, sensoren en ontwikkeltools. Deze handleiding is gebaseerd op documentatie van de fabrikant en genoemde communityprojecten; het bord is niet onafhankelijk getest voor dit artikel.

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
    { "@type": "ListItem", "position": 1, "name": "Home", "item": {{ site.url | append: "/" | jsonify }} },
    { "@type": "ListItem", "position": 2, "name": "ESP32 Touchscreen Displays Guide", "item": {{ "/esp32-touchscreen-displays-guide/" | absolute_url | jsonify }} },
    { "@type": "ListItem", "position": 3, "name": {{ page.title | jsonify }}, "item": {{ page.url | absolute_url | jsonify }} }
  ]
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    { "@type": "Question", "name": "Is de Sunton ESP32-8048S043C het kopen waard?", "acceptedAnswer": { "@type": "Answer", "text": "Het is een goede keuze als je een geïntegreerd ESP32-S3-bord met een capacitief touchscreen van 4,3 inch en 800×480 pixels wilt. Controleer de exacte hardwarerevisie en softwareconfiguratie." } },
    { "@type": "Question", "name": "Welke aanraakcontroller gebruikt de 8048S043C?", "acceptedAnswer": { "@type": "Answer", "text": "De capacitieve versie gebruikt een GT911 via I2C, doorgaans op GPIO19 en GPIO20." } },
    { "@type": "Question", "name": "Heeft de 8048S043C PSRAM?", "acceptedAnswer": { "@type": "Answer", "text": "De gangbare N16R8-versie heeft 8 MB octale PSRAM en 16 MB Flash. Controleer de exacte aanbieding, want er bestaan verschillende varianten." } },
    { "@type": "Question", "name": "Is de 8048S043C capacitief of resistief?", "acceptedAnswer": { "@type": "Answer", "text": "De C-versie is capacitief en gebruikt de GT911. De R-versie gebruikt resistieve aanraakhardware en een andere controller." } },
    { "@type": "Question", "name": "Heeft de 8048S043N-versie touchscreenfunctionaliteit?", "acceptedAnswer": { "@type": "Answer", "text": "De N-variant wordt in sommige referenties vermeld als versie zonder aanraking. Controleer het exacte bord en de specificaties bij de verkoper." } },
    { "@type": "Question", "name": "Is het bord geschikt voor LVGL?", "acceptedAnswer": { "@type": "Answer", "text": "Ja. De ESP32-S3, het RGB-scherm en de PSRAM zijn geschikt voor grafisch veeleisende LVGL-interfaces wanneer de schermconfiguratie correct is." } },
    { "@type": "Question", "name": "Moet ik de 8048S043C of een ander ESP32-touchscreen kopen?", "acceptedAnswer": { "@type": "Answer", "text": "Vergelijk vóór je een keuze maakt het schermformaat, de resolutie, aanraaktechnologie, GPIO-vereisten, PSRAM en softwareondersteuning." } },
    { "@type": "Question", "name": "Kan ik andere sensoren aansluiten?", "acceptedAnswer": { "@type": "Answer", "text": "Ja. Gebruik vrije uitbreidingspinnen en zorg ervoor dat I2C-adressen niet conflicteren met de aanraakcontroller." } }
  ]
}
</script>

## Eindoordeel

De **Sunton ESP32-8048S043C** is een aantrekkelijke optie als je een relatief groot **4,3-inch 800×480-capacitief touchscreen** wilt dat is geïntegreerd met een **ESP32-S3**.

De belangrijkste sterke punten zijn het geïntegreerde scherm en de aanraakhardware, PSRAM en ondersteuning voor grafisch veeleisende interfaces zoals LVGL.

De belangrijkste afweging is dat het RGB-scherm, de PSRAM-configuratie en de verschillende hardwarevarianten meer aandacht vereisen dan een eenvoudiger ESP32-schermmodule.

Als deze eigenschappen bij je project passen, is de 8048S043C het overwegen waard. Controleer vóór aankoop of het exacte achtervoegsel en de hardwarerevisie overeenkomen met je software.

### Gerelateerde handleidingen en tools

- [Handleiding voor ESP32-touchscreens]({{ site.url }}/esp32-touchscreen-displays-guide/) — vergelijk schermformaten, aanraaktechnologieën, interfaces en geheugenvereisten.
- [ESP32-touchscreenkiezer]({{ site.url }}/tools/esp32-touchscreen-selector/) — filter borden op resolutie, PSRAM, aanraaktype en interface.
- [Waveshare ESP32-S3-Touch-LCD-4.3-productpagina]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-4-3/) — vergelijk een ander geïntegreerd 4,3-inch ESP32-S3-scherm.
- [Waveshare ESP32-S3-Touch-LCD-7-productpagina]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-7/) — vergelijk een 7-inch 800×480-alternatief wanneer je meer fysiek schermoppervlak nodig hebt.
- [I2C-scanner voor Arduino, ESP32 en ESP8266]({{ site.url }}/i2c-scanner-tutorial/) — controleer welke I2C-apparaten op de bus reageren bij het opsporen van problemen met aanraking of sensoraansluitingen.
- [I2C-adreszoeker en compatibiliteitscontrole]({{ site.url }}/tools/i2c-address-lookup/) — controleer I2C-adressen en onderzoek mogelijke conflicten met de GT911-aanraakcontroller.
- [Sunton ESP32-8048S043C-productpagina]({{ site.url }}/products/sunton-esp32-8048s043c/) — bekijk de productspecificaties en actuele aankoopopties.
