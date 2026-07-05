# Arquitectura

## Organización general

```text
comunicaciones_digitales/
├── funciones/
│   ├── fuente/             ← generación/reconstrucción del flujo de datos de entrada
│   ├── cuantizacion/       ← cuantización uniforme y no uniforme
│   ├── analisis_senales/   ← espectro, autocorrelación, densidad espectral
│   ├── pulsos/             ← pulsos conformadores: rectangular, sinc, coseno alzado
│   ├── canal/              ← ruido AWGN, canal multitrayecto
│   ├── metricas/           ← BER, SER, EVM
│   ├── visualizacion/      ← gráficas estandarizadas: constelación, ojo, espectro
│   └── ...                 ← funciones específicas de un solo tema, si no encajan arriba
├── practicas/
│   ├── 01_procesos_aleatorios/
│   ├── 02_densidad_espectral_lti/
│   ├── 03_cuantificacion/
│   ├── ...
│   └── 21_capacidad_canal_awgn/
├── docs/
└── validacion/
```

El módulo está organizado en 21 temas, agrupados en 4 bloques que siguen los capítulos del temario de Comunicaciones Digitales: procesos aleatorios y cuantificación, modulación digital, codificación de canal y teoría de la información. El detalle de cada tema y su estado está en el `README.md` del módulo.

## Siete categorías de funciones transversales

No toda función vive dentro de un solo tema. Siete subcarpetas de `funciones/` agrupan lógica que se repite a través de muchos temas. La regla general es: **si dos o más temas necesitarían la misma función, va en una subcarpeta transversal y no se duplica dentro de cada tema.**

| Subcarpeta | Qué resuelve | Ejemplo de función |
| --- | --- | --- |
| `fuente/` | Generar o reconstruir el flujo de datos de entrada, sintético o mensaje real | `generar_bits_aleatorios.m` |
| `cuantizacion/` | Cuantización uniforme/no uniforme, reutilizada por `fuente/` para audio e imagen | `cuantizar_uniforme.m` |
| `analisis_senales/` | Caracterizar una señal en tiempo o frecuencia: espectro, autocorrelación, PSD | `calcular_espectro.m` |
| `pulsos/` | Generar pulsos conformadores reutilizables en transmisión digital | `pulso_raised_cosine.m` |
| `canal/` | Modelar el efecto del canal sobre la señal transmitida | `generar_ruido_awgn.m` |
| `metricas/` | Calcular métricas de desempeño de forma consistente entre esquemas | `calcular_ber.m` |
| `visualizacion/` | Gráficas repetidas con formato estandarizado: título, ejes, leyenda y rejilla | `graficar_constelacion.m` |

Ver el `README.md` de cada subcarpeta para el detalle y estado de sus funciones.

## `funciones/fuente/`

Cualquier tema que arme una cadena de transmisión necesita, como primer paso, conseguir una secuencia de bits o símbolos para transmitir. En vez de que cada tema reimplemente esto, `funciones/fuente/` ofrece un conjunto de generadores intercambiables mediante un parámetro configurable en el script de sistema:

```matlab
fuente = 'bits_aleatorios';  % 'bits_aleatorios' | 'simbolos_aleatorios' | 'texto' | 'audio' | 'imagen'
```

- `'bits_aleatorios'` / `'simbolos_aleatorios'` — para análisis estadístico puro: BER, SER o capacidad, sin depender de un mensaje específico.
- `'texto'` / `'audio'` / `'imagen'` — para ilustrar el sistema con un mensaje real y comparar el mensaje original contra el reconstruido tras el canal.

## `funciones/cuantizacion/`

`audio_a_bits.m` e `imagen_a_bits.m`, dentro de `funciones/fuente/`, necesitan cuantizar la señal analógica antes de convertirla en bits. Esa cuantización es exactamente el fenómeno que se estudia en el tema `03_cuantificacion`, así que las funciones viven en `funciones/cuantizacion/`, reutilizables por la práctica que enseña el fenómeno y por las funciones de fuente que lo aplican en un caso real.

## `funciones/analisis_senales/`

Casi cualquier tema necesita en algún momento caracterizar una señal en frecuencia. `calcular_espectro.m` resuelve un problema concreto: `fft()` de MATLAB no centra el espectro ni lo normaliza, así que sin esta función cada tema repetiría manualmente `fftshift`, normalización y construcción del eje de frecuencia, con el riesgo de hacerlo de forma distinta.

## `funciones/pulsos/`

La carpeta `funciones/pulsos/` agrupa los pulsos conformadores que conectan el tema `06_pulsos_nyquist_isi` con los temas posteriores de modulación, especialmente `07_modulacion_pam` y `08_modulacion_mqam_mpsk`.

Esta carpeta debe contener funciones puras de generación de pulsos, sin impresión por consola ni gráficas. Ejemplos previstos:

- `pulso_rect.m`
- `pulso_sinc.m`
- `pulso_raised_cosine.m`

La motivación es evitar que cada práctica de modulación implemente su propio pulso. Si el pulso rectangular, el sinc o el coseno alzado se implementan una sola vez y se reutilizan en toda la cadena, las comparaciones entre esquemas de modulación se hacen sobre una misma base de conformación de pulso.

## `funciones/canal/`

El ruido AWGN no pertenece solo al tema `04_awgn_bernoulli`: es el modelo de canal por defecto de gran parte de la cadena de transmisión. Centralizar `generar_ruido_awgn.m` asegura que la definición de SNR/Eb-No sea la misma en todos los temas que la usan.

## `funciones/metricas/`

BER, SER y EVM se calculan de forma consistente sin importar el esquema de modulación o codificación evaluado. Si cada tema implementara su propio cálculo de BER, las curvas de comparación entre esquemas podrían no ser comparables entre sí.

## `funciones/visualizacion/`

A diferencia de las funciones de cálculo, estas funciones sí generan gráficas. Son la excepción explícita reservada para funciones de visualización separadas. Encapsulan gráficas repetidas, como constelaciones, diagramas de ojo y espectros, para que cumplan automáticamente el formato obligatorio.

## El enlace cuantificación → codificación de fuente → Shannon

Este es el hilo conductor más importante del módulo:

```text
Señal analógica (ej. audio)
        │
        ▼
cuantizar_uniforme.m / cuantizar_no_uniforme.m   (tema 03_cuantificacion)
        │
        ▼
audio_a_bits.m                                    (funciones/fuente/)
        │
        ▼
secuencia de bits
        │
        ├──► temas 05-21: codificación de línea, modulación, canal, códigos...
        │
        └──► tema 17_codificacion_fuente_shannon:
             codificación de fuente sobre esta misma secuencia,
             contrastando el resultado contra el teorema de codificación
             de fuente de Shannon.
```

Cualquier desarrollador que trabaje en el tema `17_codificacion_fuente_shannon` debe partir de esta cadena y no reimplementar su propia cuantificación de ejemplo.

## El enlace pulsos Nyquist → modulación digital

El segundo hilo transversal importante del módulo es:

```text
Tema 06: pulsos Nyquist e ISI
        │
        ▼
funciones/pulsos/
        │
        ├──► tema 07_modulacion_pam:
        │     conformación de pulso para transmisión banda base
        │
        └──► tema 08_modulacion_mqam_mpsk:
              conformación de pulso para señales en dos dimensiones
```

Cualquier desarrollador que trabaje en modulación debe reutilizar los pulsos disponibles en `funciones/pulsos/` antes de crear una nueva implementación local.

## Separación función vs. script de sistema

Se mantiene la regla general del proyecto: las funciones de cálculo (`fuente/`, `cuantizacion/`, `analisis_senales/`, `pulsos/`, `canal/`, `metricas/`) no imprimen ni grafican. `funciones/visualizacion/` es la única subcarpeta que sí genera gráficas, como excepción prevista por el estándar.

Los scripts de sistema (`practicas/[tema]/`) son los que orquestan todo lo anterior, imprimen resultados con `fprintf()` y, si no usan una función de `visualizacion/`, generan sus propias gráficas siguiendo el mismo formato obligatorio.
