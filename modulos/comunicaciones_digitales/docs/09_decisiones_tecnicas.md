# Decisiones técnicas

## Granularidad: 21 temas en vez de un módulo monolítico

**Decisión:** dividir el temario completo de la asignatura (4 capítulos, 32 subtemas) en 21 carpetas de tema dentro de `practicas/`, agrupando subtemas estrechamente relacionados (ej. "media, autocorrelación y autocovarianza" y "estacionariedad y ergodicidad" conviven en `01_procesos_aleatorios`).

**Alternativas consideradas:**
- Un único módulo grande desarrollado por un solo equipo — descartado: no era viable como una sola pasantía/colaboración, y no permite que distintos equipos trabajen en paralelo sobre temas independientes.
- Un tema por cada subtema exacto del temario (32 carpetas) — descartado por fragmentación excesiva; varios subtemas comparten fundamento teórico y tiene sentido pedagógico presentarlos juntos.

**Consecuencia:** cada tema puede desarrollarse, revisarse e integrarse de forma independiente, con su propio *Issue*, equipo y *pull request* (ver `GOVERNANCE.md`). El desarrollo puede avanzar en cualquier orden; no hay una dependencia estricta de ejecución entre temas, salvo la señalada explícitamente entre `03_cuantizacion` y `17_codificacion_fuente_shannon`.

## Fuente de datos intercambiable en vez de datos fijos por práctica

**Decisión:** extraer la generación del flujo de datos de entrada (`funciones/fuente/`) como funciones transversales, seleccionables mediante un parámetro `fuente` en el script de sistema, en vez de que cada práctica de modulación/codificación tenga su propia generación de bits fija.

**Motivación:** el requerimiento explícito era poder alimentar las prácticas tanto con datos sintéticos (bits o símbolos aleatorios, para análisis estadístico limpio) como con un mensaje real (texto, audio, imagen), sin duplicar la cadena de transmisión para cada caso.

**Alternativa considerada:** funciones de generación de datos independientes y duplicadas dentro de cada tema — descartada porque multiplica el mantenimiento y rompe la posibilidad de comparar los mismos escenarios (mismo mensaje) entre distintos temas de modulación o codificación.

## Cuantización como función compartida, no exclusiva del tema 03

**Decisión:** `cuantizar_uniforme.m` y `cuantizar_no_uniforme.m` viven en `funciones/cuantizacion/`, fuera de `practicas/03_cuantizacion/`, aunque ese es el tema que las enseña.

**Motivación:** son la pieza que conecta la conversión análoga-digital (capítulo 1 del temario) con la codificación de fuente y los teoremas de Shannon (capítulo 4). Mantenerlas como funciones compartidas es lo que permite que `funciones/fuente/audio_a_bits.m`, `imagen_a_bits.m` y el futuro tema `17_codificacion_fuente_shannon` reutilicen exactamente la misma cuantización que se estudia y valida en el tema 03, en lugar de tener implementaciones divergentes.

## Pendiente de decidir

- Versión mínima de MATLAB y *toolboxes* exactos requeridos: se definirán cuando se desarrolle el primer tema y se sepa qué funciones de *Communications Toolbox* o *Signal Processing Toolbox* resultan efectivamente necesarias (ver `docs/04_instalacion.md`, pendiente).
- Orden de desarrollo entre los 21 temas: no se fija de antemano; se decide vía *Issues* según disponibilidad de equipos (ver `README.md` del módulo para el mapa de estado).
