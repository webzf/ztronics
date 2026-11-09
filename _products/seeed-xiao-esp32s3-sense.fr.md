---
layout: product
lang: fr
locale: fr-FR
toc_label: Sommaire
page_id: product-seeed-xiao-esp32s3-sense
available_languages: [en, de, es, fr]
english_url: /products/seeed-xiao-esp32s3-sense/
german_url: /de/products/seeed-xiao-esp32s3-sense/
spanish_url: /es/products/seeed-xiao-esp32s3-sense/
french_url: /fr/products/seeed-xiao-esp32s3-sense/
internal_links: true
title: "Seeed Studio XIAO ESP32S3 Sense : caméra, microphone et microSD sur 21 × 17,8 mm"
product_verdict: "Une carte ESP32-S3 très compacte pour les projets de caméra, d’audio et d’enregistrement de données. Tenez compte des GPIO partagés et de la consommation plus élevée en veille profonde lorsque la carte d’extension est connectée."
editorial_review:
  rating: 8.5
  best_rating: 10
  worst_rating: 1
  author: "Embedded Nerd"
  summary: "Le Seeed Studio XIAO ESP32S3 Sense associe un ESP32-S3 avec 8 Mo de PSRAM et 8 Mo de Flash, une carte d’extension caméra amovible, un microphone numérique et un lecteur microSD dans un module de 21 × 17,8 mm avec circuit de charge pour batterie. Ses principales limites sont le partage de certains GPIO, une consommation en veille profonde plus élevée avec la carte d’extension et les variations possibles de caméra selon les lots."
  methodology: "Cette évaluation éditoriale repose sur les caractéristiques publiées et la documentation du fabricant. Embedded Nerd n’a pas testé physiquement la carte ni l’annonce commerciale décrite ici."
  pros:
    - "Caméra, microphone numérique et lecteur microSD sur une carte de la taille d’un pouce"
    - "ESP32-S3 avec 8 Mo de PSRAM et 8 Mo de Flash pour le traitement d’image et les petites démonstrations ML"
    - "Circuit de charge Li-ion intégré et connecteur d’antenne U.FL"
    - "Documentation officielle détaillée, brochages et exemples de Seeed Studio"
  cons:
    - "Le microphone, la carte SD et la LED utilisateur partagent des GPIO avec les broches du connecteur ; vérifiez les broches disponibles avant le câblage"
    - "La consommation en veille profonde atteint environ 3 mA avec la carte d’extension connectée, bien plus que le XIAO ESP32S3 standard"
    - "La carte est généralement livrée sans barrettes de broches ; le module caméra (OV5640 ou OV3660) peut varier selon le lot"
seo_title: "XIAO ESP32S3 Sense : caractéristiques, brochage et où l’acheter"
seo_description: "Caractéristiques et brochage du Seeed Studio XIAO ESP32S3 Sense : D0–D12 vers GPIO, caméra OV5640, microphone, microSD, consommation et achat."
product_id: seeed-xiao-esp32s3-sense
category: Development Boards
manufacturer: "Seeed Studio"
image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
header:
  teaser: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image_alt: "Vue avant du Seeed Studio XIAO ESP32S3 Sense avec module caméra"
alt: "Seeed Studio XIAO ESP32S3 Sense, vue avant avec module caméra"
excerpt: "Seeed Studio XIAO ESP32S3 Sense avec ESP32-S3, caméra OV5640, microphone numérique, lecteur microSD, 8 Mo de PSRAM et 8 Mo de Flash sur 21 × 17,8 mm."
description: "Le Seeed Studio XIAO ESP32S3 Sense est une carte de développement ESP32-S3 de la taille d’un pouce, avec 8 Mo de PSRAM, 8 Mo de Flash, Wi-Fi, Bluetooth LE et circuit de charge. Sa carte d’extension amovible ajoute une caméra, un microphone numérique et un lecteur microSD. Plusieurs GPIO sont partagés entre le connecteur, le microphone, la carte SD et la LED utilisateur : consultez les tableaux de brochage avant tout branchement."
categories: [ESP32, ESP32-S3, "Development Boards", "Camera Boards"]
tags: ["XIAO ESP32S3 Sense", "Seeed Studio XIAO", ESP32, ESP32-S3, "ESP32 Camera", OV5640, "PDM Microphone", microSD, Wi-Fi, "Bluetooth LE", MicroPython]
permalink: /products/seeed-xiao-esp32s3-sense/
specifications:
  - name: Processeur
    value: "ESP32-S3R8, double cœur Xtensa LX7, jusqu’à 240 MHz"
  - name: Flash
    value: "8 Mo"
  - name: PSRAM
    value: "8 Mo"
  - name: Caméra
    value: "OV5640 amovible avec autofocus (OV3660 sur certaines cartes)"
  - name: Microphone
    value: "Microphone numérique PDM"
  - name: Stockage
    value: "Lecteur microSD sur la carte d’extension, FAT jusqu’à 32 Go"
  - name: Connectivité sans fil
    value: "Wi-Fi 2,4 GHz et Bluetooth LE 5.0 / Bluetooth Mesh"
  - name: USB
    value: "USB Type-C"
  - name: Batterie
    value: "Batterie Li-ion 3,7 V avec circuit de charge intégré"
  - name: Dimensions
    value: "21 × 17,8 mm ; avec carte d’extension 21 × 17,8 × 15 mm"
  - name: Température de fonctionnement
    value: "−20 °C à 65 °C"
links:
  - title: "Seeed Studio XIAO ESP32-S3 — guide de démarrage"
    icon: "fas fa-book"
    description: "Caractéristiques officielles, brochage, configuration et dépannage."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/"
  - title: "Multiplexage des broches du XIAO ESP32-S3 (Sense)"
    icon: "fas fa-microchip"
    description: "Informations officielles sur GPIO, ADC, I²C, SPI, UART et broches tactiles."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/"
  - title: "Page produit Seeed Studio"
    icon: "fas fa-store"
    description: "Page officielle du XIAO ESP32S3 Sense."
    url: "https://www.seeedstudio.com/XIAO-ESP32S3-Sense-p-5639.html"
related: [arduino-nano-esp32, esp32-devkit, raspberry-pi-pico-w]
---
Le **Seeed Studio XIAO ESP32S3 Sense** est une carte ESP32-S3 de la taille d’un pouce, accompagnée d’une carte d’extension amovible qui accueille une caméra, un microphone numérique et un lecteur microSD. Ce modèle est également recherché sous les noms **XIAO ESP32-S3 Sense** et **Seeed XIAO ESP32S3 Sense**. Lors de l’achat, vérifiez qu’il s’agit bien de la version **Sense** : le XIAO ESP32S3 standard lui ressemble, mais ne possède ni caméra, ni microphone, ni lecteur SD.

Avant de connecter des périphériques externes, faites attention aux **broches partagées** : le microphone, la carte SD et la LED utilisateur utilisent certains GPIO également présents sur le connecteur. Les tableaux ci-dessous détaillent ces affectations.

## Galerie du produit

<div class="product-image-gallery" style="display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:1rem;margin:1.5rem 0;">
  <figure><img src="/assets/images/products/seeed-xiao-esp32s3-sense-front.webp" alt="Vue avant du Seeed Studio XIAO ESP32S3 Sense avec carte caméra" loading="lazy" style="width:100%;height:auto;"><figcaption>Vue avant : XIAO ESP32S3 Sense avec module caméra</figcaption></figure>
  <figure><img src="/assets/images/products/seeed-xiao-esp32s3-sense-camera-assembly.webp" alt="Seeed Studio XIAO ESP32S3 Sense avec carte caméra montée" loading="lazy" style="width:100%;height:auto;"><figcaption>Caméra et carte d’extension assemblées</figcaption></figure>
  <figure><img src="/assets/images/products/seeed-xiao-esp32s3-sense-back.webp" alt="Vue arrière du Seeed Studio XIAO ESP32S3 Sense avec marquages des broches" loading="lazy" style="width:100%;height:auto;"><figcaption>Vue arrière : marquages des broches et pastilles de soudure</figcaption></figure>
</div>

## Le XIAO ESP32S3 Sense vaut-il l’achat ?

Cette carte convient si vous avez besoin d’une caméra, d’un microphone ou d’un stockage SD sur un module minuscule : petite caméra Wi-Fi, projet audio ou vocal, objet connecté portable ou enregistreur de données sur batterie. Si vous avez seulement besoin d’un ESP32-S3 compact, le XIAO ESP32S3 standard est intéressant : il reprend le même brochage de connecteur et consomme beaucoup moins en veille profonde. Pour davantage de GPIO et 16 Mo de Flash, regardez le XIAO ESP32-S3 Plus.

## XIAO ESP32S3, Sense ou Plus : quelle version choisir ?

| Caractéristique | XIAO ESP32S3 | XIAO ESP32S3 Sense | XIAO ESP32-S3 Plus |
|---|---|---|---|
| Caméra et microphone | Non | Oui (carte d’extension) | Non |
| Lecteur microSD | Non | Oui (carte d’extension) | Non |
| Flash / PSRAM | 8 Mo / 8 Mo | 8 Mo / 8 Mo | 16 Mo / 8 Mo |
| GPIO avec PWM | 11 | 11 | 18 |
| Courant en veille profonde (donnée Seeed) | 14 µA | 3 mA avec carte d’extension | 33,5 µA |
| Usage conseillé | Petits projets basse consommation | Image, audio et journalisation | Plus de broches et de Flash |

Les prix varient selon le vendeur, le pays de livraison, les frais d’expédition et la variante choisie. Vérifiez l’offre actuelle, les accessoires et le modèle de caméra inclus.

<div class="en-product-cta__buttons">
  <a class="en-buy-button" href="/go/hardware/seeed-xiao-esp32s3-sense/" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-cart-shopping"></i></span><span class="en-buy-text"><strong>Voir le prix — XIAO ESP32S3 Sense</strong><small>AliExpress · Vérifiez la version caméra et les barrettes</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.amazon.com/Seeed-Studio-XIAO-ESP32-Sense/dp/B0C69FFVHH?tag=embeddednerd2-20" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fab fa-amazon"></i></span><span class="en-buy-text"><strong>Voir le prix — Amazon</strong><small>Vérifiez la version Sense et le contenu du colis</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
</div>

## Caractéristiques techniques

| Spécification | Détails |
|---|---|
| Microcontrôleur | ESP32-S3R8, double cœur Xtensa LX7, jusqu’à 240 MHz |
| Flash | 8 Mo |
| PSRAM | 8 Mo |
| Sans fil | Wi-Fi 2,4 GHz, Bluetooth LE 5.0 / Bluetooth Mesh |
| Caméra | OV5640 amovible avec autofocus (2592 × 1944) ; certaines cartes ont une OV3660 (2048 × 1536) ; les anciennes utilisaient une OV2640 (1600 × 1200) |
| Microphone | Microphone numérique PDM |
| Stockage | Lecteur microSD sur la carte d’extension, FAT jusqu’à 32 Go |
| Interfaces | 1 × UART, 1 × I²C, 1 × I²S, 1 × SPI, 11 × GPIO avec PWM, 9 × ADC |
| Boutons et LED | Reset, Boot, LED utilisateur, LED de charge |
| Alimentation | 5 V via USB Type-C ou batterie Li-ion 3,7 V |
| Antenne | Connecteur U.FL ; antenne externe fournie |
| Dimensions | 21 × 17,8 mm ; avec carte d’extension 21 × 17,8 × 15 mm |
| Température de fonctionnement | −20 °C à 65 °C |

Ces caractéristiques reposent sur le wiki Seeed Studio (au 7 novembre 2026). Seeed remplace actuellement la caméra OV3660 par une OV5640 avec autofocus. Pendant cette transition, les cartes livrées peuvent contenir l’une ou l’autre.

## Caméra, microphone et microSD

La carte d’extension se connecte via un connecteur carte-à-carte et intègre la caméra, le microphone PDM et le lecteur microSD. Les exemples caméra de Seeed prennent en charge les OV5640, OV3660 et OV2640. Les mêmes programmes peuvent donc être utilisés ; seule l’OV5640 dispose de l’autofocus. Le module OV5640 est également disponible séparément comme pièce de rechange.

Selon Seeed, le firmware d’usine livré depuis juin 2025 active par défaut un point d’accès Wi-Fi avec un nom et un mot de passe publiés. Installez votre propre firmware avant toute utilisation dans un lieu accessible au public.

## Brochage du XIAO ESP32S3 Sense : D0–D12 vers GPIO

| Broche XIAO | GPIO | Fonctions | Remarque |
|---|---:|---|---|
| D0 | GPIO1 | ADC, tactile | Entrée/sortie générale |
| D1 | GPIO2 | ADC, tactile | Entrée/sortie générale |
| D2 | GPIO3 | ADC, tactile | Broche de strapping (source JTAG) |
| D3 | GPIO4 | ADC, tactile | Entrée/sortie générale |
| D4 / SDA | GPIO5 | Données I²C, ADC, tactile | I²C par défaut. Voir le [répertoire des adresses I²C](/tools/i2c-address-lookup/) et le [guide du scanner I²C](/i2c-scanner-tutorial/). |
| D5 / SCL | GPIO6 | Horloge I²C, ADC, tactile | I²C par défaut |
| D6 / TX | GPIO43 | UART TX | Sortie série |
| D7 / RX | GPIO44 | UART RX | Entrée série |
| D8 / SCK | GPIO7 | Horloge SPI, ADC, tactile | Également utilisé par l’horloge SD |
| D9 / MISO | GPIO8 | SPI MISO, ADC, tactile | Également utilisé pour les données SD |
| D10 / MOSI | GPIO9 | SPI MOSI, ADC, tactile | Également utilisé pour les données SD |
| D11 | GPIO42 | Tactile | Partagé avec l’horloge du microphone |
| D12 | GPIO41 | Tactile | Partagé avec les données du microphone |

Seeed précise que D11 et D12 (GPIO42 et GPIO41) sont étiquetés comme broches analogiques, mais que l’ESP32-S3 ne prend pas en charge la mesure ADC sur ces broches. Pour les mesures analogiques, utilisez D0–D5 et D8–D10.

Broches d’alimentation : **5V** correspond au rail USB 5 V, **3V3** à la sortie régulée 3,3 V et **GND** à la masse. Tous les GPIO fonctionnent en logique 3,3 V et ne sont pas tolérants au 5 V. En fonctionnement sur batterie, la broche 5V n’est pas alimentée.

## Disponibilité des GPIO : caméra, microphone et carte SD

Selon le brochage Seeed, la caméra, le microphone et la carte SD ne se chevauchent pas entre eux. Certaines de ces fonctions partagent toutefois des GPIO avec les broches du connecteur.

| Fonction | GPIO | Partagé avec |
|---|---|---|
| Horloge microphone (PDM) | GPIO42 | Broche D11 |
| Données microphone (PDM) | GPIO41 | Broche D12 |
| Chip-select de la carte SD | GPIO21 | LED utilisateur |
| Horloge / MISO / MOSI SD | GPIO7 / GPIO8 / GPIO9 | Broches SPI D8 / D9 / D10 |
| Données / horloge I²C caméra | GPIO40 / GPIO39 | Broches JTAG MTDO / MTCK |
| Données, horloge et synchronisation caméra | GPIO10–18, 38, 47, 48 | Connecteur carte-à-carte uniquement |

Lorsque vous utilisez la carte SD, la LED utilisateur sur GPIO21 sert également de ligne chip-select. Les autres périphériques SPI connectés à D8–D10 partagent le bus avec la carte SD et nécessitent leur propre broche chip-select. Lorsque le microphone est utilisé, D11 et D12 sont occupées.

## Consommation et alimentation par batterie

Valeurs typiques publiées par Seeed pour le Sense **avec la carte d’extension connectée** :

| Mode | Courant typique |
|---|---:|
| Wi-Fi actif | 110 mA |
| Bluetooth LE actif | 102 mA |
| Modem-sleep | 44 mA |
| Light-sleep | 5 mA |
| Deep sleep | 3 mA |
| Serveur caméra (USB) | environ 140 mA en moyenne, 347 mA en pointe |

La carte peut fonctionner avec une batterie Li-ion 3,7 V, rechargeable via USB-C. Selon Seeed, la pastille de soudure négative de la batterie est la plus proche du connecteur USB. Vérifiez soigneusement la polarité avant de souder. Il n’existe pas de GPIO dédié à la mesure de la tension de batterie : un diviseur de tension externe connecté à une broche ADC est nécessaire.

## Arduino, MicroPython et démarrage

Seeed documente Arduino et MicroPython pour la série XIAO ESP32-S3, ainsi que des guides pour ESP-IDF et Zephyr. Dans l’IDE Arduino, sélectionnez la carte **XIAO_ESP32S3** et utilisez le package de cartes ESP32 version 2.0.8 ou ultérieure.

Exemple pour la LED intégrée et une entrée analogique :

```cpp
const int ledPin = LED_BUILTIN; // GPIO21 sur le XIAO ESP32S3
const int analogPin = A0;       // D0 = GPIO1 (ADC)

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // La LED utilisateur est active à l'état BAS : LOW l'allume.
  digitalWrite(ledPin, LOW);
  delay(500);
  digitalWrite(ledPin, HIGH);
  delay(500);

  Serial.print("A0 = ");
  Serial.println(analogRead(analogPin));
}
```

Ouvrez le moniteur série à **115200 bauds**. GPIO21 sert aussi de chip-select à la carte SD : ne commandez pas la LED pendant que la carte SD est utilisée. Si le port disparaît ou si le téléversement échoue, maintenez le bouton **Boot** enfoncé pendant la connexion USB pour démarrer en mode bootloader.

- [Seeed Studio — guide de démarrage](https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/)
- [Seeed Studio — multiplexage des broches](https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/)

## Où acheter

Vérifiez que l’annonce indique explicitement la version **Sense**, le modèle de caméra, le vendeur et le pays de livraison. Seeed livre généralement la carte sans barrettes de broches. Choisissez une version déjà équipée ou prévoyez de souder vous-même les connecteurs. Les offres varient selon la région ; aucun prix fixe n’est affiché sur cette page.

En tant que site affilié, Embedded Nerd peut recevoir une commission sur les achats éligibles, sans frais supplémentaires pour vous.

- [Seeed Studio XIAO ESP32S3 Sense — boutique Seeed](https://www.seeedstudio.com/XIAO-ESP32S3-Sense-p-5639.html)

## Questions fréquentes

### Le XIAO ESP32S3 Sense est-il identique au XIAO ESP32S3 ?

Non. Les deux utilisent la même carte principale et le même brochage. Le modèle Sense comprend une carte d’extension amovible avec caméra, microphone numérique et lecteur microSD. Le XIAO ESP32S3 standard ne possède pas ces composants et consomme moins en veille profonde.

### Quelle caméra équipe le XIAO ESP32S3 Sense ?

Les cartes actuelles utilisent une caméra OV5640 amovible avec autofocus. Pendant la transition, certaines livraisons peuvent encore contenir l’OV3660. Les anciennes cartes utilisaient l’OV2640, désormais abandonnée. Les exemples Seeed prennent en charge les trois modèles.

### Les GPIO du XIAO ESP32S3 Sense tolèrent-ils le 5 V ?

Non. Les GPIO fonctionnent en logique 3,3 V et ne doivent pas recevoir 5 V. Utilisez un convertisseur de niveau pour les capteurs ou modules 5 V.

### La caméra, le microphone et la carte SD peuvent-ils fonctionner simultanément ?

Selon le brochage Seeed, ces fonctions ne se chevauchent pas entre elles et peuvent être utilisées ensemble. Le microphone occupe D11 et D12 ; la carte SD partage les broches SPI D8–D10 et son chip-select utilise le même GPIO que la LED utilisateur.

### Le XIAO ESP32S3 Sense peut-il recharger une batterie ?

Oui. La carte intègre un circuit de charge Li-ion et des connexions pour la batterie. En fonctionnement sur batterie, la broche 5V n’est pas alimentée. Il n’existe pas non plus de broche dédiée à la mesure de la tension de batterie.

### Les barrettes de broches sont-elles fournies ?

Seeed livre généralement la carte sans barrettes. Vérifiez si l’offre comprend une version déjà équipée ou soudez vos propres connecteurs.

### Le XIAO ESP32S3 Sense fonctionne-t-il avec MicroPython ?

Oui. Seeed documente Arduino et MicroPython pour la série XIAO ESP32-S3. L’environnement de développement ne change toutefois ni les limites électriques de 3,3 V ni le brochage présenté ci-dessus.

## Comparaison avec d’autres cartes ESP32

| Carte | Idéale pour |
|---|---|
| Seeed Studio XIAO ESP32S3 Sense | Projets très compacts de caméra, audio et enregistrement de données |
| [Arduino Nano ESP32](/products/arduino-nano-esp32/) | Format Nano avec ESP32-S3 et repérage Arduino |
| [ESP32 DevKit V1](/products/esp32-devkit/) | Prototypage généraliste économique |
| [Raspberry Pi Pico W](/products/raspberry-pi-pico-w/) | RP2040 avec Wi-Fi et prise en charge de MicroPython |

Vous hésitez sur la carte adaptée à votre projet ? Consultez notre guide [Les meilleures cartes ESP32](/best-esp32-boards/) ou la catégorie [Cartes de développement](/products/development-boards/).
