---
layout: product
lang: es
locale: es-ES
toc_label: Contenido
page_id: product-arduino-uno-q
translation_id: arduino-uno-q
internal_links: true
title: "Arduino UNO Q: especificaciones, 2GB frente a 4GB y dónde comprar"
product_verdict: "Una placa híbrida con Linux y microcontrolador para IA en el borde, visión artificial y robótica. Elige 2GB para aplicaciones específicas; 4GB ofrece más margen para usarla como ordenador independiente y realizar varias tareas."
seo_title: "Arduino UNO Q: precio, especificaciones y versión de 2GB o 4GB"
seo_description: "Arduino UNO Q con Qualcomm Dragonwing QRB2210, STM32U585, Debian Linux, funciones de IA y comparación de 2GB frente a 4GB. Consulta precios y tiendas."
product_id: arduino-uno-q
category: Placas de desarrollo
manufacturer: "Arduino"
alt: "Placa de desarrollo Arduino UNO Q sostenida en una mano, con sus componentes visibles"
image: "/assets/images/products/arduino-uno-q-handheld.webp"
header:
  teaser: "/assets/images/products/arduino-uno-q-handheld.webp"
  og_image: "/assets/images/products/arduino-uno-q-handheld.webp"
  og_image_alt: "Placa de desarrollo Arduino UNO Q sostenida en una mano"
excerpt: "Arduino UNO Q combina un procesador Qualcomm Dragonwing QRB2210 para Linux con un microcontrolador STM32U585 en tiempo real, Wi-Fi 5, Bluetooth 5.1 y almacenamiento eMMC."
description: "Arduino UNO Q es una plataforma híbrida de ordenador de placa única y microcontrolador. El Qualcomm Dragonwing QRB2210 ejecuta Debian Linux y cargas de trabajo avanzadas, mientras que el STM32U585 gestiona las entradas y salidas en tiempo real. Disponible con 2GB de RAM y 16GB eMMC o 4GB de RAM y 32GB eMMC."
categories: [Arduino, Placas de desarrollo, SBC Linux, IA en el borde, Robótica]
tags: [Arduino UNO Q, Arduino, Qualcomm Dragonwing QRB2210, STM32U585, Debian Linux, IA en el borde, Visión artificial, Robótica, Arduino App Lab, Wi-Fi 5, Bluetooth 5.1]
permalink: /products/arduino-uno-q/
available_languages: [en, de, es, fr, it, nl, pl]
english_url: /products/arduino-uno-q/
german_url: /de/products/arduino-uno-q/
spanish_url: /es/products/arduino-uno-q/
french_url: /fr/products/arduino-uno-q/
italian_url: /it/products/arduino-uno-q/
dutch_url: /nl/products/arduino-uno-q/
polish_url: /pl/products/arduino-uno-q/
specifications:
  - name: MPU
    value: "Qualcomm Dragonwing QRB2210, Arm Cortex-A53 de cuatro núcleos hasta 2,0 GHz"
  - name: GPU
    value: "Acelerador gráfico 3D Qualcomm Adreno"
  - name: MCU
    value: "STM32U585, Arm Cortex-M33 hasta 160 MHz"
  - name: Memoria del MCU
    value: "2 MB Flash y 786 KB SRAM"
  - name: Opciones de RAM
    value: "2GB o 4GB LPDDR4"
  - name: Almacenamiento
    value: "16GB o 32GB eMMC"
  - name: Conectividad inalámbrica
    value: "Wi-Fi 5 de doble banda (2,4/5GHz) y Bluetooth 5.1"
  - name: USB
    value: "1× USB-C con cambio de función host/dispositivo, gestión de alimentación y salida de vídeo DisplayPort"
  - name: Alimentación
    value: "USB-C 5V / máximo 3A; VIN 7–24V"
  - name: Interfaces
    value: "I²C/I3C, SPI, PWM, CAN, UART, PSSI, GPIO, JTAG y ADC"
  - name: Pantalla
    value: "Vídeo DisplayPort por USB-C; señales MIPI DSI en el conector JMEDIA"
  - name: Indicadores
    value: "4 LED RGB controlables y matriz azul de 8×13 LED"
  - name: Expansión
    value: "Conector Qwiic I²C de 3,3V"
  - name: Audio
    value: "Entrada de micrófono, salida de auriculares y salida de línea en JMISC"
  - name: Dimensiones
    value: "68,85 × 53,34 mm (formato UNO)"
  - name: Sistemas operativos
    value: "Debian Linux en el MPU; Arduino Core sobre Zephyr OS en el MCU"
  - name: Contenedores
    value: "Docker y Docker Compose"
links:
  - title: "Documentación oficial de Arduino UNO Q"
    icon: "fas fa-book"
    description: "Instrucciones oficiales de configuración, documentación de hardware y recursos de software."
    url: "https://docs.arduino.cc/hardware/uno-q/"
  - title: "Hoja de datos de Arduino UNO Q"
    icon: "fas fa-file-pdf"
    description: "Arquitectura de hardware, conectores, detalles eléctricos y especificaciones técnicas."
    url: "https://docs.arduino.cc/resources/datasheets/ABX00162-datasheet.pdf"
  - title: "Página de producto Arduino UNO Q"
    icon: "fas fa-shopping-cart"
    description: "Información oficial del producto y variantes actuales de 2GB y 4GB."
    url: "https://store.arduino.cc/products/uno-q"
  - title: "Arduino App Lab"
    icon: "fas fa-code"
    description: "Entorno de desarrollo para combinar Python, sketches de Arduino y modelos de IA."
    url: "https://docs.arduino.cc/software/app-lab/"
related: [arduino-nano-esp32, esp32-devkit, raspberry-pi-pico]
---
![Placa Arduino UNO Q sostenida en una mano](/assets/images/products/arduino-uno-q-handheld.webp)

La **Arduino UNO Q** no es una placa Arduino convencional con un microcontrolador más rápido. Combina un procesador de aplicaciones capaz de ejecutar Linux con un microcontrolador independiente en tiempo real, en una placa con formato UNO. El Qualcomm Dragonwing QRB2210 ejecuta Debian Linux y aplicaciones de alto nivel, mientras que el STM32U585 se encarga del control determinista de sensores, actuadores y otros dispositivos.

Esta arquitectura de doble procesador hace que la UNO Q resulte especialmente interesante para **IA en el borde, visión artificial, robótica y dispositivos conectados** que necesitan tanto software Linux como control de hardware con baja latencia.

Hay dos configuraciones de memoria: **2GB de RAM con 16GB eMMC** y **4GB de RAM con 32GB eMMC**. El procesador y la arquitectura principal son los mismos; la RAM y el almacenamiento son las diferencias principales.

![Arduino UNO Q parcialmente dentro de su embalaje](/assets/images/products/arduino-uno-q-box.webp)

*Arduino UNO Q y su embalaje comercial.*

## ¿Merece la pena comprar Arduino UNO Q?

La UNO Q tiene sentido cuando un proyecto necesita más de lo que un microcontrolador tradicional puede ofrecer cómodamente. Puede ejecutar aplicaciones Linux, código Python y servicios en contenedores mientras el STM32U585 sigue gestionando las entradas y salidas en tiempo real.

Es menos interesante para un proyecto básico con LED, sensores o automatización sencilla. Si no necesitas Linux, IA local ni visión artificial, una Arduino convencional, una ESP32 o una Raspberry Pi Pico suelen ser opciones más económicas y sencillas.

**La decisión principal de compra es 2GB frente a 4GB.** Elige el modelo de 2GB para una aplicación integrada dedicada y con una carga de trabajo limitada. Elige 4GB si vas a conectar monitor, teclado y ratón, ejecutar varios servicios Linux a la vez o trabajar con cargas de IA y visión más exigentes.

## Arduino UNO Q de 2GB frente a 4GB

| Característica | UNO Q 2GB | UNO Q 4GB |
|---|---|---|
| RAM | 2GB LPDDR4 | 4GB LPDDR4 |
| Almacenamiento eMMC | 16GB | 32GB |
| MPU | Qualcomm Dragonwing QRB2210 | Qualcomm Dragonwing QRB2210 |
| MCU | STM32U585 | STM32U585 |
| Linux | Debian | Debian |
| Más adecuada para | Aplicaciones integradas dedicadas, pasarelas IoT y cargas de IA ligeras | Uso como SBC independiente, multitarea y cargas de IA/visión mayores |

La versión de 4GB es la opción más segura si quieres utilizar la UNO Q como un pequeño ordenador Linux con pantalla, teclado y ratón. Arduino recomienda la configuración de 4GB para el uso independiente. La versión de 2GB sigue siendo adecuada para aplicaciones específicas con un consumo de memoria controlado.

Las variantes no utilizan procesadores diferentes: ambas incorporan el QRB2210 y el STM32U585. La RAM y la capacidad eMMC adicionales son lo que distingue al modelo de 4GB.

## Especificaciones de Arduino UNO Q

Las especificaciones técnicas completas ya están resumidas en el panel de especificaciones superior. Para evitar repetir la misma tabla, consulta la [hoja de datos oficial de Arduino UNO Q](https://docs.arduino.cc/resources/datasheets/ABX00162-datasheet.pdf) para conocer los detalles de los conectores y la información eléctrica específica de cada revisión. Las funciones de los conectores y los dominios de tensión no son intercambiables: consulta la hoja de datos antes de conectar hardware externo.

## Vistas de la placa Arduino UNO Q

La cara de los componentes y la parte posterior muestran la distribución de la placa, los conectores y los pines de expansión.

![Cara de componentes de Arduino UNO Q con Qualcomm Dragonwing QRB2210 y STM32U585](/assets/images/products/arduino-uno-q-front.webp)

![Parte posterior de Arduino UNO Q con sus conectores y distribución](/assets/images/products/arduino-uno-q-back.webp)

## Pinout de Arduino UNO Q

La UNO Q ofrece conexiones separadas para el MCU y el MPU. Las principales entradas y salidas para proyectos maker están en los conectores del lado del MCU; otros conectores dedicados transportan señales de control del procesador, cámara y pantalla.

| Conector | Señales disponibles | Detalle importante |
|---|---|---|
| JDIGITAL | Pines digitales D0–D21 y funciones alternativas, como serie, I²C, SPI, PWM y CAN | E/S del MCU, lógica de 3,3V |
| JANALOG | Entradas analógicas A0–A5 y funciones alternativas | A0 y A1 **no toleran 5V** |
| Qwiic | GND, 3,3V, SDA y SCL | I²C4 en el STM32U585 |
| JSPI | MISO, SCK, MOSI, RESET, 5V y GND | Señales SPI2 de 3,3V |
| JCTL | Señales de arranque, reinicio, activación y consola | Dominio MPU de 1,8V; no es E/S general de 3,3V |
| JMEDIA | Líneas MIPI de cámara/pantalla y señales relacionadas | Señales de alta velocidad de 1,8V; no son GPIO generales |
| JMISC | Funciones mixtas de MCU y MPU, incluidas PSSI, I²C, audio y alimentación | Dominios mixtos de 3,3V para MCU y 1,8V para MPU |

El diagrama de pinout relaciona los números de pin de Arduino con los pines del STM32U585 y sus funciones periféricas. Compruébalo antes de cablear un módulo: **no apliques 5V a A0/A1 ni señales de 3,3V a los conectores MPU de 1,8V.** Las líneas MIPI de JMEDIA no son GPIO.

- [Descargar el PDF oficial del pinout completo de Arduino UNO Q](https://docs.arduino.cc/resources/pinouts/ABX00162-full-pinout.pdf)
- [Abrir la hoja de datos oficial de Arduino UNO Q](https://docs.arduino.cc/resources/datasheets/ABX00162-datasheet.pdf)

## Cómo funciona la arquitectura de doble procesador

La UNO Q reparte el trabajo entre dos procesadores.

### Qualcomm Dragonwing QRB2210: Linux y computación de alto nivel

El procesador Cortex-A53 de cuatro núcleos ejecuta Debian Linux. Se encarga de tareas como aplicaciones Python, redes, procesamiento de datos, visión artificial e inferencia de IA. La GPU Adreno integrada y los procesadores de señal de imagen ayudan con aplicaciones multimedia y de visión.

### STM32U585: control de hardware en tiempo real

El STM32U585 es un microcontrolador Cortex-M33 independiente que ejecuta Arduino Core sobre Zephyr OS. Gestiona la parte física del proyecto: lectura de sensores, control de salidas y operaciones sensibles al tiempo.

Esta separación es la principal ventaja de la UNO Q. Linux puede ejecutar aplicaciones complejas sin obligar a que el control crítico en tiempo real funcione como un proceso Linux convencional.

## IA, visión artificial y robótica

El QRB2210 hace que la UNO Q sea más adecuada para proyectos de computación en el borde que una placa Arduino MCU tradicional. Entre sus posibles aplicaciones se encuentran:

- **Visión artificial:** clasificación de imágenes, detección de objetos e inspección mediante cámara.
- **Dispositivos inteligentes:** procesamiento local de datos de sensores y automatización conectada.
- **Robótica:** planificación y visión basadas en Linux junto con control de motores y sensores mediante el MCU.
- **IoT industrial:** agregación local de datos, pasarelas y servicios en contenedores.
- **Sistemas interactivos:** combinación de aplicaciones Python, cámara, pantallas y controles físicos.

El rendimiento real depende del modelo, la cámara, la pila de software y la memoria disponible. No des por hecho que todos los modelos de IA funcionarán de forma eficiente solo porque la placa incorpore un procesador Qualcomm.

## Debian Linux, Python y Arduino App Lab

El MPU ejecuta Debian Linux, mientras que el STM32U585 utiliza Arduino Core sobre Zephyr OS. Así, un proyecto puede combinar herramientas Linux y Python con sketches Arduino convencionales.

Arduino App Lab está diseñado para reunir estas partes. Ofrece un flujo de trabajo para utilizar código Arduino, Python y componentes de aplicación preconfigurados llamados Bricks. La compatibilidad con Docker y Docker Compose también permite empaquetar servicios del lado Linux en contenedores.

Para empezar, consulta la [documentación oficial de UNO Q](https://docs.arduino.cc/hardware/uno-q/) y la [documentación de Arduino App Lab](https://docs.arduino.cc/software/app-lab/).

## Alimentación, USB-C y salida de vídeo

La placa puede alimentarse mediante USB-C a 5V y hasta 3A, o a través de la entrada VIN, especificada para 7–24V. USB-C también permite cambiar entre los roles host/dispositivo y ofrece salida de vídeo DisplayPort.

Para utilizarla como ordenador independiente con monitor, teclado y ratón, necesitarás un hub o adaptador USB-C compatible tanto con salida de vídeo como con USB Power Delivery. Comprueba que el adaptador y la fuente puedan suministrar la potencia necesaria; un hub USB-C básico sin alimentación adecuada puede no ser suficiente.

La placa también expone señales MIPI DSI a través del conector JMEDIA. No es la misma conexión que la salida DisplayPort por USB-C.

## Accesorios para Arduino UNO Q

La UNO Q solo tiene un puerto USB-C, por lo que algunos accesorios facilitan el uso independiente y la expansión de hardware.

- **Hub USB-C con vídeo y Power Delivery:** necesario para utilizarla con monitor, teclado y ratón. Elige un hub que indique expresamente compatibilidad con vídeo y paso de alimentación PD. [Ver hubs USB-C en Amazon](https://www.amazon.com/s?k=USB-C+hub+HDMI+Power+Delivery&tag=embeddednerd2-20){:target="_blank" rel="nofollow sponsored noopener"}
- **Fuente USB-C de 5V / 3A:** la placa admite hasta 5V / 3A por USB-C. Comprueba que la fuente y el cable puedan suministrar la potencia necesaria. [Ver fuentes USB-C en Amazon](https://www.amazon.com/s?k=USB-C+power+supply+5V+3A&tag=embeddednerd2-20){:target="_blank" rel="nofollow sponsored noopener"}
- **Cables y sensores Qwiic:** el conector Qwiic de 3,3V permite ampliar por I²C sin soldar con módulos compatibles. [Ver sensores Qwiic en Amazon](https://www.amazon.com/s?k=Qwiic+sensors+cables&tag=embeddednerd2-20){:target="_blank" rel="nofollow sponsored noopener"}

Como afiliado, Embedded Nerd puede recibir una comisión por compras que cumplan los requisitos, sin coste adicional para ti.

## Compatibilidad y expansión

La UNO Q conserva el contorno familiar de las placas UNO y mide 68,85 × 53,34mm. Sin embargo, compartir el formato no garantiza que todos los shields antiguos sean compatibles eléctrica o mecánicamente.

Presta especial atención a los distintos dominios de tensión de la placa. Las interfaces del lado STM32 están orientadas a 3,3V, mientras que algunas señales del MPU Qualcomm disponibles en conectores dedicados funcionan a 1,8V. Consulta el pinout y la hoja de datos antes de cablear periféricos o conectar un shield.

El conector Qwiic ofrece una opción práctica de expansión I²C a 3,3V para sensores y módulos compatibles.

## Precio de Arduino UNO Q y dónde comprar

La UNO Q se vende en configuraciones de 2GB y 4GB. El precio actual puede variar según el país, el vendedor, el envío y las existencias. Utiliza los enlaces de las tiendas para consultar el precio vigente y confirmar qué versión de memoria incluye el producto.

<div class="en-product-cta__buttons">
  <a class="en-buy-button preferred" href="https://link.amazon/B05l32CeC" target="_blank" rel="nofollow sponsored noopener">
    <span class="en-buy-icon"><i class="fab fa-amazon"></i></span>
    <span class="en-buy-text"><strong style="font-weight:400">Ver Arduino UNO Q en Amazon</strong><small style="font-weight:700">Comprueba la versión de 2GB / 4GB y el envío</small></span>
    <span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span>
  </a>
  <a class="en-buy-button" href="https://s.click.aliexpress.com/e/_c3w4434P" target="_blank" rel="nofollow sponsored noopener">
    <span class="en-buy-icon"><i class="fas fa-cart-shopping"></i></span>
    <span class="en-buy-text"><strong>Ver Arduino UNO Q en AliExpress</strong><small>Comprueba el vendedor, la memoria y el envío</small></span>
    <span class="en-buy-arrow"><i class="fas fa-chevron-right"></i></span>
  </a>
</div>

La tienda oficial de Arduino muestra actualmente la UNO Q de 2GB por **59,90€** y la versión de 4GB por **82,90€** (precios comprobados el **11 de noviembre de 2026**). [Compara ambas configuraciones en la tienda oficial de Arduino UNO Q](https://store.arduino.cc/pages/uno-q). Los precios de otros vendedores, el envío y la disponibilidad pueden variar.

Como afiliado, Embedded Nerd puede recibir una comisión por compras que cumplan los requisitos, sin coste adicional para ti.

## Arduino UNO Q frente a Raspberry Pi

La comparación depende de qué Raspberry Pi tengas en mente. Aquí Raspberry Pi se refiere a un ordenador de placa única Linux como Raspberry Pi 4 o Raspberry Pi 5, no a la Pico, que es una placa de microcontrolador.

| Característica | Arduino UNO Q | Raspberry Pi 4 / 5 |
|---|---|---|
| Función principal | Ordenador Linux híbrido y plataforma de microcontrolador | Ordenador Linux de propósito general |
| Sistema operativo | Debian Linux en el QRB2210 | Raspberry Pi OS y otras distribuciones Linux |
| Control de hardware en tiempo real | MCU STM32U585 dedicado con Zephyr/Arduino Core | Normalmente software GPIO o un microcontrolador externo |
| Formato | Formato Arduino UNO | Formato SBC Raspberry Pi |
| Expansión | Pines MCU tipo UNO, Qwiic y conectores MPU dedicados | GPIO de 40 pines y conectores según el modelo |
| Mejor para | Proyectos que combinan Linux, IA/visión y E/S en tiempo real | Escritorio Linux, servidores, redes y computación general |

Elige **Arduino UNO Q** si quieres Linux y un microcontrolador dedicado en la misma placa, especialmente para proyectos que combinan procesamiento avanzado con control en tiempo real de sensores o actuadores.

Elige una **Raspberry Pi 4 o 5** si la prioridad es un ordenador Linux de propósito general, un entorno de escritorio, un servidor doméstico o el ecosistema de software Raspberry Pi. Para proyectos prácticos de servidores Linux, consulta nuestra [guía de proyectos informáticos con Raspberry Pi](/raspberry-pi-it-projects/).

## Arduino UNO Q frente a Arduino UNO R4 WiFi

Estas placas están destinadas a proyectos diferentes. La UNO R4 WiFi es una placa de desarrollo de microcontrolador convencional. La UNO Q añade un procesador de aplicaciones con Linux y mucha más memoria de sistema.

| Característica | Arduino UNO Q | Arduino UNO R4 WiFi |
|---|---|---|
| Arquitectura | MPU Qualcomm + MCU STM32 | MCU Renesas RA4M1 |
| Linux | Debian Linux | Sin MPU Linux |
| Programación | Python, sketches Arduino y aplicaciones Linux | Sketches Arduino |
| IA y visión artificial | Diseñada para cargas de borde | No es su objetivo principal |
| Mejor para | Linux, IA en el borde, robótica y aplicaciones avanzadas | Control integrado tradicional, aprendizaje y proyectos MCU conectados |

Elige UNO R4 WiFi para proyectos convencionales de microcontrolador. Elige UNO Q cuando necesites Linux y un microcontrolador en tiempo real en la misma placa.

## Preguntas frecuentes

### ¿Es Arduino UNO Q mejor que Raspberry Pi?

Ninguna es mejor en todos los casos. Arduino UNO Q combina Debian Linux con un microcontrolador STM32U585 dedicado, por lo que resulta útil cuando un proyecto necesita aplicaciones Linux y control de hardware en tiempo real en una sola placa. Raspberry Pi 4 o 5 es un ordenador Linux más generalista y suele encajar mejor para escritorio, servidores domésticos y proyectos SBC convencionales. Raspberry Pi Pico pertenece a otra categoría: es una placa de microcontrolador, no un ordenador Linux.

### ¿Qué es Arduino UNO Q?

Arduino UNO Q es una placa de desarrollo híbrida que combina un procesador Qualcomm Dragonwing QRB2210 con un microcontrolador STM32U585. Puede ejecutar Debian Linux y aplicaciones de alto nivel mientras el STM32 gestiona el control del hardware en tiempo real.

### ¿Qué diferencia hay entre Arduino UNO Q de 2GB y 4GB?

La versión de 2GB tiene 2GB de RAM LPDDR4 y 16GB de almacenamiento eMMC. La versión de 4GB duplica estas capacidades hasta 4GB de RAM y 32GB eMMC. Ambas utilizan el mismo procesador QRB2210 y el mismo microcontrolador STM32U585.

### ¿Cuánto cuesta Arduino UNO Q?

En la tienda oficial de Arduino, la UNO Q de 2GB figura a **59,90€** y la versión de 4GB a **82,90€** (precios comprobados el **11 de noviembre de 2026**). Los precios pueden variar por país, impuestos, envío y disponibilidad. Confirma el importe final en la [tienda oficial de Arduino UNO Q](https://store.arduino.cc/pages/uno-q).

### ¿Dónde comprar Arduino UNO Q?

Puedes comparar ofertas en la sección de [precio y dónde comprar](#precio-de-arduino-uno-q-y-dónde-comprar) o consultar ambas configuraciones directamente en la [tienda oficial de Arduino](https://store.arduino.cc/pages/uno-q).

### ¿Arduino UNO Q ejecuta Linux?

Sí. El Qualcomm Dragonwing QRB2210 ejecuta Debian Linux. El microcontrolador STM32U585 independiente ejecuta Arduino Core sobre Zephyr OS.

### ¿Puedo programar Arduino UNO Q con Python?

Sí. Las aplicaciones Python pueden ejecutarse en el lado Debian Linux de la placa. El microcontrolador STM32 puede ejecutar sketches Arduino, lo que permite combinar Python y Arduino en un mismo proyecto.

### ¿Arduino UNO Q es compatible con Docker?

Sí. Arduino indica compatibilidad con Docker y Docker Compose en el lado Linux de la UNO Q.

### ¿Arduino UNO Q sirve para IA?

Está diseñada para aplicaciones de IA en el borde y visión artificial. La idoneidad de cada modelo depende de su tamaño, memoria necesaria, compatibilidad con frameworks y requisitos de rendimiento. La versión de 4GB es preferible para modelos mayores y multitarea intensiva.

### ¿Puedo utilizar Arduino UNO Q como ordenador independiente?

Sí. Puedes conectarle monitor, teclado y ratón mediante un hub o adaptador USB-C con salida de vídeo y Power Delivery. La versión de 4GB es la más recomendable para este uso.

### ¿Arduino UNO Q tiene Wi-Fi y Bluetooth?

Sí. Incluye Wi-Fi 5 de doble banda a 2,4GHz y 5GHz, además de Bluetooth 5.1.

### ¿Arduino UNO Q es compatible con los shields Arduino UNO?

Mantiene el formato UNO, pero el encaje físico no garantiza compatibilidad eléctrica. Comprueba los requisitos de tensión, el uso de pines y la documentación de los conectores antes de conectar un shield.

## Descubre más placas de desarrollo

- [Arduino Nano ESP32](/products/arduino-nano-esp32/) — una placa de microcontrolador inalámbrica y compacta.
- [Arduino UNO Q](/products/arduino-uno-q/) — Linux, IA en el borde y control en tiempo real en una placa.
- [ESP32 DevKit](/products/esp32-devkit/) — plataforma más sencilla y económica para muchos proyectos Wi-Fi y Bluetooth.
- [Raspberry Pi Pico](/products/raspberry-pi-pico/) — alternativa de microcontrolador para proyectos integrados.
- [Placas de desarrollo](/products/development-boards/) — descubre más placas para desarrollo integrado.
