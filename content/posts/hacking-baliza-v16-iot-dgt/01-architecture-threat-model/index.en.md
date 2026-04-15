---
title: "V16 IoT Beacon 1: Architecture, Connectivity, and Threat Model"
date: 2026-04-15
draft: true
description: "What is inside a connected V16 beacon, how it is organized, and which attack surfaces are worth analyzing."
summary: "Technical teardown, key components, and an initial threat model for a connected V16 beacon."
tags:
  - hardware-hacking
  - reverse-engineering
  - iot
  - cybersecurity
  - embedded
series:
  - hacking-baliza-v16-iot-dgt
series_weight: 1
ShowToc: true
---

## Thesis

This article should answer one simple question: **what system is in front of us, and where is it actually worth looking first**. The value is not just in opening the beacon, but in turning a closed product into a usable technical map.

## Already done

- Visual PCB documentation and board orientation.
- Identification of key components: MCU, modem, power stages, LED, GNSS/antennas.
- Solid notes on functional architecture and domain separation.
- Enough material to discuss physical, firmware, and network attack surfaces.

## Still needed before publishing

- Unify naming and board orientation across every figure.
- Separate confirmed claims from context-based inferences.
- Prepare a clean system architecture diagram.

## Main source material

- `PCB.md`
- `Componentes/*.md`
- external references for the N32L403 and Y7080E

## Recommended angle

More “rigorous reverse engineering of a real connected IoT product” than “cool teardown”. This article should sell method and judgment.
