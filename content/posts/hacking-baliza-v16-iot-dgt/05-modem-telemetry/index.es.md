---
title: "🚨📡 Baliza V16 IoT 5: Frente al módem — AT, UDP y reverse de la telemetría"
date: 2026-04-15
draft: true
description: "Reverse funcional del canal MCU↔módem: comandos AT, socket UDP, payloads y primeras correlaciones útiles."
summary: "Qué le dice la baliza al módem, qué envía por red y qué puede inferirse del payload sin inventar más de la cuenta."
tags:
  - hardware-hacking
  - reverse-engineering
  - iot
  - nb-iot
  - cybersecurity
series:
  - hacking-baliza-v16-iot-dgt
series_weight: 5
ShowToc: true
---

## Tesis

Este artículo tiene un gancho enorme porque baja del cobre a la red: **el MCU usa el módem como una tarjeta de red por comandos**. Aquí el valor está en demostrar el modelo funcional del dispositivo y no solo en listar AT commands.

## Qué ya está hecho

- Captura y separación de órdenes del MCU y respuestas/eventos del módem.
- Identificación de `NSOCR` / `NSOSTF` y uso de UDP.
- Extracción de IP destino, puerto y longitud del payload.
- Decodificación inicial del payload y correlaciones con IMEI y celda.

## Qué falta por cerrar antes de publicar

- Conseguir más muestras de `NSOSTF` en condiciones distintas.
- Correlacionar mejor payload con estado de red y, si se puede, con GNSS.
- Dejar muy claro qué campos están confirmados y cuáles son hipótesis.

## Material fuente principal

- `Diario de Laboratorio 3 - Análisis activo del tráfico UART.md`
- notas del Y7080E

## Tono y enfoque recomendado

Muy elegante y muy claro. Aquí puedes sonar a reverse funcional serio, no solo a “sniffing”. Es uno de los artículos con más potencial de marca personal.
