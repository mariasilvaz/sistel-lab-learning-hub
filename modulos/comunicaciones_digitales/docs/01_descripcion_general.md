# Descripción general

## Qué es este módulo

El módulo de Comunicaciones Digitales simula, de forma modular y configurable, el temario completo de la asignatura homónima: desde el análisis de señales aleatorias y su cuantificación, pasando por la cadena de modulación digital y codificación de canal, hasta los elementos fundamentales de la teoría de la información: entropía, capacidad de canal y teoremas de Shannon.

## Qué fenómenos o sistemas simula

- Estadística de señales aleatorias: autocorrelación, densidad espectral y comportamiento a través de sistemas LTI.
- Cuantificación de señales, uniforme y optimizada, como paso de conversión análoga-digital.
- Cadena completa de transmisión digital: codificación de línea, modulación M-PAM, M-QAM y M-PSK, canal AWGN, demodulación y cálculo de probabilidad de error.
- Codificación de canal: repetición, paridad, bloque lineal, cíclica, convolucional y desempeño frente al ruido.
- Elementos de teoría de la información: entropía, codificación de fuente, información mutua, capacidad de canal y teoremas de codificación de fuente y canal de Shannon.

## A qué asignaturas apoya

Comunicaciones Digitales como asignatura principal, además de Comunicaciones Móviles y Laboratorio I y II de Sistemas de Telecomunicaciones.

## Qué problema pedagógico resuelve

Estos contenidos normalmente se estudian de forma aislada entre capítulos y entre asignaturas, sin un entorno común que permita ver cómo se conectan. En particular, este módulo hace explícitos dos enlaces que suelen perderse:

1. **De la señal analógica al bit, y de vuelta a la teoría de la información.** El mismo mecanismo de cuantificación que se estudia en el tema `03_cuantificacion` convierte una señal analógica en bits y alimenta, más adelante, la comparación contra el teorema de codificación de fuente de Shannon en el tema `17_codificacion_fuente_shannon`.

2. **De un mensaje real a una transmisión completa.** Las prácticas de modulación y codificación no están limitadas a bits sintéticos: pueden alimentarse con un mensaje real, como texto, audio o imagen, a través de las funciones compartidas en `funciones/fuente/`. Esto permite comparar el mensaje original contra el recibido tras el canal, no solo una tasa de error abstracta.

## Cómo está organizado

Ver `docs/03_arquitectura.md` para el detalle de la arquitectura de funciones y `README.md` de este módulo para el mapa curricular completo con el estado de cada uno de los 21 temas.
