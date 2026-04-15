---
title: "🚨📡 V16 IoT Beacon 3: UART, System Console, and Debug Surfaces"
date: 2026-04-15
draft: true
description: "UART identification, first useful captures, and an initial delimitation of the debug surface."
summary: "From candidate pads to real channels: modem UART, system console, and the first control signals."
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

## Thesis

This article should be the bridge between electrical observation and functional understanding: **we are no longer talking about abstract pins, but about channels that carry meaning**. This is where UART, the system console, and serious boot analysis begin.

## Already done

- Identification and validation of a useful UART.
- Captures with AT commands and modem responses.
- System console logs at 115200.
- Early observations around reset, boot, and debug candidates.

## Still needed before publishing

- Fully resolve the transition between the different pin maps across labs.
- Clearly separate “system console”, “MCU↔modem UART”, and “SWD surface”.
- Pick one clean discovery narrative.

## Main source material

- `Diario de Laboratorio 2 - Identificación y validación de UART.md`
- `Diario de Laboratorio 4 - Reset, Boot y Superficie de Debug.md`
- `Diario de Laboratorio 6 - Búsqueda de Interfaces de Debug (UART, SWD).md`

## Recommended angle

More “how I validated a real conversation” than “I found a pin”. This has strong practical value and very good narrative momentum.
