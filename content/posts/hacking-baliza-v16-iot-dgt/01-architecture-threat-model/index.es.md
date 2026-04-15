---
title: "🚨📡 Baliza V16 IoT 1: Arquitectura, conectividad y modelo de amenazas"
date: 2026-04-15
draft: true
description: "Qué hay dentro de una baliza V16 IoT conectada, cómo está organizada y qué superficies de ataque merece la pena analizar."
summary: "Teardown técnico, componentes principales y modelo de amenazas inicial para una baliza V16 conectada."
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

## Tesis

Este artículo debe responder una pregunta simple: **qué sistema tenemos delante y por dónde merece la pena empezar a mirarlo**. La gracia no está solo en desmontar la baliza, sino en convertir un producto cerrado en un mapa técnico razonable.

## Qué ya está hecho

- Documentación visual de la PCB y su orientación.
- Identificación de componentes clave: MCU, módem, potencia, LED, GNSS/antenas.
- Notas bastante sólidas sobre arquitectura funcional y reparto de dominios.
- Material base para hablar de superficies físicas, firmware y red.

## Qué falta por cerrar antes de publicar

- Unificar nomenclatura y orientación de la placa en todas las imágenes.
- Revisar qué afirmaciones sobre componentes son confirmadas y cuáles son inferidas por contexto.
- Preparar un diagrama limpio de arquitectura del sistema.

## Material fuente principal

- `PCB.md`
- `Componentes/*.md`
- referencias externas del N32L403 y Y7080E

## Tono y enfoque recomendado

Más “ingeniería inversa rigurosa de un IoT conectado real” que “teardown curioso”. Este artículo tiene que vender método y criterio.
