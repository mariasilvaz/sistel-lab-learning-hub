# Métricas de desempeño (`funciones/metricas/`)

Funciones que calculan métricas de desempeño estándar, independientes del esquema de modulación o codificación que se esté evaluando. Necesarias para que la comparación entre esquemas (uno de los elementos obligatorios de toda práctica, ver `estandar_pedagogico.md`) sea válida: todos los temas deben calcular BER/SER/EVM de la misma forma.

## Funciones planeadas (⚪ pendientes de desarrollo)

| Función | Descripción |
| --- | --- |
| `calcular_ber.m` | Tasa de error de bit, comparando la secuencia transmitida contra la recibida. Usada en prácticamente todos los temas de modulación (07-10) y codificación de canal (11-15). |
| `calcular_ser.m` | Tasa de error de símbolo, análoga a la anterior pero a nivel de símbolo — relevante en modulaciones de orden superior (M-QAM, M-PSK). |
| `calcular_evm.m` | Magnitud del vector de error, para el tema `10_ojo_constelacion_evm`. |

## Por qué son transversales

Si cada tema de modulación calculara su propio BER con una definición ligeramente distinta (ej. contar errores de forma diferente al alinear las secuencias transmitida/recibida), las comparaciones entre esquemas de modulación — que son obligatorias según el estándar pedagógico — dejarían de ser válidas. Centralizar estas funciones asegura que todas las curvas de BER del módulo sean comparables entre sí y contra las curvas teóricas de referencia.

Cada función nueva en esta carpeta debe seguir `docs/plantillas/plantilla_funcion.m` y el estándar de código del proyecto.
