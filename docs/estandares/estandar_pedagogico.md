# Estándar pedagógico

Define qué hace que una práctica sea pedagógicamente válida dentro de este proyecto. No basta con que el código funcione: cada práctica debe estar diseñada para que el estudiante analice, compare y justifique, no solo para que ejecute un *script* y lea un número al final.

## Índice

- [Principio general](#principio-general)
- [Elementos obligatorios de toda práctica](#elementos-obligatorios-de-toda-práctica)
- [Preguntas orientadoras](#preguntas-orientadoras)
- [Comparación de escenarios](#comparación-de-escenarios)
- [Lo que una práctica no debe ser](#lo-que-una-práctica-no-debe-ser)
- [Checklist de revisión pedagógica](#checklist-de-revisión-pedagógica)

## Principio general

El propósito de la herramienta es que el estudiante **modifique, visualice y analice**:

- **Modificar** — ajustar parámetros y observar el efecto sobre señales, canales y métricas de desempeño.
- **Visualizar** — ver resultados intermedios en cada etapa del procesamiento, no solo el resultado final.
- **Analizar** — responder preguntas orientadoras y comparar escenarios, para promover el pensamiento crítico.

Una práctica que solo entrega un número o una gráfica final, sin permitir estas tres acciones, no cumple el estándar, aunque el código sea correcto.

## Elementos obligatorios de toda práctica

Toda práctica (documentada en `practicas/` de cada módulo) debe incluir:

1. **Objetivo claro y medible** — qué debería poder hacer o explicar el estudiante al terminar, en términos verificables (no "entender la modulación QPSK", sino "explicar por qué QPSK duplica la eficiencia espectral de BPSK a costa de mayor sensibilidad al ruido").
2. **Descripción del fenómeno o modelo** — el fundamento físico o matemático que se está simulando, en un nivel suficiente para interpretar los resultados, sin repetir un curso completo.
3. **Parámetros configurables con rangos válidos y valores por defecto** — ver `estandar_codigo.md` para el formato técnico.
4. **Código documentado con comentarios orientadores** — el código en sí es material didáctico, no solo una herramienta de cálculo.
5. **Visualizaciones intermedias** — el estado de la señal en cada etapa relevante del procesamiento (ej: señal antes y después del canal, antes y después de la demodulación), no solo el resultado final.
6. **Métricas de desempeño con interpretación explícita** — no basta con imprimir un valor de BER; la guía debe indicar qué significa ese valor en contexto (¿es alto o bajo para este escenario? ¿por qué?).
7. **Preguntas orientadoras** — ver sección dedicada más abajo.
8. **Comparación entre al menos dos escenarios o configuraciones distintas** — ver sección dedicada más abajo.
9. **Conclusiones esperadas como guía para el docente** — un resumen de qué debería concluir un estudiante que completó bien la práctica, útil para quien la evalúe.

## Preguntas orientadoras

Cada práctica incluye preguntas que el estudiante debe poder responder al terminar, apoyándose en lo que observó al modificar parámetros. Ejemplos de referencia (del módulo piloto de comunicaciones digitales):

- ¿Qué ocurre cuando se aumenta el ruido del canal?
- ¿Cómo cambia el espectro al modificar el tipo de modulación?
- ¿Por qué una modulación de mayor orden es más eficiente pero más sensible al ruido?
- ¿Qué compromisos existen entre ancho de banda, potencia y probabilidad de error?

Las preguntas orientadoras de un módulo nuevo deben seguir este mismo espíritu: apuntan a relaciones causa-efecto y a compromisos de diseño (*trade-offs*), no a "leer un valor de la pantalla".

## Comparación de escenarios

Toda práctica contrasta explícitamente **al menos dos configuraciones**, por ejemplo:

- Dos esquemas de modulación bajo el mismo canal.
- El mismo esquema bajo dos niveles distintos de SNR.
- Con y sin un mecanismo de codificación de canal.

La comparación debe presentarse de forma que el estudiante vea las dos (o más) salidas lado a lado o superpuestas (misma gráfica con leyenda, o gráficas alineadas), no en ejecuciones separadas y desconectadas entre sí.

## Lo que una práctica no debe ser

- Una "caja negra" donde el estudiante ejecuta un botón y obtiene un resultado sin visibilidad del proceso.
- Una demostración de un único escenario fijo, sin parámetros que el estudiante pueda cambiar.
- Un ejercicio puramente de transcripción (copiar código de un enunciado sin decisiones que tomar).

## Checklist de revisión pedagógica

Quien revisa la calidad pedagógica de un módulo (ver `GOVERNANCE.md`) verifica que cada práctica cumpla:

- [ ] Tiene un objetivo medible, no solo un tema.
- [ ] Incluye descripción del fenómeno o modelo, proporcional en extensión al nivel de la práctica.
- [ ] Los parámetros configurables permiten explorar al menos un compromiso de diseño real.
- [ ] Hay visualizaciones intermedias, no solo el resultado final.
- [ ] Las métricas vienen acompañadas de interpretación, no solo del valor numérico.
- [ ] Incluye preguntas orientadoras que exigen relacionar causa y efecto.
- [ ] Compara explícitamente al menos dos escenarios.
- [ ] Incluye conclusiones esperadas como guía de evaluación para el docente.
