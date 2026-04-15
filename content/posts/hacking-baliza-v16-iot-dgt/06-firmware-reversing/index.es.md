---
title: "Baliza V16 IoT 6: Firmware, RAM y siguientes pasos de reversing"
date: 2026-04-15
draft: true
description: "Qué podría contarse sobre firmware y reversing sin prometer de más: RAM, límites reales y próximos pasos con sentido."
summary: "Artículo opcional para cuando haya suficiente evidencia sobre RAM, reversing útil y límites impuestos por la protección del target."
tags:
  - hardware-hacking
  - reverse-engineering
  - firmware
  - embedded
  - cybersecurity
series:
  - hacking-baliza-v16-iot-dgt
series_weight: 6
ShowToc: true
---

## Tesis

Este artículo solo merece existir si aporta algo real. La idea no sería “y ahora viene la magia”, sino **qué información útil sigue siendo accesible cuando el firmware no cae, qué dice la RAM y qué límites impone el objetivo**.

## Qué ya está hecho

- Acceso a SRAM.
- Intentos de stub desde RAM.
- Evidencia de frontera entre memoria accesible e inaccesible.
- Hipótesis razonables sobre cómo seguir sin vender humo.

## Qué falta por cerrar antes de publicar

- Volcado útil de RAM en estado “caliente”.
- Criterio claro sobre si hay material suficiente para un artículo propio.
- Decidir si el cierre de la serie es “lo que aprendí” o “por dónde seguiría”.

## Material fuente principal

- `Diario de Laboratorio N - Plantilla 1.md`
- notas futuras de RAM / reversing

## Tono y enfoque recomendado

Solo publicar si hay suficiente sustancia. Si no, es mejor cerrar la serie con el artículo del módem y dejar este como futura continuación.
