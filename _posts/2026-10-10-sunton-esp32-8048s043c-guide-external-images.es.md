---
title: "Sunton ESP32-8048S043C: Pinout, código Arduino y guía"
title_tag: "Sunton ESP32-8048S043C: pinout y configuración"
seo_title: "Sunton ESP32-8048S043C: pinout, código Arduino y guía"
seo_description: "Guía del Sunton ESP32-8048S043C: pinout GPIO, pantalla RGB de 4,3 pulgadas, táctil GT911, microSD, Arduino, LVGL y ESPHome."
layout: single
lang: es
locale: es-ES
page_id: article-sunton-esp32-8048s043c-guide
translation_id: sunton-esp32-8048s043c-guide
available_languages:
  - en
  - de
  - es
  - fr
  - it
english_url: /sunton-esp32-8048s043c-guide/
german_url: /de/sunton-esp32-8048s043c-guide/
spanish_url: /es/sunton-esp32-8048s043c-guide/
french_url: /fr/sunton-esp32-8048s043c-guide/
italian_url: /it/sunton-esp32-8048s043c-guide/
internal_links: true
permalink: /sunton-esp32-8048s043c-guide/
id: "https://embeddednerd.com/es/sunton-esp32-8048s043c-guide/"
hide_post_pagination: true
sidebar:
  nav: "embedded"
  related: true
  share: true
excerpt: "Pinout y código Arduino para el Sunton ESP32-8048S043C: pantalla RGB, táctil GT911, GPIO de microSD, LVGL, ESPHome y consejos antes de comprar."
show_date: false
last_modified_at: 2026-11-08
author: "Embedded Nerd"
read_time: false
toc: true
toc_label: "Contenido"
toc_sticky: true
header:
  teaser: /assets/images/sunton-esp32-8048s043c-board.webp
  overlay_image: /assets/images/header3.webp
  overlay_filter: 0.5
  image: /assets/images/sunton-esp32-8048s043c-board.webp
  og_image: /assets/images/sunton-esp32-8048s043c-board.webp
  og_image_alt: "Sunton ESP32-8048S043C-I con pantalla táctil de 4,3 pulgadas, ESP32-S3 y conectores"
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
---

El **Sunton ESP32-8048S043C** es una placa todo en uno que integra un ESP32-S3, una pantalla IPS de 4,3 pulgadas y 800 × 480 píxeles, y una pantalla táctil capacitiva. El procesador, la pantalla y el controlador táctil están montados en una sola placa. Es una opción interesante para proyectos que necesitan una pantalla táctil relativamente grande sin combinar un ESP32 independiente con un módulo de pantalla.

> **Nota sobre la verificación:** Esta guía se basa en documentación del fabricante, referencias de hardware disponibles públicamente y proyectos de ejemplo. Embedded Nerd no ha probado físicamente esta placa para este artículo. El pinout puede variar según la revisión. Antes de conectar periféricos, compárelo con el esquema de su placa.

> **Aviso de afiliación:** El enlace de AliExpress de esta guía es un enlace de afiliado. Embedded Nerd puede recibir una comisión si realiza una compra a través de él, sin coste adicional para usted.

Antes de comprar, conviene comprobar algunos detalles. Sunton comercializa placas con nombres muy parecidos y con tecnología táctil capacitiva o resistiva. La revisión exacta del hardware puede afectar al pinout y a la configuración recomendada.

Esta guía cubre las especificaciones, la pantalla y el táctil, los GPIO importantes, la compatibilidad de software, los problemas habituales y los criterios principales para elegir el modelo 8048S043C.

> **¿No tiene claro qué pantalla táctil ESP32 encaja con su proyecto?** Consulte nuestra [guía de pantallas táctiles ESP32]({{ site.url }}/esp32-touchscreen-displays-guide/) para comparar placas por resolución y memoria.

![Sunton ESP32-8048S043C-I con pantalla táctil capacitiva de 4,3 pulgadas, módulo ESP32-S3 y conectores](/assets/images/sunton-esp32-8048s043c-board.webp)

*Imagen de la placa proporcionada por Embedded Nerd.*

## Especificaciones técnicas del Sunton ESP32-8048S043C

| Característica | Detalles |
| --- | --- |
| MCU | ESP32-S3 de doble núcleo, Wi-Fi y Bluetooth LE |
| Flash / PSRAM | 16 MB de Flash y 8 MB de PSRAM Octal en la habitual versión N16R8 |
| Pantalla | IPS de 4,3 pulgadas, 800 × 480 píxeles |
| Interfaz de pantalla | RGB paralelo de 16 bits |
| Táctil | Capacitivo, controlador GT911 por I²C |
| Almacenamiento | Ranura para microSD |
| USB | USB-C |
| Otros conectores | Botón BOOT en GPIO0 y cabeceras de expansión; las conexiones de altavoz y batería varían según la revisión |

> **Compruebe la revisión exacta antes de comprar.** Sunton vende placas con nombres similares, incluidas la 4827S043C y variantes resistivas «R». Compare la serigrafía de la placa con la documentación del vendedor antes de confiar en los números GPIO, la memoria o los proyectos de demostración.
{: .notice--warning}

## ¿Es una buena opción el Sunton ESP32-8048S043C?

El 8048S043C resulta interesante si necesita una pantalla táctil relativamente grande y quiere integrar el ESP32, la pantalla y el controlador táctil en una sola placa.

### Es una buena elección si necesita

- Una **pantalla táctil de 4,3 pulgadas y 800 × 480 píxeles**.
- Un **ESP32-S3** con Wi-Fi y Bluetooth LE.
- Táctil capacitivo integrado.
- PSRAM para interfaces gráficas exigentes.
- Una placa todo en uno en lugar de un ESP32 y una pantalla separados.
- Una interfaz basada en **LVGL**.
- Un panel de control táctil compacto.

Entre sus aplicaciones habituales están los paneles de control, interfaces para domótica, controles de máquinas, paneles de sensores y otros proyectos en los que una pantalla táctil grande resulta más práctica que una pequeña pantalla OLED o de caracteres.

### Considere otra placa si necesita

- Documentación oficial extensa y muchos ejemplos del fabricante.
- Otro tamaño o resolución de pantalla.
- GPIO más accesibles.
- Otra tecnología táctil.
- Una placa con una configuración de software más sencilla.

## Versión capacitiva C o resistiva R: ¿cuál debe comprar?

Este es uno de los aspectos más importantes que debe comprobar antes de realizar el pedido.

La **versión C** utiliza un **controlador táctil capacitivo GT911** conectado al bus I²C. Ofrece una experiencia táctil similar a la de las pantallas modernas de los teléfonos.

La **versión R** utiliza hardware táctil resistivo y necesita otro controlador y otro driver.

Si busca expresamente una pantalla táctil capacitiva moderna, asegúrese de que el anuncio identifica la placa como **8048S043C**, y no como una variante R.

El nombre general **8048S043** también aparece sin sufijo en algunos repositorios de ejemplos y documentos. Los anuncios pueden incluir tres configuraciones:

- **8048S043C**: táctil capacitivo, normalmente con GT911.
- **8048S043R**: táctil resistivo; no utilice la configuración GT911 de la versión C.
- **8048S043N**: algunas referencias de producto la identifican como versión sin pantalla táctil.

Compruebe el sufijo y pida al vendedor que confirme la placa real, el controlador de pantalla y el hardware táctil. Los nombres de modelo y las demostraciones incluidas no son uniformes en todos los anuncios.

## Datasheet, esquema y proyectos de ejemplo

Estas referencias son buenos puntos de partida para comprobar la revisión de la placa y preparar un proyecto funcional:

- [Documentación Makerfabs/Sunton y demostraciones de pantalla](https://wiki.makerfabs.com/Sunton_ESP32_S3_4.3_inch_800x400_IPS_with_Touch.html): guías de configuración del fabricante y enlaces a demostraciones de pantalla y LVGL.
- [Referencia de hardware ESP3D para ESP32-8048S043C](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/): pinout, conexiones microSD y notas sobre la modificación de la interrupción GT911.
- [Datasheet y archivo de demostraciones Sunton ESP32-8048S043](http://pan.jczn1688.com/directlink/1/ESP32%20module/4.3inch_ESP32-8048S043.zip): archivo alojado por el fabricante con documentación de la comunidad. Compruebe el contenido y la revisión antes de utilizarlo.
- [Proyecto de ejemplo Arduino_GFX + GT911 + LVGL](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043): proyecto PlatformIO con Arduino_GFX, GT911 y LVGL 9.1.
- [Ejemplo ESP-IDF + LVGL](https://github.com/limpens/esp32-8048S043): ejemplo independiente basado en ESP-IDF y el componente táctil GT911.

## Pinout: pantalla, táctil, microSD y cabeceras de expansión

La pantalla está conectada al ESP32-S3 mediante un bus RGB paralelo de 16 bits. El controlador táctil GT911 utiliza I²C. Estas conexiones ya están realizadas en la placa; por tanto, no utilice esos GPIO para otros periféricos.

### Pines táctiles y de control

| Función | GPIO | Notas |
| --- | ---: | --- |
| GT911 I²C SDA | 19 | Datos táctiles |
| GT911 I²C SCL | 20 | Reloj I²C |
| GT911 Reset (RST) | 38 | Reinicio del controlador táctil |
| GT911 Interrupt (INT) | 18 | Normalmente no está conectado al controlador sin una modificación de hardware |
| Retroiluminación LCD | 2 | Control de la retroiluminación |
| Botón BOOT | 0 | Selección del modo de arranque |

El GT911 suele utilizar la dirección I²C **0x5D** o **0x14**, según la configuración. La línea de interrupción táctil puede requerir una modificación de hardware. Si no está conectada, puede utilizarse sondeo periódico (polling).

### Pines microSD (SPI)

| Función | GPIO |
| --- | ---: |
| SD CS | 10 |
| SD MOSI | 11 |
| SD SCK | 12 |
| SD MISO | 13 |

### Señales de pantalla RGB

| Señal | GPIO |
| --- | --- |
| DE / VSYNC / HSYNC / PCLK | 40 / 41 / 39 / 42 |
| Rojo (R0–R4) | 45, 48, 47, 21, 14 |
| Verde (G0–G5) | 5, 6, 7, 15, 16, 4 |
| Azul (B0–B4) | 8, 3, 46, 9, 1 |

### Cabeceras de expansión

La referencia de hardware publicada describe la siguiente asignación de las cabeceras:

| Cabecera | Pines / funciones |
| --- | --- |
| P1 (similar a UART) | GND, RX, TX, +5 V |
| P2 (similar a SPI) | GPIO13, GPIO12, GPIO11, GPIO19 |
| P3 | GPIO20, GPIO19, GPIO18, GPIO17 |
| P4 | GPIO18, GPIO17, 3,3 V, GND |

**No todos estos pines se pueden utilizar de forma independiente.** GPIO19/20 se comparten con el táctil I²C, GPIO11–13 están ocupados por microSD y GPIO18 está relacionado con la modificación opcional de la interrupción GT911. Antes de conectar hardware, compruebe la orientación del conector y el esquema de su revisión concreta. El bus RGB utiliza muchos otros GPIO.

En la referencia ESP3D publicada, **GPIO17 aparece como NC en la lista principal de pines, pero también se incluye en las cabeceras P3/P4**. Es el candidato más prometedor para una señal digital sencilla adicional. Aun así, considérelo *posiblemente disponible*, no garantizado, hasta revisar el esquema de su placa. GPIO33/34 aparecen como NA y GPIO35–37 como NC/NA. No dé por hecho que están expuestos o que se pueden utilizar. Evite GPIO43/44 para periféricos generales, ya que se utilizan para la conexión serie USB-UART.

## Compatibilidad de software y bibliotecas

El 8048S043C puede utilizarse con varias bibliotecas gráficas habituales del ESP32:

| Biblioteca | Adecuada para | Notas |
| --- | --- | --- |
| **LVGL** | Interfaces táctiles completas con botones, controles deslizantes y gráficos | Necesita un driver de pantalla de nivel inferior |
| **Arduino_GFX** | Gráficos sencillos, texto y pruebas rápidas | Incluye un driver de panel RGB para ESP32-S3 |
| **LovyanGFX** | Dibujo rápido y configuración flexible | Necesita una configuración de panel adecuada para la placa |

Para muchos proyectos, una combinación de un driver RGB de bajo nivel, como Arduino_GFX, y **LVGL** para la interfaz de usuario es una buena solución.

Al evaluar la placa antes de comprarla, tenga en cuenta que puede ejecutar interfaces táctiles complejas, pero la configuración de pantalla debe coincidir exactamente con el hardware utilizado.

## Ejemplo de código Arduino: pantalla y táctil

El siguiente sketch es un **programa de prueba mínimo para la pantalla Arduino_GFX y el táctil GT911**, basado en el pinout habitual del 8048S043C. Muestra un mensaje de prueba y envía las coordenadas táctiles al puerto serie. El ejemplo se basa en referencias de hardware publicadas y Embedded Nerd no lo ha probado en un banco de pruebas. La temporización y el comportamiento táctil pueden variar según la revisión de la placa.

Instale **Arduino_GFX** y **TAMC_GT911** desde el Library Manager. Instale también el paquete de placas ESP32 de Espressif, seleccione **ESP32S3 Dev Module**, active **OPI PSRAM** y configure el tamaño de Flash correspondiente a la variante del módulo (normalmente 16 MB en N16R8).

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
// The GT911 INT line is normally not connected on this board; use polling.
#define TOUCH_INT     -1

Arduino_ESP32RGBPanel *rgbPanel = new Arduino_ESP32RGBPanel(
  40, 41, 39, 42,                         // DE, VSYNC, HSYNC, PCLK
  45, 48, 47, 21, 14,                     // R0-R4
  5, 6, 7, 15, 16, 4,                      // G0-G5
  8, 3, 46, 9, 1,                          // B0-B4
  0, 8, 4, 8,                              // HSYNC polarity, front porch, pulse, back porch
  0, 8, 4, 8,                              // VSYNC polarity, front porch, pulse, back porch
  1, 12500000                              // PCLK active-negative, target pixel clock (12.5 MHz)
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

Si la pantalla permanece negra o se comporta de forma inestable, no improvise nuevos valores de temporización. Compare el timing de pantalla y la asignación GPIO con la [referencia de hardware ESP3D](https://esp3d.io/esp3d-tft/version_1x/hardware/esp32-s3/sunton-43-8048/) y con la revisión de su placa. Para un proyecto LVGL completo, puede utilizar el [ejemplo Sunton ESP32-8048S043](https://github.com/clumsyCoder00/Sunton-ESP32-8048S043), que también incluye la configuración de las bibliotecas.

Un orden razonable para la primera puesta en marcha:

1. Confirme que tiene la versión capacitiva **8048S043C**.
2. Instale el soporte de placas ESP32-S3 y abra el proyecto de ejemplo en PlatformIO.
3. Compile y cargue primero la demostración original, sin modificaciones.
4. Compruebe que la pantalla RGB funciona correctamente antes de cambiar la interfaz.
5. Compruebe las coordenadas táctiles y la rotación de la pantalla antes de añadir widgets LVGL.
6. Conecte microSD u otros periféricos solo después de comprobar los GPIO compartidos.

**Estado de verificación:** El ejemplo procede de un tercero y Embedded Nerd no lo ha probado. Compruebe la licencia y las dependencias antes de reutilizar el código en su proyecto.

## SquareLine Studio y LVGL

Con [SquareLine Studio](https://squareline.io/) puede diseñar visualmente una interfaz LVGL y exportar el código de la UI. Sin embargo, la herramienta no sustituye a los drivers de pantalla y táctil específicos del hardware. El código generado todavía debe integrarse con un driver de panel RGB funcional, el driver de entrada GT911 y una versión compatible de LVGL. Antes de importar los archivos generados, compruebe el destino de exportación y la versión de LVGL.

## ESPHome

Esta placa también se utiliza con ESPHome y Home Assistant. La [referencia ESPHome Devices](https://devices.esphome.io/devices/sunton-esp32-8048s043c/) incluye una configuración para la pantalla de 800 × 480 y el controlador táctil GT911. La [documentación del componente LVGL de ESPHome](https://esphome.io/components/lvgl/) explica cómo crear páginas interactivas.

Las configuraciones ESPHome dependen de la versión, especialmente en pantallas RGB y drivers táctiles. Empiece con una configuración que se haya comprobado para su versión de ESPHome y revisión de placa. Después añada las entidades y widgets de Home Assistant.

## Ajustes de Arduino IDE

Para la habitual versión N16R8, estos son los ajustes relevantes de Arduino IDE:

1. Instale el **paquete de placas ESP32** de Espressif desde Boards Manager.
2. Seleccione **ESP32S3 Dev Module**.
3. Configure **PSRAM** como **OPI PSRAM**.
4. Configure **Flash Size** en **16 MB**.
5. Para la versión N16R8, utilice el modo Flash **QIO 80 MHz**.
6. En proyectos grandes, seleccione un esquema de particiones adecuado para 16 MB de Flash.

Sin la configuración correcta de PSRAM, las aplicaciones gráficas pueden no conseguir reservar un framebuffer. Esto puede provocar una pantalla negra o un bucle de reinicios.

> **Importante:** Estos ajustes corresponden a la configuración N16R8 habitual. Compruebe la revisión exacta de la placa y la documentación del vendedor antes de aplicarlos.
{: .notice--warning}

## Problemas frecuentes y qué debe saber antes de comprar

El 8048S043C es más sensible a la configuración que una pantalla SPI sencilla. Conviene tener en cuenta los problemas habituales desde el momento de elegir la placa.

### La pantalla permanece negra aunque la placa funciona

Una configuración incorrecta de PSRAM, pantalla o retroiluminación puede hacer que el ESP32 funcione, pero no muestre ninguna imagen.

Compruebe que:

- PSRAM está configurada como **OPI PSRAM**.
- El perfil de placa seleccionado es **ESP32-S3**.
- La retroiluminación está configurada correctamente.
- El timing de pantalla coincide con una configuración funcional para esa placa concreta.

### Bucle de reinicios o reset después de cargar el programa

A menudo la causa son ajustes incorrectos de PSRAM o Flash.

En la habitual versión N16R8, compruebe primero los ajustes de Arduino IDE antes de modificar el código de la aplicación.

### La pantalla táctil no responde

La versión capacitiva utiliza un GT911 mediante I²C.

Si la pantalla funciona, pero el táctil no:

1. Compruebe los pines I²C.
2. Ejecute un escáner I²C.
3. Busque el GT911 en **0x5D** o **0x14**.
4. Asegúrese de que el software utiliza un driver GT911 y no uno para táctil resistivo.

Nuestro [buscador de direcciones I²C]({{ site.url }}/tools/i2c-address-lookup/) puede ayudarle a identificar una dirección. El [tutorial del escáner I²C]({{ site.url }}/i2c-scanner-tutorial/) es útil para diagnosticar el problema.

### El táctil está invertido o desplazado

Normalmente se debe a la configuración del software. Compruebe la orientación de los ejes X/Y y los ajustes de rotación de la configuración táctil y de pantalla.

### La imagen parpadea o se desplaza

Las causas pueden ser el timing RGB o el ancho de banda de PSRAM. Empiece con valores de temporización de una demostración funcional para esa placa, en lugar de probar valores al azar.

### Hay pocos GPIO disponibles

La pantalla RGB utiliza una parte importante de los GPIO. Si su proyecto necesita varios sensores, periféricos o interfaces de comunicación, compruebe antes de comprar qué pines están realmente disponibles en las cabeceras de expansión.

### No se puede cargar el programa

Si es necesario, mantenga pulsado **BOOT (GPIO0)** mientras conecta la placa por USB-C o pruebe otro cable USB. Algunos cables solo permiten cargar y no transmiten datos.

## Comparación del Sunton ESP32-8048S043C con otras pantallas táctiles ESP32

No importa solo el tamaño de la pantalla: la resolución, la tecnología táctil, la interfaz de pantalla, los GPIO disponibles y el soporte de software también determinan la complejidad del proyecto.

| Placa | Pantalla | Táctil / MCU | Especialmente adecuada para |
| --- | --- | --- | --- |
| **Sunton ESP32-8048S043C** | 4,3 pulgadas, 800 × 480 RGB | ESP32-S3, GT911 capacitivo, 16 MB Flash / 8 MB PSRAM (N16R8 habitual) | Pantalla táctil integrada de 4,3 pulgadas y alta resolución |
| [Waveshare ESP32-S3-Touch-LCD-4.3](https://www.waveshare.com/esp32-s3-touch-lcd-4.3.htm) | 4,3 pulgadas, 800 × 480 | ESP32-S3; táctil capacitivo según la variante | Alternativa de 4,3 pulgadas con documentación del fabricante |
| **Sunton ESP32-8048S070C** | 7 pulgadas, 800 × 480 RGB | ESP32-S3, táctil capacitivo en la versión C | Mayor superficie de pantalla con la misma resolución |
| [**Waveshare ESP32-S3-Touch-LCD-7**]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-7/) | 7 pulgadas, 800 × 480 IPS | ESP32-S3, táctil capacitivo de 5 puntos | Alternativa de 7 pulgadas con interfaces CAN y RS485 documentadas |

Consulte la documentación actual de cada fabricante para verificar memoria, conexiones y controlador táctil. Que dos placas tengan nombres parecidos no significa que sus pinouts o configuraciones de software sean intercambiables.

Para una comparación más específica, puede utilizar el [selector de pantallas táctiles ESP32 de 4,3 pulgadas]({{ site.url }}/tools/esp32-touchscreen-selector/esp32-4-3-inch-touchscreen/) o el [selector de pantallas 800 × 480]({{ site.url }}/tools/esp32-touchscreen-selector/800x480/).

## Precio y disponibilidad del Sunton ESP32-8048S043C

**[Ver Sunton ESP32-8048S043C en AliExpress →](https://s.click.aliexpress.com/e/_c2zi4HDn){: rel="sponsored nofollow noopener" target="_blank"}**

Antes de realizar el pedido, confirme que el anuncio corresponde a la **versión capacitiva 8048S043C con GT911**, y no a la versión resistiva R o a la versión N sin táctil. Embedded Nerd no puede ver la identificación exacta del modelo detrás de la URL de afiliado abreviada. Por eso, revise cuidadosamente las imágenes y las especificaciones del vendedor.

Los precios, gastos de envío, impuestos y existencias varían según el vendedor y el destino. Compare el **precio final con envío incluido** y compruebe la revisión de la placa antes de comprar. Encontrará más datos técnicos y opciones de compra en la [página de producto del Sunton ESP32-8048S043C]({{ site.url }}/products/sunton-esp32-8048s043c/).

## Preguntas frecuentes

### ¿Merece la pena comprar el Sunton ESP32-8048S043C?

Es una buena opción si quiere integrar un ESP32-S3 y una pantalla táctil capacitiva de 4,3 pulgadas y 800 × 480 píxeles en una sola placa. Lo importante es que la revisión exacta del hardware coincida con la configuración de software prevista.

### ¿Qué controlador táctil utiliza el 8048S043C?

La versión capacitiva utiliza un **GT911** mediante I²C, normalmente en GPIO19 y GPIO20.

### ¿El 8048S043C tiene PSRAM?

La habitual versión N16R8 dispone de **8 MB de PSRAM Octal** y **16 MB de Flash**. Compruebe el anuncio concreto antes de comprar, ya que existen varias versiones.

### ¿El 8048S043C es capacitivo o resistivo?

La **versión C** es capacitiva y utiliza el GT911. La **versión R** utiliza hardware táctil resistivo y otro controlador. Algunos anuncios utilizan **8048S043** sin sufijo como nombre de familia; algunas referencias identifican una **versión N** sin táctil. Compruebe la placa exacta antes de comprar.

### ¿La versión 8048S043N tiene pantalla táctil?

Algunas referencias describen la variante N como una versión sin táctil. No dé por hecho que incluye un GT911. Compruebe el anuncio y la revisión de la placa.

### ¿La placa es adecuada para LVGL?

Sí. El ESP32-S3, la pantalla RGB y la PSRAM son adecuados para interfaces LVGL exigentes, siempre que la configuración de pantalla sea correcta. Si compara placas para este tipo de proyectos, consulte el [selector de pantallas LVGL ESP32-S3]({{ site.url }}/tools/esp32-touchscreen-selector/esp32-s3-lvgl/).

### ¿Debería comprar el 8048S043C u otra pantalla táctil ESP32?

Depende del tamaño de pantalla, la resolución, la tecnología táctil, los GPIO que necesite y el soporte de software.

Compare el tamaño de pantalla, la resolución y la PSRAM con el [selector de pantallas táctiles ESP32]({{ site.url }}/tools/esp32-touchscreen-selector/).

### ¿Puedo conectar sensores adicionales?

Sí. Utilice los pines libres de las cabeceras de expansión y compruebe que los dispositivos I²C no tengan conflictos de dirección con el controlador táctil.

Por ejemplo, puede utilizar sensores I²C como el [MPU6050]({{ site.url }}/mpu6050-arduino-guide/) o el [BMA400]({{ site.url }}/bma400-esp32-tutorial-wiring-code-arduino-guide/), siempre que haya pines y direcciones I²C disponibles.

## Sobre el autor

**Embedded Nerd** publica guías prácticas sobre placas ESP32, hardware embebido, pantallas, sensores y herramientas de desarrollo. Esta guía se basa en documentación del fabricante y proyectos de la comunidad citados. La placa no se ha probado de forma independiente para este artículo.

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
    { "@type": "ListItem", "position": 1, "name": "Inicio", "item": {{ site.url | append: "/" | jsonify }} },
    { "@type": "ListItem", "position": 2, "name": "Guía de pantallas táctiles ESP32", "item": {{ "/esp32-touchscreen-displays-guide/" | absolute_url | jsonify }} },
    { "@type": "ListItem", "position": 3, "name": {{ page.title | jsonify }}, "item": {{ page.url | absolute_url | jsonify }} }
  ]
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    { "@type": "Question", "name": "¿Merece la pena comprar el Sunton ESP32-8048S043C?", "acceptedAnswer": { "@type": "Answer", "text": "Es una buena opción si quiere integrar un ESP32-S3 y una pantalla táctil capacitiva de 4,3 pulgadas y 800 × 480 píxeles en una sola placa. Compruebe que la revisión del hardware coincide con la configuración de software." } },
    { "@type": "Question", "name": "¿Qué controlador táctil utiliza el 8048S043C?", "acceptedAnswer": { "@type": "Answer", "text": "La versión capacitiva utiliza un GT911 mediante I²C, normalmente en GPIO19 y GPIO20." } },
    { "@type": "Question", "name": "¿El 8048S043C tiene PSRAM?", "acceptedAnswer": { "@type": "Answer", "text": "La habitual versión N16R8 dispone de 8 MB de PSRAM Octal y 16 MB de Flash. Compruebe el anuncio concreto porque existen varias versiones." } },
    { "@type": "Question", "name": "¿El 8048S043C es capacitivo o resistivo?", "acceptedAnswer": { "@type": "Answer", "text": "La versión C es capacitiva y utiliza el GT911. La versión R utiliza hardware táctil resistivo y otro controlador." } },
    { "@type": "Question", "name": "¿La versión 8048S043N tiene pantalla táctil?", "acceptedAnswer": { "@type": "Answer", "text": "Algunas referencias describen la variante N como una versión sin táctil. Compruebe el anuncio y la revisión de la placa." } },
    { "@type": "Question", "name": "¿La placa es adecuada para LVGL?", "acceptedAnswer": { "@type": "Answer", "text": "Sí. El ESP32-S3, la pantalla RGB y la PSRAM son adecuados para interfaces LVGL exigentes, siempre que la configuración de pantalla sea correcta." } },
    { "@type": "Question", "name": "¿Debería comprar el 8048S043C u otra pantalla táctil ESP32?", "acceptedAnswer": { "@type": "Answer", "text": "Compare el tamaño de pantalla, la resolución, la tecnología táctil, los GPIO necesarios y el soporte de software." } },
    { "@type": "Question", "name": "¿Puedo conectar sensores adicionales?", "acceptedAnswer": { "@type": "Answer", "text": "Sí. Utilice pines libres de las cabeceras de expansión y compruebe posibles conflictos de direcciones I²C con el controlador táctil." } }
  ]
}
</script>

## Conclusión

El **Sunton ESP32-8048S043C** es una opción interesante si quiere utilizar una **pantalla táctil de 4,3 pulgadas y 800 × 480 píxeles** junto con un **ESP32-S3** en una sola placa.

Entre sus principales ventajas están la pantalla y el hardware táctil integrados, la PSRAM y la compatibilidad con interfaces gráficas exigentes como LVGL.

El principal compromiso es que la pantalla RGB, la configuración de PSRAM y las distintas variantes de hardware requieren más atención que un módulo de pantalla ESP32 más sencillo.

Si estas características encajan con su proyecto, merece la pena considerar el 8048S043C. Antes de comprar, asegúrese de que el sufijo y la revisión del hardware coinciden con su software.

### Guías y herramientas relacionadas

- [Guía de pantallas táctiles ESP32]({{ site.url }}/esp32-touchscreen-displays-guide/): compare tamaños, tecnologías táctiles, interfaces y requisitos de memoria.
- [Selector de pantallas táctiles ESP32]({{ site.url }}/tools/esp32-touchscreen-selector/): filtre placas por resolución, PSRAM, tipo de táctil e interfaz.
- [Waveshare ESP32-S3-Touch-LCD-4.3 – página de producto]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-4-3/): compare otra plataforma integrada de pantalla ESP32-S3 de 4,3 pulgadas.
- [Waveshare ESP32-S3-Touch-LCD-7 – página de producto]({{ site.url }}/products/waveshare-esp32-s3-touch-lcd-7/): alternativa de 7 pulgadas y 800 × 480 píxeles con mayor superficie física.
- [Escáner I²C para Arduino, ESP32 y ESP8266]({{ site.url }}/i2c-scanner-tutorial/): compruebe qué dispositivos I²C responden al diagnosticar conexiones táctiles o de sensores.
- [Buscador de direcciones I²C y comprobación de compatibilidad]({{ site.url }}/tools/i2c-address-lookup/): compruebe direcciones I²C y posibles conflictos con el GT911.
- [Sunton ESP32-8048S043C – página de producto]({{ site.url }}/products/sunton-esp32-8048s043c/): consulte las especificaciones y las opciones de compra actuales.
