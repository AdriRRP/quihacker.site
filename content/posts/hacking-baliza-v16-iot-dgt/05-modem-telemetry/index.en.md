---
title: "🚨📡 V16 IoT Beacon 5: Facing the Modem — AT, UDP, and Telemetry Reverse Engineering"
date: 2026-04-15
draft: true
description: "Functional reverse engineering of the MCU↔modem channel: AT commands, UDP socket usage, payloads, and early correlations."
summary: "What the beacon tells the modem, what it sends over the network, and what can be inferred from the payload without overclaiming."
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

## Thesis

This one has huge narrative pull because it moves from copper to network behavior: **the MCU uses the modem like a command-driven network card**. The value is in demonstrating the functional model of the device, not just listing AT commands.

## Already done

- Capture and separation of MCU commands and modem responses/events.
- Identification of `NSOCR` / `NSOSTF` and UDP usage.
- Extraction of destination IP, port, and payload length.
- Initial payload decoding and correlation with IMEI and cell data.

## Still needed before publishing

- Gather more `NSOSTF` samples under different conditions.
- Correlate payload changes better with network state and, if possible, GNSS.
- Keep a very clear line between confirmed fields and hypotheses.

## Main source material

- `Diario de Laboratorio 3 - Análisis activo del tráfico UART.md`
- Y7080E notes

## Recommended angle

Elegant and clear. This can read like serious functional reverse engineering rather than “just sniffing”. Strong personal-brand material.
