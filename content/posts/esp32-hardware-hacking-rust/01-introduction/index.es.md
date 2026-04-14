---
title: "📟🦀 Hardware Hacking en ESP32 con Rust 1: Introducción"
date: 2025-10-21
draft: true
tags:
  - hardware-hacking
  - esp32
  - rust
series:
  - esp32-hardware-hacking-rust
series_weight: 1
cover:
  image: "/images/posts/esp32-hardware-hacking-rust/01-introduction.png"
  alt: "MCU (Food Truck) VS MPU (Restaurante) - Quihacker"
  caption: "Food Truck (MCU) VS Restaurante (MPU)"
  relative: false
  hidden: false
  hiddenInList: false
  hiddenInSingle: false
images: ["/images/posts/esp32-hardware-hacking-rust/01-introduction.png"]
---

# MCU vs MPU: el **food truck**  y el **restaurante**

Piensa en un **microcontrolador (MCU)** como un **food truck**: pequeño, autosuficiente, con todo lo necesario integrado para cocinar **una cosa muy bien** y **en el acto**.
Un **microprocesador/SoC (MPU)** es un **restaurante**: enorme, con cocina industrial, personal, normas, reservas y un menú inmenso… pero con **burocracia** y tiempos.

---

## ¿Qué es un MCU? - **El food truck**

* **Todo en uno, en poco espacio**: el food truck trae **plancha, neverita, ingredientes y utensilios** dentro.
  → MCU = **CPU + memoria + periféricos (GPIO, ADC, timers, UART/I²C/SPI)** en el mismo chip.

* **Arranque instantáneo**: subes la persiana y a servir.
  → Enciendes y el firmware corre **en milisegundos**.

* **Un menú corto, perfecto**: hace **pocas cosas, pero con timing perfecto** (freír, tostar, servir).
  → **Tiempo real** y **bajo jitter**; ideal para señales y pines precisos.

* **Eficiente y discreto**: consume poco; puede vivir con una **batería** o una **CR2032**.
  → **Modos sleep**, despierta por **interrupción** y vuelve a dormir.

* **Robusto ante sustos**: si se cuelga, el “**watchdog**” pita y reinicia la cocina.
  → Recupera **rápido** ante fallos o cortes de luz.

### Traducción de cosas del food truck a partes del MCU

* **Cocinero principal** → CPU
* **Recetario plastificado** (pegado a la ventana) → **Flash** (programa)
* **Tabla de cortar** → **RAM** (datos vivos)
* **Pinzas/utensilios** → **GPIO** (entradas/salidas)
* **Probar la salsa** → **ADC** (leer analógico)
* **Temporizadores de cocina** → **Timers** (medir/esperar)
* **Rueda del fuego** → **PWM** (control fino, p. ej., brillo/motores)
* **Walkie con otros puestos** → **UART/I²C/SPI** (buses)
* **Lista de tareas en la pared** → **RTOS** (si lo usas)
* **Cerrar a medias pero escuchar golpes** → **sleep + wake** por interrupción
* **Pitido si te atascas** → **watchdog** (auto-reset)

---

## ¿Qué es un MPU/SoC? — **El restaurante**

* **Infraestructura y personal**: cocina grande, **chefs, camareros, gerente**, reservas, TPV…
  → **Sistema operativo** (kernel, drivers), **procesos**, **planificador**, **FS**, **red**, **GPU**…

* **Menú enorme**: puedes hacer **desde sushi a banquetes** (visión por computador, servidores, GUIs…).
  → Mucha **RAM**, **almacenamiento**, librerías, **multitarea**.

* **Pero… con burocracia**: abrir el local lleva tiempo; hay **colas**, **turnos**, normas.
  → **Boot lento**, **latencias** del scheduler; acceder a hardware pasa por **drivers**.

* **Potencia y comodidad, a cambio de consumo**: luces, neveras y hornos **siempre encendidos**.
  → Más **energía** y **complejidad** para tareas que quizá un food truck haría más simple.

### Traducción de cosas del restaurante a partes del MPU/SoC

* **Chef ejecutivo** → CPU potente
* **Gerente y normativa** → **Kernel/OS**
* **Cocineros especializados** → **drivers**
* **Cámaras frigoríficas** → **RAM**
* **Despensa** → **almacenamiento** (eMMC/SD/SSD)
* **Maître** → **planificador** (scheduler)
* **Comandas** → **llamadas al sistema** (syscalls)
* **Pantalla de menú gigante** → **GPU/Display**
* **Reparto a domicilio** → **red/stack TCP/IP**
* **Preparar el local** → **tiempo de arranque**

---

## ¿Cuándo te conviene cada uno?

### El **food truck (MCU)** gana cuando necesitas…

* **Reflejos**: leer un pin y responder **ya** (timing exacto, PWM, captura de señales).
* **Bajo consumo**: meses con una pila, **despertar por sensor** y volver a dormir.
* **Simplicidad física**: pocos cables, placa pequeña, barato y fácil de integrar.
* **Robustez**: cero sistema de archivos, arranque inmediato, **poca magia negra**.

**Ejemplos “wow” en casa/ofi:**

* **Sniff/Replay de mandos IR** (AC/TV) con timings perfectos.
* **Abrir el portero** con un relé y ventanas horarias (demo ética).
* **Emular un sensor** (I²C/1-Wire) para testear calderas/termóstatos.
* **HID educativo** (BadUSB benigno) que teclea al conectar, al instante.
* **Glitch de laboratorio** con pulsos cronometrados al μs/ns.

### El **restaurante (MPU/SoC)** brilla cuando necesitas…

* **Cocina pesada**: visión, IA, dashboards, bases de datos, NAS.
* **Mucha conectividad y UX**: web, GUI, multitarea, almacenamiento grande.

---

## La opción pro: **aparcado en la puerta del restaurante**

Lo mejor de ambos mundos: el **restaurante (RPi/VoCore)** piensa, registra, sube a la nube; el **food truck (MCU)** toca el cobre con precisión.
Ejemplo: **ESP32** leyendo sensores y controlando actuadores; una **RPi** hace la visualización y la red.

---

## TL;DR para tu post

* **MCU = Food truck**: arranca en nada, menú corto pero **perfecto**, timing quirúrgico, poco consumo.
* **MPU = Restaurante**: potencia y menú gigante, pero **burocracia** y energía.
* Para **hardware hacking**, empieza por el **food truck**: es donde realmente “tocas el cable”.

Si quieres, te lo maquetamos tal cual para abrir la serie del **ESP32** con un mini-dibujo (food truck con etiquetas tipo “GPIO”, “ADC”, “Timers”) y un bloque lateral “¿Y si necesito restaurante?”.

https://www.ibm.com/think/topics/microcontroller-vs-microprocessor
https://www.ibm.com/think/author/josh-schneider
