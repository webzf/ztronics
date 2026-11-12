---
layout: product
lang: pl
locale: pl-PL
toc_label: Spis treści
internal_links: true
title: "Seeed Studio XIAO ESP32S3 Sense: kamera, mikrofon i karta SD na płytce 21 × 17,8 mm"
product_verdict: "Świetny wybór do niewielkich projektów z kamerą, dźwiękiem i rejestrowaniem danych opartych na ESP32-S3. Trzeba uwzględnić współdzielone GPIO oraz większy pobór prądu w trybie deep-sleep po podłączeniu płytki rozszerzeń."
editorial_review:
  rating: 8.5
  best_rating: 10
  worst_rating: 1
  author: "Embedded Nerd"
  summary: "Seeed Studio XIAO ESP32S3 Sense łączy ESP32-S3 z 8 MB PSRAM i 8 MB Flash, odłączaną płytkę kamery, mikrofon cyfrowy oraz gniazdo microSD w module o wymiarach 21 × 17,8 mm z układem ładowania akumulatora. To dobry wybór do małych projektów wizyjnych i audio, wsparty szczegółową dokumentacją producenta. Główne ograniczenia to współdzielone GPIO, większy pobór prądu w deep-sleep po podłączeniu płytki rozszerzeń oraz różnice między partiami kamer."
  methodology: "Ocena redakcyjna opiera się na opublikowanych specyfikacjach i dokumentacji producenta. Embedded Nerd nie testował fizycznie konkretnej płytki ani oferty sprzedawcy opisanej na tej stronie."
  pros:
    - "Kamera, mikrofon cyfrowy i gniazdo microSD na płytce wielkości kciuka"
    - "ESP32-S3 z 8 MB PSRAM i 8 MB Flash, wystarczający do strumieniowania obrazu i niewielkich demonstracji ML"
    - "Wbudowane ładowanie akumulatora Li-ion i złącze antenowe U.FL"
    - "Szczegółowa oficjalna dokumentacja Seeed Studio, mapy pinów i przykłady"
  cons:
    - "Mikrofon, karta SD i dioda użytkownika współdzielą GPIO z pinami złącza; przed podłączeniem urządzeń trzeba sprawdzić dostępne piny"
    - "Prąd w deep-sleep wynosi około 3 mA z podłączoną płytką rozszerzeń, znacznie więcej niż w zwykłym XIAO ESP32S3"
    - "Płytki są zwykle dostarczane bez goldpinów, a model kamery (OV5640 lub OV3660) może zależeć od partii"
seo_title: "XIAO ESP32S3 Sense: specyfikacja, pinout i gdzie kupić"
seo_description: "Specyfikacja Seeed Studio XIAO ESP32S3 Sense, pełna mapa pinów D0–D12 do GPIO, kamera OV5640, piny mikrofonu i karty SD, pobór prądu i zakup."
page_id: product-seeed-xiao-esp32s3-sense
product_id: seeed-xiao-esp32s3-sense
english_url: /products/seeed-xiao-esp32s3-sense/
german_url: /de/products/seeed-xiao-esp32s3-sense/
spanish_url: /es/products/seeed-xiao-esp32s3-sense/
french_url: /fr/products/seeed-xiao-esp32s3-sense/
italian_url: /it/products/seeed-xiao-esp32s3-sense/
dutch_url: /nl/products/seeed-xiao-esp32s3-sense/
polish_url: /pl/products/seeed-xiao-esp32s3-sense/
available_languages: [en, de, es, fr, it, nl, pl]
category: Development Boards
manufacturer: "Seeed Studio"
image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
header:
  teaser: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image_alt: "Seeed Studio XIAO ESP32S3 Sense z modułem kamery — widok z przodu"
alt: "Płytka Seeed Studio XIAO ESP32S3 Sense z modułem kamery — widok z przodu"
excerpt: "Seeed Studio XIAO ESP32S3 Sense z ESP32-S3, kamerą OV5640, mikrofonem cyfrowym, gniazdem microSD, 8 MB PSRAM i 8 MB Flash na płytce 21 × 17,8 mm."
description: "Seeed Studio XIAO ESP32S3 Sense to niewielka płytka rozwojowa ESP32-S3 z 8 MB PSRAM, 8 MB Flash, Wi-Fi, Bluetooth LE i układem ładowania akumulatora. Odłączana płytka rozszerzeń zawiera kamerę, mikrofon cyfrowy i gniazdo microSD. Część GPIO jest współdzielona przez złącze, mikrofon, kartę SD i diodę użytkownika, dlatego przed podłączeniem urządzeń należy sprawdzić tabele pinów."
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
  - name: Procesor
    value: "ESP32-S3R8, dwurdzeniowy Xtensa LX7, do 240 MHz"
  - name: Flash
    value: "8 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Kamera
    value: "Odłączana OV5640 z autofokusem (w niektórych płytkach OV3660)"
  - name: Mikrofon
    value: "Mikrofon cyfrowy (PDM)"
  - name: Pamięć masowa
    value: "Gniazdo microSD na płytce rozszerzeń, obsługa FAT do 32 GB"
  - name: Łączność bezprzewodowa
    value: "Wi-Fi 2,4 GHz i Bluetooth LE 5.0 / Bluetooth Mesh"
  - name: USB
    value: "USB Type-C"
  - name: Akumulator
    value: "Li-ion 3,7 V z wbudowanym układem ładowania"
  - name: Wymiary
    value: "21 × 17,8 mm; 21 × 17,8 × 15 mm z płytką rozszerzeń"
  - name: Temperatura pracy
    value: "−20 °C do 65 °C"
links:
  - title: "Pierwsze kroki z Seeed Studio XIAO ESP32-S3"
    icon: "fas fa-book"
    description: "Oficjalna specyfikacja, pinout, instrukcja uruchomienia i rozwiązywanie problemów."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/"
  - title: "Multipleksowanie pinów XIAO ESP32-S3 (Sense)"
    icon: "fas fa-microchip"
    description: "Oficjalny przewodnik po GPIO, ADC, I²C, SPI, UART i pinach dotykowych."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/"
  - title: "Strona produktu Seeed Studio"
    icon: "fas fa-store"
    description: "Oficjalna strona sklepu XIAO ESP32S3 Sense."
    url: "https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link"
related:
  - arduino-nano-esp32
  - esp32-devkit
  - raspberry-pi-pico-w
---
Seeed Studio XIAO ESP32S3 Sense to płytka ESP32-S3 wielkości kciuka z odłączaną płytką rozszerzeń zawierającą kamerę, mikrofon cyfrowy i gniazdo microSD. Produkt jest również wyszukiwany jako **XIAO ESP32-S3 Sense** lub **Seeed XIAO ESP32S3 Sense**. Przed zakupem upewnij się, że oferta dotyczy wersji **Sense**: zwykły XIAO ESP32S3 wygląda niemal identycznie, ale nie ma kamery, mikrofonu ani gniazda SD.

Najważniejszą kwestią przed podłączaniem urządzeń są **współdzielone piny**. Mikrofon, karta SD i dioda użytkownika korzystają z GPIO dostępnych również na złączu. Poniższe tabele pokazują dokładnie, które piny są współdzielone.

## Zdjęcia produktu

<div class="product-image-gallery" style="display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:1rem;margin:1.5rem 0;">
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-front.webp" alt="Seeed Studio XIAO ESP32S3 Sense z kamerą — widok z przodu" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Widok z przodu: XIAO ESP32S3 Sense z modułem kamery</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-camera-assembly.webp" alt="Seeed Studio XIAO ESP32S3 Sense z zamontowaną płytką kamery" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Kamera i zamontowana płytka rozszerzeń</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-back.webp" alt="Tył Seeed Studio XIAO ESP32S3 Sense z opisami pinów i polami lutowniczymi" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Widok z tyłu: oznaczenia pinów i pola lutownicze</figcaption>
  </figure>
</div>

## Czy warto kupić XIAO ESP32S3 Sense?

Wybierz tę płytkę, jeśli potrzebujesz kamery, mikrofonu lub zapisu danych na karcie SD w urządzeniu wielkości kciuka — na przykład do małej kamery Wi-Fi, projektu audio lub rozpoznawania mowy, urządzenia przenośnego albo rejestratora zasilanego z akumulatora. Jeśli potrzebujesz tylko małej płytki ESP32-S3 bez tych dodatków, zwykły XIAO ESP32S3 ma taki sam układ złącza i znacznie niższy pobór prądu w deep-sleep. Jeśli potrzebujesz większej liczby GPIO i 16 MB Flash, sprawdź XIAO ESP32-S3 Plus.

## XIAO ESP32S3, Sense czy Plus — którą wersję wybrać?

| Cecha | XIAO ESP32S3 | XIAO ESP32S3 Sense | XIAO ESP32-S3 Plus |
|---|---|---|---|
| Kamera i mikrofon | Nie | Tak (płytka rozszerzeń) | Nie |
| Gniazdo microSD | Nie | Tak (płytka rozszerzeń) | Nie |
| Flash / PSRAM | 8 MB / 8 MB | 8 MB / 8 MB | 16 MB / 8 MB |
| GPIO z PWM | 11 | 11 | 18 |
| Pobór prądu deep-sleep (dane Seeed) | 14 µA | 3 mA z płytką rozszerzeń | 33,5 µA |
| Najlepsze zastosowanie | Możliwie małe i energooszczędne projekty | Obraz, dźwięk i rejestrowanie danych | Więcej pinów i pamięci Flash |

Ceny zależą od sprzedawcy, kraju dostawy, kosztów wysyłki i wybranego wariantu. Przed zakupem sprawdź aktualną ofertę, zawartość zestawu i model kamery.

<div class="en-product-cta__buttons">
  <a class="en-buy-button" href="/go/hardware/seeed-xiao-esp32s3-sense/" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-cart-shopping"></i></span><span class="en-buy-text"><strong>Sprawdź cenę — XIAO ESP32S3 Sense</strong><small>AliExpress · sprawdź wersję kamery i goldpiny</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.amazon.com/Seeed-Studio-XIAO-ESP32-Sense/dp/B0C69FFVHH?tag=embeddednerd2-20" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fab fa-amazon"></i></span><span class="en-buy-text"><strong>Sprawdź cenę — Amazon</strong><small>Upewnij się, że to wersja Sense i sprawdź akcesoria</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-store"></i></span><span class="en-buy-text"><strong>Kup w Seeed Studio (przylutowane goldpiny)</strong><small>Oficjalny sklep · wersja z fabrycznie przylutowanymi goldpinami</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
</div>

## Specyfikacja w skrócie

| Parametr | Szczegóły |
|---|---|
| MCU | ESP32-S3R8, dwurdzeniowy Xtensa LX7, do 240 MHz |
| Flash | 8 MB |
| PSRAM | 8 MB |
| Łączność bezprzewodowa | Wi-Fi 2,4 GHz, Bluetooth LE 5.0 / Bluetooth Mesh |
| Kamera | Odłączana OV5640 z autofokusem (2592 × 1944); część płytek ma OV3660 (2048 × 1536); wcześniejsze wersje używały OV2640 (1600 × 1200) |
| Mikrofon | Mikrofon cyfrowy (PDM) |
| Pamięć masowa | Gniazdo microSD na płytce rozszerzeń, obsługa FAT do 32 GB |
| Interfejsy | 1 × UART, 1 × I²C, 1 × I²S, 1 × SPI, 11 × GPIO z PWM, 9 × ADC |
| Przyciski i diody | Reset, Boot, dioda użytkownika, dioda ładowania |
| Zasilanie | USB Type-C 5 V lub akumulator Li-ion 3,7 V |
| Antena | Złącze U.FL; antena zewnętrzna w zestawie |
| Wymiary | 21 × 17,8 mm; 21 × 17,8 × 15 mm z płytką rozszerzeń |
| Temperatura pracy | −20 °C do 65 °C |

Specyfikacja opiera się na dokumentacji Seeed Studio Wiki (sprawdzonej 7 listopada 2026 r.). Seeed informuje o przejściu z kamery OV3660 na OV5640 z autofokusem; w okresie przejściowym płytki mogą być dostarczane z jednym z tych modeli.

## Kamera, mikrofon i microSD

Płytka rozszerzeń łączy się przez złącze board-to-board i zawiera kamerę, mikrofon PDM oraz gniazdo microSD. Przykłady Seeed obsługują OV5640, OV3660 i OV2640, więc te same szkice mogą działać z każdym z nich, ale autofokus ma tylko OV5640. Moduł OV5640 jest również sprzedawany osobno jako część zamienna.

Seeed informuje, że od czerwca 2025 r. fabryczne oprogramowanie domyślnie uruchamia punkt dostępowy Wi-Fi z opublikowaną nazwą sieci i hasłem. Przed wdrożeniem płytki w miejscu dostępnym dla innych osób wgraj własne oprogramowanie.

## Pinout XIAO ESP32S3 Sense: D0–D12 i GPIO

| Pin XIAO | GPIO | Funkcje | Uwagi |
|---|---:|---|---|
| D0 | GPIO1 | ADC, touch | Ogólne wejście/wyjście |
| D1 | GPIO2 | ADC, touch | Ogólne wejście/wyjście |
| D2 | GPIO3 | ADC, touch | Pin strapping (źródło JTAG) |
| D3 | GPIO4 | ADC, touch | Ogólne wejście/wyjście |
| D4 / SDA | GPIO5 | I²C data, ADC, touch | Domyślne I²C. Zobacz [wyszukiwarkę adresów I2C](/tools/i2c-address-lookup/) i [poradnik I2C Scanner](/i2c-scanner-tutorial/). |
| D5 / SCL | GPIO6 | I²C clock, ADC, touch | Domyślne I²C |
| D6 / TX | GPIO43 | UART TX | Wyjście szeregowe |
| D7 / RX | GPIO44 | UART RX | Wejście szeregowe |
| D8 / SCK | GPIO7 | SPI clock, ADC, touch | Współdzielony z zegarem karty SD |
| D9 / MISO | GPIO8 | SPI MISO, ADC, touch | Współdzielony z wejściem danych karty SD |
| D10 / MOSI | GPIO9 | SPI MOSI, ADC, touch | Współdzielony z wyjściem danych karty SD |
| D11 | GPIO42 | Touch | Współdzielony z zegarem mikrofonu |
| D12 | GPIO41 | Touch | Współdzielony z linią danych mikrofonu |

Seeed zaznacza, że D11 i D12 (GPIO42 i GPIO41), mimo oznaczeń sugerujących wejście analogowe, nie obsługują ADC w ESP32-S3. Do pomiarów analogowych używaj D0–D5 i D8–D10.

Piny zasilania: **5V** to linia USB 5 V, **3V3** to stabilizowane wyjście 3,3 V, a **GND** oznacza masę. Wszystkie GPIO pracują z logiką 3,3 V i nie mogą otrzymywać 5 V. Podczas zasilania płytki z akumulatora na pinie 5V nie ma napięcia.

## Dostępność GPIO: piny używane przez kamerę, mikrofon i kartę SD

Zgodnie z mapą pinów Seeed kamera, mikrofon i karta SD nie kolidują ze sobą, ale część ich sygnałów współdzieli GPIO z pinami złącza.

| Funkcja | GPIO | Współdzielony z |
|---|---|---|
| Zegar mikrofonu (PDM) | GPIO42 | Pin złącza D11 |
| Dane mikrofonu (PDM) | GPIO41 | Pin złącza D12 |
| Chip select karty SD | GPIO21 | Dioda użytkownika |
| Zegar / MISO / MOSI karty SD | GPIO7 / GPIO8 / GPIO9 | Piny SPI złącza D8 / D9 / D10 |
| Dane / zegar I²C kamery | GPIO40 / GPIO39 | Piny JTAG MTDO / MTCK |
| Dane, zegar i synchronizacja kamery | GPIO10–18, 38, 47, 48 | Wyłącznie złącze board-to-board |

Jeśli używasz karty SD, dioda użytkownika na GPIO21 korzysta również z linii chip select karty. Każde dodatkowe urządzenie SPI podłączone do D8–D10 współdzieli magistralę z kartą i wymaga własnego pinu chip select. Podczas korzystania z mikrofonu traktuj D11 i D12 jako zajęte.

## Pobór prądu i zasilanie akumulatorowe

Typowe wartości podawane przez Seeed dla wersji Sense **z podłączoną płytką rozszerzeń**:

| Tryb | Typowy prąd |
|---|---:|
| Aktywne Wi-Fi | 110 mA |
| Aktywne Bluetooth LE | 102 mA |
| Modem-sleep | 44 mA |
| Light-sleep | 5 mA |
| Deep-sleep | 3 mA |
| Serwer kamery (USB) | około 140 mA średnio, 347 mA szczytowo |

Płytka może być zasilana akumulatorem Li-ion 3,7 V i ładować go przez USB-C. Seeed wskazuje, że ujemny pad akumulatora znajduje się bliżej portu USB, dlatego przed lutowaniem sprawdź polaryzację. Nie ma dedykowanego GPIO do odczytu napięcia akumulatora; pomiar wymaga zewnętrznego dzielnika napięcia podłączonego do wejścia ADC.

## Arduino, MicroPython i pierwsze uruchomienie

Seeed udostępnia dokumentację Arduino i MicroPython dla serii XIAO ESP32-S3, a także instrukcje ESP-IDF i Zephyr. W Arduino IDE wybierz płytkę **XIAO_ESP32S3** i użyj pakietu płytek ESP32 w wersji 2.0.8 lub nowszej.

```cpp
const int ledPin = LED_BUILTIN; // GPIO21 w XIAO ESP32S3
const int analogPin = A0;       // D0 = GPIO1 (ADC)

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // Dioda użytkownika jest aktywna stanem niskim: LOW ją włącza.
  digitalWrite(ledPin, LOW);
  delay(500);
  digitalWrite(ledPin, HIGH);
  delay(500);

  Serial.print("A0 = ");
  Serial.println(analogRead(analogPin));
}
```

Otwórz Monitor portu szeregowego z szybkością **115200 baud**. Ponieważ GPIO21 jest również linią chip select karty SD, nie przełączaj diody podczas korzystania z karty. Jeśli port znika lub przesyłanie programu kończy się błędem, przytrzymaj przycisk **Boot** podczas podłączania USB, aby uruchomić tryb bootloadera.

- [Pierwsze kroki z Seeed Studio](https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/)
- [Przewodnik Seeed Studio po multipleksowaniu pinów](https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/)

## Gdzie kupić

Sprawdź, czy oferta dotyczy wersji **Sense**, jaki model kamery jest w zestawie, kto jest sprzedawcą i dokąd ma zostać wysłana płytka. Seeed standardowo dostarcza płytkę bez goldpinów, dlatego wybierz wersję z przylutowanymi pinami albo przygotuj się do samodzielnego lutowania. Oferty różnią się zależnie od regionu, a cena na tej stronie nie jest stała.

Embedded Nerd może otrzymać prowizję od kwalifikujących się zakupów dokonanych przez linki partnerskie, bez dodatkowych kosztów dla kupującego.

- [Seeed Studio XIAO ESP32S3 Sense (z przylutowanymi pinami) — oficjalny sklep](https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link)

## Najczęściej zadawane pytania

### Czy XIAO ESP32S3 Sense to to samo co XIAO ESP32S3?

Nie. Obie wersje mają tę samą główną płytkę i układ pinów złącza, ale Sense dodaje odłączaną płytkę rozszerzeń z kamerą, mikrofonem cyfrowym i gniazdem microSD. Zwykły XIAO ESP32S3 nie ma tych elementów i pobiera mniej prądu w deep-sleep.

### Jakiej kamery używa XIAO ESP32S3 Sense?

Najnowsze płytki używają odłączanej kamery OV5640 z autofokusem, ale część dostaw w okresie zmiany produkcji może nadal zawierać OV3660. Wcześniejsze płytki korzystały z wycofanej już OV2640. Przykłady Seeed obsługują wszystkie trzy modele.

### Czy XIAO ESP32S3 Sense jest odporny na napięcie 5 V?

Nie. Piny GPIO pracują z logiką 3,3 V i nie mogą otrzymywać 5 V. Do czujników lub modułów 5 V użyj konwertera poziomów logicznych.

### Czy można jednocześnie używać kamery, mikrofonu i karty SD?

Według mapy pinów Seeed sygnały tych urządzeń nie kolidują ze sobą, więc można używać ich jednocześnie. Mikrofon korzysta z D11 i D12, karta SD współdzieli piny SPI D8–D10, a jej chip select jest tym samym GPIO co dioda użytkownika.

### Czy XIAO ESP32S3 Sense może ładować akumulator?

Tak. Płytka ma układ zarządzania ładowaniem akumulatora Li-ion i pola do jego podłączenia. Podczas zasilania z akumulatora pin 5V nie ma napięcia, a płytka nie udostępnia osobnego pinu do odczytu napięcia akumulatora.

### Czy płytka jest dostarczana z goldpinami?

Seeed standardowo dostarcza płytkę bez goldpinów. Sprawdź, czy oferta informuje o fabrycznie przylutowanych pinach, albo przylutuj je samodzielnie.

### Czy XIAO ESP32S3 Sense obsługuje MicroPython?

Tak. Seeed dokumentuje Arduino i MicroPython dla serii XIAO ESP32-S3. Wybór środowiska programistycznego nie zmienia ograniczenia napięcia 3,3 V ani opisanej wyżej mapy pinów.

## Porównanie z innymi płytkami ESP32

| Płytka | Najlepsze zastosowanie |
|---|---|
| Seeed Studio XIAO ESP32S3 Sense | Kompaktowe projekty z kamerą, dźwiękiem i rejestrowaniem danych |
| [Arduino Nano ESP32](/products/arduino-nano-esp32/) | Format Nano z ESP32-S3 i nazwami pinów Arduino |
| [ESP32 DevKit V1](/products/esp32-devkit/) | Niedrogie prototypowanie ogólnego przeznaczenia |
| [Raspberry Pi Pico W](/products/raspberry-pi-pico-w/) | RP2040 z Wi-Fi, wygodny do pracy z MicroPython |

Nie wiesz, która płytka będzie odpowiednia? Przeczytaj poradnik [Najlepsze płytki ESP32](/best-esp32-boards/) lub przejrzyj kategorię [Płytki rozwojowe](/products/development-boards/).
