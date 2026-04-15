---
title: "Baliza V16 IoT 2: Caracterización pasiva y reducción de la superficie"
date: 2026-04-15
draft: true
description: "Cómo reducir decenas de pads a unos pocos candidatos útiles mediante medidas pasivas y clasificación eléctrica."
summary: "Medición pasiva, priorización de pines y reducción segura del espacio de búsqueda en una PCB desconocida."
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

## Tesis

Aquí la idea fuerte es muy buena: **una placa apagada ya dice mucho si sabes escucharla**. Este artículo debería enseñar a pasar de decenas de pads indistintos a un conjunto pequeño de candidatos plausibles sin alimentar ni forzar la placa.

## Qué ya está hecho

- Análisis pasivo inicial de pines.
- Caracterización pasiva más fina con multímetro mejor y clasificación funcional.
- Tablas, criterios y discurso pedagógico bastante buenos.

## Qué falta por cerrar antes de publicar

- Congelar un único mapa de pines “canon”.
- Limpiar solapes entre Diario 1 y Diario 5.
- Elegir una sola tabla final, no dos versiones compitiendo.

## Material fuente principal

- `Diario de Laboratorio 1 - Análisis Pasivo de Pines.md`
- `Diario de Laboratorio 5 - Caracterización Pasiva.md`

## Tono y enfoque recomendado

Muy metodológico. Este puede ser uno de los mejores artículos de la serie si la promesa es clara: **cómo reducir incertidumbre sin pinchar a ciegas**.
