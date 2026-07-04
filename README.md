# Herramienta Modular de Simulación para Prácticas en Telecomunicaciones

Plataforma académica de simulación en MATLAB, desarrollada de forma colaborativa entre estudiantes y docentes del Departamento de Telecomunicaciones de la Universidad del Cauca, para apoyar la enseñanza y las prácticas de laboratorio del programa de Ingeniería Electrónica y Telecomunicaciones.

> Un proyecto del departamento, para el departamento. Cada módulo desarrollado deja un recurso pedagógico permanente para el programa.

## Índice

- [¿Qué es este proyecto?](#qué-es-este-proyecto)
- [Estructura del repositorio](#estructura-del-repositorio)
- [Módulos](#módulos)
- [Cómo participar](#cómo-participar)
- [Documentación](#documentación)
- [Estado del proyecto](#estado-del-proyecto)
- [Licencia](#licencia)

## ¿Qué es este proyecto?

Los contenidos de telecomunicaciones se estudian hoy en asignaturas separadas, sin un entorno común donde el estudiante pueda observar cómo el ruido, la atenuación, la interferencia o la probabilidad de error atraviesan distintos sistemas de comunicación. Esta herramienta busca cerrar esa brecha aprovechando la licencia campus de MATLAB de la universidad, mediante módulos de simulación configurables, visuales y pensados pedagógicamente.

El desarrollo avanza por fases, cada una impulsada por uno o más equipos de estudiantes y docentes (ver `docs/estandares/estandar_pedagogico.md`). La Fase 1 — módulo de Comunicaciones Digitales — establece los estándares técnicos y pedagógicos que rigen todos los módulos siguientes.

## Estructura del repositorio

```
herramienta-telecom/
├── README.md                  ← este archivo
├── CONTRIBUTING.md            ← cómo contribuir, flujo de trabajo
├── CODE_OF_CONDUCT.md         ← normas de convivencia entre equipos
├── GOVERNANCE.md              ← roles, comité técnico, flujo de aprobación
├── AGENTS.md                  ← instrucciones para asistentes de IA
├── LICENSE
├── CHANGELOG.md               ← historial de módulos integrados
│
├── .github/
│   ├── ISSUE_TEMPLATE/        ← plantillas de issues
│   └── PULL_REQUEST_TEMPLATE.md
│
├── docs/
│   ├── estandares/            ← estándares obligatorios de código, docs y pedagogía
│   └── plantillas/            ← plantillas base para nuevos módulos
│
└── modulos/
    └── [nombre_modulo]/       ← un módulo autónomo por carpeta
        ├── README.md
        ├── funciones/          (piezas reutilizables: modular, canal, BER, etc.)
        ├── practicas/
        │   ├── 01_nombre_tema/  (script(s) de sistema + guía de ese tema)
        │   └── 02_nombre_tema/
        ├── datos/
        ├── docs/               (01_descripcion_general.md … 09_decisiones_tecnicas.md)
        └── validacion/
```

Cada módulo es autónomo y solo se integra a `main` mediante *pull request* aprobado por el coordinador técnico (ver `GOVERNANCE.md`).

## Módulos

| Módulo | Estado | Asignaturas relacionadas |
| --- | --- | --- |
| Comunicaciones digitales | 🟡 Piloto en desarrollo | Com. Digitales, Com. Móviles, Laboratorio I y II |
| Señales y sistemas | ⚪ Planeado | Señales y Sistemas, PDS, Com. Analógicas |
| Probabilidad, ruido y procesos | ⚪ Planeado | Probabilidad, PDS, Com. Digitales, Radiocomunicaciones |
| Procesamiento digital de señales | ⚪ Planeado | PDS, Com. Digitales, Com. Analógicas |
| Medios de transmisión | ⚪ Planeado | Medios de Transmisión, Com. Ópticas, RF |
| Antenas y propagación | ⚪ Planeado | Campos, Radiocomunicaciones, Com. Móviles |
| Comunicaciones analógicas | ⚪ Planeado | Com. Analógicas, Laboratorio I |
| Circuitos de radiofrecuencia | ⚪ Planeado | Circuitos RF, Radiocomunicaciones, Laboratorio II |
| Radiocomunicaciones | ⚪ Planeado | Radiocomunicaciones, Com. Móviles, Medios de Transmisión |
| Comunicaciones ópticas | ⚪ Planeado | Com. Ópticas, Medios de Transmisión |
| Comunicaciones móviles | ⚪ Planeado | Com. Móviles, Radiocomunicaciones, Com. Digitales |

*(🟡 en desarrollo · 🟢 integrado y validado · ⚪ planeado — este cuadro se actualiza en cada `pull request` de integración)*

## Acceso y visibilidad

Este repositorio es **público**: cualquier persona puede verlo, clonarlo y consultar su documentación. Sin embargo:

- **`main` es siempre la versión aprobada.** Todo lo que existe dentro de `modulos/` en `main` ya pasó por *pull request* revisado y aprobado por el coordinador técnico (ver `GOVERNANCE.md`). Por diseño del flujo de trabajo, no puede haber en `main` código o documentación sin validar.
- **El permiso de escritura (crear ramas, hacer *push*) está restringido.** Solo tienen acceso de escritura los estudiantes y docentes activos en un módulo específico durante el periodo de su participación; se otorga al iniciar y se retira al finalizar. Nadie fuera de esa lista puede crear ramas dentro del repositorio.
- **Ningún *pull request* se integra a `main` sin aprobación del coordinador técnico**, reforzado con reglas de protección de rama a nivel de GitHub (ver `GOVERNANCE.md`).
- Cualquier persona externa puede proponer cambios mediante un *fork* y un *pull request*, pero este solo se revisa y eventualmente se integra si el comité técnico lo decide.

## Cómo participar

El proyecto tiene varios roles de participación, tanto docente como estudiantil, y una misma persona puede combinar más de uno. El detalle completo está en `CONTRIBUTING.md` y `GOVERNANCE.md`; en resumen:

- **Coordinador técnico** — administra el repositorio y aprueba integraciones.
- **Docente asesor de módulo** — valida el contenido técnico y pedagógico de su módulo.
- **Co-autor de módulo** — define contenidos, prácticas y preguntas guía junto al equipo del módulo.
- **Usuario y validador** — prueba módulos existentes en sus asignaturas y reporta mejoras vía *Issues*.
- **Estudiante colaborador** — desarrolla un módulo completo, de forma individual o en equipo, con acompañamiento de un docente asesor.

Para proponer un módulo nuevo, reportar un error o sugerir una mejora, abre un *Issue* usando la plantilla correspondiente en `.github/ISSUE_TEMPLATE/`.

## Documentación

| Documento | Contenido |
| --- | --- |
| `docs/estandares/estandar_codigo.md` | Reglas obligatorias de código MATLAB (parámetros al inicio, nombres, comentarios) |
| `docs/estandares/estandar_documentacion.md` | Qué documentación debe entregar cada módulo |
| `docs/estandares/estandar_pedagogico.md` | Requisitos pedagógicos de cada práctica |
| `docs/plantillas/` | Plantillas base para función, práctica y guía |
| `GOVERNANCE.md` | Roles, comité técnico, flujo de *pull request* |
| `AGENTS.md` | Instrucciones para asistentes de IA usados como apoyo de desarrollo |

## Estado del proyecto

Fase 1 (módulo piloto — Comunicaciones Digitales) en curso. Ver `CHANGELOG.md` para el historial de integraciones.

## Licencia

Este repositorio usa un esquema de doble licencia:

- **Código fuente** (funciones y *scripts* MATLAB): [MIT](./LICENSE).
- **Materiales académicos** (guías de práctica, documentación de módulos, estándares y demás contenido escrito): [CC BY 4.0](./LICENSE-DOCS.md).

Si tienes dudas sobre qué licencia aplica a un archivo puntual, revisa el `README.md` del módulo correspondiente.
