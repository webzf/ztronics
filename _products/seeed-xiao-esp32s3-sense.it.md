---
layout: product
lang: it
locale: it-IT
toc_label: Indice
internal_links: true
title: "Seeed Studio XIAO ESP32S3 Sense: fotocamera, microfono e microSD in una scheda da 21 × 17,8 mm"
product_verdict: "Ideale per progetti compatti con fotocamera, audio e registrazione dati basati su ESP32-S3. Pianifica l'utilizzo dei GPIO condivisi e considera la maggiore corrente in deep sleep con la scheda di espansione collegata."
editorial_review:
  rating: 8.5
  best_rating: 10
  worst_rating: 1
  author: "Embedded Nerd"
  summary: "Seeed Studio XIAO ESP32S3 Sense integra un ESP32-S3 con 8 MB di PSRAM e 8 MB di Flash, una scheda fotocamera rimovibile, un microfono digitale e uno slot microSD in un modulo da 21 × 17,8 mm con circuito di ricarica della batteria. È una scelta interessante per piccoli progetti video e audio, supportata da una buona documentazione ufficiale; gli aspetti da considerare sono i GPIO condivisi, la maggiore corrente in deep sleep con la scheda di espansione collegata e le differenze tra i modelli di fotocamera forniti nei diversi lotti."
  methodology: "Questa valutazione editoriale si basa sulle specifiche pubblicate e sulla documentazione del produttore. Embedded Nerd non ha testato fisicamente la scheda specifica o l'inserzione del venditore descritta in questa pagina."
  pros:
    - "Fotocamera, microfono digitale e slot microSD su una scheda grande quanto un pollice"
    - "ESP32-S3 con 8 MB di PSRAM e 8 MB di Flash, sufficienti per streaming video e piccoli esempi di machine learning"
    - "Ricarica integrata della batteria Li-ion e connettore per antenna U.FL"
    - "Documentazione ufficiale dettagliata di Seeed Studio, mappe dei pin ed esempi"
  cons:
    - "Microfono, scheda SD e LED utente condividono GPIO con i pin del connettore: verifica i pin disponibili prima del cablaggio"
    - "La corrente in deep sleep è di circa 3 mA con la scheda di espansione collegata, molto più alta rispetto al normale XIAO ESP32S3"
    - "Le schede sono generalmente fornite senza pin header e il modello della fotocamera (OV5640 o OV3660) può variare in base al lotto"
seo_title: "XIAO ESP32S3 Sense: specifiche, pinout e dove acquistarlo"
seo_description: "Specifiche Seeed Studio XIAO ESP32S3 Sense, pinout completo da D0 a D12/GPIO, pin della fotocamera OV5640, microfono e SD, consumi e acquisto."
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
category: Development Boards
manufacturer: "Seeed Studio"
image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
header:
  teaser: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image_alt: "Vista frontale di Seeed Studio XIAO ESP32S3 Sense con modulo fotocamera"
alt: "Scheda Seeed Studio XIAO ESP32S3 Sense, vista frontale con modulo fotocamera"
excerpt: "Seeed Studio XIAO ESP32S3 Sense con ESP32-S3, fotocamera OV5640, microfono digitale, slot microSD, 8 MB di PSRAM e 8 MB di Flash su una scheda da 21 × 17,8 mm."
description: "Seeed Studio XIAO ESP32S3 Sense è una scheda di sviluppo ESP32-S3 grande quanto un pollice, con 8 MB di PSRAM, 8 MB di Flash, Wi-Fi, Bluetooth LE e ricarica della batteria, oltre a una scheda di espansione rimovibile con fotocamera, microfono digitale e slot microSD. Diversi GPIO sono condivisi tra il connettore, il microfono, la scheda SD e il LED utente: controlla le tabelle dei pin prima del cablaggio."
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
permalink: /it/products/seeed-xiao-esp32s3-sense/
specifications:
  - name: Processore
    value: "ESP32-S3R8, dual-core Xtensa LX7, fino a 240 MHz"
  - name: Flash
    value: "8 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Fotocamera
    value: "OV5640 rimovibile con autofocus (OV3660 su alcune schede)"
  - name: Microfono
    value: "Microfono digitale (PDM)"
  - name: Memoria
    value: "Slot microSD sulla scheda di espansione, supporto FAT fino a 32 GB"
  - name: Wireless
    value: "Wi-Fi 2,4 GHz e Bluetooth LE 5.0 / Bluetooth Mesh"
  - name: USB
    value: "USB Type-C"
  - name: Batteria
    value: "Li-ion da 3,7 V con gestione della ricarica integrata"
  - name: Dimensioni
    value: "21 × 17,8 mm; 21 × 17,8 × 15 mm con scheda di espansione"
  - name: Temperatura di esercizio
    value: "−20 °C a 65 °C"
links:
  - title: "Guida introduttiva Seeed Studio XIAO ESP32-S3"
    icon: "fas fa-book"
    description: "Specifiche ufficiali, mappa dei pin, guida alla configurazione e risoluzione dei problemi."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/"
  - title: "Multiplexing dei pin per XIAO ESP32-S3 (Sense)"
    icon: "fas fa-microchip"
    description: "Guida ufficiale all'utilizzo di GPIO, ADC, I2C, SPI, UART e pin touch."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/"
  - title: "Pagina prodotto Seeed Studio"
    icon: "fas fa-store"
    description: "Pagina dello store ufficiale del produttore per XIAO ESP32S3 Sense."
    url: "https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link"
related:
  - arduino-nano-esp32
  - esp32-devkit
  - raspberry-pi-pico-w
---
Seeed Studio XIAO ESP32S3 Sense è una scheda ESP32-S3 grande quanto un pollice, con una scheda di espansione rimovibile che integra una fotocamera, un microfono digitale e uno slot microSD. È cercata anche come **XIAO ESP32-S3 Sense** o **Seeed XIAO ESP32S3 Sense**. Prima dell'acquisto, verifica che l'inserzione riguardi la versione **Sense**: il normale XIAO ESP32S3 è quasi identico, ma non include fotocamera, microfono o slot SD.

Prima di collegare qualsiasi componente, è importante capire quali sono i **pin condivisi**: microfono, scheda SD e LED utente riutilizzano GPIO disponibili anche sul connettore. Le tabelle qui sotto mostrano esattamente quali.

## Foto del prodotto

<div class="product-image-gallery" style="display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:1rem;margin:1.5rem 0;">
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-front.webp" alt="Vista frontale della scheda fotocamera Seeed Studio XIAO ESP32S3 Sense" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Vista frontale: XIAO ESP32S3 Sense con modulo fotocamera</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-camera-assembly.webp" alt="Seeed Studio XIAO ESP32S3 Sense con scheda di espansione della fotocamera assemblata" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Assemblaggio della fotocamera e della scheda di espansione</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-back.webp" alt="Lato posteriore di Seeed Studio XIAO ESP32S3 Sense con etichette dei pin e piazzole" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Vista posteriore: etichette dei pin e piazzole di saldatura</figcaption>
  </figure>
</div>

## Vale la pena acquistare XIAO ESP32S3 Sense?

Scegli questa scheda se vuoi una fotocamera, un microfono o la registrazione su SD in una scheda grande quanto un pollice: una piccola videocamera Wi-Fi, un progetto audio o vocale, un dispositivo indossabile o un logger alimentato a batteria. Se ti serve soltanto un piccolo ESP32-S3 senza questi extra, il normale XIAO ESP32S3 ha la stessa disposizione dei pin e una corrente in deep sleep molto più bassa. Se ti servono più GPIO e 16 MB di Flash, valuta XIAO ESP32-S3 Plus.

## XIAO ESP32S3, Sense o Plus: quale versione acquistare?

| Caratteristica | XIAO ESP32S3 | XIAO ESP32S3 Sense | XIAO ESP32-S3 Plus |
|---|---|---|---|
| Fotocamera e microfono | No | Sì (scheda di espansione) | No |
| Slot microSD | No | Sì (scheda di espansione) | No |
| Flash / PSRAM | 8 MB / 8 MB | 8 MB / 8 MB | 16 MB / 8 MB |
| GPIO con PWM | 11 | 11 | 18 |
| Corrente in deep sleep (dato Seeed) | 14 µA | 3 mA con scheda di espansione | 33,5 µA |
| Ideale per | Progetti compatti a basso consumo | Visione, audio e registrazione dati | Più pin e Flash |

I prezzi cambiano in base al venditore, alla destinazione, alla spedizione e alla variante selezionata. Prima del pagamento, controlla l'inserzione aggiornata, gli accessori inclusi e il modello della fotocamera.

<div class="en-product-cta__buttons">
  <a class="en-buy-button" href="/go/hardware/seeed-xiao-esp32s3-sense/" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-cart-shopping"></i></span><span class="en-buy-text"><strong>Verifica il prezzo — XIAO ESP32S3 Sense</strong><small>AliExpress · verifica la versione della fotocamera e i pin header</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.amazon.com/Seeed-Studio-XIAO-ESP32-Sense/dp/B0C69FFVHH?tag=embeddednerd2-20" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fab fa-amazon"></i></span><span class="en-buy-text"><strong>Verifica il prezzo — Amazon</strong><small>Verifica la versione Sense e gli accessori inclusi</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-store"></i></span><span class="en-buy-text"><strong>Acquista — Seeed Studio (pin pre-saldati)</strong><small>Store ufficiale · versione con pin pre-saldati</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
</div>

## Specifiche in breve

| Specifica | Dettagli |
|---|---|
| MCU | ESP32-S3R8, dual-core Xtensa LX7, fino a 240 MHz |
| Flash | 8 MB |
| PSRAM | 8 MB |
| Wireless | Wi-Fi 2,4 GHz, Bluetooth LE 5.0 / Bluetooth Mesh |
| Fotocamera | OV5640 rimovibile con autofocus (2592 × 1944); alcune schede sono fornite con OV3660 (2048 × 1536); le prime versioni utilizzavano OV2640 (1600 × 1200) |
| Microfono | Microfono digitale (PDM) |
| Memoria | Slot microSD sulla scheda di espansione, supporto FAT fino a 32 GB |
| Interfacce | 1 × UART, 1 × I²C, 1 × I²S, 1 × SPI, 11 × GPIO con PWM, 9 × ADC |
| Pulsanti e LED | Reset, Boot, LED utente, LED di ricarica |
| Alimentazione | USB Type-C 5 V oppure batteria Li-ion da 3,7 V |
| Antenna | Connettore U.FL; antenna esterna inclusa nella confezione |
| Dimensioni | 21 × 17,8 mm; 21 × 17,8 × 15 mm con scheda di espansione |
| Temperatura di esercizio | −20 °C a 65 °C |

Le specifiche seguono la Wiki Seeed Studio (verificata il 7 novembre 2026). Seeed indica che la fotocamera sta passando dal modello OV3660 all'OV5640 con autofocus e che, durante la transizione, le schede possono essere fornite con uno dei due modelli.

## Fotocamera, microfono e microSD

La scheda di espansione si collega tramite un connettore board-to-board e ospita la fotocamera, il microfono PDM e lo slot microSD. Gli esempi di Seeed per la fotocamera supportano OV5640, OV3660 e OV2640: gli stessi sketch funzionano con tutti e tre i modelli, ma soltanto OV5640 dispone di autofocus. Il modulo OV5640 è venduto anche separatamente come ricambio.

Seeed dichiara che, da giugno 2025, il firmware di fabbrica abilita un access point Wi-Fi predefinito con nome e password pubblicati. Prima di installare la scheda in un luogo accessibile ad altre persone, carica un firmware personalizzato.

## Pinout XIAO ESP32S3 Sense: da D0–D12 a GPIO

| Pin XIAO | GPIO | Funzioni | Nota |
|---|---:|---|---|
| D0 | GPIO1 | ADC, touch | I/O generale |
| D1 | GPIO2 | ADC, touch | I/O generale |
| D2 | GPIO3 | ADC, touch | Pin di strapping (sorgente JTAG) |
| D3 | GPIO4 | ADC, touch | I/O generale |
| D4 / SDA | GPIO5 | Dati I²C, ADC, touch | I²C predefinito. Consulta [Ricerca indirizzi I²C](/tools/i2c-address-lookup/) e [Tutorial I²C Scanner](/i2c-scanner-tutorial/). |
| D5 / SCL | GPIO6 | Clock I²C, ADC, touch | I²C predefinito |
| D6 / TX | GPIO43 | UART TX | Uscita seriale |
| D7 / RX | GPIO44 | UART RX | Ingresso seriale |
| D8 / SCK | GPIO7 | Clock SPI, ADC, touch | Condiviso con il clock della scheda SD |
| D9 / MISO | GPIO8 | SPI MISO, ADC, touch | Condiviso con l'ingresso dati della scheda SD |
| D10 / MOSI | GPIO9 | SPI MOSI, ADC, touch | Condiviso con l'uscita dati della scheda SD |
| D11 | GPIO42 | Touch | Condiviso con il clock del microfono |
| D12 | GPIO41 | Touch | Condiviso con i dati del microfono |

Seeed specifica che, anche se D11 e D12 (GPIO42 e GPIO41) sono contrassegnati come pin analogici, ESP32-S3 non supporta l'ADC su questi pin. Per le letture analogiche, usa D0–D5 e D8–D10.

Pin di alimentazione: **5V** è la linea USB a 5 V, **3V3** è l'uscita regolata a 3,3 V e **GND** è la massa. Tutti i GPIO utilizzano logica a 3,3 V e non devono ricevere 5 V. Quando la scheda è alimentata a batteria, sul pin 5V non è presente tensione.

## Disponibilità dei GPIO: pin utilizzati da fotocamera, microfono e scheda SD

Secondo la mappa dei pin di Seeed, fotocamera, microfono e scheda SD non si sovrappongono tra loro, ma alcune funzioni condividono i GPIO con i pin del connettore.

| Funzione | GPIO | Condiviso con |
|---|---|---|
| Clock microfono (PDM) | GPIO42 | Pin D11 del connettore |
| Dati microfono (PDM) | GPIO41 | Pin D12 del connettore |
| Chip select scheda SD | GPIO21 | LED utente |
| Clock / MISO / MOSI scheda SD | GPIO7 / GPIO8 / GPIO9 | Pin SPI D8 / D9 / D10 |
| Dati / clock I²C fotocamera | GPIO40 / GPIO39 | Pin JTAG MTDO / MTCK |
| Dati, clock e sincronizzazione fotocamera | GPIO10–18, 38, 47, 48 | Solo connettore board-to-board |

Se utilizzi la scheda SD, il LED utente su GPIO21 è anche la linea chip-select della scheda. Qualsiasi dispositivo SPI aggiuntivo collegato a D8–D10 condivide il bus con la scheda SD e richiede un proprio pin chip-select. Se utilizzi il microfono, considera D11 e D12 già occupati.

## Consumo energetico e utilizzo della batteria

Valori tipici pubblicati da Seeed per la versione Sense **con la scheda di espansione collegata**:

| Modalità | Corrente tipica |
|---|---|
| Wi-Fi attivo | 110 mA |
| Bluetooth LE attivo | 102 mA |
| Modem-sleep | 44 mA |
| Light-sleep | 5 mA |
| Deep sleep | 3 mA |
| Server web della fotocamera (USB) | circa 140 mA in media, 347 mA di picco |

La scheda può essere alimentata da una batteria Li-ion da 3,7 V e ricaricarla tramite USB-C. Seeed indica che la piazzola negativa della batteria è quella più vicina alla porta USB: verifica la polarità prima di saldare. Non è presente un GPIO dedicato alla lettura della tensione della batteria; per misurarla serve un partitore di tensione esterno collegato a un pin ADC.

## Arduino, MicroPython e primi passi

Seeed documenta Arduino e MicroPython per la serie XIAO ESP32-S3, oltre alle guide per ESP-IDF e Zephyr. Nell'IDE Arduino, seleziona la scheda **XIAO_ESP32S3** e utilizza il pacchetto schede ESP32 versione 2.0.8 o successiva.

Esempio per il LED integrato e un ingresso analogico:

```cpp
const int ledPin = LED_BUILTIN; // GPIO21 on the XIAO ESP32S3
const int analogPin = A0;       // D0 = GPIO1 (ADC)

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // The user LED is active-low: LOW turns it on.
  digitalWrite(ledPin, LOW);
  delay(500);
  digitalWrite(ledPin, HIGH);
  delay(500);

  Serial.print("A0 = ");
  Serial.println(analogRead(analogPin));
}
```

Apri il Monitor seriale a **115200 baud**. Poiché GPIO21 è anche il chip-select della scheda SD, non commutare il LED mentre la scheda SD è in uso. Se la porta scompare o il caricamento non riesce, tieni premuto il pulsante **Boot** mentre colleghi il cavo USB per entrare in modalità bootloader.

- [Guida introduttiva Seeed Studio](https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/)
- [Guida Seeed Studio al multiplexing dei pin](https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/)

## Dove acquistare

Verifica che l'inserzione indichi la versione **Sense**, quale fotocamera è inclusa, il venditore e il Paese di consegna. Per impostazione predefinita, Seeed spedisce la scheda senza pin header: cerca una versione con pin pre-saldati oppure prevedi di saldare i tuoi connettori. Le offerte variano in base alla regione e questa pagina non indica un prezzo fisso.

In qualità di affiliato, Embedded Nerd può ricevere una commissione sugli acquisti idonei, senza costi aggiuntivi per te.

- [Seeed Studio XIAO ESP32S3 Sense (pin pre-saldati) — store ufficiale](https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32S3-Sense-Pre-Soldered-p-6335.html?sensecap_affiliate=3jSyuVk&referring_service=link)

## Domande frequenti

### XIAO ESP32S3 Sense è uguale a XIAO ESP32S3?

No. Condividono la stessa scheda principale e la stessa disposizione dei pin, ma Sense aggiunge una scheda di espansione rimovibile con fotocamera, microfono digitale e slot microSD. Il normale XIAO ESP32S3 non include questi componenti e consuma meno in deep sleep.

### Quale fotocamera utilizza XIAO ESP32S3 Sense?

Le schede attuali utilizzano una fotocamera OV5640 rimovibile con autofocus; durante la transizione delle forniture alcune unità possono essere dotate di OV3660. Le schede precedenti utilizzavano OV2640, ormai fuori produzione. Gli esempi Seeed supportano tutti e tre i modelli.

### XIAO ESP32S3 Sense è compatibile con 5 V?

No. I pin GPIO utilizzano logica a 3,3 V e non devono ricevere 5 V. Usa un convertitore di livello logico per sensori o moduli a 5 V.

### Posso utilizzare contemporaneamente fotocamera, microfono e scheda SD?

Secondo la mappa dei pin di Seeed, queste funzioni non si sovrappongono tra loro e possono quindi essere utilizzate insieme. Il microfono utilizza i pin D11 e D12, la scheda SD condivide i pin SPI D8–D10 e il suo chip select coincide con il GPIO del LED utente.

### XIAO ESP32S3 Sense può ricaricare una batteria?

Sì. Integra la gestione della ricarica della batteria Li-ion e le relative piazzole di collegamento. Quando la scheda è alimentata a batteria, sul pin 5V non è presente tensione e non esiste un pin dedicato alla lettura della tensione della batteria.

### La scheda include i pin header?

Per impostazione predefinita, Seeed fornisce la scheda senza pin header. Verifica se l'inserzione indica una versione con pin pre-saldati oppure salda i tuoi connettori.

### XIAO ESP32S3 Sense funziona con MicroPython?

Sì. Seeed documenta Arduino e MicroPython per la serie XIAO ESP32-S3. L'ambiente di programmazione non modifica i limiti elettrici di 3,3 V né la mappatura dei pin descritta sopra.

## Confronto con altre schede ESP32

| Scheda | Ideale per |
|---|---|
| Seeed Studio XIAO ESP32S3 Sense | Piccoli progetti con fotocamera, audio e registrazione dati |
| [Arduino Nano ESP32](/products/arduino-nano-esp32/) | Formato Nano con ESP32-S3 e denominazioni dei pin Arduino |
| [ESP32 DevKit V1](/products/esp32-devkit/) | Prototipazione generica a basso costo |
| [Raspberry Pi Pico W](/products/raspberry-pi-pico-w/) | RP2040 con Wi-Fi e supporto a MicroPython |

Non sai quale scheda sia adatta al tuo progetto? Leggi la guida alle [migliori schede ESP32](/best-esp32-boards/) oppure visita la categoria [Schede di sviluppo](/products/development-boards/).
