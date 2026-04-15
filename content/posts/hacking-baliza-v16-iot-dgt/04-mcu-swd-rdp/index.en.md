---
title: "V16 IoT Beacon 4: Facing the MCU — SWD, Synchronized Reset, and RDP"
date: 2026-04-15
draft: true
description: "Real interaction with the MCU: working SWD, early boot control, and the limits imposed by RDP."
summary: "How to move from identifying SWD to controlling the core, and what it means when flash remains protected."
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

## Thesis

This may become the strongest article in the series. The thesis should not be “I tried to dump firmware”, but something more valuable: **what you can do when SWD exists, the core responds, and flash is still protected**.

## Already done

- SWD mapping through continuity analysis.
- Core detection with ST-Link/OpenOCD.
- Working `reset halt` and early boot control.
- SRAM read/write access.
- Confirmation that flash is not readable under the tested conditions.
- Physical `NRST` confirmation and use as a control point.

## Still needed before publishing

- Turn the draft material into one clean canonical lab.
- Review very carefully what is stated as “RDP confirmed” and the exact evidence behind it.
- Tighten the ethical framing and experimental limits.

## Main source material

- `Diario de Laboratorio 6 - Búsqueda de Interfaces de Debug (UART, SWD).md`
- `Diario de Laboratorio N - Plantilla 1.md`
- `Investigación ChatGPT - Extracción de Firmware.md` as support, not as evidence

## Recommended angle

Very sober, very Project Zero in spirit: **facts, limits, and the exact boundary between control and protection**. This one can position you extremely well.
