---
layout: product
lang: pl
locale: pl-PL
toc_label: Spis treści
internal_links: true
page_id: product-seeed-xiao-esp32s3
translation_id: seeed-xiao-esp32s3
product_id: seeed-xiao-esp32s3
category: Development Boards
manufacturer: "Seeed Studio"
title: "Seeed Studio XIAO ESP32S3: specyfikacja, pinout i projekty"
product_verdict: "Niewielka płytka ESP32-S3 z dużą pamięcią i trybami oszczędzania energii. Dobra do kompaktowych urządzeń sieciowych bez kamery i audio."
editorial_review:
  rating: 8.7
  best_rating: 10
  worst_rating: 1
  author: "Embedded Nerd"
  summary: "Seeed Studio XIAO ESP32S3 łączy ESP32-S3R8, 8 MB PSRAM, 8 MB Flash, Wi-Fi, Bluetooth LE i układ ładowania akumulatora na płytce 21 × 17,8 mm. Pobór 14 µA w deep sleep jest atrakcyjny w projektach bateryjnych, ale rzeczywisty prąd zależy od peryferiów, firmware i zasilania."
  methodology: "This editorial assessment is based on the manufacturer's published specifications and documentation. Embedded Nerd has not physically tested the specific board or seller listing covered by this page."
  pros:
    - "ESP32-S3 dual-core processor with 8 MB PSRAM and 8 MB Flash"
    - "Wi-Fi, Bluetooth LE 5.0 and onboard battery charging management"
    - "Very compact 21 × 17.8 mm footprint"
    - "Low-power modes, including 14 µA typical deep sleep"
  cons:
    - "No camera, digital microphone or microSD slot on the standard model"
    - "Pin headers are not soldered by default"
    - "GPIO operate at 3.3 V and are not 5 V tolerant"
seo_title: "Seeed Studio XIAO ESP32S3: specyfikacja, pinout i projekty"
seo_description: "Specyfikacja Seeed Studio XIAO ESP32S3, pinout D0–D12, interfejsy ESP32-S3, zasilanie akumulatorowe i typowy pobór prądu."
excerpt: "Kompaktowa płytka ESP32-S3 z 8 MB PSRAM, 8 MB Flash, Wi-Fi, BLE 5.0, ładowaniem akumulatora i typowym deep sleep 14 µA."
description: "Seeed Studio XIAO ESP32S3 to płytka rozwojowa ESP32-S3 o wymiarach 21 × 17,8 mm, z 8 MB PSRAM, 8 MB Flash, Wi-Fi, Bluetooth LE 5.0 i układem ładowania akumulatora."
image: "https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/img/XIAO_ESP32-S3_front_pinout.png"
header:
  teaser: "https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/img/XIAO_ESP32-S3_front_pinout.png"
  og_image: "https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/img/XIAO_ESP32-S3_front_pinout.png"
  og_image_alt: "Official Seeed Studio XIAO ESP32-S3 pinout diagram"
alt: "Seeed Studio XIAO ESP32-S3 official pinout diagram"
categories: [ESP32, ESP32-S3, "Development Boards"]
tags: ["XIAO ESP32S3", "Seeed Studio XIAO", ESP32, ESP32-S3, "ESP32-S3 pinout", Wi-Fi, Bluetooth, "Low power", Arduino, MicroPython]
permalink: /products/seeed-xiao-esp32s3/
specifications:
  - name: Processor
    value: "ESP32-S3R8, dual-core 32-bit Xtensa LX7, up to 240 MHz"
  - name: Flash
    value: "8 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Wireless
    value: "2.4 GHz Wi-Fi, Bluetooth LE 5.0 and Bluetooth Mesh"
  - name: Interfaces
    value: "1 UART, 1 I²C, 1 SPI, 11 PWM GPIO, 9 ADC channels"
  - name: USB
    value: "USB Type-C"
  - name: Battery
    value: "3.7 V battery input with onboard charging management"
  - name: Dimensions
    value: "21 × 17.8 mm"
  - name: Operating temperature
    value: "−20 °C to 65 °C"
links:
  - title: "Seeed Studio XIAO ESP32-S3 – getting started"
    icon: "fas fa-book"
    description: "Official specifications, pin map, setup and troubleshooting."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/"
  - title: "ESP32-S3 datasheet"
    icon: "fas fa-file-pdf"
    description: "Espressif technical reference for the ESP32-S3 SoC."
    url: "https://www.espressif.com/sites/default/files/documentation/esp32-s3_datasheet_en.pdf"
related:
  - seeed-xiao-esp32s3-sense
  - seeed-xiao-esp32s3-plus
  - arduino-nano-esp32
available_languages: [en, de, es, fr, it, nl, pl, pt]
english_url: /products/seeed-xiao-esp32s3/
german_url: /de/products/seeed-xiao-esp32s3/
spanish_url: /es/products/seeed-xiao-esp32s3/
french_url: /fr/products/seeed-xiao-esp32s3/
italian_url: /it/products/seeed-xiao-esp32s3/
dutch_url: /nl/products/seeed-xiao-esp32s3/
polish_url: /pl/products/seeed-xiao-esp32s3/
portuguese_url: /pt/products/seeed-xiao-esp32s3/
---
**Seeed Studio XIAO ESP32S3** to bardzo mała płytka rozwojowa oparta na układzie Espressif ESP32-S3R8. Mimo wymiarów 21 × 17,8 mm ma dwa rdzenie Xtensa LX7 do 240 MHz, 8 MB PSRAM, 8 MB Flash, Wi-Fi 2,4 GHz, Bluetooth LE 5.0 i układ ładowania akumulatora. To wersja standardowa: **nie ma wbudowanej kamery, mikrofonu cyfrowego ani gniazda microSD**.

XIAO ESP32S3 łatwo pomylić z wersją Sense. Jeśli potrzebujesz kamery, mikrofonu lub microSD, zobacz osobny poradnik [XIAO ESP32S3 Sense](/pl/products/seeed-xiao-esp32s3-sense/).

<div class="en-product-cta__buttons">
  <a class="en-buy-button preferred" href="/go/hardware/seeed-xiao-esp32s3/" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-cart-shopping"></i></span><span class="en-buy-text"><strong>Sprawdź cenę — XIAO ESP32S3</strong><small>AliExpress · verify the selected board and accessories</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.seeedstudio.com/XIAO-ESP32S3-p-5627.html?sensecap_affiliate=3jSyuVk&referring_service=link" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-store"></i></span><span class="en-buy-text"><strong>Seeed Studio official store</strong><small>Manufacturer product page · check headers and package contents</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
</div>

## Co wyróżnia XIAO ESP32S3?

Płytka sprawdzi się w małych urządzeniach IoT, elektronice noszonej, czujnikach bezprzewodowych, kompaktowych sterownikach i prototypach, w których pełnowymiarowe DevKit zajmuje zbyt dużo miejsca. ESP32-S3 łączy dwa 32-bitowe rdzenie Xtensa LX7 z Wi-Fi i BLE, a PSRAM pomaga przy większych buforach, interfejsach wyświetlaczy i aplikacjach wymagających pamięci.

Obsługiwane są Arduino, MicroPython i ESP-IDF. USB-C służy do programowania i komunikacji szeregowej, a pola akumulatora i wbudowany układ ładowania ułatwiają budowę urządzeń przenośnych.

## Specyfikacja techniczna

| Cecha | Specyfikacja |
|---|---|
| SoC | ESP32-S3R8, dwurdzeniowy Xtensa LX7, do 240 MHz |
| Pamięć | 8 MB PSRAM + 8 MB Flash |
| Łączność | Wi-Fi 2,4 GHz, BLE 5.0, Bluetooth Mesh |
| Interfejsy | 1 UART, 1 I²C, 1 SPI |
| GPIO | 11 GPIO z PWM, 9 kanałów ADC |
| USB | USB Type-C |
| Akumulator | Wejście 3,7 V i wbudowany układ ładowania |
| Wymiary | 21 × 17,8 mm |
| Temperatura pracy | −20 °C do 65 °C |

Na płytce znajdują się również dioda użytkownika, dioda ładowania, przyciski Reset i Boot oraz złącze anteny U.FL.

## Pinout XIAO ESP32S3: D0–D12

| Pin XIAO | GPIO ESP32-S3 | Główne funkcje |
|---|---:|---|
| D0 | GPIO1 | ADC, dotyk, GPIO |
| D1 | GPIO2 | ADC, dotyk, GPIO |
| D2 | GPIO3 | ADC, dotyk, GPIO; funkcja JTAG przy starcie |
| D3 | GPIO4 | ADC, dotyk, GPIO |
| D4 | GPIO5 | SDA, ADC, dotyk, GPIO |
| D5 | GPIO6 | SCL, ADC, dotyk, GPIO |
| D6 | GPIO43 | UART TX |
| D7 | GPIO44 | UART RX |
| D8 | GPIO7 | SPI SCK, ADC, dotyk, GPIO |
| D9 | GPIO8 | SPI MISO, ADC, dotyk, GPIO |
| D10 | GPIO9 | SPI MOSI, ADC, dotyk, GPIO |
| D11 | GPIO42 | Dotyk, GPIO; bez ADC |
| D12 | GPIO41 | Dotyk, GPIO; bez ADC |

**Domyślne przypisanie:** I²C na D4 (SDA) i D5 (SCL), UART na D6 (TX) i D7 (RX), SPI na D8 (SCK), D9 (MISO) i D10 (MOSI).

**Uwaga dotycząca ADC:** Seeed podaje dziewięć kanałów ADC, ale wyraźnie zaznacza, że GPIO41 i GPIO42 (D12 i D11) nie obsługują ADC w ESP32-S3. Do pomiarów analogowych używaj D0–D5 i D8–D10.

![Official Seeed Studio XIAO ESP32-S3 pinout diagram](https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/img/XIAO_ESP32-S3_front_pinout.png)

## Pobór prądu i zasilanie z akumulatora

Seeed publikuje następujące typowe wartości dla wersji standardowej:

| Warunek pracy | Typowy prąd |
|---|---:|
| Normalna praca przez USB-C | 5 V / 19 mA |
| Normalna praca z akumulatora | 3,8 V / 22 mA |
| Modem-sleep (3,8 V) | 27 mA |
| Light-sleep (3,8 V) | 2 mA |
| Deep sleep (3,8 V) | 14 µA |
| Aktywne Wi-Fi | 100 mA |
| Aktywne BLE | 85 mA |

Są to wartości producenta uzyskane w warunkach testowych, a nie gwarantowany pobór dla każdego projektu. Transmisja radiowa, diody LED, czujniki, straty regulatora i aktywność firmware mogą zwiększyć zużycie energii. Przed obliczeniem czasu pracy zmierz płytkę w docelowej konfiguracji.

Pin 5V jest połączony z szyną USB 5 V, a 3V3 to stabilizowane wyjście. Seeed podaje do 700 mA z regulatora 3V3, ale dostępny prąd zależy od zasilania wejściowego, temperatury i obciążenia. GPIO pracują z logiką 3,3 V i **nie są odporne na 5 V**. Przy zasilaniu z akumulatora pin 5V nie dostarcza 5 V.

## Ważne uwagi projektowe

- **Brak kamery i audio:** wersja standardowa nie ma kamery, mikrofonu cyfrowego ani gniazda microSD. Wybierz Sense, jeśli potrzebujesz tych funkcji.
- **Brak fabrycznie lutowanych goldpinów:** Seeed podaje, że standardowo płytka jest dostarczana bez przylutowanych złączy. Sprawdź wariant u sprzedawcy.
- **Antena:** podłącz antenę do złącza U.FL, aby poprawić łączność bezprzewodową.
- **ADC:** nie używaj D11/D12 do pomiarów analogowych.
- **Pobór prądu:** 14 µA dotyczy deep sleep, a nie pracy z aktywnym Wi-Fi.

## Programowanie i oprogramowanie

XIAO ESP32S3 obsługuje **Arduino IDE**, **MicroPython** i **ESP-IDF**. Aby wykonać pierwszy test, zainstaluj obsługę płytek ESP32 w Arduino IDE, wybierz XIAO ESP32S3, podłącz USB-C i wgraj prosty przykład GPIO lub portu szeregowego. ESP-IDF daje dokładniejszą kontrolę nad trybami uśpienia, radiem i peryferiami.

Fabryczne oprogramowanie może zawierać demonstrację, w której dotknięcie pinów zapala diodę. Wgranie własnego programu ją zastępuje.

## XIAO ESP32S3 czy XIAO ESP32S3 Sense?

| Cecha | XIAO ESP32S3 | XIAO ESP32S3 Sense |
|---|---|---|
| Kamera | Nie | Tak, na płytce rozszerzeń |
| Mikrofon cyfrowy | Nie | Tak, na płytce rozszerzeń |
| microSD | Nie | Tak, na płytce rozszerzeń |
| Flash / PSRAM | 8 MB / 8 MB | 8 MB / 8 MB |
| Deep sleep (typowa wartość Seeed) | 14 µA | 3 mA z rozszerzeniem |
| Najlepsze zastosowanie | Kompaktowe, energooszczędne IoT | Obraz, audio i rejestracja danych |

Do projektów z kamerą, mikrofonem lub kartą SD przeczytaj osobny poradnik [XIAO ESP32S3 Sense](/pl/products/seeed-xiao-esp32s3-sense/).

## Najczęściej zadawane pytania

### Czy XIAO ESP32S3 ma kamerę?
Nie. Standardowa wersja nie ma kamery. Wersja Sense dodaje kamerę, mikrofon cyfrowy i microSD na płytce rozszerzeń.

### Czy może działać z akumulatorem LiPo?
Tak. Ma pola akumulatora i wbudowany układ ładowania dla zgodnego jednokomórkowego akumulatora Li-ion/LiPo 3,7 V.

### Czy GPIO tolerują 5 V?
Nie. Pracują z napięciem 3,3 V i nie należy podłączać ich bezpośrednio do sygnałów 5 V.

### Jaki jest pobór prądu w deep sleep?
Seeed podaje typowo 14 µA przy 3,8 V dla wersji standardowej. Rzeczywisty pobór zależy od peryferiów i firmware.

### Czy goldpiny są w zestawie?
Nie standardowo. Seeed dostarcza płytkę bez przylutowanych pinów.

## Oficjalne materiały

- [Oficjalny poradnik Seeed Studio XIAO ESP32-S3](https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/)
- [Dokumentacja techniczna Espressif ESP32-S3](https://www.espressif.com/sites/default/files/documentation/esp32-s3_datasheet_en.pdf)

*Informacja redakcyjna: poradnik opiera się na opublikowanej dokumentacji producenta. Embedded Nerd nie testował fizycznie konkretnej płytki ani oferty sprzedawcy. Linki afiliacyjne mogą generować prowizję bez dodatkowych kosztów dla kupującego.*
