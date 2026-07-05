# Decisiones técnicas

## Granularidad: 21 temas en vez de un módulo monolítico

**Decisión:** dividir el temario completo de la asignatura en 21 carpetas de tema dentro de `practicas/`, agrupando subtemas estrechamente relacionados. Por ejemplo, “media, autocorrelación y autocovarianza” y “estacionariedad y ergodicidad” conviven en `01_procesos_aleatorios`.

**Alternativas consideradas:**

- Un único módulo grande desarrollado por un solo equipo. Se descartó porque no era viable como una sola pasantía o colaboración, y no permite que distintos equipos trabajen en paralelo sobre temas independientes.
- Un tema por cada subtema exacto del temario. Se descartó por fragmentación excesiva, porque varios subtemas comparten fundamento teórico y tiene sentido pedagógico presentarlos juntos.

**Consecuencia:** cada tema puede desarrollarse, revisarse e integrarse de forma independiente, con su propio *Issue*, equipo y *pull request*. El desarrollo puede avanzar en cualquier orden; no hay una dependencia estricta de ejecución entre temas, salvo la relación explícita entre `03_cuantificacion` y `17_codificacion_fuente_shannon`.

## Fuente de datos intercambiable en vez de datos fijos por práctica

**Decisión:** extraer la generación del flujo de datos de entrada (`funciones/fuente/`) como funciones transversales, seleccionables mediante un parámetro `fuente` en el script de sistema, en vez de que cada práctica de modulación o codificación tenga su propia generación de bits fija.

**Motivación:** el requerimiento explícito era poder alimentar las prácticas tanto con datos sintéticos, como bits o símbolos aleatorios, como con un mensaje real, por ejemplo texto, audio o imagen, sin duplicar la cadena de transmisión para cada caso.

**Alternativa considerada:** funciones de generación de datos independientes y duplicadas dentro de cada tema. Se descartó porque multiplica el mantenimiento y rompe la posibilidad de comparar los mismos escenarios entre distintos temas de modulación o codificación.

## Cuantización como función compartida, no exclusiva del tema 03

**Decisión:** `cuantizar_uniforme.m` y `cuantizar_no_uniforme.m` viven en `funciones/cuantizacion/`, fuera de `practicas/03_cuantificacion/`, aunque ese es el tema que las enseña.

**Motivación:** son la pieza que conecta la conversión análoga-digital con la codificación de fuente y los teoremas de Shannon.

Mantenerlas como funciones compartidas permite que `funciones/fuente/audio_a_bits.m`, `imagen_a_bits.m` y el futuro tema `17_codificacion_fuente_shannon` reutilicen exactamente la misma cuantización que se estudia y valida en el tema 03, en lugar de tener implementaciones divergentes.

## Pendiente de decidir

- Versión mínima de MATLAB y *toolboxes* exactos requeridos. Se definirán cuando se desarrolle el primer tema y se sepa qué funciones de Communications Toolbox o Signal Processing Toolbox resultan efectivamente necesarias.
- Orden de desarrollo entre los 21 temas. No se fija de antemano; se decide vía *Issues* según disponibilidad de equipos.
