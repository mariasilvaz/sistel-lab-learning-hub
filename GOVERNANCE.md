# Gobernanza del proyecto

Este documento formaliza quién decide qué, cómo se otorgan y retiran accesos en GitHub, y cómo se traduce en configuración técnica del repositorio. Es la referencia autoritativa cuando `README.md` o `CONTRIBUTING.md` dicen "ver GOVERNANCE.md".

## Índice

- [Roles y responsabilidades](#roles-y-responsabilidades)
- [Comité técnico](#comité-técnico)
- [Estructura de acceso en GitHub](#estructura-de-acceso-en-github)
- [Reglas de protección de la rama main](#reglas-de-protección-de-la-rama-main)
- [Flujo de vida de un módulo](#flujo-de-vida-de-un-módulo)
- [Continuidad entre semestres](#continuidad-entre-semestres)
- [Resolución de desacuerdos](#resolución-de-desacuerdos)
- [Cambios a este documento](#cambios-a-este-documento)

## Roles y responsabilidades

| Rol | Quién lo ejerce | Responsabilidad principal | Permiso en GitHub |
| --- | --- | --- | --- |
| **Coordinador académico** | Docente designado por el jefe de departamento | Articula el proyecto con el departamento, gestiona la vinculación de estudiantes y asignaturas, garantiza pertinencia curricular | Admin |
| **Comité técnico (coordinador técnico)** | 2–3 docentes designados (ver más abajo) | Administra el repositorio, revisa y aprueba *pull requests*, mantiene los estándares, emite concepto técnico | Admin |
| **Docente asesor de módulo** | Docente vinculado a un módulo específico | Valida contenido técnico y pedagógico del módulo, acompaña al equipo estudiantil, evalúa junto al coordinador técnico | Write, solo en el módulo asignado (vía Team) |
| **Co-autor de módulo** | Docente de la asignatura relacionada | Define contenidos, prácticas y preguntas guía con el equipo del módulo | Write, solo en el módulo asignado (vía Team) |
| **Estudiante colaborador** | Estudiante participando activamente en un módulo | Desarrolla el módulo completo siguiendo los estándares, solo o en equipo | Write, solo en el módulo asignado, mientras dure su participación |
| **Usuario y validador** | Cualquier docente del departamento | Prueba módulos integrados, reporta mejoras vía *Issues* | Read (o ninguno; el repo es público) |

## Comité técnico

La coordinación técnica la asume un **comité de 2 a 3 docentes**, nunca una sola persona, para evitar que el proyecto dependa de la disponibilidad de un único responsable.

Responsabilidades del comité:

- Administrar el repositorio institucional y los permisos de acceso (altas y bajas de colaboradores).
- Revisar y aprobar (o solicitar cambios en) cada *pull request*.
- Mantener actualizados los documentos de `docs/estandares/`.
- Coordinar la comunicación entre equipos de módulos que trabajan en paralelo.
- Emitir el concepto técnico de cada módulo desarrollado, como insumo para cualquier proceso de evaluación académica que aplique.
- Garantizar la continuidad del proyecto entre semestres y cohortes de estudiantes.

El jefe de departamento designa a los integrantes del comité al inicio del proyecto y gestiona el reconocimiento de esta función en el plan de trabajo docente.

## Estructura de acceso en GitHub

El acceso se organiza así, para que el control de "quién puede tocar qué" sea explícito y no dependa de acuerdos verbales:

1. **Organización de GitHub del departamento** — el repositorio vive dentro de una organización, no en la cuenta personal de nadie. Esto evita que el proyecto quede atado a una sola persona si esta se retira de la universidad.
2. **Un *Team* de GitHub por módulo activo** (por ejemplo, `equipo-comunicaciones-digitales`), con acceso de escritura restringido a la carpeta de ese módulo mediante `CODEOWNERS`.
3. **`CODEOWNERS`** en la raíz del repositorio mapea cada carpeta `modulos/[nombre_modulo]/` al *Team* correspondiente y al docente asesor. GitHub exige automáticamente su revisión en cualquier *pull request* que toque esa carpeta.
4. **Alta y baja de acceso ligada a la participación en el módulo**: el comité técnico agrega al estudiante al *Team* de su módulo al iniciar, y lo retira (o lo pasa a solo lectura) al finalizar su participación, se complete o no el módulo.
5. **El comité técnico y el coordinador académico son los únicos con rol Admin**, que es el único rol capaz de modificar las reglas de protección de rama o los permisos de otros.

## Reglas de protección de la rama main

Configuración obligatoria en GitHub (`Settings → Branches → Branch protection rules` para `main`):

- [ ] **Require a pull request before merging** — nadie hace *push* directo a `main`.
- [ ] **Require approvals** — mínimo 1 aprobación.
- [ ] **Require review from Code Owners** — activa `CODEOWNERS`, de modo que la aprobación debe venir del asesor/Team dueño del módulo tocado.
- [ ] **Require status checks to pass before merging** — el flujo de `lint_y_pruebas.yml` (`.github/workflows/`) debe pasar en verde.
- [ ] **Require branches to be up to date before merging**.
- [ ] **Restrict who can push to matching branches** — solo el comité técnico.
- [ ] **Do not allow bypassing the above settings** — ni siquiera un Admin puede saltarse el proceso por accidente.
- [ ] **Block force pushes** y **block branch deletion** sobre `main`.

Estas reglas son la garantía técnica de la afirmación en `README.md`: *"main es siempre la versión aprobada"*. No dependen de que alguien recuerde seguir el proceso manualmente.

## Flujo de vida de un módulo

1. Se abre un *Issue* con la plantilla `nuevo_modulo.md`, describiendo alcance, asignaturas relacionadas y estudiante(s)/asesor propuestos.
2. El comité técnico aprueba el alcance y crea el *Team* del módulo (si no existe) y la carpeta base en `modulos/[nombre_modulo]/` a partir de `docs/plantillas/`.
3. Se agrega al/a los estudiante(s) y al asesor al *Team*, con acceso de escritura únicamente sobre esa carpeta.
4. El equipo del módulo trabaja en su rama (`modulo/nombre-modulo`), siguiendo `CONTRIBUTING.md` y los estándares de `docs/estandares/`.
5. Al finalizar, abre un *pull request* hacia `main`. `CODEOWNERS` solicita automáticamente la revisión del asesor y el comité técnico.
6. Tras aprobación y checks en verde, el comité técnico integra el *pull request*.
7. Se retira el acceso de escritura del estudiante, se actualiza `CHANGELOG.md` y la tabla de módulos en `README.md`.

## Continuidad entre semestres

- Los documentos de `docs/estandares/` son la memoria institucional del proyecto: cualquier estudiante nuevo debe poder incorporarse leyendo únicamente `README.md`, `CONTRIBUTING.md`, este documento y los estándares, sin depender de explicaciones verbales de quienes participaron antes.
- Si la participación de un estudiante en un módulo se interrumpe antes de completarlo, el código y la documentación producidos hasta ese punto permanecen en su rama (no se elimina), y el comité técnico decide si otro estudiante la retoma más adelante.
- Al cierre de cada fase, el comité técnico marca el estado en la tabla de `README.md` y, si corresponde, crea una *release* de GitHub (por ejemplo, `v1.0-piloto`) como punto de referencia estable.
- Cualquier reconocimiento académico formal del trabajo (créditos, pasantía, trabajo de grado u otra modalidad) se gestiona a través del proceso institucional correspondiente, por fuera del alcance de este documento.

## Resolución de desacuerdos

Si el asesor y el coordinador técnico no llegan a consenso sobre la aprobación de un *pull request* o sobre la evaluación del trabajo de un estudiante, el caso se eleva al coordinador académico y, de ser necesario, al Comité de Programa.

## Cambios a este documento

Cambios a la estructura de gobernanza (roles, reglas de protección de rama, composición del comité técnico) requieren *pull request* aprobado por el coordinador académico y al menos un integrante del comité técnico, dado que afectan a todos los módulos por igual.
