# Guía de desarrollador

Este documento orienta a quienes vayan a extender el módulo de Comunicaciones Digitales. Complementa los estándares generales del repositorio, especialmente `docs/estandares/estandar_codigo.md`, `docs/estandares/estandar_documentacion.md` y `docs/estandares/estandar_pedagogico.md`.

## Convenciones ya definidas para este módulo

Antes de agregar una función, práctica o documento nuevo, revisa `docs/03_arquitectura.md` del módulo. La arquitectura actual separa:

- funciones transversales en `funciones/`;
- scripts y guías de práctica en `practicas/[tema]/`;
- documentación del módulo en `docs/`;
- casos de prueba y resultados de referencia en `validacion/`.

## Dónde ubicar una función nueva

Usa esta regla práctica:

- Si la función se reutiliza en más de un tema, debe vivir en una subcarpeta transversal de `funciones/`.
- Si la función solo tiene sentido para un tema específico, puede vivir en una subcarpeta propia del tema o documentarse como parte del desarrollo de esa práctica.
- Si la función imprime resultados o grafica directamente, probablemente no debe ser una función de cálculo; debe estar en el script de sistema o, si es una gráfica reutilizable, en `funciones/visualizacion/`.

## Subcarpetas transversales actuales

| Subcarpeta | Cuándo usarla |
| --- | --- |
| `funciones/fuente/` | Cuando la función genera o reconstruye datos de entrada: bits aleatorios, símbolos, texto, audio o imagen. |
| `funciones/cuantizacion/` | Cuando la función implementa cuantización uniforme, no uniforme o procesamiento asociado a niveles cuantizados. |
| `funciones/analisis_senales/` | Cuando la función calcula espectros, autocorrelaciones, densidad espectral u otras medidas temporales/frecuenciales. |
| `funciones/pulsos/` | Cuando la función genera pulsos conformadores reutilizables: rectangular, sinc, coseno alzado u otros pulsos de Nyquist. |
| `funciones/canal/` | Cuando la función modela el canal o una perturbación, por ejemplo ruido AWGN. |
| `funciones/metricas/` | Cuando la función calcula indicadores de desempeño: BER, SER, EVM, MSE u otras métricas. |
| `funciones/visualizacion/` | Cuando la función genera una gráfica reutilizable con formato estandarizado. |

## Regla específica para `funciones/pulsos/`

Los pulsos conformadores no deben implementarse dentro de cada práctica de modulación. Si una práctica necesita un pulso rectangular, sinc, coseno alzado u otro pulso de Nyquist, debe reutilizar una función existente en:

```text
funciones/pulsos/
```

Si la función aún no existe, se crea allí desde el primer tema que la necesite y se documenta en el `README.md` de esa subcarpeta.

Ejemplos esperados:

```text
funciones/pulsos/pulso_rect.m
funciones/pulsos/pulso_sinc.m
funciones/pulsos/pulso_raised_cosine.m
```

Estas funciones deben ser de cálculo puro: reciben parámetros, devuelven vectores o estructuras de datos, y no imprimen ni grafican.

## Relación con los temas

- `06_pulsos_nyquist_isi/` es el tema donde nacen conceptualmente los pulsos conformadores.
- `07_modulacion_pam/` debe reutilizar esos pulsos para la transmisión banda base.
- `08_modulacion_mqam_mpsk/` debe reutilizar esos pulsos cuando requiera conformación de pulso en señales bidimensionales o pasa banda.

## Antes de crear una carpeta nueva

El módulo ya tiene 21 temas definidos en `practicas/`. Si aparece una necesidad que no encaja claramente en esos 21 temas, abre un Issue antes de crear una carpeta adicional.

No se debe crear una carpeta `22_...` sin discusión previa, porque eso cambia el mapa curricular del módulo.

## Pendiente

Este documento debe ampliarse cuando existan funciones y prácticas implementadas. En particular, convendrá agregar:

- convenciones internas de nombres por subcarpeta;
- ejemplos de extensión de una función existente;
- advertencias sobre parámetros delicados de simulación;
- criterios para decidir cuándo una función se mueve desde un tema hacia una carpeta transversal.
