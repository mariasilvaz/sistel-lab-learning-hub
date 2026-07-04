# Cuantización (`funciones/cuantizacion/`)

Funciones compartidas de cuantización, desarrolladas como parte del tema `practicas/03_cuantizacion/`, pero reutilizadas por otras funciones del módulo (en particular `funciones/fuente/audio_a_bits.m` e `imagen_a_bits.m`) y potencialmente por el tema `17_codificacion_fuente_shannon`.

## Funciones planeadas (⚪ pendientes de desarrollo)

| Función | Descripción |
| --- | --- |
| `cuantizar_uniforme.m` | Cuantización uniforme de una señal, con número de niveles configurable. |
| `cuantizar_no_uniforme.m` | Cuantización no uniforme (companding tipo mu-law/A-law, o diseño Lloyd-Max), para ilustrar la **optimización** de la cuantización frente al esquema uniforme. |

## Por qué viven aquí y no solo dentro del tema 03

`03_cuantizacion` es donde se enseña y compara el fenómeno (señal aleatoria genérica, distintos niveles de cuantización, error de cuantización). Pero la operación de cuantizar en sí es una pieza reutilizable que otras partes del módulo necesitan (por ejemplo, para poder transmitir audio o imagen real), así que la función vive en `funciones/` y el tema `03_cuantizacion` la usa e ilustra, en lugar de contener su propia copia.

Cada función, cuando se desarrolle, debe seguir `docs/plantillas/plantilla_funcion.m` y el estándar de código del proyecto.
