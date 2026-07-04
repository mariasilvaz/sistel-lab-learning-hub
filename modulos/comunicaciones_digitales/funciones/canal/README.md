# Canal (`funciones/canal/`)

Funciones que modelan el efecto del canal de transmisión sobre una señal o secuencia de símbolos. Se usan en casi cualquier tema que arme una cadena de transmisión completa (05 en adelante), no solo en `04_awgn_bernoulli`.

## Funciones planeadas (⚪ pendientes de desarrollo)

| Función | Descripción |
| --- | --- |
| `generar_ruido_awgn.m` | Genera y agrega ruido blanco gaussiano a una señal o secuencia de símbolos, con SNR o Eb/No configurable. Reutilizada por las prácticas de modulación (07-10), códigos de canal (11-15) y capacidad (18-21). |
| `canal_multitrayecto.m` | Modelo simplificado de canal multitrayecto, para ilustrar ISI más allá del límite de ancho de banda (complementa `06_pulsos_nyquist_isi`). |

## Por qué son transversales

El ruido AWGN no es exclusivo del tema que lo presenta formalmente (`04_awgn_bernoulli`): es el canal por defecto de casi cualquier práctica de la cadena de transmisión. Tener una única función de referencia evita, por ejemplo, que la definición de SNR o Eb/No termine implementada de forma distinta en el tema de modulación que en el de códigos de canal, lo cual haría que las comparaciones de desempeño entre ambos no fueran válidas.

Cada función nueva en esta carpeta debe seguir `docs/plantillas/plantilla_funcion.m` y el estándar de código del proyecto.
