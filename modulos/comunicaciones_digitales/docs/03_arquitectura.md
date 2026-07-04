# Arquitectura

## Organización general

```
comunicaciones_digitales/
├── funciones/
│   ├── fuente/          ← generación/reconstrucción del flujo de datos de entrada (transversal)
│   ├── cuantizacion/     ← cuantización uniforme y no uniforme (transversal)
│   └── ...               ← funciones específicas de cada tema, a medida que se desarrollen
├── practicas/
│   ├── 01_procesos_aleatorios/  … 21_capacidad_canal_awgn/
│   └── (cada carpeta: script(s) de sistema + guía de ese tema)
├── docs/
└── validacion/
```

21 temas, agrupados en 4 bloques que siguen los 4 capítulos del temario de la asignatura (procesos aleatorios y cuantificación; modulación digital; codificación de canal; teoría de la información). El detalle de cada tema y su estado está en el `README.md` del módulo.

## Funciones transversales: por qué existen

La mayoría de los 21 temas son independientes entre sí en cuanto a su lógica de cálculo específica (un código cíclico no comparte código con una modulación M-QAM). Pero hay dos piezas que **sí** se repiten a lo largo de muchos temas, y que por eso se extrajeron como funciones compartidas en vez de vivir dentro de un solo tema:

### `funciones/fuente/`

Cualquier tema que arme una cadena de transmisión (05 a 21, prácticamente) necesita, como primer paso, "conseguir una secuencia de bits (o símbolos) para transmitir". En vez de que cada tema reimplemente esto, `funciones/fuente/` ofrece un conjunto de generadores intercambiables mediante un parámetro configurable en el script de sistema:

```matlab
fuente = 'bits_aleatorios';  % 'bits_aleatorios' | 'simbolos_aleatorios' | 'texto' | 'audio' | 'imagen'
```

- `'bits_aleatorios'` / `'simbolos_aleatorios'` — para análisis estadístico puro (BER, SER, capacidad), sin depender de un mensaje específico.
- `'texto'` / `'audio'` / `'imagen'` — para ilustrar el sistema con un mensaje real, permitiendo comparar el mensaje original contra el reconstruido tras el canal (no solo una tasa de error abstracta, sino calidad perceptual: legibilidad del texto, SNR de audio, PSNR de imagen).

### `funciones/cuantizacion/`

`audio_a_bits.m` e `imagen_a_bits.m` (dentro de `funciones/fuente/`) necesitan cuantizar la señal analógica antes de convertirla en bits. Esa cuantización es exactamente el fenómeno que se estudia en el tema `03_cuantizacion`, así que la función vive en `funciones/cuantizacion/`, reutilizable por ambos consumidores: la práctica que enseña el fenómeno en sí, y las funciones de fuente que lo aplican en un caso real.

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

Se mantiene la regla general del proyecto (`docs/estandares/estandar_codigo.md`): las funciones (`funciones/`, incluyendo `fuente/` y `cuantizacion/`) son piezas de cálculo puro, sin impresión ni gráficas; los scripts de sistema (`practicas/[tema]/`) son los que orquestan, imprimen resultados y grafican.
