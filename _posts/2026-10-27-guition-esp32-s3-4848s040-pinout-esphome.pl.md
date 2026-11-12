---
title: "Guition 4848S040: pinout, GPIO i konfiguracja ESPHome"
title_tag: "Pinout 4848S040 i konfiguracja ESPHome"
layout: single
permalink: /guition-esp32-s3-4848s040-pinout-esphome/
lang: pl
locale: pl-PL
page_id: article-guition-esp32-s3-4848s040-pinout-esphome
translation_id: guition-esp32-s3-4848s040-pinout-esphome
available_languages: [en, de, es, fr, it, nl, pl]
english_url: /guition-esp32-s3-4848s040-pinout-esphome/
german_url: /de/guition-esp32-s3-4848s040-pinout-esphome/
spanish_url: /es/guition-esp32-s3-4848s040-pinout-esphome/
french_url: /fr/guition-esp32-s3-4848s040-pinout-esphome/
italian_url: /it/guition-esp32-s3-4848s040-pinout-esphome/
dutch_url: /nl/guition-esp32-s3-4848s040-pinout-esphome/
polish_url: /pl/guition-esp32-s3-4848s040-pinout-esphome/
internal_links: true
excerpt: "Pinout Guition ESP32-S3-4848S040, sygnały wyświetlacza RGB, inicjalizacja ST7701S, dotyk GT911, sterowanie podświetleniem i konfiguracja ESPHome."
show_date: false
read_time: false
last_modified_at: 2026-11-12
header:
  teaser: /assets/images/guition-esp32-s3-4848s040-back.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image_alt: "Widok tylnej części płytki dotykowej Guition ESP32-S3-4848S040"
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
  - /pl/products/guition-esp32-s3-4848s040/
  - /esp32-touchscreen-displays-guide/
share: true
seo_title: "Guition 4848S040: pinout, GPIO i konfiguracja ESPHome"
seo_description: "Pinout 4848S040 i opis GPIO, sygnały wyświetlacza RGB, dotyk GT911, sterowanie podświetleniem oraz wskazówki konfiguracji ESPHome dla ekranu ESP32-S3."
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
      "mainEntityOfPage": { "@type": "WebPage", "@id": {{ page.url | absolute_url | jsonify }} },
      "image": {{ page.header.og_image | default: page.header.image | absolute_url | jsonify }},
      "dateModified": {{ page.last_modified_at | date_to_xmlschema | jsonify }},
      "author": { "@type": "Organization", "name": "Embedded Nerd", "url": "https://embeddednerd.com/" },
      "publisher": { "@type": "Organization", "name": "Embedded Nerd", "url": "https://embeddednerd.com/" }
    },
    {
      "@type": "BreadcrumbList",
      "@id": {{ page.url | absolute_url | append: "#breadcrumb" | jsonify }},
      "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": "Strona główna", "item": "https://embeddednerd.com/" },
        { "@type": "ListItem", "position": 2, "name": {{ page.title | jsonify }}, "item": {{ page.url | absolute_url | jsonify }} }
      ]
    }
  ]
}
</script>

Pełną specyfikację, recenzję redakcyjną, dostępne warianty i opcje zakupu znajdziesz na stronie produktu [Guition ESP32-S3-4848S040](/pl/products/guition-esp32-s3-4848s040/).

Ten poradnik omawia pinout modelu 4848S040, interfejsy wyświetlacza i dotyku, kwestie sprzętowe związane z przekaźnikiem oraz sposób wykorzystania istniejącej konfiguracji ESPHome jako punktu wyjścia.

![Widok tylnej części płytki Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-back.webp)

> **Ważne:** przypisanie pinów i dostępność GPIO mogą się różnić w zależności od rewizji płytki. Traktuj poniższe tabele jako materiał referencyjny i przed podłączeniem urządzeń zewnętrznych sprawdź je w dokumentacji dokładnie tej wersji sprzętu, którą posiadasz.

## Najważniejsze elementy sprzętu

Ta rodzina płytek łączy układ ESP32-S3, wyświetlacz RGB o rozdzielczości 480 × 480 z kontrolerem ST7701S oraz pojemnościowy panel dotykowy GT911. Pamięć, obecność przekaźnika i opcje obudowy należy zweryfikować dla konkretnej rewizji i oferty sprzedawcy. Pełne dane techniczne i opcje zakupu znajdziesz na [stronie produktu](/pl/products/guition-esp32-s3-4848s040/).

## Pinout Guition ESP32-S3-4848S040

Poniższe przypisania pochodzą z profilu ESPHome Devices. Przed wykorzystaniem ich do podłączania sprzętu sprawdź rewizję swojej płytki.

### Piny wyświetlacza RGB

| Sygnał wyświetlacza | GPIO |
|---|---:|
| Dane czerwone (Red) | 11, 12, 13, 14, 0 |
| Dane zielone (Green) | 8, 20, 3, 46, 9, 10 |
| Dane niebieskie (Blue) | 4, 5, 6, 7, 15 |
| Włączanie wyświetlacza (DE) | 18 |
| Synchronizacja pozioma (HSYNC) | 16 |
| Synchronizacja pionowa (VSYNC) | 17 |
| Zegar pikseli (PCLK) | 21 |

### Inicjalizacja wyświetlacza ST7701S

| Sygnał | GPIO |
|---|---:|
| CS | 39 |
| CLK | 48 |
| DATA | 47 |

Sygnały te służą do inicjalizacji wyświetlacza. Są oddzielone od linii danych pikseli RGB i sygnałów synchronizacji.

### Kontroler dotyku GT911 i podświetlenie

| Funkcja | GPIO |
|---|---:|
| Dotyk I²C SDA | 19 |
| Dotyk I²C SCL | 45 |
| PWM podświetlenia | 38 |

Kontroler GT911 komunikuje się przez I²C. W przywołanym profilu GPIO 38 jest przypisany do sterowania podświetleniem za pomocą PWM.

![Demonstracja ekranu Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-screen-demo.webp)

*Przykładowy obraz wyświetlany na Guition ESP32-S3-4848S040.*

### Skrócona lista GPIO

Profil przypisuje **26 różnych pinów GPIO** do wyświetlacza, jego inicjalizacji, kontrolera dotyku i podświetlenia:

`GPIO0, GPIO3, GPIO4, GPIO5, GPIO6, GPIO7, GPIO8, GPIO9, GPIO10, GPIO11, GPIO12, GPIO13, GPIO14, GPIO15, GPIO16, GPIO17, GPIO18, GPIO19, GPIO20, GPIO21, GPIO38, GPIO39, GPIO45, GPIO46, GPIO47, GPIO48`

Lista przedstawia przypisania w opisanej konfiguracji. **Nie oznacza**, że wszystkie pozostałe GPIO są dostępne do użytku zewnętrznego. Inne piny mogą być zarezerwowane dla pamięci Flash lub PSRAM, elementów wbudowanych albo funkcji zależnych od konkretnej płytki.

## Które GPIO są wolne?

Nie zakładaj, że pin jest dostępny tylko dlatego, że nie pojawia się w powyższych tabelach. Zanim użyjesz GPIO do czujnika, przekaźnika, przycisku lub innego urządzenia peryferyjnego:

1. Sprawdź schemat i dokumentację dokładnej rewizji swojej płytki.
2. Ustal, które GPIO są fizycznie wyprowadzone na złącza.
3. Sprawdź, czy pin nie jest zarezerwowany dla Flash, PSRAM, USB, konfiguracji rozruchu lub innego elementu wbudowanego.
4. Porównaj planowane przypisanie pinu z konfiguracją ESPHome, której zamierzasz użyć.

Profil płytki jest dobrym punktem wyjścia, ale nie zastępuje schematu konkretnej wersji sprzętu.

## Wersje z przekaźnikiem i bez przekaźnika

Model 4848S040 jest sprzedawany w wariantach, które mogą zawierać moduł przekaźnika i różne rozwiązania montażowe. Jeśli wybierasz między wersjami, sprawdź [stronę produktu, aby poznać szczegóły wariantów i wskazówki dotyczące wyboru](/pl/products/guition-esp32-s3-4848s040/).

- **Wersja bez przekaźnika:** sprawdź dokumentację konkretnej płytki, aby ustalić dostępne złącza i obsługiwane urządzenia peryferyjne.
- **Wersja z przekaźnikiem:** nie zakładaj z góry, jakie GPIO steruje przekaźnikiem ani jakie są jego parametry elektryczne. Przed podłączeniem obciążenia zweryfikuj je na schemacie lub w dokumentacji tej wersji.
- **Montaż ścienny:** wersja z przekaźnikiem może nie pasować do europejskiej okrągłej puszki podtynkowej o średnicy 60 mm. Przed zakupem lub instalacją sprawdź wymiary i sposób montażu.

Nigdy nie podłączaj odbiornika zasilanego napięciem sieciowym wyłącznie na podstawie ogólnego pinoutu. Sprawdź parametry przekaźnika, izolację, obudowę i wymagania dotyczące okablowania dla dokładnie tego produktu.

## Pierwsze kroki z ESPHome

Istniejąca konfiguracja ESPHome może ułatwić rozpoczęcie pracy, ale przed wgraniem oprogramowania dokładnie ją przejrzyj. Poniższe zasoby społeczności są dobrym punktem wyjścia:

- [ESPHome Devices: Guition ESP32-S3-4848S040](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [Społecznościowa konfiguracja ESPHome](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

Poniższa procedura ogranicza ryzyko użycia konfiguracji przeznaczonej dla innej rewizji płytki:

1. Otwórz konfigurację i przeczytaj pliki YAML oraz wszystkie wskazane pakiety.
2. Sprawdź, czy przypisania GPIO wyświetlacza, dotyku i podświetlenia odpowiadają Twojej płytce.
3. Zastąp przykładowe nazwy urządzeń, dane Wi-Fi i sekrety własnymi wartościami.
4. Przejrzyj dodatkowe komponenty i pakiety zewnętrzne wykorzystywane przez konfigurację.
5. Sprawdź poprawność konfiguracji w ESPHome przed wgraniem.
6. Postępuj zgodnie z udokumentowaną procedurą pierwszego programowania dla swojej płytki i jej rewizji.

Ten poradnik nie stwierdza, że konfiguracja społecznościowa została przetestowana na każdej rewizji płytki. Jeśli urządzenie nie uruchamia się lub ekran pozostaje pusty, ponownie sprawdź konfigurację i porównaj pinout z dokumentacją sprzętu, zanim zmienisz połączenia.

![Panel sterowania na ekranie dotykowym Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-dashboard.webp)

*Przykładowy panel sterowania wyświetlany na ekranie dotykowym.*

## Często zadawane pytanie

### Czy mogę używać ESPHome z tym wyświetlaczem?

Profil ESPHome Devices i konfiguracja społecznościowa stanowią punkty wyjścia. Przed wgraniem oprogramowania przejrzyj pliki YAML, zweryfikuj przypisania GPIO dla swojej rewizji płytki i sprawdź poprawność konfiguracji.

## Co dalej?

Chcesz wybrać odpowiednią płytkę? Odwiedź stronę produktu [Guition ESP32-S3-4848S040](/pl/products/guition-esp32-s3-4848s040/), aby sprawdzić pełną specyfikację, recenzję redakcyjną, warianty i aktualne opcje zakupu.

## Powiązane materiały

- [Guition JC8048W550 – 5-calowy wyświetlacz ESP32-S3](/products/guition-jc8048w550/) — większy ekran panoramiczny o rozdzielczości 800×480.
- [Strona produktu Guition ESP32-S3-4848S040](/pl/products/guition-esp32-s3-4848s040/)
- [Selektor ekranów dotykowych ESP32](/tools/esp32-touchscreen-selector/)
- [Poradnik dotyczący ekranów dotykowych ESP32](/esp32-touchscreen-displays-guide/)
- [Profil ESPHome Devices](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [Społecznościowa konfiguracja ESPHome](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)
