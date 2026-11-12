---
title: "Guition ESP32-S3-4848S040: pinout, GPIO e configurazione ESPHome"
title_tag: "Guition 4848S040: pinout e configurazione ESPHome"
seo_title: "Guition ESP32-S3-4848S040: pinout, GPIO ed ESPHome"
seo_description: "Pinout Guition ESP32-S3-4848S040: GPIO RGB, inizializzazione ST7701S, touch GT911, retroilluminazione e configurazione ESPHome."
layout: single
lang: it
locale: it-IT
page_id: article-guition-esp32-s3-4848s040-pinout-esphome
translation_id: guition-esp32-s3-4848s040-pinout-esphome
available_languages: [en, de, es, fr, it]
english_url: /guition-esp32-s3-4848s040-pinout-esphome/
german_url: /de/guition-esp32-s3-4848s040-pinout-esphome/
spanish_url: /es/guition-esp32-s3-4848s040-pinout-esphome/
french_url: /fr/guition-esp32-s3-4848s040-pinout-esphome/
italian_url: /it/guition-esp32-s3-4848s040-pinout-esphome/
internal_links: true
permalink: /guition-esp32-s3-4848s040-pinout-esphome/
id: "https://embeddednerd.com/it/guition-esp32-s3-4848s040-pinout-esphome/"
hide_post_pagination: true
sidebar:
  nav: "embedded"
  related: true
  share: true
excerpt: "Pinout e assegnazione GPIO del Guition ESP32-S3-4848S040, segnali display RGB, inizializzazione ST7701S, touch GT911 e note per la configurazione ESPHome."
show_date: false
last_modified_at: 2026-11-11
author: "Embedded Nerd"
read_time: false
toc: true
toc_label: "Indice"
toc_sticky: true
header:
  teaser: /assets/images/guition-esp32-s3-4848s040-back.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image_alt: "Vista posteriore della scheda touchscreen Guition ESP32-S3-4848S040"
categories: [Displays, ESP32]
tags: [esp32-s3, guition, touchscreen, esphome, pinout]
related: true
related_posts:
  - /it/products/guition-esp32-s3-4848s040/
  - /esp32-touchscreen-displays-guide/
share: true
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
        { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://embeddednerd.com/" },
        { "@type": "ListItem", "position": 2, "name": {{ page.title | jsonify }}, "item": {{ page.url | absolute_url | jsonify }} }
      ]
    }
  ]
}
</script>

{% include guition-purchase-box.html %}

Per le specifiche complete, la valutazione editoriale, le varianti disponibili e le opzioni di acquisto, consulta la [pagina prodotto del Guition ESP32-S3-4848S040](/it/products/guition-esp32-s3-4848s040/).

Questa guida si concentra sul pinout del 4848S040, sulle interfacce display e touch, sulle considerazioni relative all'hardware del relè e sull'utilizzo di una configurazione ESPHome esistente come punto di partenza.

![Vista posteriore della scheda Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-back.webp)

> **Importante:** la piedinatura e i GPIO disponibili possono variare in base alla revisione della scheda. Usa le tabelle come riferimento e confrontale con la documentazione della tua scheda esatta prima di collegare hardware esterno.

## Panoramica dell'hardware

Questa famiglia di schede combina un ESP32-S3, un display RGB da 480 × 480 basato su ST7701S e touch capacitivo GT911. Memoria, hardware del relè e opzioni del contenitore devono essere verificati in base alla revisione esatta e all'inserzione del venditore. Consulta la [pagina prodotto per specifiche complete e opzioni di acquisto](/it/products/guition-esp32-s3-4848s040/).

## Pinout Guition ESP32-S3-4848S040

Le assegnazioni seguenti sono riportate nel profilo ESPHome Devices. Controlla la revisione della tua scheda prima di utilizzarle per i collegamenti hardware.

### Pin del display RGB

| Segnale display | GPIO |
|---|---:|
| Dati rosso | 11, 12, 13, 14, 0 |
| Dati verde | 8, 20, 3, 46, 9, 10 |
| Dati blu | 4, 5, 6, 7, 15 |
| Display enable (DE) | 18 |
| Sincronizzazione orizzontale (HSYNC) | 16 |
| Sincronizzazione verticale (VSYNC) | 17 |
| Clock pixel (PCLK) | 21 |

### Inizializzazione display ST7701S

| Segnale | GPIO |
|---|---:|
| CS | 39 |
| CLK | 48 |
| DATA | 47 |

Questi segnali servono per inizializzare il display. Sono separati dai dati pixel RGB e dai segnali di temporizzazione.

### Controller touch GT911 e retroilluminazione

| Funzione | GPIO |
|---|---:|
| Touch I²C SDA | 19 |
| Touch I²C SCL | 45 |
| Retroilluminazione PWM | 38 |

Il GT911 comunica tramite I²C. Nel profilo di riferimento, GPIO38 è indicato per il controllo PWM della retroilluminazione.

![Dimostrazione dello schermo Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-screen-demo.webp)

*Dimostrazione dello schermo Guition ESP32-S3-4848S040.*

### Riepilogo rapido dei GPIO

Il profilo assegna **26 GPIO distinti** al display, alla sua inizializzazione, al controller touch e alla retroilluminazione:

`GPIO0, GPIO3, GPIO4, GPIO5, GPIO6, GPIO7, GPIO8, GPIO9, GPIO10, GPIO11, GPIO12, GPIO13, GPIO14, GPIO15, GPIO16, GPIO17, GPIO18, GPIO19, GPIO20, GPIO21, GPIO38, GPIO39, GPIO45, GPIO46, GPIO47, GPIO48`

Questo elenco descrive le assegnazioni della configurazione di riferimento. **Non dimostra** che tutti gli altri GPIO siano disponibili per uso esterno. Altri pin potrebbero essere riservati a Flash o PSRAM, a componenti integrati o a funzioni specifiche della scheda.

## Quali GPIO sono liberi?

Non presumere che un GPIO sia disponibile solo perché non compare nelle tabelle precedenti. Prima di usare un pin per un sensore, un relè, un pulsante o un'altra periferica:

1. Consulta schema elettrico e documentazione della revisione esatta della scheda.
2. Verifica quali GPIO sono fisicamente esposti.
3. Controlla se il pin è riservato a Flash, PSRAM, USB, configurazione di avvio o altri componenti integrati.
4. Confronta l'assegnazione prevista con la configurazione ESPHome che intendi utilizzare.

Il profilo della scheda è un utile punto di partenza, ma non sostituisce lo schema elettrico della tua specifica revisione hardware.

## Versioni con e senza relè

Il 4848S040 è venduto in varianti che possono includere un modulo relè e diverse soluzioni di montaggio. Se stai scegliendo tra le versioni, consulta la [pagina prodotto per i dettagli sulle varianti e i consigli per l'acquisto](/it/products/guition-esp32-s3-4848s040/).

- **Versione senza relè:** controlla la documentazione della scheda esatta per identificare connessioni esposte e periferiche supportate.
- **Versione con relè:** non presumere l'assegnazione GPIO o i valori elettrici nominali del relè. Verificali nello schema o nella documentazione della variante prima di collegare un carico.
- **Montaggio a parete:** la versione con relè potrebbe non entrare in una scatola europea rotonda da incasso da 60 mm. Verifica dimensioni e sistema di montaggio prima dell'acquisto o dell'installazione.

Non collegare mai un carico alla tensione di rete basandoti soltanto su un pinout generico. Verifica valori nominali del relè, isolamento, contenitore e requisiti di cablaggio del prodotto esatto.

## Primi passi con ESPHome

Una configurazione ESPHome esistente può facilitare l'avvio, ma va esaminata prima del flashing. Queste risorse community sono punti di partenza utili:

- [ESPHome Devices: Guition ESP32-S3-4848S040](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [Configurazione ESPHome community](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

La procedura seguente riduce il rischio di utilizzare una configurazione destinata a una revisione diversa:

1. Apri la configurazione e leggi i file YAML e tutti i pacchetti richiamati.
2. Controlla che le assegnazioni GPIO di display, touch e retroilluminazione corrispondano alla tua scheda.
3. Sostituisci nomi dispositivo di esempio, credenziali Wi-Fi e secrets con i tuoi valori.
4. Esamina eventuali componenti aggiuntivi o pacchetti esterni utilizzati.
5. Valida la configurazione in ESPHome prima del flashing.
6. Segui la procedura documentata per il primo flashing della tua scheda e revisione.

Questa guida non afferma che la configurazione community sia stata testata su tutte le revisioni. Se la scheda non si avvia o il display resta nero, ricontrolla la configurazione e confronta il pinout con la documentazione hardware prima di modificare i collegamenti.

![Dashboard sul touchscreen Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-dashboard.webp)

*Esempio di dashboard visualizzata sul touchscreen.*

## Domanda frequente

### Posso utilizzare ESPHome con questo display?

Il profilo ESPHome Devices e la configurazione community collegati forniscono un punto di partenza. Esamina i file YAML, verifica le assegnazioni GPIO per la revisione della tua scheda e valida la configurazione prima del flashing.

## Passi successivi

Stai scegliendo una scheda? Visita la [pagina prodotto Guition ESP32-S3-4848S040](/it/products/guition-esp32-s3-4848s040/) per specifiche complete, valutazione editoriale, dettagli sulle varianti e opzioni di acquisto aggiornate.

## Risorse correlate

- [Display ESP32-S3 Guition JC8048W550 da 5 pollici](/products/guition-jc8048w550/) — un'alternativa più grande in formato orizzontale, con risoluzione 800×480.
- [Pagina prodotto Guition ESP32-S3-4848S040](/it/products/guition-esp32-s3-4848s040/)
- [Selettore touchscreen ESP32](/tools/esp32-touchscreen-selector/)
- [Guida ai display touchscreen ESP32](/esp32-touchscreen-displays-guide/)
- [Profilo ESPHome Devices](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [Configurazione ESPHome community](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

## Informazioni sull'autore

**Embedded Nerd** pubblica guide pratiche su schede ESP32, hardware embedded, display, sensori e strumenti di sviluppo. Questa guida si basa su riferimenti hardware pubblicati e risorse community. La scheda non è stata testata autonomamente per questo articolo.
