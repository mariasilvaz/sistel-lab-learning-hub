# Arquitectura

## Organización general

```
comunicaciones_digitales/
├── funciones/
│   ├── fuente/            ← generación/reconstrucción del flujo de datos de entrada
│   ├── cuantizacion/       ← cuantización uniforme y no uniforme
│   ├── analisis_senales/   ← espectro, autocorrelación, densidad espectral
│   ├── canal/              ← ruido AWGN, canal multitrayecto
│   ├── metricas/           ← BER, SER, EVM
│   ├── visualizacion/      ← gráficas estandarizadas (constelación, ojo, espectro)
│   └── ...                 ← funciones específicas de un solo tema, si no encajan arriba
├── practicas/
│   ├── 01_procesos_aleatorios/  … 21_capacidad_canal_awgn/
│   └── (cada carpeta: script(s) de sistema + guía de ese tema)
├── docs/
└── validacion/
```

21 temas, agrupados en 4 bloques que siguen los 4 capítulos del temario de la asignatura (procesos aleatorios y cuantificación; modulación digital; codificación de canal; teoría de la información). El detalle de cada tema y su estado está en el `README.md` del módulo.

## Seis categorías de funciones transversales

No toda función vive dentro de un solo tema. Seis subcarpetas de `funciones/` agrupan lógica que se repite a través de muchos temas — la regla general es: **si dos o más temas necesitarían la misma función, va en una subcarpeta transversal, no duplicada dentro de cada tema.**

| Subcarpeta | Qué resuelve | Ejemplo de función |
| --- | --- | --- |
| `fuente/` | Generar o reconstruir el flujo de datos de entrada (sintético o mensaje real) | `generar_bits_aleatorios.m` |
| `cuantizacion/` | Cuantización uniforme/no uniforme, reutilizada por `fuente/` para audio e imagen | `cuantizar_uniforme.m` |
| `analisis_senales/` | Caracterizar una señal en tiempo o frecuencia (espectro, autocorrelación, PSD) | `calcular_espectro.m` (ya implementada) |
| `canal/` | Modelar el efecto del canal sobre la señal transmitida | `generar_ruido_awgn.m` |
| `metricas/` | Calcular métricas de desempeño de forma consistente entre esquemas | `calcular_ber.m` |
| `visualizacion/` | Gráficas repetidas con formato ya estandarizado (título, ejes, leyenda, rejilla) | `graficar_constelacion.m` |

Ver el `README.md` de cada subcarpeta para el detalle y estado de sus funciones.

### `funciones/fuente/`

Cualquier tema que arme una cadena de transmisión (05 a 21, prácticamente) necesita, como primer paso, "conseguir una secuencia de bits (o símbolos) para transmitir". En vez de que cada tema reimplemente esto, `funciones/fuente/` ofrece un conjunto de generadores intercambiables mediante un parámetro configurable en el script de sistema:

```matlab
fuente = 'bits_aleatorios';  % 'bits_aleatorios' | 'simbolos_aleatorios' | 'texto' | 'audio' | 'imagen'
```

- `'bits_aleatorios'` / `'simbolos_aleatorios'` — para análisis estadístico puro (BER, SER, capacidad), sin depender de un mensaje específico.
- `'texto'` / `'audio'` / `'imagen'` — para ilustrar el sistema con un mensaje real, permitiendo comparar el mensaje original contra el reconstruido tras el canal (no solo una tasa de error abstracta, sino calidad perceptual: legibilidad del texto, SNR de audio, PSNR de imagen).

### `funciones/cuantizacion/`

`audio_a_bits.m` e `imagen_a_bits.m` (dentro de `funciones/fuente/`) necesitan cuantizar la señal analógica antes de convertirla en bits. Esa cuantización es exactamente el fenómeno que se estudia en el tema `03_cuantizacion`, así que la función vive en `funciones/cuantizacion/`, reutilizable por ambos consumidores: la práctica que enseña el fenómeno en sí, y las funciones de fuente que lo aplican en un caso real.

### `funciones/analisis_senales/`

Casi cualquier tema necesita en algún momento caracterizar una señal en frecuencia. `calcular_espectro.m` (ya implementada) resuelve un problema concreto: `fft()` de MATLAB no centra el espectro ni lo normaliza, así que sin esta función cada tema repetiría manualmente `fftshift` + normalización + construcción del eje de frecuencia, con el riesgo de hacerlo de forma distinta en cada uno.

### `funciones/canal/`

El ruido AWGN no pertenece solo al tema `04_awgn_bernoulli`: es el modelo de canal por defecto de casi cualquier práctica de la cadena de transmisión (modulación, códigos de canal, capacidad). Centralizar `generar_ruido_awgn.m` asegura que la definición de SNR/Eb-No sea la misma en todos los temas que la usan, condición necesaria para que las comparaciones de desempeño entre ellos sean válidas.

### `funciones/metricas/`

BER, SER y EVM se calculan de la misma forma sin importar el esquema de modulación o codificación evaluado. Si cada tema implementara su propio cálculo de BER, las curvas de comparación entre esquemas (obligatorias según `estandar_pedagogico.md`) podrían no ser comparables entre sí.

### `funciones/visualizacion/`

A diferencia de las anteriores, estas funciones **sí generan gráficas** — son la excepción explícita que el estándar de código reserva para "funciones de visualización" separadas de las de cálculo. Encapsulan gráficas que se repiten en muchos temas (constelación, diagrama de ojo, espectro) para que cumplan automáticamente el formato obligatorio (título, ejes con unidades, leyenda, rejilla) sin que cada script de sistema lo reescriba.

## El enlace cuantización → codificación de fuente → Shannon

Este es el hilo conductor más importante del módulo, y la razón de que estas dos funciones transversales existan:

```
Señal analógica (ej. audio)
        │
        ▼
cuantizar_uniforme.m / cuantizar_no_uniforme.m   (tema 03_cuantizacion)
        │
        ▼
audio_a_bits.m                                    (funciones/fuente/)
        │
        ▼
   secuencia de bits
        │
        ├──► temas 05-21: codificación de línea, modulación, canal, códigos...
        │
        └──► tema 17_codificacion_fuente_shannon: codificación de fuente sobre
             esta misma secuencia, contrastando el resultado contra el teorema
             de codificación de fuente de Shannon (tema 4.2 del temario).
```

Cualquier desarrollador que trabaje en el tema 17 debe partir de esta cadena, no reimplementar su propia cuantificación de ejemplo.

## Separación función vs. script de sistema

Se mantiene la regla general del proyecto (`docs/estandares/estandar_codigo.md`): las funciones de cálculo (`fuente/`, `cuantizacion/`, `analisis_senales/`, `canal/`, `metricas/`) no imprimen ni grafican. `funciones/visualizacion/` es la única subcarpeta que sí genera gráficas, como excepción prevista explícitamente por el estándar. Los scripts de sistema (`practicas/[tema]/`) son los que orquestan todo lo anterior, imprimen resultados con `fprintf()` y, si no usan una función de `visualizacion/`, generan sus propias gráficas siguiendo el mismo formato obligatorio.
