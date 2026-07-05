# Pulsos conformadores (`funciones/pulsos/`)

Funciones que generan los pulsos usados para conformar la señal en banda base antes de transmitirla. Nacen en el Tema 06 (Pulsos Nyquist y control de ISI) y se reutilizan directamente en los Temas 07 (M-PAM) y 08 (M-QAM/M-PSK), para que el mismo pulso conformador sea el que se usa en toda la cadena de modulación del módulo.

## Funciones planeadas (⚪ pendientes de desarrollo)

| Función | Estado | Descripción |
| --- | --- | --- |
| `pulso_rect.m` | ⚪ Pendiente | Pulso rectangular — el más simple, punto de partida del Tema 06. Su espectro (forma sinc, con lóbulos laterales que no decaen) motiva la necesidad de pulsos más eficientes en ancho de banda. |
| `pulso_sinc.m` | ⚪ Pendiente | Pulso sinc — el "ideal" en el sentido de Nyquist (rectangular en frecuencia), pero de duración infinita; en la práctica se trunca, lo que reintroduce ISI. Muestra la relación dual con `pulso_rect.m` (rect en tiempo ↔ sinc en frecuencia, y viceversa). |
| `pulso_raised_cosine.m` | ⚪ Pendiente | Pulso coseno alzado con factor de roll-off configurable — el compromiso práctico realmente usado en los Temas 07 y 08: cumple el criterio de Nyquist sin la impracticidad del sinc puro. |

## Por qué viven aquí y no solo dentro del Tema 06

`07_modulacion_pam` y `08_modulacion_qam_psk` necesitan la misma conformación de pulso que se estudia y compara en el Tema 06. Ponerla aquí evita que cada tema de modulación reimplemente su propio pulso raised cosine, y garantiza que la comparación entre esquemas de modulación no se vea afectada por usar pulsos distintos entre sí.

Cada función, cuando se desarrolle, debe seguir `docs/plantillas/plantilla_funcion.m` y el estándar de código del proyecto.
