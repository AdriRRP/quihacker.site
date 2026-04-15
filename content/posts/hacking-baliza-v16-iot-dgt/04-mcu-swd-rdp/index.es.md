---
title: "🚨📡 Baliza V16 IoT 4: Frente a la MCU — SWD, reset sincronizado y RDP"
date: 2026-04-15
draft: true
description: "Interacción real con la MCU: SWD funcional, control del arranque y límites impuestos por RDP."
summary: "Cómo pasar de identificar SWD a controlar el core, y qué significa encontrarse con RDP en un objetivo real."
tags:
  - hardware-hacking
  - reverse-engineering
  - swd
  - embedded
  - cybersecurity
series:
  - hacking-baliza-v16-iot-dgt
series_weight: 4
ShowToc: true
---

## Tesis

Este puede ser el artículo más fuerte de la serie. La tesis no debería ser “intenté dumpear firmware”, sino algo mucho más valioso: **qué puedes hacer cuando SWD existe, el core responde, pero la flash sigue protegida**.

## Qué ya está hecho

- Mapeo de SWD por continuidad.
- Detección del core con ST-Link/OpenOCD.
- `reset halt` funcional y control temprano del arranque.
- Lectura/escritura en SRAM.
- Confirmación de que la flash no es legible en las condiciones probadas.
- Confirmación de `NRST` físico y uso como punto de control.

## Qué falta por cerrar antes de publicar

- Convertir el material de borrador en un lab canónico limpio.
- Revisar muy bien qué afirmas como RDP “confirmado” y con qué evidencia exacta.
- Pulir la parte ética y de límites experimentales para que quede impecable.

## Material fuente principal

- `Diario de Laboratorio 6 - Búsqueda de Interfaces de Debug (UART, SWD).md`
- `Diario de Laboratorio N - Plantilla 1.md`
- `Investigación ChatGPT - Extracción de Firmware.md` como apoyo, no como prueba

## Tono y enfoque recomendado

Muy sobrio, muy Project Zero en espíritu: **hechos, límites, frontera exacta de control y protección**. Esto te posiciona muy bien.
