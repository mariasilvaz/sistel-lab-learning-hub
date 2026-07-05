# Comunicaciones Digitales

Módulo de simulación que cubre el temario completo de la asignatura de Comunicaciones Digitales: desde procesos aleatorios y cuantificación, pasando por modulación digital y codificación de canal, hasta los elementos fundamentales de la teoría de la información. Incluye una arquitectura de "fuente de datos" intercambiable que permite ejecutar las prácticas de transmisión tanto con datos sintéticos (bits o símbolos aleatorios) como con un mensaje real (texto, audio o imagen), pasando en ese caso por la misma cuantización que se estudia en el tema 03.

**Estado general:** 🟡 En planeación — estructura y estándares definidos, desarrollo de temas individuales pendiente de asignación vía *Issues*.

## Asignaturas relacionadas

Comunicaciones Digitales, Comunicaciones Móviles, Laboratorio I y II de Sistemas de Telecomunicaciones.

## Mapa curricular (temas y estado)

| # | Carpeta (`practicas/`) | Tema | Estado |
| --- | --- | --- | --- |
| 01 | `01_procesos_aleatorios` | Procesos aleatorios: media, autocorrelación, autocovarianza | ⚪ Pendiente |
| 02 | `02_densidad_espectral_lti` | Densidad espectral y sistemas LTI | ⚪ Pendiente |
| 03 | `03_cuantizacion` | Cuantificación de señales aleatorias (y su optimización) | ⚪ Pendiente |
| 04 | `04_awgn_bernoulli` | Ruido AWGN y procesos Bernoulli | ⚪ Pendiente |
| 05 | `05_codificacion_linea` | Codificación de línea | ⚪ Pendiente |
| 06 | `06_pulsos_nyquist_isi` | Pulsos Nyquist y control de ISI | ⚪ Pendiente |
| 07 | `07_modulacion_pam` | Modulación M-PAM | ⚪ Pendiente |
| 08 | `08_modulacion_qam_psk` | Modulación M-QAM y M-PSK | ⚪ Pendiente |
| 09 | `09_probabilidad_error` | Probabilidad de error en modulación digital | ⚪ Pendiente |
| 10 | `10_ojo_constelacion_evm` | Diagramas de ojo, constelación y EVM | ⚪ Pendiente |
| 11 | `11_codigos_repeticion_paridad` | Códigos de repetición y verificación de paridad | ⚪ Pendiente |
| 12 | `12_codigos_bloque_lineales` | Códigos de bloque lineales | ⚪ Pendiente |
| 13 | `13_codigos_ciclicos` | Códigos cíclicos | ⚪ Pendiente |
| 14 | `14_codigos_convolucionales` | Códigos convolucionales | ⚪ Pendiente |
| 15 | `15_desempeno_codigos_canal` | Desempeño de códigos de canal frente al ruido | ⚪ Pendiente |
| 16 | `16_informacion_entropia` | Información y entropía | ⚪ Pendiente |
| 17 | `17_codificacion_fuente_shannon` | Codificación de fuente y teorema de Shannon | ⚪ Pendiente |
| 18 | `18_canales_discretos` | Canales discretos sin memoria e información mutua | ⚪ Pendiente |
| 19 | `19_codificacion_canal_shannon` | Teorema de codificación de canal de Shannon | ⚪ Pendiente |
| 20 | `20_canales_continuos` | Canales continuos de entrada discreta y de forma de onda | ⚪ Pendiente |
| 21 | `21_capacidad_canal_awgn` | Capacidad del canal AWGN | ⚪ Pendiente |

*(⚪ Pendiente · 🟡 En desarrollo · 🟢 Integrado y validado — se actualiza en cada pull request que toque un tema)*

## Funciones compartidas

Además de las funciones propias de cada tema, el módulo tiene subcarpetas transversales en `funciones/` para lógica que se repite entre muchos temas — ver `docs/03_arquitectura.md` para el detalle completo:

- **`funciones/fuente/`** — genera o reconstruye el flujo de datos de entrada: bits aleatorios, símbolos aleatorios, o un mensaje real (texto, audio, imagen).
- **`funciones/cuantizacion/`** — cuantización uniforme y no uniforme, reutilizada por `funciones/fuente/` para audio e imagen.
- **`funciones/analisis_senales/`** — espectro (`calcular_espectro.m`, ya implementada), autocorrelación, densidad espectral.
- **`funciones/canal/`** — ruido AWGN, canal multitrayecto.
- **`funciones/metricas/`** — BER, SER, EVM.
- **`funciones/visualizacion/`** — gráficas estandarizadas (constelación, diagrama de ojo, espectro).
- **`funciones/pulsos/`** — pulsos conformadores (rect, sinc, coseno alzado), nacidos en el Tema 06 y reutilizados por los Temas 07 y 08.

Ver el `README.md` de cada subcarpeta para el estado detallado de sus funciones.

## Dependencias

- **MATLAB:** por definir cuando se desarrolle el primer tema.
- **Toolboxes:** por definir (previsiblemente Communications Toolbox y Signal Processing Toolbox, dada la licencia campus disponible).

## Uso rápido

Aún no aplica — no hay ningún tema desarrollado todavía. Cuando el primer tema esté integrado, esta sección tendrá instrucciones concretas de ejecución (ver `docs/plantillas/plantilla_readme_modulo.md`).

## Documentación completa

- [`docs/01_descripcion_general.md`](./docs/01_descripcion_general.md)
- [`docs/02_metodologia.md`](./docs/02_metodologia.md)
- [`docs/03_arquitectura.md`](./docs/03_arquitectura.md)
- [`docs/04_instalacion.md`](./docs/04_instalacion.md)
- [`docs/05_guia_usuario.md`](./docs/05_guia_usuario.md)
- [`docs/06_guia_desarrollador.md`](./docs/06_guia_desarrollador.md)
- [`docs/07_pruebas.md`](./docs/07_pruebas.md)
- [`docs/08_resultados.md`](./docs/08_resultados.md)
- [`docs/09_decisiones_tecnicas.md`](./docs/09_decisiones_tecnicas.md)

## Autoría

- **Diseño de la estructura del módulo:** definido colaborativamente antes del inicio del desarrollo (ver `docs/09_decisiones_tecnicas.md`).
- **Desarrollo por tema:** por asignar — cada tema puede tener su propio equipo (estudiante(s) + asesor), ver `GOVERNANCE.md`.
