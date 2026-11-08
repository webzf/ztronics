---
layout: product
lang: es
locale: es-ES
toc_label: Contenido
page_id: product-seeed-xiao-esp32s3-sense
available_languages:
  - en
  - de
  - es
english_url: /products/seeed-xiao-esp32s3-sense/
german_url: /de/products/seeed-xiao-esp32s3-sense/
spanish_url: /es/products/seeed-xiao-esp32s3-sense/
internal_links: true
title: "Seeed Studio XIAO ESP32S3 Sense: cámara, micrófono y microSD en 21 × 17,8 mm"
product_verdict: "Una placa ESP32-S3 muy compacta para proyectos de cámara, audio y registro de datos. Tenga en cuenta los GPIO compartidos y el mayor consumo en deep sleep con la placa de expansión conectada."
editorial_review:
  rating: 8.5
  best_rating: 10
  worst_rating: 1
  author: "Embedded Nerd"
  summary: "El Seeed Studio XIAO ESP32S3 Sense combina un ESP32-S3 con 8 MB de PSRAM y 8 MB de Flash, una placa de expansión de cámara extraíble, un micrófono digital y una ranura microSD en un módulo de solo 21 × 17,8 mm con circuito de carga de batería. Sus principales limitaciones son los GPIO compartidos, el mayor consumo en deep sleep con la placa de expansión conectada y las posibles diferencias de cámara entre lotes de fabricación."
  methodology: "Esta valoración editorial se basa en especificaciones publicadas y en la documentación del fabricante. Embedded Nerd no ha probado físicamente la placa ni el anuncio comercial concreto descrito aquí."
  pros:
    - "Cámara, micrófono digital y ranura microSD en una placa del tamaño de un pulgar"
    - "ESP32-S3 con 8 MB de PSRAM y 8 MB de Flash para streaming de cámara y pequeñas demostraciones de ML"
    - "Circuito de carga integrado para baterías Li-ion y conector de antena U.FL"
    - "Documentación oficial, pinouts y ejemplos detallados de Seeed Studio"
  cons:
    - "El micrófono, la tarjeta SD y el LED de usuario comparten GPIO con los pines de la cabecera; compruebe los pines disponibles antes de cablear"
    - "El consumo en deep sleep es de aproximadamente 3 mA con la placa de expansión conectada, claramente superior al XIAO ESP32S3 estándar"
    - "La placa suele venderse sin conectores de pines; el módulo de cámara (OV5640 u OV3660) puede variar según el lote"
seo_title: "XIAO ESP32S3 Sense: especificaciones, pinout y dónde comprar"
seo_description: "Especificaciones y pinout del Seeed Studio XIAO ESP32S3 Sense: D0–D12 a GPIO, cámara OV5640, micrófono, microSD, consumo y compra."
product_id: seeed-xiao-esp32s3-sense
category: Development Boards
manufacturer: "Seeed Studio"
image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
header:
  teaser: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image: "/assets/images/products/seeed-xiao-esp32s3-sense-front.webp"
  og_image_alt: "Vista frontal del Seeed Studio XIAO ESP32S3 Sense con módulo de cámara"
alt: "Seeed Studio XIAO ESP32S3 Sense, vista frontal con módulo de cámara"
excerpt: "Seeed Studio XIAO ESP32S3 Sense con ESP32-S3, cámara OV5640, micrófono digital, ranura microSD, 8 MB de PSRAM y 8 MB de Flash en 21 × 17,8 mm."
description: "El Seeed Studio XIAO ESP32S3 Sense es una placa de desarrollo ESP32-S3 del tamaño de un pulgar con 8 MB de PSRAM, 8 MB de Flash, Wi-Fi, Bluetooth LE y circuito de carga de batería. La placa de expansión extraíble añade una cámara, un micrófono digital y una ranura microSD. Varios GPIO se comparten entre la cabecera, el micrófono, la tarjeta SD y el LED de usuario. Consulte las tablas de pines antes de conectar periféricos."
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
permalink: /es/products/seeed-xiao-esp32s3-sense/
specifications:
  - name: Procesador
    value: "ESP32-S3R8, Xtensa LX7 de doble núcleo, hasta 240 MHz"
  - name: Flash
    value: "8 MB"
  - name: PSRAM
    value: "8 MB"
  - name: Cámara
    value: "OV5640 extraíble con enfoque automático (algunas placas incluyen OV3660)"
  - name: Micrófono
    value: "Micrófono digital PDM"
  - name: Almacenamiento
    value: "Ranura microSD en la placa de expansión; FAT hasta 32 GB"
  - name: Conectividad inalámbrica
    value: "Wi-Fi de 2,4 GHz y Bluetooth LE 5.0 / Bluetooth Mesh"
  - name: USB
    value: "USB Type-C"
  - name: Batería
    value: "Batería Li-ion de 3,7 V con circuito de carga integrado"
  - name: Dimensiones
    value: "21 × 17,8 mm; con placa de expansión 21 × 17,8 × 15 mm"
  - name: Temperatura de funcionamiento
    value: "−20 °C a 65 °C"
links:
  - title: "Seeed Studio XIAO ESP32-S3 – primeros pasos"
    icon: "fas fa-book"
    description: "Especificaciones oficiales, pinout, guía de configuración y resolución de problemas."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/"
  - title: "Multiplexación de pines XIAO ESP32-S3 (Sense)"
    icon: "fas fa-microchip"
    description: "Notas oficiales sobre el uso de GPIO, ADC, I²C, SPI, UART y pines táctiles."
    url: "https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/"
  - title: "Página de producto de Seeed Studio"
    icon: "fas fa-store"
    description: "Página oficial del XIAO ESP32S3 Sense."
    url: "https://www.seeedstudio.com/XIAO-ESP32S3-Sense-p-5639.html"
related:
  - arduino-nano-esp32
  - esp32-devkit
  - raspberry-pi-pico-w
---
El **Seeed Studio XIAO ESP32S3 Sense** es una placa ESP32-S3 del tamaño de un pulgar con una placa de expansión extraíble que incorpora una cámara, un micrófono digital y una ranura microSD. También se busca como **XIAO ESP32-S3 Sense** o **Seeed XIAO ESP32S3 Sense**. Al comprar, fíjese expresamente en la versión **Sense**: el XIAO ESP32S3 estándar tiene un aspecto muy parecido, pero no incluye cámara, micrófono ni ranura SD.

Antes de conectar hardware externo, preste atención a los **pines compartidos**: el micrófono, la tarjeta SD y el LED de usuario utilizan algunos de los mismos GPIO que los pines de la cabecera. Las siguientes tablas muestran las asignaciones.

## Imágenes del producto

<div class="product-image-gallery" style="display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:1rem;margin:1.5rem 0;">
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-front.webp" alt="Vista frontal del Seeed Studio XIAO ESP32S3 Sense con placa de cámara" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Vista frontal: XIAO ESP32S3 Sense con módulo de cámara</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-camera-assembly.webp" alt="Seeed Studio XIAO ESP32S3 Sense con la placa de expansión de cámara instalada" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Cámara y placa de expansión montadas</figcaption>
  </figure>
  <figure>
    <img src="/assets/images/products/seeed-xiao-esp32s3-sense-back.webp" alt="Parte trasera del Seeed Studio XIAO ESP32S3 Sense con etiquetas de pines y pads de soldadura" loading="lazy" style="width:100%;height:auto;">
    <figcaption>Parte trasera: etiquetas de pines y pads de soldadura</figcaption>
  </figure>
</div>

## ¿Merece la pena comprar el XIAO ESP32S3 Sense?

Esta placa es una buena elección si necesita una cámara, un micrófono o almacenamiento SD en una placa diminuta, por ejemplo para una pequeña cámara Wi-Fi, un proyecto de audio o voz, un dispositivo wearable o un registrador de datos alimentado por batería. Si solo necesita un ESP32-S3 pequeño sin estas funciones adicionales, puede interesarle el XIAO ESP32S3 estándar: tiene la misma distribución de cabeceras y un consumo en deep sleep mucho menor. Si necesita más GPIO y 16 MB de Flash, eche un vistazo al XIAO ESP32-S3 Plus.

## XIAO ESP32S3, Sense o Plus: ¿qué versión elegir?

| Característica | XIAO ESP32S3 | XIAO ESP32S3 Sense | XIAO ESP32-S3 Plus |
|---|---|---|---|
| Cámara y micrófono | No | Sí (placa de expansión) | No |
| Ranura microSD | No | Sí (placa de expansión) | No |
| Flash / PSRAM | 8 MB / 8 MB | 8 MB / 8 MB | 16 MB / 8 MB |
| GPIO con PWM | 11 | 11 | 18 |
| Consumo en deep sleep (dato de Seeed) | 14 µA | 3 mA con placa de expansión | 33,5 µA |
| Adecuado para | Proyectos pequeños de bajo consumo | Imagen, audio y registro de datos | Más pines y Flash |

Los precios varían según el vendedor, el país de entrega, el envío y la variante seleccionada. Antes de comprar, compruebe el anuncio actual, los accesorios y el modelo de cámara incluido.

<div class="en-product-cta__buttons">
  <a class="en-buy-button" href="/go/hardware/seeed-xiao-esp32s3-sense/" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fas fa-cart-shopping"></i></span><span class="en-buy-text"><strong>Consultar precio – XIAO ESP32S3 Sense</strong><small>AliExpress · Compruebe la cámara y los conectores</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
  <a class="en-buy-button" href="https://www.amazon.com/Seeed-Studio-XIAO-ESP32-Sense/dp/B0C69FFVHH?tag=embeddednerd2-20" target="_blank" rel="nofollow sponsored noopener"><span class="en-buy-icon"><i class="fab fa-amazon"></i></span><span class="en-buy-text"><strong>Consultar precio – Amazon</strong><small>Compruebe la versión Sense y el contenido</small></span><span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span></a>
</div>

## Especificaciones técnicas

| Especificación | Detalles |
|---|---|
| Microcontrolador | ESP32-S3R8, Xtensa LX7 de doble núcleo, hasta 240 MHz |
| Flash | 8 MB |
| PSRAM | 8 MB |
| Conectividad inalámbrica | Wi-Fi de 2,4 GHz, Bluetooth LE 5.0 / Bluetooth Mesh |
| Cámara | OV5640 extraíble con enfoque automático (2592 × 1944); algunas placas se entregan con OV3660 (2048 × 1536); las primeras placas utilizaban OV2640 (1600 × 1200) |
| Micrófono | Micrófono digital PDM |
| Almacenamiento | Ranura microSD en la placa de expansión, FAT hasta 32 GB |
| Interfaces | 1 × UART, 1 × I²C, 1 × I²S, 1 × SPI, 11 × GPIO con PWM, 9 × ADC |
| Botones y LED | Reset, Boot, LED de usuario y LED de carga |
| Alimentación | 5 V por USB Type-C o batería Li-ion de 3,7 V |
| Antena | Conector U.FL; antena externa incluida |
| Dimensiones | 21 × 17,8 mm; con placa de expansión 21 × 17,8 × 15 mm |
| Temperatura de funcionamiento | −20 °C a 65 °C |

Los datos técnicos se basan en el wiki de Seeed Studio (consultado el 7 de noviembre de 2026). Seeed está cambiando actualmente la cámara OV3660 por la OV5640 con enfoque automático. Durante esta transición, pueden suministrarse placas con cualquiera de las dos cámaras.

## Cámara, micrófono y microSD

La placa de expansión se conecta mediante un conector board-to-board e incluye la cámara, el micrófono PDM y la ranura microSD. Los ejemplos de cámara de Seeed son compatibles con OV5640, OV3660 y OV2640. Por tanto, pueden utilizarse los mismos programas; solo la OV5640 dispone de enfoque automático. El módulo OV5640 también se vende por separado como repuesto.

Según Seeed, el firmware de fábrica de las unidades enviadas desde junio de 2025 activa por defecto un punto de acceso Wi-Fi con nombre y contraseña publicados. Instale su propio firmware antes de utilizar la placa en un lugar accesible al público.

## Pinout del XIAO ESP32S3 Sense: D0–D12 a GPIO

| Pin XIAO | GPIO | Funciones | Nota |
|---|---:|---|---|
| D0 | GPIO1 | ADC, táctil | Entrada/salida de propósito general |
| D1 | GPIO2 | ADC, táctil | Entrada/salida de propósito general |
| D2 | GPIO3 | ADC, táctil | Pin de configuración (fuente JTAG) |
| D3 | GPIO4 | ADC, táctil | Entrada/salida de propósito general |
| D4 / SDA | GPIO5 | Datos I²C, ADC, táctil | I²C predeterminado. Consulte la [guía de direcciones I²C](/tools/i2c-address-lookup/) y el [tutorial del escáner I²C](/i2c-scanner-tutorial/). |
| D5 / SCL | GPIO6 | Reloj I²C, ADC, táctil | I²C predeterminado |
| D6 / TX | GPIO43 | UART TX | Salida serie |
| D7 / RX | GPIO44 | UART RX | Entrada serie |
| D8 / SCK | GPIO7 | Reloj SPI, ADC, táctil | También se utiliza para el reloj de la tarjeta SD |
| D9 / MISO | GPIO8 | SPI MISO, ADC, táctil | También se utiliza para los datos de la tarjeta SD |
| D10 / MOSI | GPIO9 | SPI MOSI, ADC, táctil | También se utiliza para los datos de la tarjeta SD |
| D11 | GPIO42 | Táctil | Compartido con el reloj del micrófono |
| D12 | GPIO41 | Táctil | Compartido con los datos del micrófono |

Seeed señala que D11 y D12 (GPIO42 y GPIO41) aparecen etiquetados como pines analógicos, pero el ESP32-S3 no admite mediciones ADC en ellos. Para lecturas analógicas, utilice D0–D5 y D8–D10.

Pines de alimentación: **5V** es la línea USB de 5 V, **3V3** es la salida regulada de 3,3 V y **GND** es masa. Todos los GPIO utilizan lógica de 3,3 V y no deben recibir 5 V. Cuando se alimenta con batería, el pin 5V no tiene tensión.

## Disponibilidad GPIO: pines compartidos por cámara, micrófono y tarjeta SD

Según el pinout de Seeed, la cámara, el micrófono y la tarjeta SD no entran en conflicto entre sí. Sin embargo, algunas de estas funciones comparten GPIO con los pines de la cabecera.

| Función | GPIO | Compartido con |
|---|---|---|
| Reloj del micrófono (PDM) | GPIO42 | Pin de cabecera D11 |
| Datos del micrófono (PDM) | GPIO41 | Pin de cabecera D12 |
| Chip-select de la tarjeta SD | GPIO21 | LED de usuario |
| Reloj / MISO / MOSI de la SD | GPIO7 / GPIO8 / GPIO9 | Pines SPI D8 / D9 / D10 |
| Datos / reloj I²C de la cámara | GPIO40 / GPIO39 | Pines JTAG MTDO / MTCK |
| Datos, reloj y sincronización de cámara | GPIO10–18, 38, 47, 48 | Solo conector board-to-board |

Al utilizar la tarjeta SD, el LED de usuario en GPIO21 también funciona como línea chip-select de la tarjeta. Los dispositivos SPI adicionales conectados a D8–D10 comparten el bus con la tarjeta SD y necesitan su propio pin chip-select. Si utiliza el micrófono, considere D11 y D12 ocupados.

## Consumo y funcionamiento con batería

Valores típicos publicados por Seeed para la versión Sense **con la placa de expansión conectada**:

| Modo de funcionamiento | Corriente típica |
|---|---:|
| Wi-Fi activo | 110 mA |
| Bluetooth LE activo | 102 mA |
| Modem-sleep | 44 mA |
| Light-sleep | 5 mA |
| Deep sleep | 3 mA |
| Servidor web de cámara (USB) | unos 140 mA de media, 347 mA de pico |

La placa puede funcionar con una batería Li-ion de 3,7 V y cargarse mediante USB-C. Según Seeed, el pad de soldadura negativo de la batería es el más cercano al conector USB. Compruebe cuidadosamente la polaridad antes de soldar. No hay un GPIO específico para leer la tensión de la batería; para ello se necesita un divisor de tensión externo conectado a un pin ADC.

## Arduino, MicroPython y primeros pasos

Seeed documenta Arduino y MicroPython para la serie XIAO ESP32-S3, además de guías para ESP-IDF y Zephyr. En Arduino IDE, seleccione la placa **XIAO_ESP32S3** y utilice el paquete de placas ESP32 versión 2.0.8 o posterior.

Ejemplo para el LED integrado y una entrada analógica:

```cpp
const int ledPin = LED_BUILTIN; // GPIO21 en XIAO ESP32S3
const int analogPin = A0;       // D0 = GPIO1 (ADC)

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // El LED de usuario es activo en LOW: LOW lo enciende.
  digitalWrite(ledPin, LOW);
  delay(500);
  digitalWrite(ledPin, HIGH);
  delay(500);

  Serial.print("A0 = ");
  Serial.println(analogRead(analogPin));
}
```

Abra el monitor serie a **115200 baudios**. Como GPIO21 también funciona como chip-select de la tarjeta SD, no controle el LED mientras esté utilizando la tarjeta SD. Si el puerto desaparece o falla la carga, mantenga pulsado el botón **Boot** mientras conecta el cable USB para iniciar el modo bootloader.

- [Seeed Studio – primeros pasos](https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/)
- [Seeed Studio – multiplexación de pines](https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/)

## Dónde comprar

Compruebe que el anuncio indica expresamente la versión **Sense**, qué modelo de cámara incorpora, quién es el vendedor y a qué destino realiza envíos. Seeed suministra la placa sin conectores de pines de forma predeterminada. Busque una variante con los conectores ya soldados o prevea soldarlos usted mismo. Los anuncios varían según la región; esta página no muestra un precio fijo.

Como afiliado, Embedded Nerd puede recibir una comisión por compras que cumplan los requisitos, sin coste adicional para usted.

- [Seeed Studio XIAO ESP32S3 Sense en la tienda de Seeed](https://www.seeedstudio.com/XIAO-ESP32S3-Sense-p-5639.html)

## Preguntas frecuentes

### ¿El XIAO ESP32S3 Sense es lo mismo que el XIAO ESP32S3?

No. Ambos utilizan la misma placa principal y la misma distribución de cabeceras. Sin embargo, el Sense incluye una placa de expansión extraíble con cámara, micrófono digital y ranura microSD. El XIAO ESP32S3 estándar no tiene estos componentes y consume menos en deep sleep.

### ¿Qué cámara utiliza el XIAO ESP32S3 Sense?

Las placas actuales utilizan una cámara OV5640 extraíble con enfoque automático. Durante la transición, algunas unidades todavía pueden incluir la OV3660. Las primeras placas utilizaban la OV2640, que ya está descatalogada. Los ejemplos de Seeed son compatibles con los tres modelos.

### ¿Los GPIO del XIAO ESP32S3 Sense toleran 5 V?

No. Los GPIO funcionan con lógica de 3,3 V y no deben recibir 5 V. Utilice un conversor de nivel para sensores o módulos de 5 V.

### ¿Se pueden utilizar la cámara, el micrófono y la tarjeta SD al mismo tiempo?

Según el pinout de Seeed, estas funciones no entran en conflicto entre sí y pueden utilizarse conjuntamente. El micrófono ocupa D11 y D12; la tarjeta SD comparte los pines SPI D8–D10 y su chip-select está en el mismo GPIO que el LED de usuario.

### ¿El XIAO ESP32S3 Sense puede cargar una batería?

Sí. La placa incluye un circuito de carga para baterías Li-ion y las conexiones correspondientes. Cuando funciona con batería, el pin 5V no tiene tensión. Tampoco existe un pin dedicado para leer la tensión de la batería.

### ¿Se incluyen conectores de pines?

Seeed suministra la placa sin conectores de pines de forma predeterminada. Compruebe si el anuncio incluye una variante con los conectores ya soldados o suelde sus propios conectores.

### ¿El XIAO ESP32S3 Sense funciona con MicroPython?

Sí. Seeed documenta Arduino y MicroPython para la serie XIAO ESP32-S3. Sin embargo, el entorno de desarrollo no cambia los límites eléctricos de 3,3 V ni el pinout descrito anteriormente.

## Comparación con otras placas ESP32

| Placa | Especialmente adecuada para |
|---|---|
| Seeed Studio XIAO ESP32S3 Sense | Proyectos muy compactos de cámara, audio y registro de datos |
| [Arduino Nano ESP32](/products/arduino-nano-esp32/) | Formato Nano con ESP32-S3 y nombres de pines Arduino |
| [ESP32 DevKit V1](/products/esp32-devkit/) | Prototipos generales económicos |
| [Raspberry Pi Pico W](/products/raspberry-pi-pico-w/) | RP2040 con Wi-Fi y soporte MicroPython |

¿No sabe qué placa encaja mejor con su proyecto? Consulte nuestra guía de [las mejores placas ESP32](/best-esp32-boards/) o visite la categoría de [placas de desarrollo](/products/development-boards/).
