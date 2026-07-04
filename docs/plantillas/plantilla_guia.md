# [Nombre del tema] — Guía de práctica

> Carpeta: `practicas/NN_nombre_del_tema/` · Script asociado: `nombre_del_tema.m`
> Módulo: [nombre del módulo] · Asignatura(s): [asignatura(s) relacionada(s)]

<!--
Recordatorios del estándar (borra este bloque al usar la plantilla):
- El objetivo debe ser medible/verificable, no un tema genérico.
- Debe comparar al menos dos escenarios distintos.
- Las preguntas orientadoras apuntan a relaciones causa-efecto y a
  compromisos de diseño, no a "leer un valor de la pantalla".
Ver docs/estandares/estandar_pedagogico.md para el detalle completo.
-->

## Objetivo

<!-- Verbo + qué debería poder explicar o hacer el estudiante al terminar.
Ejemplo: "Explicar por qué QPSK duplica la eficiencia espectral de BPSK
a costa de mayor sensibilidad al ruido, a partir de curvas de BER simuladas." -->

## Fundamento teórico

<!-- Lo esencial para interpretar los resultados, no un capítulo completo.
2-4 párrafos o una lista de conceptos clave con su definición breve. -->

## Parámetros de la simulación

| Parámetro | Descripción | Valor por defecto | Rango válido |
| --- | --- | --- | --- |
| `snr_db` | Relación señal a ruido | 10 dB | -5 a 30 dB |
| `esquema_mod` | Esquema de modulación | 'QPSK' | 'BPSK', 'QPSK', '16QAM' |

## Procedimiento

1. Abrir `nombre_del_tema.m` en MATLAB.
2. Ejecutar el script con los parámetros por defecto y observar [qué debe observar].
3. Modificar [parámetro] a [valor alterno] y volver a ejecutar.
4. Comparar [qué comparar entre las dos ejecuciones].
5. Repetir con [otra variación], si aplica.

## Comparación de escenarios

<!-- Describe explícitamente los al menos dos escenarios que la práctica
contrasta, y qué se espera que cambie entre uno y otro. -->

| Escenario | Configuración | Qué observar |
| --- | --- | --- |
| A | `snr_db = 10`, `esquema_mod = 'QPSK'` | ... |
| B | `snr_db = 5`, `esquema_mod = 'QPSK'` | ... |

## Preguntas orientadoras

<!-- Apuntan a causa-efecto y compromisos de diseño, no a "leer un número". -->

- ¿Qué ocurre cuando...?
- ¿Por qué...?
- ¿Qué compromisos existen entre...?

## Conclusiones esperadas (guía para el docente)

<!-- Qué debería concluir un estudiante que completó bien la práctica.
Útil como referencia al evaluar, no se entrega necesariamente al estudiante. -->

-
-

## Referencias

<!-- Bibliografía, capítulos de libro de texto, u otras guías relacionadas del módulo -->
