---
title: "🚨📡 Baliza V16 IoT 3: UART, consola de sistema y superficies de debug"
date: 2026-04-15
draft: true
description: "Identificación de UART, primeras capturas útiles y delimitación inicial de la superficie de debug."
summary: "De pads candidatos a canales reales: UART del módem, consola de sistema y primeras señales de control."
tags:
  - hardware-hacking
  - reverse-engineering
  - uart
  - embedded
series:
  - hacking-baliza-v16-iot-dgt
series_weight: 3
ShowToc: true
---

## Tesis

Este artículo debería ser el puente entre lo eléctrico y lo funcional: **ya no hablamos de pines abstractos, sino de canales que transmiten significado**. Aquí empiezan la UART, la consola de sistema y la lectura seria del arranque.

## Qué ya está hecho

- Identificación y validación de una UART útil.
- Capturas con AT commands y respuestas del módem.
- Logs de consola de sistema a 115200.
- Primeras observaciones sobre reset, boot y candidatos a debug.

## Qué falta por cerrar antes de publicar

- Resolver del todo la transición entre los mapas de pines de los distintos laboratorios.
- Separar con claridad “consola de sistema”, “UART MCU↔módem” y “superficie SWD”.
- Elegir una sola narrativa de descubrimiento.

## Material fuente principal

- `Diario de Laboratorio 2 - Identificación y validación de UART.md`
- `Diario de Laboratorio 4 - Reset, Boot y Superficie de Debug.md`
- `Diario de Laboratorio 6 - Búsqueda de Interfaces de Debug (UART, SWD).md`

## Tono y enfoque recomendado

Más “cómo validé una conversación real” que “encontré un pin y ya”. Aquí tienes un artículo con mucho valor práctico y muy buen ritmo narrativo.
