# Guía de contribución

Gracias por aportar a la Herramienta Modular de Simulación. Este documento explica **cómo** se contribuye: flujo de trabajo, requisitos antes de abrir un *pull request* y el proceso de revisión. Los estándares de contenido (qué debe llevar el código y la documentación) están en `docs/estandares/`, no aquí.

## Índice

- [Quién puede contribuir](#quién-puede-contribuir)
- [Antes de empezar](#antes-de-empezar)
- [Flujo de trabajo con Git](#flujo-de-trabajo-con-git)
- [Issues y GitHub Projects](#issues-y-github-projects)
- [Checklist antes de abrir un pull request](#checklist-antes-de-abrir-un-pull-request)
- [Proceso de revisión](#proceso-de-revisión)
- [Definición de "módulo terminado"](#definición-de-módulo-terminado)

## Quién puede contribuir

- **Estudiantes** desarrollando un módulo, de forma individual o en equipo, con acompañamiento de un docente asesor.
- **Docentes asesores o co-autores**, definiendo alcance, prácticas y preguntas orientadoras.
- **Docentes usuarios/validadores**, reportando mejoras sobre módulos ya integrados sin necesidad de escribir código.

Si no perteneces a ninguna categoría pero quieres aportar, abre un *Issue* para discutirlo antes de escribir código.

## Acceso al repositorio

El repositorio es público para lectura, pero el permiso de **escritura es restringido y nominal**:

- Solo puede crear ramas y hacer *push* quien tenga acceso de escritura otorgado explícitamente por el coordinador técnico (como colaborador o como miembro del *Team* de GitHub correspondiente a su módulo).
- El acceso se otorga al iniciar la participación en un módulo, y se retira al finalizar. No es un permiso permanente ni transferible.
- Si no tienes acceso de escritura y quieres proponer un cambio (por ejemplo, como usuario/validador externo al equipo del módulo), hazlo mediante un *fork* del repositorio y abre un *pull request* desde ahí; seguirá el mismo proceso de revisión.
- Independientemente del acceso de escritura, **nadie puede hacer *merge* a `main` sin aprobación del coordinador técnico**. Esto está reforzado con reglas de protección de la rama `main` a nivel de GitHub (revisión obligatoria vía *CODEOWNERS*, bloqueo de *push* directo), no depende de la buena voluntad de quien tenga acceso.

## Antes de empezar

1. Lee `docs/estandares/estandar_codigo.md`, `estandar_documentacion.md` y `estandar_pedagogico.md`. Son de cumplimiento obligatorio; el *pull request* no se aprueba si no los cumple.
2. Revisa `docs/plantillas/` — toda función, práctica y guía nueva parte de esas plantillas, no desde cero.
3. Confirma con tu asesor el alcance del módulo o la mejora, y abre (o reclama) un *Issue* que lo describa antes de crear la rama.

## Flujo de trabajo con Git

1. Crea tu rama desde `main`: `modulo/nombre-modulo` o `fix/descripcion-breve`.
2. Trabaja con *commits* frecuentes y descriptivos (qué cambia y por qué, no solo "avance").
3. A mitad de desarrollo, solicita una revisión interna informal a tu asesor (sin integrar a `main`).
4. Al terminar, abre un *pull request* hacia `main` usando la plantilla de `.github/PULL_REQUEST_TEMPLATE.md`.
5. Atiende los comentarios del coordinador técnico y del asesor.
6. Solo el coordinador técnico integra a `main`, y únicamente tras aprobación explícita del *pull request*.

No se integra código directamente a `main` sin pasar por este proceso, sin excepción.

## Issues y GitHub Projects

Para una explicación más detallada sobre cómo crear Issues, usar etiquetas y organizar el tablero de GitHub Projects, consulta `docs/guias/guia_issues_projects.md`.

Todo trabajo (módulo nuevo, error, mejora de práctica, tarea de desarrollo) debe estar respaldado por un *Issue*:

- Usa la plantilla correspondiente en `.github/ISSUE_TEMPLATE/`.
- Etiqueta el *Issue* con el módulo afectado (`modulo:...`), el tipo (`tipo:bug` / `tipo:feature` / `tipo:documentacion`) y, si aplica, la etapa del plan de trabajo (`etapa:alistamiento`, `etapa:desarrollo`, `etapa:validacion`, `etapa:integracion`).
- Vincula el *Issue* al tablero de GitHub Projects del módulo o de la fase correspondiente, y mueve la tarjeta a medida que avanzas.
- Todo *pull request* debe referenciar el *Issue* que resuelve (`Closes #N`).

## Checklist antes de abrir un pull request

- [ ] El código corre sin errores con los parámetros por defecto.
- [ ] Los parámetros configurables están agrupados al inicio del *script* principal, con unidades y rango válido comentados.
- [ ] Cada función tiene encabezado estándar (nombre, propósito, entradas, salidas, autor, fecha, versión).
- [ ] No hay `disp()` sin contexto; los resultados usan `fprintf()` con etiqueta y unidades.
- [ ] Las gráficas tienen título, ejes con unidades, leyenda (si aplica) y rejilla.
- [ ] El módulo incluye los 9 documentos de `docs/` (ver `estandar_documentacion.md`).
- [ ] Existen al menos 2 guías de práctica y 3 casos de prueba documentados.
- [ ] El `README.md` del módulo está completo (dependencias, instrucciones de uso, autoría).
- [ ] El *Issue* correspondiente está referenciado en la descripción del *pull request*.

## Proceso de revisión

El coordinador técnico revisa el cumplimiento de los estándares técnicos; el asesor del módulo revisa la documentación y la calidad pedagógica. Si el trabajo se enmarca además en un proceso de evaluación académica formal (por ejemplo, una asignatura, un trabajo de grado o una modalidad de práctica), esos criterios adicionales los define y aplica la instancia académica correspondiente, por fuera de este repositorio. El detalle de quién aprueba qué en GitHub está en `GOVERNANCE.md`.

Un *pull request* puede recibir solicitudes de cambio más de una vez; esto es parte normal del proceso, no una señal de rechazo del módulo.

## Definición de "módulo terminado"

Un módulo se considera listo para integrar cuando:

1. Pasa la revisión técnica y pedagógica descrita arriba.
2. El *pull request* está aprobado por el coordinador técnico.
3. Toda la documentación obligatoria está presente y sigue la plantilla.
4. Los casos de prueba se ejecutan y coinciden con los resultados de referencia documentados.

Solo entonces se actualiza `CHANGELOG.md` y la tabla de módulos en `README.md`.
