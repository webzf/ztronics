---
title: "Guition ESP32-S3-4848S040 : brochage, GPIO et ESPHome"
title_tag: "Guition 4848S040 : brochage et configuration ESPHome"
seo_title: "Guition ESP32-S3-4848S040 : brochage, GPIO et ESPHome"
seo_description: "Brochage du Guition ESP32-S3-4848S040 : GPIO RGB, initialisation ST7701S, tactile GT911, rétroéclairage et configuration ESPHome."
layout: single
lang: fr
page_id: article-guition-esp32-s3-4848s040-pinout-esphome
translation_id: guition-esp32-s3-4848s040-pinout-esphome
available_languages: [en, de, es, fr]
english_url: /guition-esp32-s3-4848s040-pinout-esphome/
german_url: /de/guition-esp32-s3-4848s040-pinout-esphome/
spanish_url: /es/guition-esp32-s3-4848s040-pinout-esphome/
french_url: /fr/guition-esp32-s3-4848s040-pinout-esphome/
internal_links: true
permalink: /guition-esp32-s3-4848s040-pinout-esphome/
id: "https://embeddednerd.com/fr/guition-esp32-s3-4848s040-pinout-esphome/"
hide_post_pagination: true
sidebar:
  nav: "embedded"
  related: true
  share: true
excerpt: "Brochage et GPIO du Guition ESP32-S3-4848S040 : écran RGB, ST7701S, tactile GT911 et configuration ESPHome."
show_date: false
last_modified_at: 2026-11-09
author: "Embedded Nerd"
read_time: false
toc: true
toc_label: "Sommaire"
toc_sticky: true
header:
  teaser: /assets/images/guition-esp32-s3-4848s040-back.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image: /assets/images/guition-esp32-s3-4848s040-back.webp
  og_image_alt: "Vue arrière de la carte tactile Guition ESP32-S3-4848S040"
categories: [Displays, ESP32]
tags: [esp32-s3, guition, touchscreen, esphome, pinout]
related: true
related_posts:
  - /fr/products/guition-esp32-s3-4848s040/
  - /esp32-touchscreen-displays-guide/
---
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "TechArticle",
  "@id": {{ page.url | absolute_url | append: "#article" | jsonify }},
  "headline": {{ page.title | jsonify }},
  "description": {{ page.seo_description | default: page.excerpt | strip_html | strip_newlines | jsonify }},
  "mainEntityOfPage": { "@type": "WebPage", "@id": {{ page.url | absolute_url | jsonify }} },
  "image": {{ page.header.og_image | default: page.header.image | absolute_url | jsonify }},
  "dateModified": {{ page.last_modified_at | date_to_xmlschema | jsonify }},
  "author": { "@type": "Organization", "name": "Embedded Nerd", "url": "https://embeddednerd.com/" },
  "publisher": { "@type": "Organization", "name": "Embedded Nerd", "url": "https://embeddednerd.com/" }
}
</script>

{% include guition-purchase-box.html %}

Pour les caractéristiques complètes, l’évaluation éditoriale, les variantes et les options d’achat, consultez la [page produit du Guition ESP32-S3-4848S040](/fr/products/guition-esp32-s3-4848s040/).

Ce guide présente le brochage du 4848S040, les interfaces de l’écran et du tactile, les GPIO importants et l’utilisation d’une configuration ESPHome existante comme point de départ.

![Vue arrière de la carte Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-back.webp)

> **Important :** le brochage et les GPIO disponibles peuvent varier selon la révision de la carte. Utilisez ces tableaux comme référence et vérifiez-les avec la documentation de votre carte avant de connecter du matériel externe.

## Présentation du matériel

Cette famille de cartes associe un ESP32-S3 à un écran RGB de 480 × 480 basé sur le ST7701S et à un contrôleur tactile capacitif GT911. La mémoire, le relais et les options de boîtier doivent être vérifiés selon la révision exacte et l’annonce du vendeur. La [page produit présente les caractéristiques et les options d’achat](/fr/products/guition-esp32-s3-4848s040/).

## Brochage du Guition ESP32-S3-4848S040

Les affectations ci-dessous sont indiquées dans le profil ESPHome Devices. Vérifiez la révision de votre carte avant de les utiliser pour un câblage.

### Broches de l’écran RGB

| Signal écran | GPIO |
|---|---:|
| Données rouges | 11, 12, 13, 14, 0 |
| Données vertes | 8, 20, 3, 46, 9, 10 |
| Données bleues | 4, 5, 6, 7, 15 |
| Display Enable (DE) | 18 |
| Synchronisation horizontale (HSYNC) | 16 |
| Synchronisation verticale (VSYNC) | 17 |
| Horloge pixel (PCLK) | 21 |

### Initialisation de l’écran ST7701S

| Signal | GPIO |
|---|---:|
| CS | 39 |
| CLK | 48 |
| DATA | 47 |

Ces signaux servent à initialiser l’écran. Ils sont distincts des lignes de données RGB et de synchronisation.

### Tactile GT911 et rétroéclairage

| Fonction | GPIO |
|---|---:|
| Tactile I²C SDA | 19 |
| Tactile I²C SCL | 45 |
| Rétroéclairage PWM | 38 |

Le GT911 communique en I²C. Dans le profil cité, le GPIO 38 commande le rétroéclairage par PWM.

![Démonstration de l’écran Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-screen-demo.webp)

*Démonstration de l’écran Guition ESP32-S3-4848S040.*

### Récapitulatif des GPIO

Le profil affecte **26 GPIO distincts** à l’écran, à son initialisation, au tactile et au rétroéclairage :

`GPIO0, GPIO3, GPIO4, GPIO5, GPIO6, GPIO7, GPIO8, GPIO9, GPIO10, GPIO11, GPIO12, GPIO13, GPIO14, GPIO15, GPIO16, GPIO17, GPIO18, GPIO19, GPIO20, GPIO21, GPIO38, GPIO39, GPIO45, GPIO46, GPIO47, GPIO48`

Cette liste décrit les affectations de la configuration référencée. Elle ne prouve **pas** que tous les autres GPIO sont disponibles pour des composants externes. D’autres broches peuvent être réservées à la mémoire Flash ou PSRAM, à des composants intégrés ou à des fonctions propres à la carte.

## Quels GPIO sont disponibles ?

Ne supposez pas qu’un GPIO est libre simplement parce qu’il n’apparaît pas dans les tableaux ci-dessus. Avant d’utiliser une broche pour un capteur, un relais, un bouton ou un autre périphérique :

1. Consultez le schéma et la documentation de la révision exacte de votre carte.
2. Vérifiez quelles broches sont physiquement accessibles.
3. Vérifiez si une broche est réservée à la Flash, à la PSRAM, à l’USB, au démarrage ou à un autre composant intégré.
4. Comparez votre câblage avec la configuration ESPHome utilisée.

Le profil de la carte constitue un point de départ utile, mais ne remplace pas son schéma électrique.

## Versions avec et sans relais

Le 4848S040 existe en variantes pouvant inclure un module relais et différentes options de montage. Pour comparer les versions, consultez la [page produit et ses conseils d’achat](/fr/products/guition-esp32-s3-4848s040/).

- **Version sans relais :** vérifiez dans la documentation de la carte les connecteurs disponibles et les périphériques pris en charge.
- **Version avec relais :** ne présumez ni de l’affectation GPIO ni de la capacité électrique du relais. Consultez le schéma et la documentation de cette variante avant de connecter une charge.
- **Montage mural :** la version avec relais peut ne pas entrer dans une boîte d’encastrement ronde européenne de 60 mm. Vérifiez les dimensions et le type de montage avant l’achat.

Ne connectez jamais une charge secteur sur la seule base d’un brochage générique. Vérifiez les caractéristiques du relais, l’isolation, le boîtier et les exigences de câblage du produit concerné.

## Premiers pas avec ESPHome

Une configuration ESPHome existante peut faciliter le démarrage, mais elle doit être vérifiée avant le flashage. Ces ressources communautaires constituent de bons points de départ :

- [ESPHome Devices : Guition ESP32-S3-4848S040](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [Configuration ESPHome communautaire](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

Pour éviter d’utiliser une configuration destinée à une autre révision :

1. Ouvrez la configuration et lisez les fichiers YAML ainsi que tous les packages inclus.
2. Vérifiez que les GPIO de l’écran, du tactile et du rétroéclairage correspondent à votre carte.
3. Remplacez le nom d’appareil d’exemple, les identifiants Wi-Fi et les secrets par vos propres valeurs.
4. Examinez les composants supplémentaires et les packages externes utilisés.
5. Validez la configuration dans ESPHome avant de flasher le firmware.
6. Suivez la procédure de premier flashage documentée pour votre carte et sa révision.

Ce guide ne prétend pas que la configuration communautaire a été testée sur toutes les révisions. Si la carte ne démarre pas ou si l’écran reste noir, vérifiez à nouveau la configuration et comparez le brochage à la documentation matérielle avant de modifier le câblage.

![Tableau de bord sur l’écran tactile Guition ESP32-S3-4848S040](/assets/images/guition-esp32-s3-4848s040-dashboard.webp)

*Exemple de tableau de bord sur l’écran tactile.*

## Question fréquente

### Puis-je utiliser cet écran avec ESPHome ?

Le profil ESPHome Devices et la configuration communautaire fournissent un point de départ. Examinez les fichiers YAML, comparez les GPIO à la révision de votre carte et validez la configuration avant le flashage.

## Étapes suivantes

Vous souhaitez choisir une carte ? Consultez la [page produit du Guition ESP32-S3-4848S040](/fr/products/guition-esp32-s3-4848s040/) pour les caractéristiques, l’évaluation éditoriale, les variantes et les options d’achat.

## Ressources complémentaires

- [Guition JC8048W550 : écran ESP32-S3 de 5 pouces](/products/guition-jc8048w550/) — une alternative plus grande au format paysage, en 800 × 480 pixels.
- [Guition ESP32-S3-4848S040 — page produit](/fr/products/guition-esp32-s3-4848s040/)
- [Sélecteur d’écrans tactiles ESP32](/tools/esp32-touchscreen-selector/)
- [Guide des écrans tactiles ESP32](/esp32-touchscreen-displays-guide/)
- [Profil ESPHome Devices](https://devices.esphome.io/devices/guition-esp32-s3-4848s040/)
- [Configuration ESPHome communautaire](https://github.com/jtenniswood/esphome-lvgl/tree/main/guition-esp32-s3-4848s040)

## À propos de l’auteur

**Embedded Nerd** publie des guides pratiques sur les cartes ESP32, le matériel embarqué, les écrans, les capteurs et les outils de développement. Ce guide s’appuie sur des références matérielles publiées et des ressources communautaires. La carte n’a pas été testée indépendamment pour cet article.
