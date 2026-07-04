# Estándar de documentación

Define qué documentación debe entregar cada módulo antes de que un *pull request* pueda ser aprobado. Un módulo sin esta documentación completa no se considera terminado, independientemente de la calidad de su código (ver la "Definición de módulo terminado" en `CONTRIBUTING.md`).

## Índice

- [Estructura de documentación de un módulo](#estructura-de-documentación-de-un-módulo)
- [Los 9 documentos del módulo](#los-9-documentos-del-módulo)
- [README.md del módulo](#readmemd-del-módulo)
- [Guías de práctica](#guías-de-práctica)
- [Casos de prueba](#casos-de-prueba)
- [Mapa de relación curricular](#mapa-de-relación-curricular)

## Estructura de documentación de un módulo

```
modulos/[nombre_modulo]/
├── README.md
├── docs/
│   ├── 01_descripcion_general.md
│   ├── 02_metodologia.md
│   ├── 03_arquitectura.md
│   ├── 04_instalacion.md
│   ├── 05_guia_usuario.md
│   ├── 06_guia_desarrollador.md
│   ├── 07_pruebas.md
│   ├── 08_resultados.md
│   └── 09_decisiones_tecnicas.md
├── practicas/
│   ├── 01_modulacion_digital/
│   │   ├── modulacion_digital.m       (script de sistema)
│   │   └── modulacion_digital.md      (guía de práctica)
│   ├── 02_codificacion_canal/
│   │   ├── codificacion_canal.m
│   │   └── codificacion_canal.md
│   └── ... (una carpeta por tema, ver "Granularidad por temas" en estandar_codigo.md)
└── validacion/
    ├── casos_prueba/
    └── resultados_referencia/
```

## Los 9 documentos del módulo

Cada archivo tiene un propósito específico; no son subdivisiones arbitrarias de un mismo texto.

| Archivo | Contenido esperado |
| --- | --- |
| **01_descripcion_general.md** | Qué es el módulo, qué fenómenos o sistemas simula, a qué asignaturas apoya, y qué problema pedagógico resuelve. Es lo primero que debería leer alguien que nunca ha visto el módulo. |
| **02_metodologia.md** | Cómo se abordó el desarrollo: modelos matemáticos o físicos usados, supuestos y simplificaciones, y por qué se eligieron (ej: por qué un canal AWGN simplificado y no un modelo de canal más complejo). |
| **03_arquitectura.md** | Organización interna del módulo: qué hace cada función, cómo se relacionan entre sí (idealmente con un diagrama de flujo o de bloques), y separación entre funciones de cálculo y de visualización. |
| **04_instalacion.md** | Requisitos para ejecutar el módulo: versión mínima de MATLAB, *toolboxes* requeridos, y pasos para dejarlo funcionando (ej: agregar carpetas al *path*). |
| **05_guia_usuario.md** | Dirigido a un docente o estudiante que va a *usar* el módulo en una práctica: cómo ejecutar cada *script*, qué parámetros puede modificar y qué esperar como resultado. No asume conocimiento de programación avanzado. |
| **06_guia_desarrollador.md** | Dirigido a quien vaya a *extender* el módulo en una fase futura: convenciones internas específicas del módulo (si las hay), puntos de extensión previstos (ej: cómo añadir un nuevo esquema de modulación), y advertencias sobre partes delicadas del código. |
| **07_pruebas.md** | Qué se probó, cómo, y con qué resultado. Enlaza o resume los casos de prueba de `validacion/casos_prueba/`. |
| **08_resultados.md** | Resultados representativos del módulo (curvas de BER, constelaciones, comparaciones entre escenarios), con su interpretación. No es un repositorio de todas las gráficas posibles, sino las que mejor ilustran el comportamiento del módulo. |
| **09_decisiones_tecnicas.md** | Decisiones de diseño relevantes y sus alternativas descartadas: por qué se estructuró así, qué se consideró y no se usó, y qué se dejó pendiente para una fase futura. Es la memoria que evita que un desarrollador futuro repita una discusión ya resuelta. |

## README.md del módulo

Además de los 9 documentos, cada módulo tiene un `README.md` propio (distinto al de la raíz del repositorio) con:

- Descripción breve (1-2 párrafos) — puede resumir `01_descripcion_general.md`.
- Lista de funciones principales que ofrece el módulo.
- Dependencias: *toolboxes* de MATLAB requeridos.
- Instrucciones rápidas de uso (enlaza a `docs/05_guia_usuario.md` para el detalle).
- Autoría: quién desarrolló el módulo y en qué periodo.
- Enlaces a los documentos en `docs/` y a las prácticas en `practicas/`.

## Guías de práctica

Cada tema del módulo vive en su propia carpeta dentro de `practicas/` (ver "Granularidad por temas dentro de un módulo" en `estandar_codigo.md`), y dentro de esa carpeta conviven la guía en Markdown y el o los *scripts* de sistema que implementan ese tema. La guía documenta el tema para quien lo usa; el script es lo que efectivamente se ejecuta. No deben desincronizarse: si cambia el script, se actualiza la guía, y viceversa.

Cada módulo entrega **al menos dos temas** (dos carpetas en `practicas/`). La guía (`.md`) de cada tema incluye obligatoriamente:

- Objetivo de la práctica.
- Fundamento teórico breve (no un capítulo completo; lo esencial para entender qué se va a observar).
- Parámetros de la simulación y sus valores por defecto.
- Procedimiento paso a paso.
- Preguntas orientadoras (ver `estandar_pedagogico.md`).
- Análisis esperado / conclusiones que el docente puede usar como referencia al evaluar.

## Casos de prueba

Cada módulo documenta **al menos tres casos de prueba** en `validacion/casos_prueba/`, cada uno con:

- Parámetros de entrada exactos usados.
- Resultado de referencia (valor numérico, gráfica o ambos), guardado en `validacion/resultados_referencia/`.
- Breve nota de qué se está verificando con ese caso (ej: "BER coincide con la curva teórica de QPSK en canal AWGN dentro de un margen esperado").

Estos casos son los que permiten a cualquier persona confirmar que el módulo sigue funcionando correctamente después de una modificación futura.

## Mapa de relación curricular

Tabla obligatoria (puede vivir en `01_descripcion_general.md` o en un archivo aparte) que relacione cada práctica del módulo con los contenidos curriculares que aborda:

| Tema (carpeta en `practicas/`) | Asignatura(s) | Conceptos abordados |
| --- | --- | --- |
| `01_modulacion_digital/` | Comunicaciones Digitales | Modulación ASK/FSK/QAM, ancho de banda, BER |
| `02_codificacion_canal/` | Comunicaciones Digitales, Comunicaciones Móviles | Codificación de canal, ganancia de codificación, compromiso potencia-BER |

Este mapa es lo que permite a un docente de otra asignatura identificar rápidamente si una práctica existente le sirve, sin tener que leer todo el módulo.
