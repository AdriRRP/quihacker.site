+++
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
date = '{{ .Date }}'
draft = true
description = 'Qué encontré, por qué importa y qué aprenderá el lector.'
summary = 'Hallazgo principal en 1-2 frases, con impacto y promesa clara.'
tags = ['hardware-hacking', 'cybersecurity']
ShowToc = true
cover = { image = '/images/posts/REPLACE-ME/cover.png', alt = 'Imagen principal del artículo', caption = 'Imagen o diagrama con valor informativo real', relative = false, hidden = false, hiddenInList = false, hiddenInSingle = false }
images = ['/images/posts/REPLACE-ME/cover.png']
+++

<!--
ARQUETIPO: artículo de investigación en seguridad

QUÉ DEBE HACER ESTE POST
- Abrir con una tesis fuerte.
- Demostrar, no solo contar.
- Enseñar el método mental que llevó al hallazgo.
- Extraer una lección reusable más allá del target concreto.

HINTS DE FORMATO
- Hero image: una sola, informativa, no decorativa.
- Añade una figura útil cada vez que cambie el modelo mental del lector.
- Usa captions que expliquen por qué la imagen importa.
- Prioriza tablas, diagramas, screenshots anotados y logs pequeños sobre bloques enormes de texto.
- Un bloque de código o log solo si aporta evidencia o reproducibilidad.
- Si una imagen solo “queda bonita”, probablemente sobra.
-->

## El hallazgo en una frase

<!--
2-4 líneas máximo.
Estructura ideal:
"Analicé X y encontré Y, lo que permite/demuestra Z. Lo interesante no es solo el impacto, sino el patrón detrás."
-->

Escribe aquí el hook principal.

## Por qué importa

<!--
Responde pronto:
- impacto técnico
- impacto práctico
- por qué el lector debería seguir

No metas aún todo el background. Solo la promesa del artículo.
-->

- Qué se rompe:
- A quién afecta:
- Qué hace esto interesante:

## TL;DR

<!--
3-6 bullets, pensados para lectores que escanean.
-->

- Hallazgo:
- Evidencia clave:
- Impacto:
- Límite importante:
- Lección reusable:

## Qué tenía delante

<!--
Contexto mínimo del target.
Usa aquí:
- foto/diagrama general
- tabla de componentes
- arquitectura simplificada

VISUAL
- Buena figura: esquema simple, PCB anotada, diagrama de secuencia.
- Mala figura: collage confuso o foto sin anotaciones.
-->

Describe aquí el sistema, superficie de ataque y restricciones.

## Hipótesis iniciales

<!--
Este bloque da mucha sensación de rigor.
Cuenta qué creías posible, qué descartabas y qué señales buscabas.
-->

- Hipótesis 1:
- Hipótesis 2:
- Qué habría invalidado cada hipótesis:

## La observación que cambió el juego

<!--
Este suele ser el corazón narrativo del artículo.
La mejor pieza de evidencia temprana:
- una medida
- un log
- un pulso
- una diferencia
- una inconsistencia
-->

Cuenta aquí el momento en que pasaste de intuición a dirección clara.

## Cómo lo validé

<!--
Ordena esto como una cadena de validación.
Ideal:
1. observación
2. experimento
3. confirmación
4. descarte de alternativas

VISUAL
- Logs cortos, tablas, capturas anotadas.
- No pegues 200 líneas si una tabla resume mejor.
-->

### 1. Preparación

### 2. Experimento

### 3. Resultado

### 4. Qué queda razonablemente descartado

## Evidencia clave

<!--
Aquí van los artefactos que sostienen el artículo.
Si usas código, logs o payloads:
- recórtalos
- anótalos
- explica qué debe mirar el lector
-->

### Tabla de evidencias

| Evidencia | Qué demuestra | Nivel de confianza |
| --- | --- | --- |
| Reemplazar | Reemplazar | Alto / Medio / Bajo |

### Fragmento representativo

```text
Pega aquí solo el fragmento que importa.
```

### Figura o diagrama

<!--
Recomendación visual:
- diagramas de secuencia para protocolos
- PCB anotada para hardware
- captura con 2-4 anotaciones, no 20
- destaca con flechas o círculos solo lo esencial
-->

## Qué demuestra realmente

<!--
Separa hechos de inferencias.
Muy importante para sonar senior y serio.
-->

### Confirmado

- 

### Inferido con bastante confianza

- 

### Aún no demostrado

- 

## El patrón general

<!--
Este bloque convierte un buen case study en investigación de verdad.
Pregunta:
- qué clase de fallo es esto
- dónde más aparecería
- cómo lo buscarías en otros sistemas
-->

Explica aquí la idea reusable detrás del caso.

## Implicaciones defensivas

<!--
No cierres solo con “qué bonito hack”.
Da lecciones para fabricantes, developers, blue teams o reviewers.
-->

- Mitigación 1:
- Mitigación 2:
- Qué no arregla un parche superficial:

## Disclosure y límites éticos

<!--
Especialmente útil si hay producto real, IoT, automoción, safety o bug bounty.
-->

- Qué se probó:
- Qué no se intentó:
- Qué información se omite por seguridad:
- Estado de divulgación:

## Conclusión

<!--
1-2 párrafos.
No repitas todo.
Remata con una idea fuerte y con identidad.
-->

Escribe aquí un cierre con tesis, aprendizaje y siguiente frontera.

## Apéndice

<!--
Opcional.
Úsalo para:
- comandos reproducibles
- mapas de pines
- tablas largas
- referencias

Mejor aquí que romper el ritmo del artículo principal.
-->

### Setup

### Referencias

- 
