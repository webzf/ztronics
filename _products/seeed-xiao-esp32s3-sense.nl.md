---
layout: product
lang: nl
locale: nl-NL
toc_label: Inhoud
internal_links: true
title: "Seeed Studio XIAO ESP32S3 Sense: camera, microfoon en SD-kaart op een bord van 21 × 17,8 mm"
product_verdict: "Een uitstekende keuze voor compacte camera-, audio- en dataloggingprojecten met ESP32-S3. Houd rekening met gedeelde GPIO's en het hogere stroomverbruik in deep-sleep wanneer de uitbreidingskaart is aangesloten."
editorial_review:
  rating: 8.5
  best_rating: 10
  worst_rating: 1
  author: "Embedded Nerd"
  summary: "De Seeed Studio XIAO ESP32S3 Sense combineert een ESP32-S3 met 8 MB PSRAM en 8 MB Flash, een afneembare camerakaart, een digitale microfoon en een microSD-sleuf in een module van 21 × 17,8 mm met batterijlaadfunctie. Het is een sterke keuze voor kleine camera- en audioprojecten en heeft goede officiële documentatie. De belangrijkste aandachtspunten zijn gedeelde GPIO's, een hoger deep-sleep-verbruik met de uitbreidingskaart aangesloten en verschillen tussen cameramodellen per productiebatch."
  methodology: "Deze redactionele beoordeling is gebaseerd op gepubliceerde specificaties en documentatie van de fabrikant. Embedded Nerd heeft het specifieke bord of de verkopersaanbieding op deze pagina niet fysiek getest."
  pros:
    - "Camera, digitale microfoon en microSD-sleuf op een bord ter grootte van een duim"
    - "ESP32-S3 met 8 MB PSRAM en 8 MB Flash, voldoende voor camerastreaming en kleine ML-demo's"
    - "Ingebouwde Li-ion-batterijlader en U.FL-antenneconnector"
    - "Uitgebreide officiële documentatie, pinouttabellen en voorbeelden van Seeed Studio"
  cons:
    - "De microfoon, SD-kaart en gebruikers-led delen GPIO's met de headerpinnen; controleer de beschikbare pinnen vóór het aansluiten"
    - "Het deep-sleep-verbruik bedraagt ongeveer 3 mA met de uitbreidingskaart aangesloten, veel hoger dan bij de gewone XIAO ESP32S3"
    - "Borden worden doorgaans zonder pinheaders geleverd en het cameramodel (OV5640 of OV3660) kan per batch verschillen"
seo_title: "XIAO ESP32S3 Sense: specificaties, pinout en waar te kopen"
seo_description: "Specificaties van de Seeed Studio XIAO ESP32S3 Sense, volledige D0–D12-naar-GPIO-pinout, OV5640-camera, microfoon- en SD-kaartpinnen, stroomverbruik en aankoopopties."
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
  - nl
dutch_url: /nl/products/seeed-xiao-esp32s3-sense/
category: Development Boards
manufacturer: "Seeed Studio"

image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
header:
  teaser: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image_alt: "Vooraanzicht van de Seeed Studio XIAO ESP32S3 Sense met cameramodule"
alt: "Seeed Studio XIAO ESP32S3 Sense-bord, vooraanzicht met cameramodule"

excerpt: "Seeed Studio XIAO ESP32S3 Sense met ESP32-S3, OV5640-camera, digitale microfoon, microSD-sleuf, 8 MB PSRAM en 8 MB Flash op een bord van 21 × 17,8 mm."

description: "De Seeed Studio XIAO ESP32S3 Sense is een ESP32-S3-ontwikkelbord ter grootte van een duim met 8 MB PSRAM, 8 MB Flash, Wi-Fi, Bluetooth LE en batterijlaadfunctie. De afneembare uitbreidingskaart bevat een camera, digitale microfoon en microSD-sleuf. Verschillende GPIO's worden gedeeld door de header, microfoon, SD-kaart en gebruikers-led; controleer daarom vóór het aansluiten de pintabellen."

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
    value: "ESP32-S3R8, dual-core Xtensa LX7, tot 240 MHz"
  - name: Flash
    value: "8 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Camera
    value: "Afneembare OV5640 met autofocus (OV3660 op sommige borden)"
  - name: Microfoon
    value: "Digitale microfoon (PDM)"
  - name: Opslag
    value: "microSD-sleuf op de uitbreidingskaart, FAT tot 32 GB ondersteund"
  - name: Draadloos
    value: "2,4 GHz Wi-Fi en Bluetooth LE 5.0 / Bluetooth Mesh"
  - name: USB
    value: "USB Type-C"
  - name: Batterij
    value: "3,7 V Li-ion met ingebouwd laadbeheer"
  - name: Afmetingen
    value: "21 × 17,8 mm; 21 × 17,8 × 15 mm met uitbreidingskaart"
  - name: Bedrijfstemperatuur
    value: "−20 °C tot 65 °C"

links:
  - title: "Aan de slag met Seeed Studio XIAO ESP32-S3"
    icon: "fas fa-book"
    description: "Officiële specificaties, pinout, installatiehandleiding en probleemoplossing."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/"
  - title: "Pinmultiplexing voor XIAO ESP32-S3 (Sense)"
    icon: "fas fa-microchip"
    description: "Officiële handleiding voor het gebruik van GPIO, ADC, I²C, SPI, UART en touch-pinnen."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/"
  - title: "Productpagina van Seeed Studio"
    icon: "fas fa-store"
    description: "Officiële winkelpagina van de XIAO ESP32S3 Sense."
    url: "https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link"

related:
  - arduino-nano-esp32
  - esp32-devkit
  - raspberry-pi-pico-w
---
De Seeed Studio XIAO ESP32S3 Sense is een ESP32-S3-bord ter grootte van een duim met een afneembare uitbreidingskaart waarop een camera, digitale microfoon en microSD-sleuf zitten. Het wordt ook gezocht als **XIAO ESP32-S3 Sense** of **Seeed XIAO ESP32S3 Sense**. Controleer vóór aankoop of de aanbieding de **Sense**-versie betreft, want de gewone XIAO ESP32S3 ziet er bijna hetzelfde uit maar heeft geen camera, microfoon of SD-sleuf.

Het belangrijkste aandachtspunt voordat je iets aansluit, zijn de **gedeelde pinnen**: de microfoon, SD-kaart en gebruikers-led gebruiken GPIO's die ook op de header beschikbaar zijn. De onderstaande pintabellen tonen precies welke.

## Productfoto's

<div class="product-image-gallery" style="display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:1rem;margin:1.5rem 0;">
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-front.webp" alt="Vooraanzicht van de Seeed Studio XIAO ESP32S3 Sense-camerakaart" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Vooraanzicht: XIAO ESP32S3 Sense met cameramodule</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-camera-assembly.webp" alt="Seeed Studio XIAO ESP32S3 Sense met gemonteerde camera-uitbreidingskaart" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Camera en gemonteerde uitbreidingskaart</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-back.webp" alt="Achterkant van de Seeed Studio XIAO ESP32S3 Sense met pinaanduidingen en soldeerpads" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Achteraanzicht: pinaanduidingen en soldeerpads</figcaption>
  </figure>
</div>

## Is de XIAO ESP32S3 Sense het kopen waard?

Kies dit bord als je een camera, microfoon of SD-logging wilt op een bord ter grootte van een duim: bijvoorbeeld een kleine Wi-Fi-camera, een audio- of spraakproject, een draagbaar apparaat of een logger op batterijen. Als je alleen een kleine ESP32-S3 zonder deze extra's nodig hebt, heeft de gewone XIAO ESP32S3 dezelfde headerindeling en een veel lager deep-sleep-verbruik. Als je meer GPIO's en 16 MB Flash nodig hebt, bekijk dan de XIAO ESP32-S3 Plus.

## XIAO ESP32S3 versus Sense versus Plus: welke versie moet je kopen?

| Eigenschap | XIAO ESP32S3 | XIAO ESP32S3 Sense | XIAO ESP32-S3 Plus |
|---|---|---|---|
| Camera en microfoon | Nee | Ja (uitbreidingskaart) | Nee |
| microSD-sleuf | Nee | Ja (uitbreidingskaart) | Nee |
| Flash / PSRAM | 8 MB / 8 MB | 8 MB / 8 MB | 16 MB / 8 MB |
| GPIO's met PWM | 11 | 11 | 18 |
| Deep-sleep-verbruik (opgave Seeed) | 14 µA | 3 mA met uitbreidingskaart | 33,5 µA |
| Meest geschikt voor | Zo klein en zuinig mogelijke projecten | Beeld, audio en datalogging | Meer pinnen en Flash |

Prijzen veranderen afhankelijk van verkoper, bestemming, verzending en gekozen variant. Controleer vóór het afrekenen de actuele aanbieding, meegeleverde accessoires en het cameramodel.

<div class="en-product-cta__buttons">
  <a class="en-buy-button" href="/go/hardware/seeed-xiao-esp32s3-sense/" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-cart-shopping"></i></span><span class="en-buy-text"><strong>Prijs bekijken — XIAO ESP32S3 Sense</strong><small>AliExpress · controleer cameraversie en headers</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.amazon.com/Seeed-Studio-XIAO-ESP32-Sense/dp/B0C69FFVHH?tag=embeddednerd2-20" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fab fa-amazon"></i></span><span class="en-buy-text"><strong>Prijs bekijken — Amazon</strong><small>Controleer de Sense-versie en meegeleverde accessoires</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-store"></i></span><span class="en-buy-text"><strong>Kopen — Seeed Studio (voorgemonteerde headers)</strong><small>Officiële winkel · versie met voorgesoldeerde headers</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
</div>

## Specificaties in één oogopslag

| Specificatie | Details |
|---|---|
| MCU | ESP32-S3R8, dual-core Xtensa LX7, tot 240 MHz |
| Flash | 8 MB |
| PSRAM | 8 MB |
| Draadloos | 2,4 GHz Wi-Fi, Bluetooth LE 5.0 / Bluetooth Mesh |
| Camera | Afneembare OV5640 met autofocus (2592 × 1944); sommige borden worden geleverd met OV3660 (2048 × 1536); eerdere borden gebruikten OV2640 (1600 × 1200) |
| Microfoon | Digitale microfoon (PDM) |
| Opslag | microSD-sleuf op uitbreidingskaart, FAT tot 32 GB ondersteund |
| Interfaces | 1 × UART, 1 × I²C, 1 × I²S, 1 × SPI, 11 × GPIO met PWM, 9 × ADC |
| Knoppen en leds | Reset, Boot, gebruikers-led, laad-led |
| Voeding | USB Type-C 5 V of 3,7 V Li-ion-batterij |
| Antenne | U.FL-connector; externe antenne inbegrepen in het pakket |
| Afmetingen | 21 × 17,8 mm; 21 × 17,8 × 15 mm met uitbreidingskaart |
| Bedrijfstemperatuur | −20 °C tot 65 °C |

De specificaties volgen de Seeed Studio Wiki (gecontroleerd op 7 november 2026). Seeed vermeldt dat de camera wordt vervangen door de OV5640 met autofocus in plaats van de OV3660 en dat borden tijdens deze overgang met een van beide camera's kunnen worden geleverd.

## Camera, microfoon en microSD

De uitbreidingskaart wordt aangesloten op een board-to-board-connector en bevat de camera, PDM-microfoon en microSD-sleuf. De camera-voorbeelden van Seeed ondersteunen OV5640, OV3660 en OV2640, zodat dezelfde sketches werken, maar alleen de OV5640 heeft autofocus. De OV5640-module wordt ook afzonderlijk als vervangingsonderdeel verkocht.

Seeed vermeldt dat de fabrieksfirmware sinds juni 2025 standaard een Wi-Fi-toegangspunt activeert met een gepubliceerde netwerknaam en een gepubliceerd wachtwoord. Flash je eigen firmware voordat je het bord inzet op een plek waar andere mensen er toegang toe kunnen krijgen.

## XIAO ESP32S3 Sense-pinout: D0–D12 naar GPIO

| XIAO-pin | GPIO | Functies | Opmerking |
|---|---:|---|---|
| D0 | GPIO1 | ADC, touch | Algemene I/O |
| D1 | GPIO2 | ADC, touch | Algemene I/O |
| D2 | GPIO3 | ADC, touch | Strapping-pin (JTAG-bron) |
| D3 | GPIO4 | ADC, touch | Algemene I/O |
| D4 / SDA | GPIO5 | I²C-data, ADC, touch | Standaard-I²C. Zie de [I2C-adreszoeker](/tools/i2c-address-lookup/) en de [I2C-scannerhandleiding](/i2c-scanner-tutorial/). |
| D5 / SCL | GPIO6 | I²C-klok, ADC, touch | Standaard-I²C |
| D6 / TX | GPIO43 | UART TX | Seriële uitvoer |
| D7 / RX | GPIO44 | UART RX | Seriële invoer |
| D8 / SCK | GPIO7 | SPI-klok, ADC, touch | Gedeeld met de SD-kaartklok |
| D9 / MISO | GPIO8 | SPI MISO, ADC, touch | Gedeeld met SD-kaartdata-in |
| D10 / MOSI | GPIO9 | SPI MOSI, ADC, touch | Gedeeld met SD-kaartdata-uit |
| D11 | GPIO42 | Touch | Gedeeld met de microfoonklok |
| D12 | GPIO41 | Touch | Gedeeld met de microfoondatapin |

Seeed merkt op dat D11 en D12 (GPIO42 en GPIO41), hoewel ze als analoge pinnen zijn aangeduid, op de ESP32-S3 geen ADC ondersteunen. Gebruik D0–D5 en D8–D10 voor analoge metingen.

Voedingspinnen: **5V** is de USB-5V-voedingsrail, **3V3** is de gereguleerde uitgang van 3,3 V en **GND** is massa. Alle GPIO's gebruiken 3,3V-logica en mogen geen 5 V ontvangen. Wanneer het bord op een batterij werkt, staat er geen spanning op de 5V-pin.

## Beschikbaarheid van GPIO's: pinnen die door camera, microfoon en SD-kaart worden gebruikt

Volgens de pinout van Seeed overlappen camera, microfoon en SD-kaart elkaar niet, maar sommige delen GPIO's met de headerpinnen.

| Functie | GPIO | Gedeeld met |
|---|---|---|
| Microfoonklok (PDM) | GPIO42 | Headerpin D11 |
| Microfoondatapin (PDM) | GPIO41 | Headerpin D12 |
| Chipselect SD-kaart | GPIO21 | Gebruikers-led |
| SD-kaartklok / MISO / MOSI | GPIO7 / GPIO8 / GPIO9 | Header-SPI-pinnen D8 / D9 / D10 |
| Camera-I²C-data / klok | GPIO40 / GPIO39 | JTAG-pinnen MTDO / MTCK |
| Cameradata, klok en synchronisatie | GPIO10–18, 38, 47, 48 | Alleen board-to-board-connector |

Als je de SD-kaart gebruikt, is de gebruikers-led op GPIO21 ook de chipselectlijn van de kaart. Elk extra SPI-apparaat op D8–D10 deelt de bus met de kaart en heeft een eigen chipselectpin nodig. Als je de microfoon gebruikt, moet je D11 en D12 als bezet beschouwen.

## Stroomverbruik en batterijgebruik

Typische waarden die Seeed publiceert voor de Sense **met aangesloten uitbreidingskaart**:

| Modus | Typische stroom |
|---|---:|
| Wi-Fi actief | 110 mA |
| Bluetooth LE actief | 102 mA |
| Modem-sleep | 44 mA |
| Light-sleep | 5 mA |
| Deep-sleep | 3 mA |
| Camera-webserver (USB) | ongeveer 140 mA gemiddeld, 347 mA piek |

Het bord kan werken op een 3,7V-Li-ion-batterij en deze via USB-C opladen. Seeed merkt op dat het negatieve batterijpad het dichtst bij de USB-poort ligt; controleer daarom de polariteit voordat je gaat solderen. Er is geen GPIO die specifiek bedoeld is om de batterijspanning uit te lezen; daarvoor is een externe spanningsdeler op een ADC-pin nodig.

## Arduino, MicroPython en aan de slag

Seeed documenteert Arduino en MicroPython voor de XIAO ESP32-S3-serie, naast handleidingen voor ESP-IDF en Zephyr. Selecteer in de Arduino IDE **XIAO_ESP32S3** als bord en gebruik ESP32-bordpakket 2.0.8 of nieuwer.

```cpp
const int ledPin = LED_BUILTIN; // GPIO21 op de XIAO ESP32S3
const int analogPin = A0;       // D0 = GPIO1 (ADC)

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // De gebruikers-led is active-low: LOW schakelt deze in.
  digitalWrite(ledPin, LOW);
  delay(500);
  digitalWrite(ledPin, HIGH);
  delay(500);

  Serial.print("A0 = ");
  Serial.println(analogRead(analogPin));
}
```

Open de Serial Monitor op **115200 baud**. Omdat GPIO21 ook de chipselect van de SD-kaart is, mag je de led niet schakelen terwijl de SD-kaart in gebruik is. Als de poort verdwijnt of uploaden mislukt, houd dan de knop **Boot** ingedrukt terwijl je USB aansluit om de bootloader-modus te activeren.

- [Aan de slag met Seeed Studio](https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/)
- [Handleiding pinmultiplexing van Seeed Studio](https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/)

## Waar te kopen

Controleer of de aanbieding de **Sense**-versie betreft, welke camera is inbegrepen, wie de verkoper is en wat de bestemming van de levering is. Seeed levert het bord standaard zonder pinheaders; zoek dus naar een voorgesoldeerde uitvoering of houd rekening met het zelf solderen van headers. Aanbiedingen verschillen per regio en de prijs ligt niet vast op deze pagina.

Als affiliate kan Embedded Nerd een commissie ontvangen uit in aanmerking komende aankopen, zonder extra kosten voor jou.

- [Seeed Studio XIAO ESP32S3 Sense (voorgesoldeerd) — officiële winkel](https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link)

## Veelgestelde vragen

### Is de XIAO ESP32S3 Sense hetzelfde als de XIAO ESP32S3?

Nee. Ze delen hetzelfde hoofdbord en dezelfde headerindeling, maar de Sense voegt een afneembare uitbreidingskaart toe met een camera, digitale microfoon en microSD-sleuf. De gewone XIAO ESP32S3 heeft deze onderdelen niet en verbruikt minder stroom in deep-sleep.

### Welke camera gebruikt de XIAO ESP32S3 Sense?

Huidige borden gebruiken een afneembare OV5640-camera met autofocus; sommige leveringen bevatten tijdens de overgang in de toeleveringsketen nog een OV3660. Eerdere borden gebruikten de OV2640, die niet meer wordt geproduceerd. De voorbeelden van Seeed ondersteunen alle drie.

### Is de XIAO ESP32S3 Sense bestand tegen 5 V?

Nee. De GPIO-pinnen gebruiken 3,3V-logica en mogen geen 5 V ontvangen. Gebruik een logic-level-converter voor 5V-sensoren of -modules.

### Kan ik de camera, microfoon en SD-kaart tegelijk gebruiken?

Volgens de pinout van Seeed overlappen ze elkaar niet en kunnen ze dus samen worden gebruikt. De microfoon gebruikt D11 en D12, de SD-kaart deelt de SPI-pinnen D8–D10 en de chipselect is dezelfde GPIO als die van de gebruikers-led.

### Kan de XIAO ESP32S3 Sense een batterij opladen?

Ja. Het bord heeft laadbeheer voor Li-ion-batterijen en batterijpads. Wanneer het op een batterij werkt, staat er geen spanning op de 5V-pin en is er geen aparte pin om de batterijspanning uit te lezen.

### Wordt het bord met pinheaders geleverd?

Seeed levert het bord standaard zonder pinheaders. Controleer of de aanbieding vermeldt dat de headers zijn voorgesoldeerd, of soldeer ze zelf.

### Werkt de XIAO ESP32S3 Sense met MicroPython?

Ja. Seeed documenteert Arduino en MicroPython voor de XIAO ESP32-S3-serie. De programmeeromgeving verandert niets aan de limiet van 3,3 V of de hierboven beschreven pinindeling.

## Vergelijk andere ESP32-borden

| Bord | Meest geschikt voor |
|---|---|
| Seeed Studio XIAO ESP32S3 Sense | Compacte camera-, audio- en dataloggingprojecten |
| [Arduino Nano ESP32](/products/arduino-nano-esp32/) | Nano-formaat met ESP32-S3 en Arduino-pinnamen |
| [ESP32 DevKit V1](/products/esp32-devkit/) | Goedkope prototyping voor algemeen gebruik |
| [Raspberry Pi Pico W](/products/raspberry-pi-pico-w/) | RP2040 met Wi-Fi, geschikt voor MicroPython |

Weet je niet zeker welk bord bij je project past? Lees onze handleiding [Beste ESP32-borden](/best-esp32-boards/) of bekijk de categorie [Ontwikkelborden](/products/development-boards/).
