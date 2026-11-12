---
title: "Sunton ESP32-8048S043C: pinout, kod Arduino i konfiguracja"
title_tag: "Sunton ESP32-8048S043C – pinout i konfiguracja"
hide_post_pagination: true
layout: single
lang: pl
locale: pl-PL
translation_id: sunton-esp32-8048s043c-guide
available_languages: [en, de, es, fr, it, nl, pl]
english_url: /sunton-esp32-8048s043c-guide/
german_url: /de/sunton-esp32-8048s043c-guide/
spanish_url: /es/sunton-esp32-8048s043c-guide/
french_url: /fr/sunton-esp32-8048s043c-guide/
italian_url: /it/sunton-esp32-8048s043c-guide/
dutch_url: /nl/sunton-esp32-8048s043c-guide/
polish_url: /pl/sunton-esp32-8048s043c-guide/
permalink: /sunton-esp32-8048s043c-guide/
sidebar:
  nav: "embedded"
  related: true
  share: true
excerpt: "Kod Arduino i pinout Sunton ESP32-8048S043C: konfiguracja wyświetlacza RGB, dotyk GT911, piny microSD, LVGL, ESPHome i wskazówki zakupowe."
show_date: false
last_modified_at: 2026-11-12
author: "Embedded Nerd"
read_time: false
toc: true
toc_label: "Spis treści"
toc_sticky: true
header:
  teaser: /assets/images/sunton-esp32-8048s043c-board.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/sunton-esp32-8048s043c-board.webp
  og_image: /assets/images/sunton-esp32-8048s043c-board.webp
  og_image_alt: "Sunton ESP32-8048S043C z żółtą płytką, ekranem dotykowym 4,3 cala 800x480 i układem ESP32-S3"
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
seo_title: "Sunton ESP32-8048S043C – pinout, Arduino, LVGL i konfiguracja"
seo_description: "Kompletny poradnik Sunton ESP32-8048S043C: pinout RGB i GT911, microSD, konfiguracja Arduino IDE, przykładowy kod, ESPHome i rozwiązywanie problemów."
---

**Sunton ESP32-8048S043C** to zintegrowana płytka z układem ESP32-S3, 4,3-calowym ekranem IPS o rozdzielczości 800×480 i pojemnościowym panelem dotykowym. Wszystkie te elementy znajdują się na jednej płytce, dzięki czemu można zbudować projekt z dużym ekranem dotykowym bez łączenia osobnego modułu ESP32 i wyświetlacza.

> **Informacja o testach:** ten poradnik opiera się na dokumentacji producenta, publicznie dostępnych opisach sprzętu i przykładowych projektach. Embedded Nerd nie testował niezależnie tej płytki na potrzeby artykułu. Przypisanie pinów może różnić się między rewizjami, dlatego przed podłączeniem urządzeń peryferyjnych sprawdź schemat swojej płytki.

> **Informacja o linkach partnerskich:** link AliExpress w tym poradniku jest linkiem partnerskim. Jeśli dokonasz zakupu za jego pośrednictwem, Embedded Nerd może otrzymać prowizję bez dodatkowych kosztów dla Ciebie.

Przed zakupem warto sprawdzić kilka szczegółów. Sunton sprzedaje kilka podobnych płytek, w tym wersje pojemnościowe i rezystancyjne. Dokładna rewizja sprzętu może wpływać na pinout i zalecaną konfigurację.

Ten poradnik omawia specyfikację, sprzęt wyświetlacza i dotyku, najważniejsze piny, zgodność oprogramowania, typowe problemy oraz kwestie, które warto rozważyć przed wyborem modelu 8048S043C.

> **Nie wiesz, który ekran dotykowy ESP32 będzie odpowiedni do Twojego projektu?** Zacznij od naszego [poradnika ekranów dotykowych ESP32]({{ site.url }}/esp32-touchscreen-displays-guide/) i porównaj płytki pod kątem rozdzielczości oraz wymaganej pamięci.

![Płytka Sunton ESP32-8048S043C-I z pojemnościowym ekranem dotykowym 4,3 cala; oznaczenia modułu ESP32-S3 i złączy](/assets/images/sunton-esp32-8048s043c-board.webp)

*Zdjęcie płytki udostępnione przez Embedded Nerd.*

## Specyfikacja Sunton ESP32-8048S043C

| **Parametr** | **Szczegóły** |
| --- | --- |
| MCU | ESP32-S3 (dwurdzeniowy, Wi-Fi + Bluetooth LE) |
| Flash / PSRAM | 16 MB Flash, 8 MB PSRAM octal w popularnej wersji N16R8 |
| Wyświetlacz | IPS 4,3 cala, 800×480 |
| Interfejs wyświetlacza | 16-bitowa równoległa magistrala RGB |
| Dotyk | Pojemnościowy, kontroler GT911 przez I²C |
| Pamięć masowa | Gniazdo karty microSD |
| USB | USB-C |
| Pozostałe | Przycisk BOOT na GPIO0; złącze rozszerzeń, złącza głośnika i baterii zależne od rewizji |

> **Przed zakupem sprawdź dokładną rewizję.** Sunton sprzedaje kilka podobnych płytek o myląco zbliżonych nazwach, w tym 4827S043C oraz rezystancyjne wersje R. Przed użyciem numerów pinów, konfiguracji pamięci lub przykładowego programu porównaj oznaczenie na płytce z dokumentacją sprzedawcy.
{: .notice--warning}

## Czy Sunton ESP32-8048S043C to dobry wybór?

Model 8048S043C ma sens, jeśli potrzebujesz stosunkowo dużego ekranu dotykowego, w którym ESP32, wyświetlacz i kontroler dotyku są zintegrowane na jednej płytce.

### Dobry wybór, jeśli potrzebujesz

- **4,3-calowego ekranu dotykowego 800×480**
- układu **ESP32-S3** z Wi-Fi i Bluetooth LE
- zintegrowanego dotyku pojemnościowego
- pamięci PSRAM do bardziej wymagających interfejsów graficznych
- jednej zintegrowanej płytki zamiast osobnego ESP32 i wyświetlacza
- interfejsu **LVGL**
- kompaktowego panelu sterowania z ekranem dotykowym

Typowe zastosowania obejmują pulpity nawigacyjne, interfejsy inteligentnego domu, sterowanie maszynami, wyświetlacze czujników i inne projekty, w których większy ekran dotykowy jest praktyczniejszy niż mały OLED lub wyświetlacz tekstowy.

### Rozważ inną płytkę, jeśli potrzebujesz

- rozbudowanej oficjalnej dokumentacji i przykładów
- innego rozmiaru lub rozdzielczości ekranu
- łatwiej dostępnych pinów GPIO
- innej technologii dotyku
- płytki z prostszą konfiguracją oprogramowania

## Wersja pojemnościowa C a rezystancyjna R – którą wybrać?

To jedna z najważniejszych rzeczy, które należy sprawdzić przed złożeniem zamówienia.

Wersja **C** wykorzystuje **pojemnościowy kontroler dotyku GT911** podłączony do magistrali I²C. Zapewnia on sposób obsługi dotyku typowy dla nowoczesnych ekranów.

Wersja **R** korzysta z rezystancyjnego panelu dotykowego i wymaga innego kontrolera oraz sterownika.

Jeśli zależy Ci na nowoczesnym, pojemnościowym interfejsie dotykowym, sprawdź, czy oferta wyraźnie wskazuje model **8048S043C**, a nie wariant R.

W szerszych nazwach repozytoriów i dokumentacji model występuje czasem jako **8048S043**, bez końcowego oznaczenia. W ofertach można spotkać trzy konfiguracje:

- **8048S043C** — dotyk pojemnościowy, zwykle z kontrolerem GT911.
- **8048S043R** — dotyk rezystancyjny; nie używaj konfiguracji GT911 przeznaczonej dla wersji C.
- **8048S043N** — w niektórych materiałach produktowych opisywana jako wersja bez dotyku.

Traktuj końcowy sufiks jako istotną część nazwy. Przed zakupem poproś sprzedawcę o potwierdzenie rzeczywistej płytki, kontrolera ekranu i sprzętu dotykowego. Nazwy produktów i dołączone przykładowe programy nie zawsze są spójne między ofertami.

## Pobieranie dokumentacji, schematu i przykładów

Poniższe materiały są przydatnym punktem wyjścia do sprawdzenia rewizji płytki i przygotowania działającego projektu:

- [Dokumentacja Makerfabs / Sunton i demonstracje wyświetlacza](https://wiki.makerfabs.com/Sunton_ESP32_S3_4.3_inch_800x400_IPS_with_Touch.html) — instrukcje instalacji udostępniane przez producenta, demonstracja ekranu i odnośniki do przykładów LVGL.
- [Referencja sprzętowa ESP3D dla ESP32-8048S043C](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/) — przypisanie pinów, połączenia microSD i uwagi dotyczące modyfikacji linii przerwania GT911.
- [Arkusz danych i archiwum demonstracyjne Sunton ESP32-8048S043](http://pan.jczn1688.com/directlink/1/ESP32%20module/4.3inch_ESP32-8048S043.zip) — archiwum hostowane przez producenta, wskazywane w dokumentacji społeczności; przed użyciem sprawdź jego zawartość i rewizję sprzętu.
- [Przykładowy projekt Arduino_GFX + GT911 + LVGL](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043) — projekt PlatformIO wykorzystujący Arduino_GFX, GT911 i LVGL 9.1.
- [Przykład ESP-IDF + LVGL](https://github.com/limpens/esp32-8048S043) — osobny przykład oparty na ESP-IDF i komponencie dotykowym GT911.

## Pinout: wyświetlacz, dotyk, microSD i złącza rozszerzeń

Wyświetlacz jest połączony z ESP32-S3 przez 16-bitową równoległą magistralę RGB. Kontroler dotyku GT911 korzysta z I²C. Połączenia te są już wykonane na płytce — nie wykorzystuj tych samych pinów ponownie do innych urządzeń peryferyjnych.

### Piny dotyku i sterowania

| Funkcja | GPIO | Uwagi |
| --- | ---: | --- |
| GT911 I²C SDA | 19 | Dane dotyku |
| GT911 I²C SCL | 20 | Zegar I²C dotyku |
| Reset GT911 (RST) | 38 | Reset kontrolera dotyku |
| Przerwanie GT911 (INT) | 18 | Zwykle niepodłączone do kontrolera bez modyfikacji sprzętowej |
| Podświetlenie LCD | 2 | Sterowanie podświetleniem |
| Przycisk BOOT | 0 | Wybór trybu rozruchu |

Adres GT911 na magistrali I²C to zwykle **0x5D** lub **0x14**, zależnie od konfiguracji. Linia przerwania dotyku może wymagać modyfikacji sprzętowej; jeśli nie jest podłączona, można używać standardowego odpytywania (polling).

### Piny microSD (SPI)

| Funkcja | GPIO |
| --- | ---: |
| CS karty SD | 10 |
| MOSI karty SD | 11 |
| SCK karty SD | 12 |
| MISO karty SD | 13 |

### Sygnały wyświetlacza RGB

| Sygnał | GPIO |
| --- | --- |
| DE / VSYNC / HSYNC / PCLK | 40 / 41 / 39 / 42 |
| Czerwony (R0–R4) | 45, 48, 47, 21, 14 |
| Zielony (G0–G5) | 5, 6, 7, 15, 16, 4 |
| Niebieski (B0–B4) | 8, 3, 46, 9, 1 |

### Złącza rozszerzeń

Opublikowana referencja sprzętowa podaje następujący układ pinów:

| Złącze | Piny / funkcje |
| --- | --- |
| P1 (podobne do UART) | GND, RX, TX, +5 V |
| P2 (podobne do SPI) | GPIO13, GPIO12, GPIO11, GPIO19 |
| P3 | GPIO20, GPIO19, GPIO18, GPIO17 |
| P4 | GPIO18, GPIO17, 3,3 V, GND |

**Nie są to niezależne piny GPIO.** GPIO19/20 współdzielą magistralę z dotykowym I²C, GPIO11–13 są używane przez microSD, a GPIO18 jest powiązane z opcjonalną modyfikacją linii przerwania GT911. Przed podłączeniem sprzętu sprawdź orientację złącza i schemat dokładnej rewizji płytki. Magistrala RGB wykorzystuje wiele pozostałych GPIO.

W opublikowanym pinoucie ESP3D **GPIO17 jest oznaczone na głównej liście jako NC, ale jednocześnie jest wyprowadzone na złącza rozszerzeń P3/P4**. To najbardziej obiecujący kandydat na proste dodatkowe wejście/wyjście cyfrowe, ale traktuj go jako *potencjalnie dostępny*, a nie gwarantowanie wolny, dopóki nie sprawdzisz schematu swojej płytki. GPIO33/34 są oznaczone jako NA, a GPIO35–37 jako NC/NA — nie zakładaj, że są dostępne lub użyteczne. Unikaj używania GPIO43/44 do ogólnych urządzeń peryferyjnych, ponieważ obsługują połączenie szeregowe USB–UART.

## Zgodność z oprogramowaniem i bibliotekami

Model 8048S043C może współpracować z kilkoma popularnymi bibliotekami graficznymi ESP32:

| **Biblioteka** | **Zastosowanie** | **Uwagi** |
| --- | --- | --- |
| **LVGL** | Pełne interfejsy dotykowe z przyciskami, suwakami i wykresami | Wymaga niższego poziomu sterownika wyświetlacza |
| **Arduino_GFX** | Prosta grafika, tekst i szybkie testy | Wymaga sterownika panelu RGB dla ESP32-S3 |
| **LovyanGFX** | Szybkie rysowanie i elastyczna konfiguracja | Wymaga konfiguracji panelu odpowiedniej dla płytki |

W większości projektów rozsądnym podejściem jest użycie sterownika panelu RGB niższego poziomu, takiego jak Arduino_GFX, razem z **LVGL** do budowy interfejsu.

Najważniejszy wniosek przed zakupem: płytka obsługuje zaawansowane interfejsy dotykowe, ale konfiguracja wyświetlacza musi odpowiadać dokładnej wersji sprzętu.

## Przykładowy kod Arduino: ekran i dotyk

Poniższy szkic to **minimalny test wyświetlacza Arduino_GFX z obsługą dotyku GT911** dla typowego pinoutu 8048S043C. Program wyświetla komunikat testowy i wysyła współrzędne dotyku do monitora portu szeregowego. Przykład opiera się na opublikowanych referencjach sprzętowych i nie był testowany na stanowisku Embedded Nerd; taktowanie i działanie dotyku mogą różnić się między rewizjami płytki.

Zainstaluj biblioteki **Arduino_GFX** i **TAMC_GT911** przez Library Manager, zainstaluj pakiet płytek ESP32 firmy Espressif, wybierz **ESP32S3 Dev Module**, włącz **OPI PSRAM** i ustaw rozmiar Flash odpowiedni dla modułu (zwykle 16 MB dla N16R8).

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
// Linia GT911 INT zwykle nie jest podłączona na tej płytce; użyj odpytywania.
#define TOUCH_INT     -1

Arduino_ESP32RGBPanel *rgbPanel = new Arduino_ESP32RGBPanel(
  40, 41, 39, 42,                         // DE, VSYNC, HSYNC, PCLK
  45, 48, 47, 21, 14,                     // R0-R4
  5, 6, 7, 15, 16, 4,                      // G0-G5
  8, 3, 46, 9, 1,                          // B0-B4
  0, 8, 4, 8,                              // polaryzacja HSYNC, front porch, impuls, back porch
  0, 8, 4, 8,                              // polaryzacja VSYNC, front porch, impuls, back porch
  1, 12500000                              // PCLK active-negative, docelowy zegar pikseli (12,5 MHz)
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

Jeśli ekran pozostaje pusty lub działa niestabilnie, nie próbuj losowo zmieniać wartości taktowania. Porównaj timing ekranu i przypisanie GPIO z [referencją sprzętową ESP3D](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/) oraz dokumentacją dokładnej rewizji. Do pełnego projektu LVGL wykorzystaj [przykład Sunton ESP32-8048S043](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043), który zawiera również konfigurację bibliotek.

Zalecana kolejność uruchamiania:

1. Upewnij się, że masz pojemnościową wersję **8048S043C**.
2. Zainstaluj obsługę płytek ESP32-S3 i otwórz projekt przykładowy w PlatformIO.
3. Najpierw skompiluj i wgraj niezmodyfikowaną demonstrację.
4. Sprawdź, czy ekran RGB wyświetla obraz, zanim zaczniesz zmieniać interfejs.
5. Zweryfikuj współrzędne dotyku i obrót ekranu, a następnie dodaj widżety LVGL.
6. Podłącz microSD lub inne urządzenia peryferyjne dopiero po sprawdzeniu współdzielonych GPIO.

**Status weryfikacji:** przykład jest projektem strony trzeciej, a nie kodem przetestowanym przez Embedded Nerd. Traktuj go jako implementację referencyjną i sprawdź licencję oraz zależności przed ponownym wykorzystaniem kodu we własnym projekcie.

## SquareLine Studio i LVGL

[SquareLine Studio](https://squareline.io/) umożliwia wizualne projektowanie interfejsu LVGL i eksportowanie kodu UI. Nie zastępuje sterowników wyświetlacza i dotyku zależnych od płytki: wygenerowany interfejs nadal trzeba zintegrować z działającym sterownikiem panelu RGB, sterownikiem wejścia GT911 i zgodną wersją LVGL. Przed zaimportowaniem wygenerowanych plików sprawdź platformę docelową eksportu i wersję LVGL.

## ESPHome

Płytka jest również wykorzystywana z ESPHome i Home Assistant. [Referencja ESPHome Devices](https://devices.esphome.io/devices/sunton-esp32-8048s043c/) zawiera konfigurację ekranu 800×480 i dotyku GT911. [Dokumentacja komponentu LVGL w ESPHome](https://esphome.io/components/lvgl/) wyjaśnia, jak tworzyć interaktywne strony.

Konfiguracje ESPHome zależą od wersji, szczególnie w przypadku ekranów RGB i sterowników dotyku. Zacznij od konfiguracji znanej jako działająca z Twoją wersją ESPHome i rewizją płytki. Następnie dodaj encje i widżety Home Assistant.

## Ustawienia Arduino IDE

Dla popularnej wersji N16R8 istotne ustawienia Arduino IDE to:

1. Zainstaluj **pakiet płytek ESP32** firmy Espressif przez Boards Manager.
2. Wybierz **ESP32S3 Dev Module**.
3. Ustaw **PSRAM** na **OPI PSRAM**.
4. Ustaw **Flash Size** na **16 MB**.
5. Dla wersji N16R8 użyj trybu Flash **QIO 80 MHz**.
6. Wybierz schemat partycji odpowiedni dla dużych projektów i 16 MB pamięci Flash.

Bez prawidłowej konfiguracji PSRAM aplikacje graficzne mogą nie być w stanie przydzielić bufora ramki, co może powodować pusty ekran lub pętlę restartów.

> **Ważne:** te ustawienia dotyczą popularnej konfiguracji N16R8. Przed ich zastosowaniem sprawdź dokładną rewizję płytki i dokumentację sprzedawcy.
{: .notice--warning}

## Typowe problemy, które warto znać przed zakupem

Warto zrozumieć typowe problemy przed wyborem tej płytki, ponieważ 8048S043C wymaga więcej uwagi podczas konfiguracji niż prosty ekran ESP32 ze SPI.

### Czarny ekran, mimo że płytka działa

Nieprawidłowa konfiguracja PSRAM, wyświetlacza lub podświetlenia może sprawić, że ESP32 działa, ale obraz nie jest widoczny.

Sprawdź, czy:

- PSRAM jest ustawiona na **OPI PSRAM**
- profil płytki to **ESP32-S3**
- podświetlenie jest poprawnie skonfigurowane
- timing wyświetlacza odpowiada znanej, działającej konfiguracji tej płytki

### Pętla restartów lub reset po wgraniu programu

Częstą przyczyną są nieprawidłowe ustawienia PSRAM lub Flash.

W popularnej wersji N16R8 sprawdź ustawienia Arduino IDE, zanim zaczniesz zmieniać kod aplikacji.

### Dotyk nie działa

Wersja pojemnościowa korzysta z kontrolera GT911 przez I²C.

Jeśli ekran działa, ale dotyk nie:

1. Sprawdź piny I²C.
2. Uruchom skaner I²C.
3. Poszukaj kontrolera GT911 pod adresem **0x5D** lub **0x14**.
4. Upewnij się, że oprogramowanie korzysta ze sterownika GT911, a nie sterownika dotyku rezystancyjnego.

Możesz również użyć naszej [wyszukiwarki adresów I²C]({{ site.url }}/tools/i2c-address-lookup/), aby zidentyfikować adres urządzenia, oraz skorzystać z [poradnika I2C Scanner]({{ site.url }}/i2c-scanner-tutorial/) podczas diagnozowania problemów.

### Dotyk jest lustrzany lub przesunięty

Zwykle jest to problem konfiguracji oprogramowania. Sprawdź orientację osi X/Y i ustawienia obrotu ekranu w konfiguracji dotyku i wyświetlacza.

### Migotanie lub przesuwanie obrazu

Przyczyną może być timing RGB lub przepustowość PSRAM. Zamiast zgadywać, zacznij od wartości taktowania użytych w działającym przykładzie dla dokładnie tej płytki.

### Ograniczona liczba dostępnych GPIO

Wyświetlacz RGB wykorzystuje znaczną liczbę GPIO. Jeśli projekt wymaga również kilku czujników, urządzeń peryferyjnych lub interfejsów komunikacyjnych, przed wyborem płytki sprawdź dostępne piny rozszerzeń.

### Nie można wgrać programu

W razie potrzeby przytrzymaj **BOOT (GPIO0)** podczas podłączania USB-C albo spróbuj użyć innego przewodu USB. Niektóre przewody USB służą wyłącznie do ładowania.

## Sunton ESP32-8048S043C a inne ekrany dotykowe ESP32

Najważniejszy kompromis nie dotyczy wyłącznie rozmiaru ekranu: rozdzielczość, technologia dotyku, interfejs wyświetlacza, dostępne GPIO i obsługa programowa wpływają na nakład pracy przy projekcie.

| Płytka | Ekran | Dotyk / MCU | Najlepsze zastosowanie |
| --- | --- | --- | --- |
| **Sunton ESP32-8048S043C** | 4,3 cala, 800×480 RGB | ESP32-S3, pojemnościowy GT911, 16 MB Flash / 8 MB PSRAM (popularna wersja N16R8) | Zintegrowany ekran dotykowy 4,3 cala o wysokiej rozdzielczości |
| [Waveshare ESP32-S3-Touch-LCD-4.3](https://www.waveshare.com/esp32-s3-touch-lcd-4.3.htm) | 4,3 cala, 800×480 | ESP32-S3; dotyk pojemnościowy w odpowiednim wariancie produktu | Alternatywna platforma 4,3 cala z dokumentacją producenta |
| **Sunton ESP32-8048S070C** | 7 cali, 800×480 RGB | ESP32-S3, dotyk pojemnościowy w wersji C | Większy fizycznie ekran o tej samej rozdzielczości |
| [**Waveshare ESP32-S3-Touch-LCD-7**](/products/waveshare-esp32-s3-touch-lcd-7/) | 7 cali, 800×480 IPS | ESP32-S3, 5-punktowy dotyk pojemnościowy | Alternatywa 7-calowa z udokumentowanymi interfejsami CAN i RS485 |

Sprawdź aktualną dokumentację każdego producenta, aby poznać szczegóły pamięci, złączy i kontrolerów dotyku. Podobne nazwy modeli nie gwarantują zgodnego pinoutu ani wymiennych konfiguracji oprogramowania.

Aby zawęzić porównanie, skorzystaj z [selektora ekranów dotykowych ESP32 4,3 cala]({{ site.url }}/tools/esp32-touchscreen-selector/esp32-4-3-inch-touchscreen/) lub [selektora ekranów 800×480]({{ site.url }}/tools/esp32-touchscreen-selector/800x480/).

## Cena i dostępność Sunton ESP32-8048S043C

**[Zobacz Sunton ESP32-8048S043C w AliExpress →](https://s.click.aliexpress.com/e/_c2zi4HDn){: rel="sponsored nofollow noopener" target="_blank"}**

Przed zakupem sprawdź, czy oferta dotyczy **pojemnościowej wersji 8048S043C z GT911**, a nie rezystancyjnej wersji R lub wersji N bez dotyku. Dokładny identyfikator modelu ukryty za skróconym linkiem partnerskim nie jest widoczny dla Embedded Nerd. Dlatego dokładnie sprawdź zdjęcia i specyfikację sprzedawcy.

Ceny, koszty wysyłki, podatki i dostępność różnią się w zależności od sprzedawcy i miejsca dostawy. Porównuj **łączną cenę z dostawą** i przed zakupem sprawdź rewizję płytki. Przed podjęciem decyzji możesz również odwiedzić [techniczną stronę produktu]({{ site.url }}/products/sunton-esp32-8048s043c/).

## Najczęściej zadawane pytania

### Czy warto kupić Sunton ESP32-8048S043C?

To dobry wybór, jeśli szukasz zintegrowanej płytki ESP32-S3 z pojemnościowym ekranem dotykowym 4,3 cala o rozdzielczości 800×480. Najważniejsze jest dopasowanie dokładnej rewizji sprzętu do konfiguracji oprogramowania, której zamierzasz użyć.

### Jakiego kontrolera dotyku używa 8048S043C?

Wersja pojemnościowa wykorzystuje **GT911** przez I²C, zwykle na GPIO19 i GPIO20.

### Czy 8048S043C ma PSRAM?

Popularna wersja N16R8 ma **8 MB pamięci PSRAM octal** i **16 MB Flash**. Przed zakupem sprawdź dokładną ofertę, ponieważ dostępne są różne warianty.

### Czy 8048S043C ma dotyk pojemnościowy czy rezystancyjny?

Wersja **C** jest pojemnościowa i wykorzystuje GT911. Wersja **R** ma rezystancyjny sprzęt dotykowy i inny kontroler. Niektóre oferty używają również nazwy rodziny **8048S043** bez sufiksu; wariant **N** jest opisywany jako wersja bez dotyku. Przed zakupem sprawdź dokładny model płytki.

### Czy wersja 8048S043N obsługuje ekran dotykowy?

W niektórych materiałach wariant N jest opisywany jako wersja bez dotyku. Nie zakładaj, że ma kontroler GT911 — sprawdź ofertę i rewizję płytki.

### Czy płytka nadaje się do LVGL?

Tak. ESP32-S3, ekran RGB i PSRAM sprawiają, że płytka nadaje się do wymagających graficznie interfejsów LVGL, o ile konfiguracja wyświetlacza jest prawidłowa. Jeśli porównujesz płytki do takich projektów, skorzystaj z [selektora ekranów ESP32-S3 LVGL]({{ site.url }}/tools/esp32-touchscreen-selector/esp32-s3-lvgl/), aby filtrować opcje według rodziny układów i wymagań pamięci.

### Czy kupić 8048S043C, czy inny ekran dotykowy ESP32?

To zależy od potrzebnego rozmiaru i rozdzielczości ekranu, technologii dotyku, wymagań dotyczących GPIO i obsługi programowej.

Porównaj rozmiar ekranu, rozdzielczość i PSRAM za pomocą [selektora ekranów dotykowych ESP32]({{ site.url }}/tools/esp32-touchscreen-selector/).

### Czy mogę podłączyć dodatkowe czujniki?

Tak. Używaj wolnych pinów złącza rozszerzeń i upewnij się, że urządzenia I²C nie mają adresów kolidujących z kontrolerem dotyku.

Przykładowo czujniki I²C, takie jak [MPU6050]({{ site.url }}/mpu6050-arduino-guide/) lub [BMA400]({{ site.url }}/bma400-esp32-tutorial-wiring-code-arduino-guide/), mogą współpracować z płytką, jeśli dostępne piny i adresy I²C na to pozwalają.

## O autorze

**Embedded Nerd** publikuje praktyczne poradniki dotyczące płytek ESP32, sprzętu embedded, wyświetlaczy, czujników i narzędzi programistycznych. Ten poradnik opiera się na dokumentacji producenta i wskazanych projektach społeczności; płytka nie była niezależnie testowana na potrzeby tego artykułu.

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
    { "@type": "ListItem", "position": 1, "name": "Strona główna", "item": {{ site.url | append: "/" | jsonify }} },
    { "@type": "ListItem", "position": 2, "name": "Poradnik ekranów dotykowych ESP32", "item": {{ "/esp32-touchscreen-displays-guide/" | absolute_url | jsonify }} },
    { "@type": "ListItem", "position": 3, "name": {{ page.title | jsonify }}, "item": {{ page.url | absolute_url | jsonify }} }
  ]
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    { "@type": "Question", "name": "Czy warto kupić Sunton ESP32-8048S043C?", "acceptedAnswer": { "@type": "Answer", "text": "To dobry wybór, jeśli potrzebujesz zintegrowanej płytki ESP32-S3 z pojemnościowym ekranem dotykowym 4,3 cala 800×480. Sprawdź dokładną rewizję sprzętu i konfigurację oprogramowania." } },
    { "@type": "Question", "name": "Jakiego kontrolera dotyku używa 8048S043C?", "acceptedAnswer": { "@type": "Answer", "text": "Wersja pojemnościowa wykorzystuje kontroler GT911 przez I²C, zwykle na GPIO19 i GPIO20." } },
    { "@type": "Question", "name": "Czy 8048S043C ma PSRAM?", "acceptedAnswer": { "@type": "Answer", "text": "Popularna wersja N16R8 ma 8 MB pamięci PSRAM octal i 16 MB Flash. Sprawdź dokładną ofertę, ponieważ dostępne są różne warianty." } },
    { "@type": "Question", "name": "Czy 8048S043C ma dotyk pojemnościowy czy rezystancyjny?", "acceptedAnswer": { "@type": "Answer", "text": "Wersja C jest pojemnościowa i wykorzystuje GT911. Wersja R ma rezystancyjny sprzęt dotykowy i inny kontroler." } },
    { "@type": "Question", "name": "Czy wersja 8048S043N obsługuje ekran dotykowy?", "acceptedAnswer": { "@type": "Answer", "text": "Wariant N jest w niektórych materiałach opisywany jako wersja bez dotyku. Sprawdź dokładną płytkę i specyfikację sprzedawcy." } },
    { "@type": "Question", "name": "Czy płytka nadaje się do LVGL?", "acceptedAnswer": { "@type": "Answer", "text": "Tak. ESP32-S3, ekran RGB i PSRAM nadają się do wymagających graficznie interfejsów LVGL, jeśli konfiguracja wyświetlacza jest prawidłowa." } },
    { "@type": "Question", "name": "Czy kupić 8048S043C, czy inny ekran dotykowy ESP32?", "acceptedAnswer": { "@type": "Answer", "text": "Przed wyborem porównaj rozmiar ekranu, rozdzielczość, technologię dotyku, wymagania GPIO, PSRAM i obsługę programową." } },
    { "@type": "Question", "name": "Czy mogę podłączyć dodatkowe czujniki?", "acceptedAnswer": { "@type": "Answer", "text": "Tak. Używaj wolnych pinów rozszerzeń i upewnij się, że adresy I²C nie kolidują z kontrolerem dotyku." } }
  ]
}
</script>

## Podsumowanie

**Sunton ESP32-8048S043C** to interesująca opcja, jeśli potrzebujesz stosunkowo dużego **pojemnościowego ekranu dotykowego 4,3 cala 800×480** zintegrowanego z układem **ESP32-S3**.

Do największych zalet należą zintegrowany wyświetlacz i sprzęt dotykowy, pamięć PSRAM oraz obsługa wymagających graficznie interfejsów, takich jak LVGL.

Najważniejszym kompromisem jest to, że ekran RGB, konfiguracja PSRAM i różne warianty sprzętowe wymagają więcej uwagi niż prostszy moduł wyświetlacza ESP32.

Jeśli te cechy odpowiadają Twojemu projektowi, warto rozważyć model 8048S043C. Przed zakupem upewnij się, że dokładny sufiks i rewizja sprzętu odpowiadają używanemu oprogramowaniu.

### Powiązane poradniki i narzędzia

- [Poradnik ekranów dotykowych ESP32]({{ site.url }}/esp32-touchscreen-displays-guide/) — porównaj rozmiary ekranów, technologie dotyku, interfejsy i wymagania pamięci.
- [Selektor ekranów dotykowych ESP32]({{ site.url }}/tools/esp32-touchscreen-selector/) — filtruj płytki według rozdzielczości, PSRAM, typu dotyku i interfejsu.
- [Strona produktu Waveshare ESP32-S3-Touch-LCD-4.3]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-4-3/) — porównaj inny zintegrowany ekran ESP32-S3 o przekątnej 4,3 cala.
- [Strona produktu Waveshare ESP32-S3-Touch-LCD-7]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-7/) — porównaj 7-calową alternatywę 800×480, jeśli potrzebujesz większej powierzchni ekranu.
- [Skaner I²C dla Arduino, ESP32 i ESP8266]({{ site.url }}/i2c-scanner-tutorial/) — sprawdź, które urządzenia I²C odpowiadają na magistrali podczas diagnozowania problemów z dotykiem lub czujnikami.
- [Wyszukiwarka adresów I²C i kontrola zgodności]({{ site.url }}/tools/i2c-address-lookup/) — sprawdź adresy I²C i możliwe konflikty z kontrolerem dotyku GT911.
- [Strona produktu Sunton ESP32-8048S043C]({{ site.url }}/products/sunton-esp32-8048s043c/) — sprawdź specyfikację produktu i aktualne opcje zakupu.
