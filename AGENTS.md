# Instrucciones para asistentes de IA

Este archivo sigue la convención `AGENTS.md`, adoptada por varias herramientas de codificación asistida por IA (independientemente del proveedor) como punto de entrada estándar para dar contexto a un agente que trabaje sobre este repositorio. Si estás usando un asistente de IA (Claude, ChatGPT/Codex, Copilot, Cursor, Gemini u otro) como apoyo para desarrollar o modificar un módulo, dale a leer este archivo primero, junto con `docs/estandares/`.

## Qué es este proyecto

Herramienta modular de simulación en MATLAB para apoyar la enseñanza de telecomunicaciones en la Universidad del Cauca. No es solo software: cada módulo es también material pedagógico, evaluado tanto por corrección técnica como por calidad didáctica. Ver `README.md` para el contexto completo.

## Antes de generar o modificar código

1. Lee `docs/estandares/estandar_codigo.md` completo. No asumas convenciones genéricas de MATLAB o de otros lenguajes; este proyecto tiene reglas propias (bloque de parámetros al inicio, encabezados obligatorios, prohibición de números mágicos, etc.).
2. Identifica si lo que vas a escribir es una **función reutilizable** (`funciones/`) o un **script de sistema** (`practicas/[tema]/`) — tienen reglas y encabezados distintos. Ver la sección "Dos tipos de código" de `estandar_codigo.md`.
3. Si vas a crear una práctica nueva, lee también `docs/estandares/estandar_pedagogico.md` — una práctica no está completa solo con que el código funcione.
4. Revisa `docs/plantillas/` antes de escribir un archivo desde cero.

## Reglas de código que no debes romper

- Todo parámetro modificable va en un único bloque `%% Parámetros configurables` al inicio del *script*, con unidad y rango como comentario. Nunca disperses valores "mágicos" en medio del cálculo.
- Toda función lleva el encabezado estándar completo (propósito, entradas, salidas, autor, fecha, versión) — no lo omitas ni lo abrevies "por brevedad".
- Todo script de sistema declara explícitamente: versión mínima de MATLAB, *toolboxes* requeridos y la lista completa de funciones propias que invoca.
- Las funciones de cálculo no imprimen ni grafican; esa responsabilidad es del script de sistema.
- Ninguna gráfica se genera sin título, ejes con unidades, leyenda (si aplica) y rejilla.
- No inventes resultados de referencia, valores de BER, o datos de prueba: si necesitas un caso de prueba y no puedes ejecutarlo, dilo explícitamente en vez de generar un número plausible.

## Documentación que debes generar o actualizar

Si tu tarea toca un módulo, verifica si corresponde actualizar:

- El `README.md` del módulo (no el de la raíz).
- Los documentos de `docs/` del módulo que apliquen (ver `estandar_documentacion.md` para qué va en cada uno de los 9).
- La guía de práctica del tema que modificaste, si el cambio afecta lo que el estudiante observa o hace.
- El mapa de relación curricular, si agregaste o quitaste conceptos abordados.

No generes los 9 documentos completos de forma automática y superficial solo para "cumplir la lista"; si no tienes información real para un documento (por ejemplo, `09_decisiones_tecnicas.md` sin decisiones de diseño que documentar todavía), dilo en vez de rellenarlo con contenido genérico.

## Qué no debes hacer

- No integres ni sugieras integrar cambios directamente en `main`. Todo cambio va en una rama y se propone como *pull request* (ver `CONTRIBUTING.md` y `GOVERNANCE.md`).
- No elimines ni modifiques `validacion/resultados_referencia/` para hacer que un caso de prueba "pase"; si un resultado no coincide, repórtalo como una discrepancia a resolver, no la ocultes ajustando el número de referencia.
- No agregues dependencias de *toolboxes* adicionales si existe una alternativa razonable en MATLAB base (ver `estandar_codigo.md`, sección de dependencias).
- No reproduzcas código con licencia incompatible ni copies fragmentos de otros repositorios sin verificar su licencia.
- No asumas que un módulo existente sigue exactamente esta estructura si fue creado antes de una actualización de estándares; verifica antes de generalizar.

## Si algo no está claro

Si una instrucción del usuario entra en conflicto con `docs/estandares/` o con este archivo, señala el conflicto explícitamente en vez de resolverlo silenciosamente en un sentido u otro. Los estándares son de cumplimiento obligatorio y solo el coordinador técnico puede aprobar una excepción.
