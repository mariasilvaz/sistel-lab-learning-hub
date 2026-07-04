# Fuente de datos (`funciones/fuente/`)

Funciones compartidas que generan el flujo de datos de entrada para cualquier práctica de modulación o codificación del módulo. La idea es que un mismo *script* de sistema pueda elegir su fuente como un parámetro configurable más, sin reescribir la cadena de transmisión para cada caso:

```matlab
fuente = 'bits_aleatorios';  % 'bits_aleatorios' | 'simbolos_aleatorios' | 'texto' | 'audio' | 'imagen'
```

## Funciones planeadas (⚪ pendientes de desarrollo)

| Función | Descripción |
| --- | --- |
| `generar_bits_aleatorios.m` | Genera una secuencia de bits aleatorios uniformes. |
| `generar_simbolos_aleatorios.m` | Genera símbolos aleatorios directamente (sin pasar por una secuencia de bits ni por mapeo bit-símbolo), útil para prácticas centradas en el símbolo (constelaciones, EVM). |
| `texto_a_bits.m` / `bits_a_texto.m` | Convierte un mensaje de texto a su representación en bits (y de vuelta), para poder comparar el mensaje original contra el recibido tras el canal. |
| `audio_a_bits.m` / `bits_a_audio.m` | Muestrea y **cuantiza** una señal de audio (usa `funciones/cuantizacion/`) y la convierte a bits; permite reconstruir y comparar el audio recibido (ej. SNR de la señal reconstruida). |
| `imagen_a_bits.m` / `bits_a_imagen.m` | Cuantiza los píxeles de una imagen (usa `funciones/cuantizacion/`) y la convierte a bits; permite reconstruir y comparar la imagen recibida (ej. PSNR). |

## Por qué existen estas funciones aquí y no dentro de cada tema

Varias prácticas de modulación (temas `07_modulacion_pam`, `08_modulacion_qam_psk`, etc.) necesitan la misma lógica de "conseguir una secuencia de bits para transmitir". Ponerla aquí evita que cada tema reimplemente su propio generador, y es lo que permite que una misma práctica se ejecute indistintamente con datos sintéticos o con un mensaje real.

`audio_a_bits.m` e `imagen_a_bits.m` son además el puente explícito entre el tema `03_cuantizacion` (conversión análoga-digital) y el tema `17_codificacion_fuente_shannon` (codificación de fuente): la señal que sale cuantizada de aquí es la misma que se retoma más adelante para aplicar codificación entrópica y contrastar contra el teorema de Shannon.

Cada función, cuando se desarrolle, debe seguir `docs/plantillas/plantilla_funcion.m` y el estándar de código del proyecto.
