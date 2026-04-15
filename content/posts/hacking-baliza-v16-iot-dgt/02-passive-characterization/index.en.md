---
title: "🚨📡 V16 IoT Beacon 2: Passive Characterization and Surface Reduction"
date: 2026-04-15
draft: true
description: "How to reduce dozens of pads to a few useful candidates through passive measurement and electrical classification."
summary: "Passive measurement, pin prioritization, and safe reduction of the search space on an unknown PCB."
tags:
  - hardware-hacking
  - reverse-engineering
  - iot
  - embedded
series:
  - hacking-baliza-v16-iot-dgt
series_weight: 2
ShowToc: true
---

## Thesis

The core idea here is excellent: **an unpowered board still tells a story if you know how to listen**. This article should show how to go from dozens of anonymous pads to a small set of plausible candidates without powering or forcing the board.

## Already done

- Initial passive pin analysis.
- Finer passive characterization with a better multimeter and functional classification.
- Good tables, criteria, and pedagogical framing.

## Still needed before publishing

- Freeze one canonical pin map.
- Remove overlap between Lab 1 and Lab 5.
- Choose one final table instead of two competing versions.

## Main source material

- `Diario de Laboratorio 1 - Análisis Pasivo de Pines.md`
- `Diario de Laboratorio 5 - Caracterización Pasiva.md`

## Recommended angle

Highly methodological. This can become one of the strongest pieces in the series if the promise is clear: **how to reduce uncertainty without poking blindly**.
