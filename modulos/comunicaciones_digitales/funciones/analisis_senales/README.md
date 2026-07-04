# Análisis de señales (`funciones/analisis_senales/`)

Funciones compartidas para caracterizar una señal (en tiempo o en frecuencia), usadas por prácticamente cualquier tema del módulo que necesite graficar o comparar señales.

## Funciones

| Función | Estado | Descripción |
| --- | --- | --- |
| `calcular_espectro.m` | 🟢 Implementada | *Wrapper* de `fft()` que centra el espectro (`fftshift`), normaliza por amplitud o potencia, y entrega directamente el eje de frecuencia en Hz y la magnitud en dB o lineal. Evita que cada tema repita manualmente el ajuste de alineación y escala. |
| `estimar_autocorrelacion.m` | ⚪ Pendiente | Estimación de la función de autocorrelación de una señal o proceso aleatorio — usada principalmente por `01_procesos_aleatorios`, pero reutilizable en cualquier tema que necesite caracterizar dependencia temporal (ej. verificación de blancura del ruido en `04_awgn_bernoulli`). |
| `estimar_densidad_espectral.m` | ⚪ Pendiente | Estimación de densidad espectral de potencia (ej. método de Welch/periodograma) — usada por `02_densidad_espectral_lti`, y reutilizable por cualquier tema que necesite verificar el ancho de banda ocupado de una señal modulada. |

## Por qué son transversales

Sin estas funciones, cada tema que grafica un espectro (LTI, PSD, codificación de línea, pulsos Nyquist, modulación, EVM...) reimplementaría su propia versión de `fftshift` + normalización + construcción del eje de frecuencia, con el riesgo de que cada una quede ligeramente distinta (una en dB, otra en lineal, una centrada y otra no). Centralizarlas aquí garantiza que todas las gráficas de espectro del módulo sean comparables entre sí.

Cada función nueva en esta carpeta debe seguir `docs/plantillas/plantilla_funcion.m` y el estándar de código del proyecto.
