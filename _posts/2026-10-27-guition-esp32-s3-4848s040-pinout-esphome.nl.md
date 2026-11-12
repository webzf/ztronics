---
title: "4848S040-pinout, GPIO's en ESPHome-installatiehandleiding"
title_tag: "4848S040-pinout en ESPHome-installatiehandleiding"
layout: single
permalink: /nl/guition-esp32-s3-4848s040-pinout-esphome/
lang: nl
page_id: article-guition-esp32-s3-4848s040-pinout-esphome
translation_id: guition-esp32-s3-4848s040-pinout-esphome
available_languages:
  - en
  - de
  - es
  - fr
  - it
  - nl
english_url: /guition-esp32-s3-4848s040-pinout-esphome/
german_url: /de/guition-esp32-s3-4848s040-pinout-esphome/
spanish_url: /es/guition-esp32-s3-4848s040-pinout-esphome/
french_url: /fr/guition-esp32-s3-4848s040-pinout-esphome/
italian_url: /it/guition-esp32-s3-4848s040-pinout-esphome/
dutch_url: /nl/guition-esp32-s3-4848s040-pinout-esphome/
internal_links: true
excerpt: "Pinout van de Guition ESP32-S3-4848S040, RGB-schermsignalen, ST7701S-initialisatie, GT911-aanraking, GPIO voor achtergrondverlichting en opmerkingen over ESPHome-installatie."
show_date: false
read_time: false
last_modified_at: 2026-10-27
header:
  teaser: /assets/images/guition-esp32-s3-4848s040-back.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image_alt: "Achteraanzicht van het Guition ESP32-S3-4848S040-touchscreenbord"
categories:
  - Displays
  - ESP32
tags:
  - esp32-s3
  - guition
  - touchscreen
  - esphome
  - pinout
sidebar:
  nav: "embedded"
related: true
related_posts:
  - /nl/products/guition-esp32-s3-4848s040/
  - /esp32-touchscreen-displays-guide/
share: true
seo_title: "4848S040-pinout, GPIO's en ESPHome-installatiehandleiding"
seo_description: "Pinout en GPIO-referentie van de 4848S040, RGB-schermsignalen, GT911-aanraking, regeling van de achtergrondverlichting en ESPHome-installatie voor dit ESP32-S3-touchscreen."
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
      "image": {{ page.header.og_image | default: page.header.image | absolute_url | jsonify }},
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

{% include guition-purchase-box.html %}

Bekijk voor de volledige specificaties, redactionele beoordeling, beschikbare varianten en aankoopopties de productpagina van de [Guition ESP32-S3-4848S040](/nl/products/guition-esp32-s3-4848s040/).

Deze handleiding richt zich op de pinout van de 4848S040, de scherm- en aanraakinterfaces, aandachtspunten rond de relaishardware en het gebruik van een bestaande ESPHome-configuratie als uitgangspunt.

![Achteraanzicht van het Guition ESP32-S3-4848S040-bord](/assets/images/guition-esp32-s3-4848s040-back.webp)

> **Belangrijk:** pinindelingen en beschikbare GPIO's kunnen per bordrevisie verschillen. Gebruik de onderstaande tabellen als referentie en controleer ze vervolgens aan de hand van jouw exacte bord en de bijbehorende documentatie voordat je externe hardware aansluit.

## Belangrijkste hardware in één oogopslag

Deze bordfamilie combineert een ESP32-S3, een RGB-scherm van 480 × 480 pixels met ST7701S en capacitieve GT911-aanraking. Controleer geheugen, relaishardware en behuizingsopties aan de hand van de exacte revisie en aanbieding van de verkoper. Bekijk de [productpagina voor de volledige specificaties en aankoopopties](/nl/products/guition-esp32-s3-4848s040/).

## Pinout van de Guition ESP32-S3-4848S040

De onderstaande toewijzingen staan vermeld in het ESPHome Devices-profiel. Controleer de revisie van je bord voordat je ze voor hardwareaansluitingen gebruikt.

### RGB-schermpinnen

| Schermsignaal | GPIO |
|---|---:|
| Rode data | 11, 12, 13, 14, 0 |
| Groene data | 8, 20, 3, 46, 9, 10 |
| Blauwe data | 4, 5, 6, 7, 15 |
| Scherminschakeling (DE) | 18 |
| Horizontale synchronisatie (HSYNC) | 16 |
| Verticale synchronisatie (VSYNC) | 17 |
| Pixelklok (PCLK) | 21 |

### Initialisatie van het ST7701S-scherm

| Signaal | GPIO |
|---|---:|
| CS | 39 |
| CLK | 48 |
| DATA | 47 |

Deze signalen worden gebruikt voor de initialisatie van het scherm. Ze staan los van de RGB-pixeldata en timingsignalen.

### GT911-aanraakcontroller en achtergrondverlichting

| Functie | GPIO |
|---|---:|
| Touch I²C SDA | 19 |
| Touch I²C SCL | 45 |
| PWM achtergrondverlichting | 38 |

De GT911 gebruikt I²C voor de communicatie met het aanraakscherm. GPIO 38 wordt in het genoemde profiel vermeld voor PWM-regeling van de achtergrondverlichting.

![Schermdemonstratie van de Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-screen-demo.webp)

*Schermdemonstratie van de Guition ESP32-S3-4848S040.*

### Snel GPIO-overzicht

Het profiel wijst **26 verschillende GPIO's** toe aan het scherm, de scherminitialisatie, de aanraakcontroller en de achtergrondverlichting:

`GPIO0, GPIO3, GPIO4, GPIO5, GPIO6, GPIO7, GPIO8, GPIO9, GPIO10, GPIO11, GPIO12, GPIO13, GPIO14, GPIO15, GPIO16, GPIO17, GPIO18, GPIO19, GPIO20, GPIO21, GPIO38, GPIO39, GPIO45, GPIO46, GPIO47, GPIO48`

Deze lijst beschrijft de toewijzingen in de genoemde configuratie. Ze bewijst **niet** dat elke andere GPIO beschikbaar is voor extern gebruik. Andere pinnen kunnen gereserveerd zijn voor Flash of PSRAM, ingebouwde componenten of functies die specifiek zijn voor het bord.

## Welke GPIO's zijn vrij?

Ga er niet van uit dat een GPIO beschikbaar is alleen omdat deze niet in de bovenstaande tabellen staat. Controleer het volgende voordat je een pin gebruikt voor een sensor, relais, knop of ander randapparaat:

1. Controleer het schema en de documentatie van jouw exacte bordrevisie.
2. Controleer welke GPIO's fysiek op het bord beschikbaar zijn.
3. Controleer of de pin gereserveerd is voor Flash, PSRAM, USB, de opstartconfiguratie of een andere ingebouwde component.
4. Vergelijk de gewenste pindefinitie met de ESPHome-configuratie die je wilt gebruiken.

Het bordprofiel is een nuttig startpunt, maar vervangt het schema van jouw specifieke hardwarerevisie niet.

## Versies met en zonder relais

De 4848S040 wordt verkocht in varianten die een relaismodule en verschillende montageoplossingen kunnen bevatten. Als je tussen versies kiest, raadpleeg dan de [productpagina voor variantdetails en advies over welke versie je moet kopen](/nl/products/guition-esp32-s3-4848s040/).

- **Versie zonder relais:** raadpleeg de documentatie van het exacte bord om te bepalen welke aansluitingen beschikbaar zijn en welke randapparatuur wordt ondersteund.
- **Versie met relais:** ga niet uit van de GPIO-toewijzing of elektrische waarden van het relais. Controleer deze in het schema of de documentatie van die versie voordat je een belasting aansluit.
- **Wandmontage:** de relaisversie past mogelijk niet in een Europese ronde inbouwdoos van 60 mm. Controleer vóór aankoop of installatie de afmetingen en montagemethode.

Sluit nooit een belasting op netspanning aan op basis van alleen een algemene pinout. Controleer de waarden van het relais, de isolatie, de behuizing en de bedradingsvereisten voor het exacte product.

## Aan de slag met ESPHome

Een bestaande ESPHome-configuratie kan je op weg helpen, maar bekijk deze eerst voordat je gaat flashen. De volgende communitybronnen zijn nuttige uitgangspunten:

- [ESPHome Devices: Guition ESP32-S3-4848S040](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [ESPHome-communityconfiguratie](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

De volgende werkwijze verkleint het risico dat je een configuratie gebruikt die voor een andere revisie bedoeld is:

1. Open de configuratie en lees de YAML-bestanden en alle genoemde packages.
2. Controleer of de GPIO-toewijzingen voor scherm, aanraking en achtergrondverlichting overeenkomen met jouw bord.
3. Vervang voorbeeldnamen van apparaten, Wi-Fi-gegevens en secrets door je eigen waarden.
4. Bekijk eventuele aanvullende componenten of externe packages die door de configuratie worden gebruikt.
5. Valideer de configuratie in ESPHome voordat je gaat flashen.
6. Volg de gedocumenteerde procedure voor de eerste flash van jouw bord en revisie.

Deze handleiding beweert niet dat de communityconfiguratie op elke bordrevisie is getest. Als het bord niet start of het scherm leeg blijft, controleer dan de configuratie opnieuw en vergelijk de pinout met de hardwaredocumentatie voordat je de bedrading wijzigt.

![Guition ESP32-S3-4848S040-dashboard op het touchscreen](/assets/images/guition-esp32-s3-4848s040-dashboard.webp)

*Voorbeeld van een dashboard op het touchscreen.*

## Veelgestelde vraag

### Kan ik ESPHome met dit scherm gebruiken?

Het gekoppelde ESPHome Devices-profiel en de communityconfiguratie bieden bruikbare uitgangspunten. Bekijk de YAML, controleer de GPIO-toewijzingen voor jouw bordrevisie en valideer de configuratie voordat je gaat flashen.

## Volgende stappen

Klaar om een bord te kiezen? Ga naar de productpagina van de [Guition ESP32-S3-4848S040](/nl/products/guition-esp32-s3-4848s040/) voor de volledige specificaties, redactionele beoordeling, variantdetails en actuele aankoopopties.

## Gerelateerde bronnen

- [Guition JC8048W550 5-inch ESP32-S3-scherm](/products/guition-jc8048w550/) — een groter liggend alternatief van 800×480 pixels.
- [Productpagina Guition ESP32-S3-4848S040](/nl/products/guition-esp32-s3-4848s040/)
- [ESP32-touchscreenkiezer](/tools/esp32-touchscreen-selector/)
- [Handleiding voor ESP32-touchscreens](/esp32-touchscreen-displays-guide/)
- [ESPHome Devices-profiel](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [ESPHome-communityconfiguratie](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)
