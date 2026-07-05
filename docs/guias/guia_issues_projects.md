# Guía de trabajo con Issues y GitHub Projects

Este documento explica, desde cero, qué son un *Issue* y un *Project* de GitHub, y propone cómo configurarlos para organizar el trabajo que viene: los 21 temas del módulo piloto de Comunicaciones Digitales y los módulos que le sigan. Complementa a `CONTRIBUTING.md` (el flujo de *pull request*) y a `GOVERNANCE.md` (quién aprueba qué); este documento se enfoca en cómo se planea, se distribuye y se sigue el trabajo día a día.

## Índice

- [¿Qué es un Issue?](#qué-es-un-issue)
- [¿Qué busca GitHub Projects?](#qué-busca-github-projects)
- [Cómo se relacionan entre sí](#cómo-se-relacionan-entre-sí)
- [Convenciones de Issues en este proyecto](#convenciones-de-issues-en-este-proyecto)
- [Configuración propuesta del tablero](#configuración-propuesta-del-tablero)
- [Vistas recomendadas](#vistas-recomendadas)
- [Automatizaciones](#automatizaciones)
- [Flujo de trabajo, paso a paso](#flujo-de-trabajo-paso-a-paso)
- [Buenas prácticas y errores a evitar](#buenas-prácticas-y-errores-a-evitar)

## ¿Qué es un Issue?

Un *Issue* es, en términos simples, **una tarjeta que representa una sola unidad de trabajo pendiente**: algo que hay que hacer, corregir o decidir, con un título, una descripción, y un espacio de conversación debajo donde cualquier persona puede comentar, hacer preguntas o proponer ajustes antes o durante el desarrollo.

Piénsalo como el equivalente digital de una ficha en un corcho de tareas: no es el trabajo en sí (el código, la guía, la corrección), sino **el registro de que ese trabajo existe, de qué se trata, quién lo está haciendo y en qué estado va**. Un *Issue* puede representar:

- Un módulo o tema nuevo por desarrollar (`nuevo_modulo.md`).
- Un error detectado en algo ya integrado (`bug_report.md`).
- Una mejora a una práctica existente (`mejora_practica.md`).
- Una tarea puntual dentro del desarrollo de un tema (`tarea_desarrollo.md`).

Cada *Issue* tiene un número único (`#12`, `#37`...) que se puede referenciar desde cualquier otro lugar del repositorio — en particular, desde un *pull request*, para que quede registrado qué *Issue* resuelve ese cambio de código (ver `CONTRIBUTING.md`).

## ¿Qué busca GitHub Projects?

Si un *Issue* es una tarjeta individual, **un Project es el tablero donde esas tarjetas se organizan, se agrupan y se visualizan en conjunto**. Su propósito no es registrar el trabajo (eso ya lo hace el *Issue*), sino responder preguntas como:

- ¿Qué se está haciendo ahora mismo, y qué está simplemente esperando turno?
- ¿Cuántos de los 21 temas del módulo de Comunicaciones Digitales ya están terminados, cuáles están en desarrollo y cuáles ni se han empezado?
- ¿Qué le corresponde revisar a un asesor específico esta semana?
- ¿Hay algo que lleva demasiado tiempo estancado en la misma etapa?

GitHub Projects toma los *Issues* (y los *pull requests*) del repositorio y los presenta en distintas formas — tablero estilo *kanban*, tabla, hoja de ruta — según qué pregunta se quiera responder en cada momento. No duplica la información: es una capa de organización y visualización sobre los mismos *Issues*.

## Cómo se relacionan entre sí

```
Issue                          Project
-----                          -------
Una unidad de trabajo          El tablero donde viven todos los Issues
(qué, quién, estado, discusión) organizados por estado, módulo, tema, etc.

  #14 "Tema 03: Cuantización"  ──►  aparece como una tarjeta en el tablero
  #15 "Tema 07: Modulación PAM" ──► aparece como otra tarjeta
  ...
```

Todo *Issue* del repositorio debería estar agregado al Project correspondiente (hay uno solo, con vistas distintas — ver más abajo — no un tablero por módulo). Un *Issue* sin *Project* asignado es trabajo invisible: existe, pero nadie lo ve al mirar el estado general.

## Convenciones de Issues en este proyecto

Estas ya están definidas en `.github/ISSUE_TEMPLATE/` y en `CONTRIBUTING.md`; se resumen aquí porque son la base de cómo se configura el tablero.

### Tipos de Issue (plantilla que se usa)

| Plantilla | Cuándo usarla | Etiqueta automática |
| --- | --- | --- |
| `nuevo_modulo.md` | Proponer o arrancar el desarrollo de un módulo o un tema completo | `tipo:nuevo-modulo` |
| `bug_report.md` | Reportar un error en algo ya integrado | `tipo:bug` |
| `mejora_practica.md` | Proponer una mejora a una práctica existente | `tipo:mejora` |
| `tarea_desarrollo.md` | Una tarea puntual dentro del desarrollo de un tema (no todo el tema, un paso de él) | `tipo:tarea` |

### Catálogo de etiquetas

Las etiquetas se agrupan por categoría, cada una con un prefijo que indica de qué tipo de información se trata (`tipo:`, `modulo:`, `etapa:`, `prioridad:`), más algunas etiquetas sueltas para situaciones puntuales.

**Tipo de trabajo** (automáticas desde las plantillas de Issue)

- `tipo:nuevo-modulo`
- `tipo:bug`
- `tipo:mejora`
- `tipo:tarea`

**Módulo** (una por módulo, se agrega según crecen)

- `modulo:comunicaciones-digitales`
- `modulo:senales-sistemas` (cuando exista, y así sucesivamente)

**Etapa del plan de trabajo**

- `etapa:alistamiento`
- `etapa:desarrollo`
- `etapa:validacion`
- `etapa:integracion`

**Prioridad** (para que el comité técnico decida qué revisar primero)

- `prioridad:alta`
- `prioridad:media`
- `prioridad:baja`

**Estado especial** (situaciones que no encajan en las columnas normales del tablero)

- `bloqueado` — depende de otro Issue o de una decisión externa antes de poder avanzar.
- `necesita-decision` — requiere que el comité técnico o el coordinador académico resuelva algo antes de continuar (ver `GOVERNANCE.md`, resolución de desacuerdos).
- `en-espera-de-asesor` — el estudiante ya hizo su parte, espera revisión.
- `duplicado` — ya existe otro Issue igual; se cierra referenciando al original.
- `no-se-hara` — se decidió explícitamente no abordarlo; siempre se comenta el motivo antes de cerrar.

**Alcance del cambio** (sobre todo útil para `tipo:mejora` y `tipo:bug`)

- `solo-documentacion` — el cambio no toca código, solo una guía, README o estándar.
- `rompe-compatibilidad` — cambia una función o script de forma que rompe algo que ya funcionaba en otro tema.

**Onboarding** (opcional)

- `primera-contribucion` — tarea acotada y bien delimitada, buena para alguien que recién se integra al equipo de un módulo.

### Qué no debe convertirse en etiqueta

Algunas cosas parecen etiquetas pero no lo son, porque tienen demasiados valores posibles o cambian con demasiada frecuencia — en ambos casos, terminan ensuciando la lista de labels del repositorio en vez de ayudar a filtrar:

- **El tema específico** (`03_cuantizacion`, `07_modulacion_pam`, ...) — va como campo **Tema** del Project, no como etiqueta (ver más abajo, "Qué NO se etiqueta con 21 labels distintas").
- **Nombres de estudiantes o asesores** — van como campo **Equipo/Asesor** del Project, o como *assignee* del Issue, nunca como label.
- **Semestre o cohorte** (`2026-1`, `2026-2`) — si se quiere agrupar el trabajo por semestre, se usa un campo tipo *iteration* en Projects, no una etiqueta nueva cada seis meses.

### Qué NO se etiqueta con 21 labels distintas

Para el tema específico dentro del módulo (`01_procesos_aleatorios`, `03_cuantizacion`, etc.) **no se crea una etiqueta por tema** — con 21 temas por módulo, esto ensuciaría rápidamente la lista de labels del repositorio. En su lugar, el tema se registra como un **campo personalizado dentro del Project** (ver siguiente sección), y opcionalmente en el título del Issue (`[Tema 03] Cuantización — desarrollo inicial`).

## Configuración propuesta del tablero

Un solo Project a nivel de repositorio (no uno por módulo), con estos campos personalizados además de los que trae Projects por defecto (Título, Asignado, Estado):

| Campo | Tipo | Opciones / uso |
| --- | --- | --- |
| **Estado** | Selección única (por defecto de Projects) | `Backlog`, `Por hacer`, `En progreso`, `En revisión`, `Hecho` |
| **Módulo** | Selección única | `Comunicaciones Digitales`, y las que se agreguen a futuro |
| **Tema** | Texto o selección única | El nombre de la carpeta (`03_cuantizacion`, `07_modulacion_pam`, ...), vacío si el Issue no corresponde a un tema específico |
| **Tipo** | Selección única | `Nuevo módulo`, `Bug`, `Mejora`, `Tarea` (refleja la etiqueta) |
| **Etapa** | Selección única | `Alistamiento`, `Desarrollo`, `Documentación y validación`, `Integración` |
| **Equipo / Asesor** | Texto o Persona | Quién lo está desarrollando y quién lo asesora |
| **Prioridad** | Selección única | `Alta`, `Media`, `Baja` |

Las cinco columnas de **Estado** son las que se ven en la vista de tablero (*kanban*), que es la vista principal del día a día:

```
Backlog  →  Por hacer  →  En progreso  →  En revisión  →  Hecho
```

- **Backlog** — ideas o temas identificados pero sin equipo asignado todavía (los 21 temas del módulo piloto arrancan aquí).
- **Por hacer** — ya tiene equipo/estudiante asignado, no ha empezado.
- **En progreso** — en desarrollo activo.
- **En revisión** — *pull request* abierto, esperando revisión del asesor/comité técnico (ver `GOVERNANCE.md`).
- **Hecho** — integrado a `main`.

## Vistas recomendadas

Sobre el mismo conjunto de *Issues*, se configuran varias vistas según la pregunta que se quiera responder:

1. **Tablero (Kanban) por Estado** — la vista de trabajo diario, para ver qué está en progreso o esperando revisión.
2. **Una vista por módulo, filtrada por `Módulo = [nombre]` y agrupada por `Tema`** — GitHub Projects no permite agrupar por dos campos a la vez (no existe un "Módulo → Tema" jerárquico en una sola vista), así que el efecto se logra combinando dos mecanismos distintos: el **filtro** aísla los Issues de un módulo específico, y el **agrupamiento** los organiza por tema dentro de esa vista. Es el equivalente visual a la tabla del mapa curricular en el `README.md` de cada módulo. Cuando exista un segundo módulo, se duplica esta vista y se cambia el filtro.
3. **Tabla filtrada por Equipo/Asesor** — para que un asesor vea solo lo que le corresponde revisar o acompañar, sin tener que mirar los 21 temas de otros equipos.
4. **Tabla filtrada por Tipo = Bug** — para dar visibilidad rápida a errores reportados sobre módulos ya integrados, que compiten por atención con el desarrollo de temas nuevos.

## Automatizaciones

GitHub Projects permite configurar reglas simples (*workflows*) que mueven las tarjetas automáticamente, para no depender de que alguien actualice el tablero a mano:

- Al agregar un *Issue* nuevo al Project → **Estado = Backlog**.
- Al abrir un *pull request* que referencia un Issue (`Closes #N`) → mover ese Issue a **En revisión**.
- Al hacer *merge* del *pull request* → mover el Issue a **Hecho** y cerrarlo automáticamente (comportamiento nativo de GitHub cuando el PR incluye `Closes #N`, ver `CONTRIBUTING.md`).

Esto mantiene el tablero honesto sin trabajo manual adicional: si alguien sigue el flujo normal de *pull request*, el tablero se actualiza solo.

## Flujo de trabajo, paso a paso

1. Se identifica un tema o tarea (por ejemplo, uno de los 21 temas del mapa curricular) y se abre un *Issue* con la plantilla correspondiente. Se agrega al Project → cae en **Backlog**.
2. El comité técnico asigna equipo/asesor (ver `GOVERNANCE.md`, "Flujo de vida de un módulo"), completa los campos **Módulo**, **Tema**, **Equipo/Asesor**, **Prioridad**, y mueve la tarjeta a **Por hacer**.
3. Al empezar a trabajar, quien lo desarrolla mueve la tarjeta a **En progreso** (o la deja que se mueva sola si su flujo de *commits* está vinculado).
4. Al abrir el *pull request* (referenciando el Issue), la tarjeta pasa a **En revisión** automáticamente.
5. Al aprobarse e integrarse, pasa a **Hecho** y el Issue se cierra solo.
6. El estado del tema se refleja también en la tabla del `README.md` del módulo (ver `CHANGELOG.md` para el registro histórico de integraciones).

## Buenas prácticas y errores a evitar

- **Un Issue, una unidad de trabajo verificable.** Si un Issue describe "desarrollar todo el módulo de Comunicaciones Digitales", es demasiado grande para dar seguimiento útil; ábrelo por tema (o usa `tarea_desarrollo.md` para dividir un tema en pasos si hace falta).
- **No dejar Issues sin Project.** Un Issue fuera del tablero no se ve en ninguna vista de conjunto, aunque exista.
- **No crear una etiqueta por tema.** Usa el campo **Tema** del Project, no una nueva label — ver la sección de convenciones más arriba.
- **Mover la tarjeta refleja la realidad, no al revés.** Si algo lleva semanas en "En progreso" sin actividad real, es una señal de que hay que revisarlo (ver `GOVERNANCE.md`, continuidad entre semestres), no de mover la tarjeta para que se vea mejor.
- **Cerrar un Issue sin *pull request* asociado** solo es válido si se decidió explícitamente no hacer ese trabajo (por ejemplo, un tema que se descarta); en ese caso, se comenta la razón antes de cerrarlo, para que quede como memoria y no como un vacío sin explicación.
