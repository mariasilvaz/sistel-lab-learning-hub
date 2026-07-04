# Estándar de código

Reglas obligatorias para todo archivo `.m` que se integre a `main`. El coordinador técnico verifica su cumplimiento antes de aprobar cualquier *pull request* (ver `GOVERNANCE.md`). Si un archivo no cumple, se solicitan cambios; no se hacen excepciones "por esta vez".

## Índice

- [Dos tipos de código: funciones y scripts de sistema](#dos-tipos-de-código-funciones-y-scripts-de-sistema)
- [Granularidad por temas dentro de un módulo](#granularidad-por-temas-dentro-de-un-módulo)
- [Encabezado de cada función](#encabezado-de-cada-función)
- [Encabezado de un script de sistema](#encabezado-de-un-script-de-sistema)
- [Parámetros configurables al inicio](#parámetros-configurables-al-inicio)
- [Nombres de variables y funciones](#nombres-de-variables-y-funciones)
- [Comentarios](#comentarios)
- [Estructura y tamaño de las funciones](#estructura-y-tamaño-de-las-funciones)
- [Salidas por consola](#salidas-por-consola)
- [Gráficas](#gráficas)
- [Manejo de dependencias (toolboxes)](#manejo-de-dependencias-toolboxes)
- [Antes de abrir el pull request](#antes-de-abrir-el-pull-request)

## Dos tipos de código: funciones y scripts de sistema

Dentro de cada módulo conviven dos tipos de archivo `.m`, con reglas y ubicación distintas. No son intercambiables ni es cuestión de estilo personal dónde va cada cosa.

| | **Función** (`funciones/`) | **Script de sistema** (`practicas/`) |
| --- | --- | --- |
| **Qué es** | Una pieza atómica y reutilizable: modula, agrega ruido, calcula BER, etc. | El *script* que arma la cadena completa (ej: generación de bits → codificación → modulación → canal → demodulación → cálculo de BER), invocando funciones de `funciones/`. |
| **Responsabilidad** | Única y bien delimitada. | Orquestar: decide qué funciones llamar, en qué orden y con qué parámetros. |
| **Recibe datos** | Solo por argumentos de entrada. | Puede leer del bloque de parámetros configurables al inicio del propio script. |
| **Efectos secundarios** | Ninguno: no imprime (`fprintf`), no grafica, no depende de variables del *workspace*. | Aquí sí van los `fprintf()` con resultados y las llamadas a graficar. |
| **Se puede probar de forma aislada** | Sí, por eso vive en `funciones/` y alimenta los casos de prueba (`validacion/casos_prueba/`). | Se prueba ejecutando el escenario completo, comparando contra `validacion/resultados_referencia/`. |
| **Relación con la documentación** | Documentada por su propio encabezado (ver más abajo). | Cada tema tiene su propia carpeta dentro de `practicas/` (ver [Granularidad por temas](#granularidad-por-temas-dentro-de-un-módulo)), con el/los script(s) de sistema de ese tema junto a su guía. |

## Granularidad por temas dentro de un módulo

Un módulo puede cubrir varios temas o fenómenos distintos (ej: el módulo de Comunicaciones Digitales puede cubrir modulación, codificación de canal y ecualización por separado). Cada tema vive en su propia subcarpeta dentro de `practicas/`, numerada según el orden sugerido de estudio:

```
practicas/
├── 01_modulacion_digital/
│   ├── modulacion_digital.m       (script de sistema)
│   └── modulacion_digital.md      (guía de práctica)
├── 02_codificacion_canal/
│   ├── codificacion_canal.m
│   ├── codificacion_canal_variante_rs.m   (variante opcional del mismo tema)
│   └── codificacion_canal.md
└── 03_ecualizacion/
    ├── ecualizacion.m
    └── ecualizacion.md
```

Reglas de esta estructura:

- Una carpeta de tema puede tener **más de un script de sistema** si existen variantes relevantes (ej: distintos esquemas de codificación), pero comparten la misma guía o la guía las referencia explícitamente a todas.
- El número de prefijo indica el orden sugerido de progresión pedagógica dentro del módulo, no un orden de desarrollo técnico.
- Todos los scripts de una carpeta de tema comparten las funciones de `funciones/` del módulo; no se duplica lógica entre temas.

Regla práctica para decidir dónde va un bloque de código nuevo: si tiene sentido llamarlo desde más de un escenario o módulo, y no necesita imprimir ni graficar nada por sí mismo, es una **función**. Si es la secuencia particular de pasos que resuelve una práctica concreta, con sus parámetros, sus impresiones y sus gráficas, es un **script de sistema**.

Un script de sistema puede (y debe) seguir también el bloque de parámetros configurables descrito más abajo — esa regla aplica a ambos tipos de archivo cuando corresponda, pero en la práctica casi siempre vive en el script de sistema, no dentro de una función atómica.

## Encabezado de cada función

Toda función `.m` inicia con un encabezado en este formato exacto:

```matlab
function [salida1, salida2] = nombre_funcion(entrada1, entrada2)
% NOMBRE_FUNCION  Resumen de una línea de qué hace la función.
%
% Propósito:
%   Descripción de 2-4 líneas: qué calcula o qué representa, y por qué existe.
%
% Entradas:
%   entrada1  - Descripción, tipo y unidades (ej: SNR en dB, escalar)
%   entrada2  - Descripción, tipo y unidades
%
% Salidas:
%   salida1   - Descripción, tipo y unidades
%   salida2   - Descripción, tipo y unidades
%
% Ejemplo de uso:
%   [ber, snr_vec] = nombre_funcion(10, 'QPSK');
%
% Autor: Nombre Apellido
% Fecha: AAAA-MM-DD
% Versión: 1.0
```

El bloque de comentarios inmediatamente debajo de la línea `function` es lo que MATLAB muestra con `help nombre_funcion`; por eso el formato no es opcional.

## Encabezado de un script de sistema

A diferencia de una función, un script de sistema no tiene entradas/salidas formales, pero sí debe declarar de forma explícita **con qué versión de MATLAB se probó** y **qué funciones propias del módulo invoca**, para que cualquier persona sepa si puede ejecutarlo sin sorpresas:

```matlab
%% MODULACION_DIGITAL — Cadena completa de modulación digital sobre canal AWGN
%
% Descripción:
%   Arma la cadena transmisor-canal-receptor para comparar esquemas de
%   modulación digital (BPSK, QPSK, 16-QAM) bajo ruido AWGN. Implementa
%   la práctica documentada en modulacion_digital.md (misma carpeta).
%
% Requiere:
%   MATLAB             R2021a o superior (probado en R2023b)
%   Toolboxes          Communications Toolbox, Signal Processing Toolbox
%   Funciones propias:
%     - generar_secuencia_binaria.m
%     - modular_digital.m
%     - canal_awgn.m
%     - calcular_ber.m
%
% Autor: Nombre Apellido
% Fecha: AAAA-MM-DD
% Versión: 1.0

%% Parámetros configurables
...
```

Reglas asociadas:

- La versión de MATLAB indicada es la **mínima verificada**; si se prueba en una versión más reciente, se anota entre paréntesis como en el ejemplo.
- La lista de "Funciones propias" debe estar completa y actualizada — es lo primero que revisa quien va a ejecutar o adaptar el script, y lo que usa el coordinador técnico para verificar que no haya dependencias ocultas o funciones huérfanas.
- Si el script no depende de ningún *toolbox* adicional (solo MATLAB base), se indica explícitamente: `Toolboxes: ninguno`.

## Parámetros configurables al inicio

Todo *script* principal de una práctica agrupa sus parámetros modificables en un único bloque, al inicio del archivo, antes de cualquier cálculo. Cada parámetro lleva su unidad y su rango válido como comentario:

```matlab
%% Parámetros configurables
snr_db      = 10;        % Relación señal a ruido [dB]. Rango típico: -5 a 30.
esquema_mod = 'QPSK';    % Esquema de modulación. Opciones: 'BPSK','QPSK','16QAM'.
num_bits    = 1e5;       % Número de bits a simular. Rango: 1e3 a 1e6.
fs          = 1e6;       % Frecuencia de muestreo [Hz].
```

Está prohibido dispersar valores "mágicos" (números sueltos sin explicación) en medio del código de cálculo; si un valor puede tener sentido cambiarlo para explorar un escenario distinto, es un parámetro y va en este bloque.

## Nombres de variables y funciones

- Nombres descriptivos, en español o inglés técnico, pero **consistentes dentro de un mismo módulo** (no mezclar `senal` y `signal` en el mismo archivo).
- `snake_case` para variables y funciones (`ber_teorica`, `generar_ruido_awgn`), no `camelCase` ni abreviaturas crípticas (`x1`, `tmp2`, `aux`).
- Los nombres deben reflejar la magnitud física cuando aplica: `snr_db`, `tiempo_s`, `frecuencia_hz` — la unidad como sufijo evita ambigüedad.
- Constantes en mayúsculas si MATLAB las trata como tales dentro del *script* (`FS_MAX = 1e9;`).

## Comentarios

- Cada bloque lógico relevante lleva un comentario que explica **qué hace y por qué**, no una traducción literal del código línea por línea.
- Ejemplo de lo que se espera:

```matlab
% Se normaliza la energía de símbolo a 1 para que la comparación de BER
% entre esquemas de modulación sea válida bajo el mismo Eb/No.
simbolos = simbolos / sqrt(mean(abs(simbolos).^2));
```

- Ejemplo de lo que **no** se acepta (comentario que no aporta nada):

```matlab
% se divide simbolos entre la raiz
simbolos = simbolos / sqrt(mean(abs(simbolos).^2));
```

## Estructura y tamaño de las funciones

- Una función, una responsabilidad. Si una función mezcla cálculo y visualización, sepárala en dos.
- Como criterio orientador, si una función supera aproximadamente **80 líneas de código efectivo**, evalúa si conviene dividirla en subfunciones.
- Las funciones no imprimen resultados ni generan gráficas directamente (ver [Dos tipos de código](#dos-tipos-de-código-funciones-y-scripts-de-sistema)); eso es responsabilidad del script de sistema que las invoca.

## Salidas por consola

- Ningún resultado se muestra con `disp()` sin contexto.
- Usa `fprintf()` con etiqueta y unidades:

```matlab
fprintf('BER simulada: %.4e (SNR = %.1f dB)\n', ber_sim, snr_db);
```

## Gráficas

Toda gráfica generada por el módulo debe incluir, sin excepción:

- Título (`title`).
- Etiquetas en ambos ejes con unidades (`xlabel`, `ylabel`).
- Leyenda, si hay más de una serie (`legend`).
- Rejilla activada (`grid on`).

## Manejo de dependencias (toolboxes)

- Se debe declarar explícitamente qué *toolboxes* de MATLAB requiere el módulo (Communications, Signal Processing, RF, etc.) en el `README.md` del módulo.
- Cuando exista una función equivalente en MATLAB base y en un *toolbox*, se prioriza la función base si el rendimiento y la claridad no se ven comprometidos, para reducir dependencias.

## Antes de abrir el pull request

- [ ] El código se ejecuta sin errores con los parámetros por defecto, sin modificar nada.
- [ ] Todos los parámetros configurables están en el bloque inicial, con unidades y rango.
- [ ] Todas las funciones tienen el encabezado estándar.
- [ ] Todo script de sistema declara versión mínima de MATLAB, *toolboxes* y funciones propias que invoca.
- [ ] No hay `disp()` sin contexto ni números mágicos sin comentar.
- [ ] Todas las gráficas cumplen los cuatro requisitos de la sección anterior.
- [ ] El estilo de nombres es consistente dentro del módulo.
