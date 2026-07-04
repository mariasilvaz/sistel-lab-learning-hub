# Visualización (`funciones/visualizacion/`)

Funciones que encapsulan gráficas que se repiten en muchos temas, para que todas cumplan automáticamente los requisitos obligatorios de `estandar_codigo.md` (título, ejes con unidades, leyenda, rejilla) sin que cada script de sistema tenga que repetir ese formato manualmente.

Estas funciones **sí grafican** (a diferencia de las de `analisis_senales/`, `canal/`, `metricas/`, que son de cálculo puro) — son la excepción explícita prevista en el estándar de código para "funciones de visualización" separadas de las de cálculo.

## Funciones planeadas (⚪ pendientes de desarrollo)

| Función | Descripción |
| --- | --- |
| `graficar_espectro.m` | Grafica el resultado de `analisis_senales/calcular_espectro.m` con formato ya estandarizado. |
| `graficar_constelacion.m` | Grafica una constelación de símbolos recibidos vs. ideal, usada por `08_modulacion_qam_psk` y `10_ojo_constelacion_evm`. |
| `graficar_diagrama_ojo.m` | Grafica el diagrama de ojo de una señal en banda base, usada por `06_pulsos_nyquist_isi` y `10_ojo_constelacion_evm`. |

## Por qué son transversales

Sin esto, cada tema reimplementaría su propia versión de "graficar constelación" o "graficar diagrama de ojo" con pequeñas inconsistencias de formato entre sí (colores, símbolos, si se marca o no el punto ideal). Centralizarlas garantiza consistencia visual entre módulos y evita que el checklist de gráficas de `estandar_codigo.md` se verifique de forma distinta en cada script de sistema.

Cada función nueva en esta carpeta debe seguir `docs/plantillas/plantilla_funcion.m` y el estándar de código del proyecto — con la salvedad de que, al ser funciones de visualización, sí generan gráficas (documentarlo así explícitamente en su encabezado).
