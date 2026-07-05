# Issues iniciales — Módulo Comunicaciones Digitales

No existen Issues separados de "funciones transversales". Cada función nace dentro del sub-issue del tema que la necesita por primera vez, y los temas siguientes la reutilizan directamente (ver `docs/03_arquitectura.md` del módulo). El orden en que aparecen los temas en este documento (01 → 21) es también, por defecto, el orden en que se asume que las funciones compartidas se van creando — si un tema se desarrolla fuera de orden y ya necesita una función "creada" en un tema posterior, simplemente se adelanta su creación ahí.

Cada tema se maneja como:

- **Un Issue padre** (plantilla `nuevo_modulo.md`) — define el alcance completo del tema y enumera sus sub-issues como lista de tareas.
- **Varios Issues hijos** (plantilla `tarea_desarrollo.md`) — pasos progresivos del desarrollo, cada uno referenciando al padre (`Relacionado con #N`).

**Los 21 temas están completamente desarrollados** en este documento, con el nivel de detalle acordado (Issue padre + sub-issues progresivos, funciones naciendo donde se necesitan por primera vez).

---

## Tema 01 — Procesos aleatorios: media, autocorrelación y autocovarianza

### Issue padre: [Tema 01] Procesos aleatorios

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 01 — Procesos aleatorios (`practicas/01_procesos_aleatorios/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Probabilidad y Estadística, Procesamiento Digital de Señales.

**Justificación:** Es la base estadística de todo el módulo. Temario 1.1–1.3.

**Alcance propuesto:**
- [ ] 01.1 — Exploración de funciones y distribuciones para procesos estocásticos
- [ ] 01.2 — Promedios estadísticos de un proceso estocástico individual
- [ ] 01.3 — Promedios estadísticos entre dos procesos estocásticos

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 1 — base teórica del módulo.

---

### Sub-issue 01.1 — Exploración de funciones y distribuciones para procesos estocásticos

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 01

**Módulo:** `practicas/01_procesos_aleatorios/`

**Descripción de la tarea:** Explorar qué funciones de MATLAB (y cuáles hay que construir propias) permiten generar realizaciones de un proceso estocástico con distintas distribuciones (uniforme, gaussiana, exponencial, u otras relevantes). Es el primer paso del tema y, en la práctica, del módulo completo.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** Al menos 2-3 distribuciones distintas se pueden generar de forma configurable (número de realizaciones, longitud, parámetros propios); queda documentado qué función se usa para cada una.

**Dependencias:** Ninguna.

---

### Sub-issue 01.2 — Promedios estadísticos de un proceso estocástico individual

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 01

**Módulo:** `practicas/01_procesos_aleatorios/`

**Descripción de la tarea:** A partir de 01.1, implementar el cálculo de media y varianza de un proceso individual, y verificar si se comporta como estacionario en sentido amplio.

**Etapa:** Desarrollo

**Criterio de aceptación:** La(s) función(es) devuelven media y varianza estimadas, comparadas contra el valor teórico para al menos una distribución de 01.1.

**Dependencias:** 01.1

---

### Sub-issue 01.3 — Promedios estadísticos entre dos procesos estocásticos

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 01

**Módulo:** `practicas/01_procesos_aleatorios/`

**Descripción de la tarea:** Extender 01.2 a dos procesos: implementar autocorrelación (dentro de un proceso) y correlación/covarianza cruzada entre dos procesos distintos. Candidata a vivir en `funciones/analisis_senales/estimar_autocorrelacion.m`, reutilizada más adelante por el Tema 04 (verificación de blancura del ruido AWGN).

**Etapa:** Desarrollo

**Criterio de aceptación:** Se valida con un caso de resultado teórico conocido (ej. dos procesos independientes, correlación cruzada esperada cero).

**Dependencias:** 01.1, 01.2

---

## Tema 02 — Densidad espectral y sistemas LTI

### Issue padre: [Tema 02] Densidad espectral y sistemas LTI

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 02 — Densidad espectral y sistemas LTI (`practicas/02_densidad_espectral_lti/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Procesamiento Digital de Señales.

**Justificación:** Temario 1.4–1.5. Necesario antes de entender cómo un canal o un filtro conformador modifica el espectro de una señal transmitida (Temas 05, 06 y siguientes).

**Alcance propuesto:**
- [ ] 02.1 — Densidad espectral de potencia/energía de un proceso aleatorio
- [ ] 02.2 — Exploración de funciones para sistemas LTI
- [ ] 02.3 — Señal aleatoria a través de un sistema LTI (dominio del tiempo)
- [ ] 02.4 — Densidad espectral después del sistema LTI, y comparación

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 1 — base teórica del módulo. Depende del Tema 01.

---

### Sub-issue 02.1 — Densidad espectral de potencia/energía de un proceso aleatorio

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 02

**Módulo:** `practicas/02_densidad_espectral_lti/`

**Descripción de la tarea:** Calcular la densidad espectral de potencia (o energía) de un proceso estocástico, usando `funciones/analisis_senales/calcular_espectro.m` (ya implementada) sobre los procesos generados en el Tema 01 (01.1).

**Etapa:** Desarrollo

**Criterio de aceptación:** La densidad espectral estimada coincide razonablemente con el resultado teórico esperado para un proceso de referencia (ej. ruido blanco, PSD teórica plana).

**Dependencias:** Tema 01 (01.1), `calcular_espectro.m` (ya disponible)

---

### Sub-issue 02.2 — Exploración de funciones para sistemas LTI

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 02

**Módulo:** `practicas/02_densidad_espectral_lti/`

**Descripción de la tarea:** Explorar funciones de MATLAB (y propias, si hace falta) para representar un sistema LTI por su respuesta al impulso y calcular su salida ante una entrada (convolución).

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** Se define un sistema LTI simple (ej. filtro pasa-bajas) y se calcula su salida ante una señal de prueba, verificada contra un caso con solución analítica sencilla.

**Dependencias:** Ninguna — puede desarrollarse en paralelo con 02.1.

---

### Sub-issue 02.3 — Señal aleatoria a través de un sistema LTI (dominio del tiempo)

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 02

**Módulo:** `practicas/02_densidad_espectral_lti/`

**Descripción de la tarea:** Pasar un proceso aleatorio del Tema 01 a través del sistema LTI de 02.2, observando el efecto en el dominio del tiempo.

**Etapa:** Desarrollo

**Criterio de aceptación:** Se muestra la señal antes y después del sistema LTI, con explicación cualitativa coherente del efecto.

**Dependencias:** 02.2, Tema 01 (01.1)

---

### Sub-issue 02.4 — Densidad espectral después del sistema LTI, y comparación

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 02

**Módulo:** `practicas/02_densidad_espectral_lti/`

**Descripción de la tarea:** Calcular la densidad espectral a la salida del sistema LTI (misma función de 02.1) y compararla contra la de entrada, relacionando el cambio con la respuesta en frecuencia del sistema.

**Etapa:** Desarrollo / Documentación y validación

**Criterio de aceptación:** La densidad espectral de salida es consistente con la de entrada multiplicada por la magnitud al cuadrado de la respuesta en frecuencia (verificación cualitativa o cuantitativa).

**Dependencias:** 02.1, 02.3

---

## Tema 03 — Cuantificación de señales aleatorias

### Issue padre: [Tema 03] Cuantificación de señales aleatorias

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 03 — Cuantificación (`practicas/03_cuantizacion/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Procesamiento Digital de Señales.

**Justificación:** Temario 1.6. Puente entre la conversión análoga-digital y la codificación de fuente (Tema 17): la cuantización desarrollada aquí es la misma que usan `funciones/fuente/audio_a_bits.m` e `imagen_a_bits.m`, y la que retoma el Tema 17 para contrastar contra el teorema de Shannon.

**Alcance propuesto:**
- [ ] 03.1 — Cuantización escalar de una señal determinística
- [ ] 03.2 — Cuantización uniforme de una señal aleatoria con PDF finita (uniforme)
- [ ] 03.3 — Cuantización uniforme de una señal aleatoria con PDF infinita (gaussiana)
- [ ] 03.4 — Cuantización no uniforme optimizada con Lloyd-Max
- [ ] 03.5 — Análisis comparativo: error granular vs. error de saturación

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 1 — base teórica del módulo. Prioritario: bloquea a `funciones/fuente/` (audio/imagen) y al Tema 17.

---

### Sub-issue 03.1 — Cuantización escalar de una señal determinística

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 03

**Módulo:** `practicas/03_cuantizacion/`

**Descripción de la tarea:** Implementar `cuantizar_uniforme.m` (nace aquí) y aplicarla sobre una señal determinística (ej. una senoidal), aislando el mecanismo de cuantización del efecto de la aleatoriedad.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** La señal cuantizada se ve correctamente escalonada; el error de cuantización es visualmente acotado y consistente con el número de niveles configurado.

**Dependencias:** Ninguna.

---

### Sub-issue 03.2 — Cuantización uniforme de una señal aleatoria con PDF finita (uniforme)

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 03

**Módulo:** `practicas/03_cuantizacion/`

**Descripción de la tarea:** Aplicar `cuantizar_uniforme.m` sobre una señal aleatoria uniforme (soporte finito, del Tema 01, 01.1). Al poder ajustar el rango del cuantizador exactamente al soporte, sirve de referencia "limpia" de error puramente granular, sin saturación.

**Etapa:** Desarrollo

**Criterio de aceptación:** Error cuadrático medio de cuantización comparado contra la expresión teórica esperada para un cuantizador uniforme sobre fuente uniforme.

**Dependencias:** 03.1, Tema 01 (01.1)

---

### Sub-issue 03.3 — Cuantización uniforme de una señal aleatoria con PDF infinita (gaussiana)

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 03

**Módulo:** `practicas/03_cuantizacion/`

**Descripción de la tarea:** Repetir 03.2 con una señal gaussiana (soporte infinito). El rango del cuantizador debe truncarse, introduciendo **error de saturación** además del granular ya visto en 03.2.

**Etapa:** Desarrollo

**Criterio de aceptación:** Se muestra la descomposición del error total en granular y de saturación, y cómo cambia el balance al variar el rango del cuantizador para varianza fija.

**Dependencias:** 03.1, 03.2, Tema 01 (01.1, proceso gaussiano)

---

### Sub-issue 03.4 — Cuantización no uniforme optimizada con Lloyd-Max

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 03

**Módulo:** `practicas/03_cuantizacion/`

**Descripción de la tarea:** Implementar `cuantizar_no_uniforme.m` (nace aquí) con el algoritmo Lloyd-Max, partiendo del cuantizador uniforme de 03.3 como comparación, aplicado principalmente al caso gaussiano.

**Etapa:** Desarrollo

**Criterio de aceptación:** El cuantizador Lloyd-Max converge y logra un error cuadrático medio menor que el uniforme de 03.3, para el mismo número de niveles.

**Dependencias:** 03.3

---

### Sub-issue 03.5 — Análisis comparativo: error granular vs. error de saturación

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 03

**Módulo:** `practicas/03_cuantizacion/`

**Descripción de la tarea:** Consolidar 03.2, 03.3 y 03.4 en una sola comparación, mostrando el compromiso entre error granular y de saturación según el rango del cuantizador.

**Etapa:** Documentación y validación

**Criterio de aceptación:** Gráfica/tabla de error granular, de saturación y total en función del rango (caso gaussiano), identificando el mínimo; conclusión sobre uniforme vs. no uniforme.

**Dependencias:** 03.2, 03.3, 03.4

---

## Tema 04 — Ruido AWGN y procesos Bernoulli

### Issue padre: [Tema 04] Ruido AWGN y procesos Bernoulli

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 04 — AWGN y procesos Bernoulli (`practicas/04_awgn_bernoulli/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Probabilidad y Estadística.

**Justificación:** Temario 1.7–1.8. El modelo de canal AWGN es la base de casi todas las prácticas de transmisión posteriores del módulo (codificación de línea, modulación, códigos de canal, capacidad).

**Alcance propuesto:**
- [ ] 04.1 — Implementación y caracterización del ruido AWGN
- [ ] 04.2 — Procesos Bernoulli: generación de bits con probabilidad configurable

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 1 — base teórica del módulo. Prioritario: bloquea funcionalmente a los Temas 07 en adelante.

---

### Sub-issue 04.1 — Implementación y caracterización del ruido AWGN

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 04

**Módulo:** `practicas/04_awgn_bernoulli/`

**Descripción de la tarea:** Implementar `generar_ruido_awgn.m` (nace aquí — primera vez que el módulo necesita ruido AWGN), con SNR o varianza configurable. Caracterizar sus propiedades: verificar que su densidad de probabilidad es gaussiana (ej. histograma vs. PDF teórica) y que es blanco (autocorrelación tipo impulso, usando `estimar_autocorrelacion.m` del Tema 01, 01.3).

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** El ruido generado tiene la varianza correspondiente al SNR configurado; su histograma se aproxima a la PDF gaussiana teórica; su autocorrelación estimada se aproxima a un impulso.

**Dependencias:** Tema 01 (01.3, `estimar_autocorrelacion.m`)

---

### Sub-issue 04.2 — Procesos Bernoulli: generación de bits con probabilidad configurable

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 04

**Módulo:** `practicas/04_awgn_bernoulli/`

**Descripción de la tarea:** Implementar la generación de una secuencia que sigue un proceso Bernoulli con probabilidad configurable, como ejemplo de señal aleatoria discreta, complementando el análisis de ruido continuo de 04.1.

**Etapa:** Desarrollo

**Criterio de aceptación:** La proporción empírica del estado de interés (ej. bits en 1) converge a la probabilidad configurada al aumentar el número de muestras generadas.

**Dependencias:** Ninguna directa; conceptualmente complementario a 04.1.

---

## Tema 05 — Codificación de línea

### Issue padre: [Tema 05] Codificación de línea

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 05 — Codificación de línea (`practicas/05_codificacion_linea/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Procesamiento Digital de Señales.

**Justificación:** Temario 2.1–2.2. Primer paso de la cadena de transmisión digital propiamente dicha: representar una secuencia de bits como pulsos antes de cualquier modulación.

**Alcance propuesto:**
- [ ] 05.1 — Fuente de bits y codificación NRZ
- [ ] 05.2 — Esquemas adicionales de codificación de línea (RZ, Manchester)
- [ ] 05.3 — Comparación de ancho de banda ocupado entre esquemas

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 2 — cadena de modulación digital. Prioritario: crea la fuente de bits que reutilizan los Temas 07 y 08.

---

### Sub-issue 05.1 — Fuente de bits y codificación NRZ

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 05

**Módulo:** `practicas/05_codificacion_linea/`

**Descripción de la tarea:** Implementar `funciones/fuente/generar_bits_aleatorios.m` (nace aquí — primera vez que el módulo necesita una secuencia de bits para transmitir) y el primer esquema de codificación de línea (ej. NRZ), generando la señal correspondiente.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** La señal NRZ representa correctamente la secuencia de bits de entrada; la función de generación de bits queda lista para ser reutilizada por cualquier tema posterior.

**Dependencias:** Ninguna — punto de partida del tema y, en la práctica, de toda la cadena de transmisión del módulo.

---

### Sub-issue 05.2 — Esquemas adicionales de codificación de línea (RZ, Manchester)

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 05

**Módulo:** `practicas/05_codificacion_linea/`

**Descripción de la tarea:** Extender 05.1 con al menos un esquema adicional (ej. RZ y/o Manchester), sobre la misma fuente de bits.

**Etapa:** Desarrollo

**Criterio de aceptación:** Las señales de los distintos esquemas se generan correctamente para la misma secuencia de bits de prueba, permitiendo comparación directa.

**Dependencias:** 05.1

---

### Sub-issue 05.3 — Comparación de ancho de banda ocupado entre esquemas

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 05

**Módulo:** `practicas/05_codificacion_linea/`

**Descripción de la tarea:** Comparar el espectro (`calcular_espectro.m`) de los esquemas de 05.1 y 05.2, relacionando la forma del espectro con las características de cada código (ej. componente DC, ancho de banda ocupado).

**Etapa:** Documentación y validación

**Criterio de aceptación:** Gráfica comparativa de espectros de al menos 2 esquemas, con conclusión explícita sobre cuál ocupa menos ancho de banda o tiene menos componente DC.

**Dependencias:** 05.1, 05.2, `calcular_espectro.m` (ya disponible)

---

## Tema 06 — Pulsos Nyquist y control de ISI

Secuencia: primero el pulso más simple (rect), luego el "ideal" en el sentido de Nyquist pero impráctico (sinc), y de esa tensión surge el compromiso realmente usable (coseno alzado). Se cierra verificando el criterio de Nyquist y contrastando explícitamente contra un caso con ISI.

### Issue padre: [Tema 06] Pulsos Nyquist y control de ISI

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 06 — Pulsos Nyquist y control de ISI (`practicas/06_pulsos_nyquist_isi/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Procesamiento Digital de Señales.

**Justificación:** Temario 2.3. Transmisión sobre canales limitados en ancho de banda; el criterio de Nyquist para evitar ISI es prerrequisito de los Temas 07 y 08, que reutilizan directamente el pulso conformador desarrollado aquí (`funciones/pulsos/`).

**Alcance propuesto:**
- [ ] 06.1 — Pulso rectangular (rect) y su espectro
- [ ] 06.2 — Pulso sinc (Nyquist ideal) y su limitación práctica
- [ ] 06.3 — Pulso coseno alzado (raised cosine) como compromiso práctico
- [ ] 06.4 — Verificación del criterio de Nyquist e ilustración de ISI

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 2 — cadena de modulación digital. Prioritario: crea `funciones/pulsos/`, que reutilizan los Temas 07 y 08.

---

### Sub-issue 06.1 — Pulso rectangular (rect) y su espectro

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 06

**Módulo:** `practicas/06_pulsos_nyquist_isi/`

**Descripción de la tarea:** Implementar `funciones/pulsos/pulso_rect.m` (nace aquí) y analizar su espectro con `calcular_espectro.m`. Es el punto de partida: el pulso más simple, cuyo espectro en forma de sinc (con lóbulos laterales que no decaen) motiva la necesidad de pulsos más eficientes en ancho de banda.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** Pulso rect generado correctamente en el tiempo, con duración/amplitud configurables; espectro verificado con la forma sinc esperada.

**Dependencias:** `funciones/analisis_senales/calcular_espectro.m` (ya disponible)

---

### Sub-issue 06.2 — Pulso sinc (Nyquist ideal) y su limitación práctica

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 06

**Módulo:** `practicas/06_pulsos_nyquist_isi/`

**Descripción de la tarea:** Implementar `funciones/pulsos/pulso_sinc.m` (nace aquí) y su versión truncada en el tiempo. Explorar la relación dual con `pulso_rect.m` (rect en tiempo ↔ sinc en frecuencia, y viceversa), y analizar por qué el sinc, siendo ideal en teoría (cumple Nyquist exactamente, espectro rectangular/brick-wall), es impráctico: duración infinita/no causal, y al truncarlo para poder implementarlo reaparece ISI.

**Etapa:** Desarrollo

**Criterio de aceptación:** Pulso sinc generado y truncado a al menos 2 longitudes distintas; se muestra cómo al truncar aparecen oscilaciones (tipo Gibbs) y se degrada el cumplimiento del criterio de Nyquist respecto al caso no truncado.

**Dependencias:** 06.1 (para la comparación de espectros)

---

### Sub-issue 06.3 — Pulso coseno alzado (raised cosine) como compromiso práctico

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 06

**Módulo:** `practicas/06_pulsos_nyquist_isi/`

**Descripción de la tarea:** Implementar `funciones/pulsos/pulso_raised_cosine.m` (nace aquí) con factor de roll-off configurable, mostrando cómo cumple el criterio de Nyquist en el tiempo (cruces por cero en los instantes de símbolo) sin la impracticidad del sinc puro de 06.2.

**Etapa:** Desarrollo

**Criterio de aceptación:** Pulso generado para al menos 2 valores de roll-off; se verifican los cruces por cero en múltiplos del periodo de símbolo para ambos casos.

**Dependencias:** 06.2 (comparación conceptual)

---

### Sub-issue 06.4 — Verificación del criterio de Nyquist e ilustración de ISI

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 06

**Módulo:** `practicas/06_pulsos_nyquist_isi/`

**Descripción de la tarea:** Verificar el criterio de Nyquist en el dominio de la frecuencia para el coseno alzado (06.3), y contrastarlo explícitamente con un caso que **no** lo cumple (ej. el sinc truncado de forma insuficiente de 06.2, o un roll-off/duración inadecuados), mostrando la ISI resultante sobre una secuencia de varios símbolos consecutivos.

**Etapa:** Desarrollo / Documentación y validación

**Criterio de aceptación:** Comparación visual clara entre "sin ISI" (coseno alzado, 06.3) y "con ISI" (pulso que no cumple Nyquist), superponiendo al menos 4-5 símbolos consecutivos en ambos casos.

**Dependencias:** 06.1, 06.3

---

## Tema 07 — Modulación M-PAM (banda base)

### Issue padre: [Tema 07] Modulación M-PAM (banda base)

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 07 — Modulación M-PAM (`practicas/07_modulacion_pam/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Comunicaciones Móviles, Laboratorio I.

**Justificación:** Temario 2.4. Primer esquema de modulación del módulo, en banda base — se completa antes que el Tema 08 (pasa banda) por ser conceptualmente más simple.

**Alcance propuesto:**
- [ ] 07.1 — Transmisor banda base M-PAM
- [ ] 07.2 — Receptor banda base M-PAM
- [ ] 07.3 — Integración con canal AWGN y cálculo de BER

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 2 — cadena de modulación digital, banda base.

---

### Sub-issue 07.1 — Transmisor banda base M-PAM

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 07

**Módulo:** `practicas/07_modulacion_pam/`

**Descripción de la tarea:** Implementar el mapeo de bits a símbolos M-PAM y la generación de la señal en banda base, incluyendo la conformación de pulso (reutiliza `funciones/pulsos/pulso_raised_cosine.m`, creada en el Tema 06). Reutiliza `funciones/fuente/generar_bits_aleatorios.m` (creada en el Tema 05).

**Etapa:** Desarrollo

**Criterio de aceptación:** Señal en banda base generada correctamente para al menos 2 valores de M; espectro verificado con `calcular_espectro.m`.

**Dependencias:** Tema 05 (`generar_bits_aleatorios.m`), Tema 06 (pulso conformador)

---

### Sub-issue 07.2 — Receptor banda base M-PAM

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 07

**Módulo:** `practicas/07_modulacion_pam/`

**Descripción de la tarea:** Implementar filtro adaptado, muestreo y decisión para recuperar los símbolos/bits de 07.1. Primero sin canal (caso ideal).

**Etapa:** Desarrollo

**Criterio de aceptación:** Recuperación perfecta de bits en ausencia de ruido, para los mismos valores de M de 07.1.

**Dependencias:** 07.1

---

### Sub-issue 07.3 — Integración con canal AWGN y cálculo de BER

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 07

**Módulo:** `practicas/07_modulacion_pam/`

**Descripción de la tarea:** Reutilizar `funciones/canal/generar_ruido_awgn.m` (creada en el Tema 04) entre transmisor y receptor, y calcular BER en función de SNR. Es la primera vez que el módulo necesita una función de BER — se crea aquí `funciones/metricas/calcular_ber.m`, para que el Tema 08 la reutilice.

**Etapa:** Desarrollo / Validación

**Criterio de aceptación:** Curva de BER vs. SNR con el comportamiento esperado; guardada como caso de prueba de referencia en `validacion/`.

**Dependencias:** 07.1, 07.2, Tema 04 (`generar_ruido_awgn.m`)

---

## Tema 08 — Modulación M-QAM y M-PSK (pasa banda)

### Issue padre: [Tema 08] Modulación M-QAM y M-PSK (pasa banda)

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 08 — Modulación M-QAM y M-PSK (`practicas/08_modulacion_qam_psk/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Comunicaciones Móviles, Laboratorio I.

**Justificación:** Temario 2.5. Extiende la modulación a dos dimensiones y a pasa banda; se completa después del Tema 07, cuyas funciones de canal y métricas reutiliza directamente.

**Alcance propuesto:**
- [ ] 08.1 — Transmisor pasa banda M-QAM/M-PSK
- [ ] 08.2 — Receptor pasa banda M-QAM/M-PSK
- [ ] 08.3 — Integración con canal AWGN, BER y comparación con M-PAM

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 2 — cadena de modulación digital, pasa banda. Depende del Tema 07 para la comparación final.

---

### Sub-issue 08.1 — Transmisor pasa banda M-QAM/M-PSK

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 08

**Módulo:** `practicas/08_modulacion_qam_psk/`

**Descripción de la tarea:** Implementar el mapeo de bits a símbolos complejos M-QAM y M-PSK, y la modulación en cuadratura. Reutiliza `generar_bits_aleatorios.m` (Tema 05) y `funciones/pulsos/pulso_raised_cosine.m` (Tema 06), si aplica.

**Etapa:** Desarrollo

**Criterio de aceptación:** Señal generada correctamente para M-QAM y M-PSK, con al menos 2 órdenes cada uno; constelación transmitida verificada visualmente.

**Dependencias:** Tema 05 (`generar_bits_aleatorios.m`), Tema 06 (pulso conformador, si aplica)

---

### Sub-issue 08.2 — Receptor pasa banda M-QAM/M-PSK

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 08

**Módulo:** `practicas/08_modulacion_qam_psk/`

**Descripción de la tarea:** Implementar demodulación en cuadratura, filtro adaptado y decisión de símbolo. Primero sin canal, igual que en 07.2.

**Etapa:** Desarrollo

**Criterio de aceptación:** Recuperación perfecta de bits en ausencia de ruido, para M-QAM y M-PSK.

**Dependencias:** 08.1

---

### Sub-issue 08.3 — Integración con canal AWGN, BER y comparación con M-PAM

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 08

**Módulo:** `practicas/08_modulacion_qam_psk/`

**Descripción de la tarea:** Reutilizar `generar_ruido_awgn.m` (Tema 04) y `calcular_ber.m` (Tema 07) para calcular BER de M-QAM/M-PSK, y comparar contra M-PAM (Tema 07) bajo condiciones equivalentes de SNR.

**Etapa:** Desarrollo / Validación

**Criterio de aceptación:** Curvas de BER de M-QAM/M-PSK junto a las de M-PAM; conclusión documentada sobre qué esquema es más eficiente y bajo qué condiciones.

**Dependencias:** 08.1, 08.2, Tema 04 (`generar_ruido_awgn.m`), Tema 07 completo (para la comparación)

---

## Tema 09 — Probabilidad de error en modulación digital

### Issue padre: [Tema 09] Probabilidad de error en modulación digital

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 09 — Probabilidad de error (`practicas/09_probabilidad_error/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Probabilidad y Estadística.

**Justificación:** Temario 2.6. Formaliza, con expresiones teóricas cerradas, el análisis de BER ya usado de forma aplicada (simulada) en los Temas 07 y 08.

**Alcance propuesto:**
- [ ] 09.1 — Expresiones teóricas de BER para M-PAM, M-QAM y M-PSK
- [ ] 09.2 — Comparación teoría vs. simulación
- [ ] 09.3 — Análisis de confiabilidad estadística a bajos BER

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 2 — cadena de modulación digital. Depende de los Temas 07 y 08 completos.

---

### Sub-issue 09.1 — Expresiones teóricas de BER para M-PAM, M-QAM y M-PSK

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 09

**Módulo:** `practicas/09_probabilidad_error/`

**Descripción de la tarea:** Implementar las expresiones cerradas de BER teórica en función de SNR/Eb-No para los esquemas ya desarrollados en los Temas 07 (M-PAM) y 08 (M-QAM, M-PSK). Candidata a vivir en `funciones/metricas/calcular_ber_teorica.m`, complementando a `calcular_ber.m` (versión simulada, del Tema 07).

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** Para cada esquema y orden ya simulado en los Temas 07-08, existe una función que devuelve el BER teórico esperado en función de SNR.

**Dependencias:** Temas 07 y 08 completos (para saber qué esquemas/órdenes cubrir).

---

### Sub-issue 09.2 — Comparación teoría vs. simulación

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 09

**Módulo:** `practicas/09_probabilidad_error/`

**Descripción de la tarea:** Graficar juntas, para cada esquema, la curva de BER teórica (09.1) y la simulada (Temas 07.3 / 08.3), verificando que coinciden razonablemente.

**Etapa:** Desarrollo / Validación

**Criterio de aceptación:** Las curvas teórica y simulada coinciden dentro de un margen razonable (diferencias atribuibles a variabilidad estadística de la simulación, no a errores de implementación).

**Dependencias:** 09.1, Tema 07 (07.3), Tema 08 (08.3)

---

### Sub-issue 09.3 — Análisis de confiabilidad estadística a bajos BER

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 09

**Módulo:** `practicas/09_probabilidad_error/`

**Descripción de la tarea:** Discutir por qué a valores bajos de BER (alta SNR) la curva simulada se vuelve poco confiable con pocos bits (pueden observarse cero errores en la simulación), y qué número de bits se requiere para estimar un BER dado con confianza razonable (regla práctica: un mínimo de errores observados, ej. ~100).

**Etapa:** Documentación y validación

**Criterio de aceptación:** Se documenta la relación entre número de bits simulados y el BER mínimo estimable con confianza; se ilustra con al menos un caso donde aumentar el número de bits cambia visiblemente la curva simulada a bajo BER.

**Dependencias:** 09.2

---

## Tema 10 — Diagramas de ojo, constelación y EVM

### Issue padre: [Tema 10] Diagramas de ojo, constelación y EVM

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 10 — Ojo, constelación y EVM (`practicas/10_ojo_constelacion_evm/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Comunicaciones Móviles.

**Justificación:** Temario 2.7–2.8. Herramientas de diagnóstico visual y cuantitativo de la calidad de una señal modulada, complementarias al BER. Aquí nacen tres funciones de `funciones/visualizacion/` y `funciones/metricas/` que quedaban planeadas desde antes.

**Alcance propuesto:**
- [ ] 10.1 — Diagrama de ojo sobre la señal en banda base
- [ ] 10.2 — Diagrama de constelación sobre la señal pasa banda
- [ ] 10.3 — Cálculo de EVM

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 2 — cadena de modulación digital. Depende de los Temas 06, 07 y 08.

---

### Sub-issue 10.1 — Diagrama de ojo sobre la señal en banda base

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 10

**Módulo:** `practicas/10_ojo_constelacion_evm/`

**Descripción de la tarea:** Implementar `funciones/visualizacion/graficar_diagrama_ojo.m` (nace aquí) y aplicarlo sobre la señal en banda base del Tema 07 (M-PAM), mostrando el efecto de distintos niveles de ruido y, retomando el Tema 06.4, el cierre del ojo cuando se usa un pulso que no cumple el criterio de Nyquist.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** El diagrama de ojo se genera superponiendo múltiples periodos de símbolo; se observa el cierre del ojo al aumentar el ruido o al usar el pulso con ISI del Tema 06.4.

**Dependencias:** Tema 07 (señal banda base), Tema 06 (06.4, caso con ISI)

---

### Sub-issue 10.2 — Diagrama de constelación sobre la señal pasa banda

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 10

**Módulo:** `practicas/10_ojo_constelacion_evm/`

**Descripción de la tarea:** Implementar `funciones/visualizacion/graficar_constelacion.m` (nace aquí) y aplicarlo sobre los símbolos recibidos del Tema 08 (M-QAM/M-PSK), marcando los puntos ideales junto a los símbolos recibidos bajo distintos niveles de SNR.

**Etapa:** Desarrollo

**Criterio de aceptación:** La constelación se grafica con los puntos ideales señalados; se observa la dispersión creciente de los símbolos recibidos al disminuir SNR.

**Dependencias:** Tema 08 (señal pasa banda)

---

### Sub-issue 10.3 — Cálculo de EVM

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 10

**Módulo:** `practicas/10_ojo_constelacion_evm/`

**Descripción de la tarea:** Implementar `funciones/metricas/calcular_evm.m` (nace aquí) sobre los símbolos recibidos del Tema 08, relacionando el EVM obtenido con el SNR del canal y con el BER correspondiente (Tema 08.3 / Tema 09).

**Etapa:** Desarrollo / Documentación y validación

**Criterio de aceptación:** El EVM calculado disminuye consistentemente al aumentar SNR; se documenta la relación cualitativa entre EVM y BER para el mismo escenario.

**Dependencias:** Tema 08 (símbolos recibidos), 10.2 (apoyo visual, opcional)

---

## Tema 11 — Códigos de repetición y verificación de paridad

Cubre dos esquemas distintos del temario (repetición y paridad), cada uno con su propio codificador/decodificador, antes de evaluarlos juntos frente al canal.

### Issue padre: [Tema 11] Códigos de repetición y verificación de paridad

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 11 — Repetición y paridad (`practicas/11_codigos_repeticion_paridad/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Comunicaciones Móviles.

**Justificación:** Temario 3.1–3.2. Primer acercamiento a la codificación de canal: los esquemas más simples de detección/corrección de errores, base conceptual para los códigos más sofisticados de los Temas 12-14.

**Alcance propuesto:**
- [ ] 11.1 — Código de repetición: codificador y decodificador
- [ ] 11.2 — Código de verificación de paridad: codificador y decodificador
- [ ] 11.3 — Evaluación de desempeño frente al canal AWGN

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 3 — codificación de canal.

---

### Sub-issue 11.1 — Código de repetición: codificador y decodificador

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 11

**Módulo:** `practicas/11_codigos_repeticion_paridad/`

**Descripción de la tarea:** Implementar el codificador (repetir cada bit N veces) y el decodificador (decisión por mayoría) de un código de repetición, con N configurable.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** Sin ruido, el decodificador recupera exactamente los bits originales; con errores introducidos manualmente dentro de la capacidad de corrección del código (según N), también los corrige correctamente.

**Dependencias:** Ninguna.

---

### Sub-issue 11.2 — Código de verificación de paridad: codificador y decodificador

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 11

**Módulo:** `practicas/11_codigos_repeticion_paridad/`

**Descripción de la tarea:** Implementar el codificador (bit de paridad por bloque) y el decodificador (verificación de paridad) de un código de paridad simple. A diferencia de 11.1, este esquema solo detecta errores, no los corrige — debe quedar documentado explícitamente.

**Etapa:** Desarrollo

**Criterio de aceptación:** El decodificador detecta correctamente bloques con un número impar de errores; se documenta que no corrige.

**Dependencias:** Ninguna — puede desarrollarse en paralelo con 11.1.

---

### Sub-issue 11.3 — Evaluación de desempeño frente al canal AWGN

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 11

**Módulo:** `practicas/11_codigos_repeticion_paridad/`

**Descripción de la tarea:** Evaluar ambos esquemas (11.1 y 11.2) bajo el canal AWGN ya disponible (`funciones/canal/generar_ruido_awgn.m`, Tema 04), calculando BER con `funciones/metricas/calcular_ber.m` (Tema 07), y comparando contra la transmisión sin codificar.

**Etapa:** Desarrollo / Validación

**Criterio de aceptación:** Curvas de BER vs. SNR para: sin codificar, repetición, y una métrica equivalente para paridad (ej. tasa de bloques con error detectado); conclusión sobre la ganancia de codificación de cada esquema.

**Dependencias:** 11.1, 11.2, Tema 04 (`generar_ruido_awgn.m`), Tema 07 (`calcular_ber.m`)

---

## Tema 12 — Códigos de bloque lineales

### Issue padre: [Tema 12] Códigos de bloque lineales

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 12 — Códigos de bloque lineales (`practicas/12_codigos_bloque_lineales/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Comunicaciones Móviles.

**Justificación:** Temario 3.3. Primer código con estructura algebraica (matriz generadora) del módulo, más sofisticado que repetición/paridad pero más simple que los cíclicos del Tema 13.

**Alcance propuesto:**
- [ ] 12.1 — Codificador de bloque lineal (matriz generadora)
- [ ] 12.2 — Decodificador por síndrome
- [ ] 12.3 — Evaluación de desempeño y comparación con el Tema 11

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 3 — codificación de canal.

---

### Sub-issue 12.1 — Codificador de bloque lineal (matriz generadora)

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 12

**Módulo:** `practicas/12_codigos_bloque_lineales/`

**Descripción de la tarea:** Implementar el codificador de un código de bloque lineal (ej. Hamming (7,4)) a partir de su matriz generadora, produciendo palabras código a partir de bloques de bits de mensaje.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** Las palabras código generadas cumplen las propiedades del código (verificado contra al menos un par de palabras código de referencia, ej. calculadas a mano).

**Dependencias:** Ninguna.

---

### Sub-issue 12.2 — Decodificador por síndrome

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 12

**Módulo:** `practicas/12_codigos_bloque_lineales/`

**Descripción de la tarea:** Implementar el decodificador por síndrome, capaz de detectar y corregir el número de errores que el código garantiza (ej. 1 error para Hamming (7,4)).

**Etapa:** Desarrollo

**Criterio de aceptación:** Para una palabra código con el número de errores garantizado, el decodificador corrige correctamente; se documenta el comportamiento cuando hay más errores de los garantizados.

**Dependencias:** 12.1

---

### Sub-issue 12.3 — Evaluación de desempeño y comparación con el Tema 11

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 12

**Módulo:** `practicas/12_codigos_bloque_lineales/`

**Descripción de la tarea:** Evaluar desempeño bajo el canal AWGN (`generar_ruido_awgn.m`, Tema 04) y comparar la curva de BER (`calcular_ber.m`, Tema 07) contra el Tema 11 y contra la transmisión sin codificar.

**Etapa:** Desarrollo / Validación

**Criterio de aceptación:** Curva de BER vs. SNR del código de bloque lineal graficada junto a las del Tema 11; conclusión sobre cuál ofrece mejor ganancia de codificación para tasas de código comparables.

**Dependencias:** 12.1, 12.2, Tema 04, Tema 07, Tema 11 (para comparación)

---

## Tema 13 — Códigos cíclicos

### Issue padre: [Tema 13] Códigos cíclicos

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 13 — Códigos cíclicos (`practicas/13_codigos_ciclicos/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Comunicaciones Móviles.

**Justificación:** Temario 3.4. Extiende los códigos de bloque del Tema 12 con la estructura cíclica (representación polinomial), ampliamente usada en la práctica (ej. CRC).

**Alcance propuesto:**
- [ ] 13.1 — Codificador cíclico mediante polinomio generador
- [ ] 13.2 — Decodificador: detección/corrección basada en el residuo
- [ ] 13.3 — Evaluación de desempeño y comparación con los Temas 11-12

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 3 — codificación de canal.

---

### Sub-issue 13.1 — Codificador cíclico mediante polinomio generador

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 13

**Módulo:** `practicas/13_codigos_ciclicos/`

**Descripción de la tarea:** Implementar el codificador de un código cíclico (ej. CRC simple) a partir de un polinomio generador, mediante división polinomial (o su equivalente con registros de desplazamiento).

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** El codificador produce correctamente la palabra código (mensaje + bits de verificación) para al menos 2 mensajes de prueba, verificado contra un cálculo de referencia.

**Dependencias:** Ninguna.

---

### Sub-issue 13.2 — Decodificador: detección/corrección basada en el residuo

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 13

**Módulo:** `practicas/13_codigos_ciclicos/`

**Descripción de la tarea:** Implementar la detección (y corrección, si el código lo permite) de errores basada en el residuo de la división polinomial de 13.1.

**Etapa:** Desarrollo

**Criterio de aceptación:** El decodificador detecta correctamente errores introducidos en la palabra código de 13.1; si el código permite corrección, se verifica también.

**Dependencias:** 13.1

---

### Sub-issue 13.3 — Evaluación de desempeño y comparación con los Temas 11-12

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 13

**Módulo:** `practicas/13_codigos_ciclicos/`

**Descripción de la tarea:** Evaluar desempeño bajo el canal AWGN (`generar_ruido_awgn.m`, Tema 04) y comparar contra los Temas 11 y 12, usando la misma métrica de BER (`calcular_ber.m`, Tema 07) donde aplique.

**Etapa:** Desarrollo / Validación

**Criterio de aceptación:** Curva de BER (o tasa de detección de error, según lo que el código permita) graficada junto a las de los Temas 11-12.

**Dependencias:** 13.1, 13.2, Tema 04, Tema 07, Temas 11-12 (para comparación)

---

## Tema 14 — Códigos convolucionales

### Issue padre: [Tema 14] Códigos convolucionales

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 14 — Códigos convolucionales (`practicas/14_codigos_convolucionales/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Comunicaciones Móviles.

**Justificación:** Temario 3.5. El esquema de codificación de canal más usado en sistemas reales del temario (ej. estándares celulares), y el más distinto en estructura a los códigos de bloque de los Temas 11-13.

**Alcance propuesto:**
- [ ] 14.1 — Codificador convolucional
- [ ] 14.2 — Decodificador de Viterbi
- [ ] 14.3 — Evaluación de desempeño y comparación con los Temas 11-13

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 3 — codificación de canal.

---

### Sub-issue 14.1 — Codificador convolucional

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 14

**Módulo:** `practicas/14_codigos_convolucionales/`

**Descripción de la tarea:** Implementar un codificador convolucional simple (ej. tasa 1/2, longitud de restricción pequeña), definido por sus polinomios generadores.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** La secuencia codificada corresponde a la esperada para al menos una secuencia de entrada de prueba, verificada contra un cálculo de referencia.

**Dependencias:** Ninguna.

---

### Sub-issue 14.2 — Decodificador de Viterbi

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 14

**Módulo:** `practicas/14_codigos_convolucionales/`

**Descripción de la tarea:** Implementar el decodificador de Viterbi para el código de 14.1, incluyendo la métrica de decisión (ej. distancia de Hamming, o métrica blanda usando información del canal AWGN).

**Etapa:** Desarrollo

**Criterio de aceptación:** El decodificador recupera exactamente la secuencia original sin errores, y corrige correctamente errores aislados dentro de la capacidad del código.

**Dependencias:** 14.1

---

### Sub-issue 14.3 — Evaluación de desempeño y comparación con los Temas 11-13

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 14

**Módulo:** `practicas/14_codigos_convolucionales/`

**Descripción de la tarea:** Evaluar desempeño bajo el canal AWGN (`generar_ruido_awgn.m`, Tema 04) y comparar contra los Temas 11-13, usando `calcular_ber.m` (Tema 07).

**Etapa:** Desarrollo / Validación

**Criterio de aceptación:** Curva de BER vs. SNR del código convolucional, graficada junto a las de los Temas 11-13; discusión de por qué suele superar a los códigos de bloque de tasa comparable.

**Dependencias:** 14.1, 14.2, Tema 04, Tema 07, Temas 11-13 (para comparación)

---

## Tema 15 — Desempeño de códigos de canal frente al ruido

### Issue padre: [Tema 15] Desempeño de códigos de canal frente al ruido

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 15 — Desempeño de códigos de canal (`practicas/15_desempeno_codigos_canal/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Comunicaciones Móviles.

**Justificación:** Temario 3.6. Cierra el capítulo de codificación de canal consolidando en una sola comparación los cuatro esquemas de los Temas 11-14; no introduce codificador propio.

**Alcance propuesto:**
- [ ] 15.1 — Consolidación de las curvas de BER de los 4 esquemas
- [ ] 15.2 — Discusión de compromiso complejidad/ganancia de codificación

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 3 — codificación de canal. Depende de los Temas 11-14 completos; cierra el capítulo.

---

### Sub-issue 15.1 — Consolidación de las curvas de BER de los 4 esquemas

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 15

**Módulo:** `practicas/15_desempeno_codigos_canal/`

**Descripción de la tarea:** Reunir en una sola gráfica las curvas de BER vs. SNR de los 4 esquemas de codificación de canal (Temas 11-14), más la curva sin codificar, todas bajo el mismo rango de SNR y el mismo canal AWGN (`generar_ruido_awgn.m`, Tema 04).

**Etapa:** Documentación y validación

**Criterio de aceptación:** Gráfica única con las 5 curvas (sin codificar + 4 esquemas), leyenda clara, ejes con unidades.

**Dependencias:** Temas 11, 12, 13 y 14 completos.

---

### Sub-issue 15.2 — Discusión de compromiso complejidad/ganancia de codificación

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 15

**Módulo:** `practicas/15_desempeno_codigos_canal/`

**Descripción de la tarea:** Documentar, para cada uno de los 4 esquemas, su tasa de código, una valoración cualitativa de su complejidad de implementación, y la ganancia de codificación observada en 15.1 a un BER de referencia.

**Etapa:** Documentación y validación

**Criterio de aceptación:** Tabla comparativa (tasa de código, complejidad relativa, ganancia de codificación aproximada) y conclusión explícita de cuándo conviene cada esquema (ej. baja complejidad vs. máxima ganancia).

**Dependencias:** 15.1

---

## Tema 16 — Información y entropía

### Issue padre: [Tema 16] Información y entropía

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 16 — Información y entropía (`practicas/16_informacion_entropia/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Probabilidad y Estadística.

**Justificación:** Temario 4.1. Primer tema del bloque de teoría de la información; sus funciones de entropía se reutilizan en los Temas 17 (codificación de fuente) y 18 (información mutua).

**Alcance propuesto:**
- [ ] 16.1 — Información propia de un evento/símbolo
- [ ] 16.2 — Entropía de una fuente discreta
- [ ] 16.3 — Exploración de la entropía con distintas distribuciones

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 4 — teoría de la información.

---

### Sub-issue 16.1 — Información propia de un evento/símbolo

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 16

**Módulo:** `practicas/16_informacion_entropia/`

**Descripción de la tarea:** Implementar el cálculo de información propia (autoinformación) de un símbolo a partir de su probabilidad: I(x) = -log2(p(x)). Es el bloque conceptual antes de agregar a nivel de fuente completa en 16.2.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** La función devuelve la información en bits correctamente para casos de referencia (ej. p=0.5 → 1 bit; p=1 → 0 bits).

**Dependencias:** Ninguna.

---

### Sub-issue 16.2 — Entropía de una fuente discreta

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 16

**Módulo:** `practicas/16_informacion_entropia/`

**Descripción de la tarea:** Implementar el cálculo de entropía de una fuente discreta a partir de su distribución de probabilidad, usando la información propia de 16.1 (la entropía es el valor esperado de la información propia).

**Etapa:** Desarrollo

**Criterio de aceptación:** Para una fuente con distribución uniforme de M símbolos, la entropía calculada coincide con log2(M) (máximo teórico); para distribuciones sesgadas, es menor.

**Dependencias:** 16.1

---

### Sub-issue 16.3 — Exploración de la entropía con distintas distribuciones

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 16

**Módulo:** `practicas/16_informacion_entropia/`

**Descripción de la tarea:** Explorar cómo cambia la entropía al variar la distribución de probabilidad de la fuente (uniforme vs. sesgada, distintos grados de sesgo), verificando que el máximo ocurre en la distribución uniforme.

**Etapa:** Documentación y validación

**Criterio de aceptación:** Gráfica de entropía vs. grado de sesgo (ej. para una fuente binaria, entropía vs. p), mostrando el máximo en p=0.5.

**Dependencias:** 16.2

---

## Tema 17 — Codificación de fuente y teorema de Shannon

### Issue padre: [Tema 17] Codificación de fuente y teorema de Shannon

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 17 — Codificación de fuente y Shannon (`practicas/17_codificacion_fuente_shannon/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Probabilidad y Estadística.

**Justificación:** Temario 4.2. Se enlaza directamente con el Tema 03: toma una señal ya cuantizada (vía `funciones/fuente/audio_a_bits.m` o `imagen_a_bits.m`) y aplica codificación de fuente para contrastar la tasa de compresión lograda contra el límite que impone el teorema de codificación de fuente de Shannon (usando la entropía del Tema 16).

**Alcance propuesto:**
- [ ] 17.1 — Codificación de Huffman (código de fuente)
- [ ] 17.2 — Aplicación sobre una señal cuantizada real (audio/imagen)
- [ ] 17.3 — Comparación contra el límite de Shannon

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 4 — teoría de la información. Depende de los Temas 03 y 16.

---

### Sub-issue 17.1 — Codificación de Huffman (código de fuente)

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 17

**Módulo:** `practicas/17_codificacion_fuente_shannon/`

**Descripción de la tarea:** Implementar el algoritmo de Huffman para construir un código de fuente de longitud variable a partir de las probabilidades de los símbolos de una fuente discreta.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** El código generado es unívocamente decodificable (libre de prefijos); su longitud promedio está entre la entropía de la fuente (Tema 16, 16.2) y entropía + 1 (cota conocida para Huffman).

**Dependencias:** Tema 16 (16.2, cálculo de entropía, para comparación).

---

### Sub-issue 17.2 — Aplicación sobre una señal cuantizada real (audio/imagen)

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 17

**Módulo:** `practicas/17_codificacion_fuente_shannon/`

**Descripción de la tarea:** Aplicar la codificación de Huffman de 17.1 sobre una señal ya cuantizada, reutilizando `cuantizar_uniforme.m`/`cuantizar_no_uniforme.m` (Tema 03) vía `funciones/fuente/audio_a_bits.m` o `imagen_a_bits.m` si ya existen, o directamente sobre los niveles cuantizados. Obtener la tasa de compresión lograda respecto a una codificación de longitud fija.

**Etapa:** Desarrollo

**Criterio de aceptación:** Se calcula la tasa de compresión (bits promedio por símbolo con Huffman vs. bits fijos) para al menos un caso de señal cuantizada real.

**Dependencias:** 17.1, Tema 03 (cuantización).

---

### Sub-issue 17.3 — Comparación contra el límite de Shannon

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 17

**Módulo:** `practicas/17_codificacion_fuente_shannon/`

**Descripción de la tarea:** Comparar la tasa de compresión de 17.2 contra la entropía de la fuente (calculada con las funciones del Tema 16 sobre la distribución empírica de los niveles cuantizados) — el límite teórico de compresión sin pérdida según el teorema de codificación de fuente de Shannon.

**Etapa:** Documentación y validación

**Criterio de aceptación:** Se documenta qué tan cerca está la longitud promedio del código de Huffman de la entropía de la fuente, y se explica la brecha (si la hay) en términos del teorema de Shannon.

**Dependencias:** 17.2, Tema 16 (cálculo de entropía).

---

## Tema 18 — Canales discretos sin memoria e información mutua

### Issue padre: [Tema 18] Canales discretos sin memoria e información mutua

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 18 — Canales discretos e información mutua (`practicas/18_canales_discretos/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Probabilidad y Estadística.

**Justificación:** Temario 4.3–4.4. Extiende la entropía del Tema 16 a un par entrada-salida (canal), y su capacidad se retoma en el Tema 19 como un canal binario simétrico equivalente al AWGN con decisión dura.

**Alcance propuesto:**
- [ ] 18.1 — Modelo de un canal discreto sin memoria (canal binario simétrico)
- [ ] 18.2 — Información mutua entre entrada y salida del canal
- [ ] 18.3 — Capacidad del canal discreto sin memoria

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 4 — teoría de la información. Depende conceptualmente del Tema 16.

---

### Sub-issue 18.1 — Modelo de un canal discreto sin memoria (canal binario simétrico)

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 18

**Módulo:** `practicas/18_canales_discretos/`

**Descripción de la tarea:** Implementar un modelo de canal binario simétrico (BSC) con probabilidad de cruce configurable, calculando la matriz de transición y la distribución de salida a partir de una distribución de entrada dada.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** Para una distribución de entrada y probabilidad de cruce dadas, se calculan correctamente la matriz de transición y la distribución de salida.

**Dependencias:** Ninguna.

---

### Sub-issue 18.2 — Información mutua entre entrada y salida del canal

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 18

**Módulo:** `practicas/18_canales_discretos/`

**Descripción de la tarea:** Implementar el cálculo de información mutua I(X;Y) entre entrada y salida del canal de 18.1, usando las funciones de entropía del Tema 16 (entropía de X, de Y, y entropía condicional).

**Etapa:** Desarrollo

**Criterio de aceptación:** Con probabilidad de cruce 0, la información mutua coincide con la entropía de la fuente; con probabilidad de cruce 0.5, la información mutua es cero (canal inútil).

**Dependencias:** 18.1, Tema 16 (funciones de entropía).

---

### Sub-issue 18.3 — Capacidad del canal discreto sin memoria

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 18

**Módulo:** `practicas/18_canales_discretos/`

**Descripción de la tarea:** Calcular la capacidad del canal (máxima información mutua sobre todas las distribuciones de entrada) para el BSC de 18.1, explorando cómo cambia la información mutua al variar la distribución de entrada.

**Etapa:** Documentación y validación

**Criterio de aceptación:** Gráfica de información mutua vs. distribución de entrada, mostrando que el máximo ocurre en la distribución uniforme para el BSC; la capacidad se reporta en función de la probabilidad de cruce del canal.

**Dependencias:** 18.2

---

## Tema 19 — Teorema de codificación de canal de Shannon

### Issue padre: [Tema 19] Teorema de codificación de canal de Shannon

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 19 — Teorema de codificación de canal (`practicas/19_codificacion_canal_shannon/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Probabilidad y Estadística.

**Justificación:** Temario 4.5. Cierra el bloque de codificación de canal (Temas 11-15) desde la perspectiva de teoría de la información: qué tan cerca están los códigos reales del límite teórico de Shannon. El canal AWGN con decisión dura de los Temas 07-15 se modela aquí como un canal binario simétrico equivalente (Tema 18), usando como probabilidad de cruce el BER sin codificar del Tema 09.

**Alcance propuesto:**
- [ ] 19.1 — Tasa de transmisión efectiva de los códigos de canal ya desarrollados
- [ ] 19.2 — Comparación contra la capacidad de un canal binario simétrico equivalente

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 4 — teoría de la información. Depende de los Temas 09, 15 y 18.

---

### Sub-issue 19.1 — Tasa de transmisión efectiva de los códigos de canal ya desarrollados

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 19

**Módulo:** `practicas/19_codificacion_canal_shannon/`

**Descripción de la tarea:** Calcular la tasa de transmisión efectiva (tasa de código combinada con la tasa de símbolo) de los 4 esquemas de codificación de canal del Tema 15, expresada en las mismas unidades que la capacidad de canal (bits por uso de canal).

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** Para cada uno de los 4 esquemas del Tema 15, se reporta su tasa de código y la tasa de transmisión efectiva resultante.

**Dependencias:** Tema 15 (tasas de código de los 4 esquemas).

---

### Sub-issue 19.2 — Comparación contra la capacidad de un canal binario simétrico equivalente

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 19

**Módulo:** `practicas/19_codificacion_canal_shannon/`

**Descripción de la tarea:** Modelar el canal AWGN con decisión dura (usado en los Temas 07-15) como un BSC equivalente, con probabilidad de cruce igual al BER sin codificar del Tema 09, y calcular su capacidad reutilizando las funciones del Tema 18 (18.3). Comparar las tasas efectivas de 19.1 contra esta capacidad.

**Etapa:** Documentación y validación

**Criterio de aceptación:** Para al menos un valor de SNR, se calcula la capacidad del BSC equivalente y se comparan las tasas efectivas de los 4 esquemas de codificación; se documenta qué tan cerca (o lejos) están del límite, y qué implica el teorema de codificación de canal de Shannon sobre la posibilidad de acercarse más con códigos más sofisticados.

**Dependencias:** 19.1, Tema 18 (18.3, capacidad del BSC), Tema 09 (BER sin codificar).

---

## Tema 20 — Canales continuos de entrada discreta y de forma de onda

### Issue padre: [Tema 20] Canales continuos de entrada discreta y de forma de onda

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 20 — Canales continuos (`practicas/20_canales_continuos/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Probabilidad y Estadística.

**Justificación:** Temario 4.6–4.7. Extiende el análisis de información mutua y capacidad (Tema 18, con entrada y salida discretas) al caso de salida continua y, después, al de forma de onda continua — preparando el terreno conceptual para la capacidad del canal AWGN del Tema 21.

**Alcance propuesto:**
- [ ] 20.1 — Canal continuo con entrada discreta
- [ ] 20.2 — Canales de forma de onda continua

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 4 — teoría de la información. Depende del Tema 18.

---

### Sub-issue 20.1 — Canal continuo con entrada discreta

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 20

**Módulo:** `practicas/20_canales_continuos/`

**Descripción de la tarea:** Modelar un canal con entrada discreta (símbolos de un esquema de modulación de los Temas 07/08) y salida continua (antes de la decisión dura), calculando la información mutua entre los símbolos transmitidos y la observación continua ruidosa — a diferencia del Tema 18, donde tanto entrada como salida eran discretas.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** Se calcula (numéricamente) la información mutua para un esquema de modulación de referencia bajo ruido AWGN, mostrando que es mayor que la del canal discreto (BSC) equivalente del Tema 18, ya que la decisión dura descarta información.

**Dependencias:** Tema 18 (para comparación), Temas 07/08 (esquema de modulación de referencia).

---

### Sub-issue 20.2 — Canales de forma de onda continua

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 20

**Módulo:** `practicas/20_canales_continuos/`

**Descripción de la tarea:** Extender el análisis a un canal de forma de onda continua (entrada y salida continuas en el tiempo, no solo en amplitud), como paso conceptual previo a la fórmula de capacidad del canal AWGN del Tema 21.

**Etapa:** Desarrollo

**Criterio de aceptación:** Se documenta la relación entre el ancho de banda del canal, el número de dimensiones/muestras disponibles por segundo, y cómo eso se traduce en la capacidad total del canal.

**Dependencias:** 20.1

---

## Tema 21 — Capacidad del canal AWGN

### Issue padre: [Tema 21] Capacidad del canal AWGN

**Labels:** `tipo:nuevo-modulo`, `modulo:comunicaciones-digitales`

**Nombre del módulo propuesto:** Tema 21 — Capacidad del canal AWGN (`practicas/21_capacidad_canal_awgn/`)

**Asignaturas relacionadas:** Comunicaciones Digitales, Probabilidad y Estadística.

**Justificación:** Temario 4.8. Cierra el módulo completo: la fórmula de capacidad de Shannon-Hartley para el canal AWGN, contrastada empíricamente contra las curvas de BER/tasas de los Temas de modulación (07-10) y codificación (11-15, vía Tema 19) ya desarrollados.

**Alcance propuesto:**
- [ ] 21.1 — Fórmula de Shannon-Hartley: capacidad del canal AWGN
- [ ] 21.2 — Comparación de los esquemas de modulación y codificación contra la capacidad
- [ ] 21.3 — Síntesis final del módulo: de la cuantización a la capacidad del canal

**Equipo propuesto:** Estudiante(s): por asignar. Docente asesor: por asignar.

**Fase del proyecto:** Fase 4 — teoría de la información. Cierre del módulo; depende de los Temas 09, 15, 19 y 20.

---

### Sub-issue 21.1 — Fórmula de Shannon-Hartley: capacidad del canal AWGN

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 21

**Módulo:** `practicas/21_capacidad_canal_awgn/`

**Descripción de la tarea:** Implementar el cálculo de la capacidad del canal AWGN de forma de onda continua, C = B·log2(1+SNR), en función del ancho de banda B y la SNR, apoyándose en el desarrollo conceptual del Tema 20.

**Etapa:** Alistamiento / Desarrollo

**Criterio de aceptación:** La función devuelve la capacidad correctamente para casos de referencia conocidos; se explora cómo cambia la capacidad al variar B y SNR por separado.

**Dependencias:** Tema 20 (preparación conceptual).

---

### Sub-issue 21.2 — Comparación de los esquemas de modulación y codificación contra la capacidad

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 21

**Módulo:** `practicas/21_capacidad_canal_awgn/`

**Descripción de la tarea:** Comparar las tasas efectivamente logradas por los esquemas de modulación (Temas 07-10) y de codificación de canal (Temas 11-15, ya comparados contra el BSC equivalente en el Tema 19) contra la capacidad del canal AWGN de 21.1, para el mismo rango de SNR.

**Etapa:** Desarrollo / Validación

**Criterio de aceptación:** Gráfica que muestre las tasas de los esquemas del módulo junto a la curva de capacidad de Shannon, evidenciando la brecha entre lo logrado y el límite teórico.

**Dependencias:** 21.1, Temas 09, 15, 19.

---

### Sub-issue 21.3 — Síntesis final del módulo: de la cuantización a la capacidad del canal

**Labels:** `tipo:tarea`, `modulo:comunicaciones-digitales` · Relacionado con el Issue padre del Tema 21

**Módulo:** `practicas/21_capacidad_canal_awgn/`

**Descripción de la tarea:** Cerrar el módulo con una síntesis breve que conecte los dos hilos conductores definidos desde el diseño de la arquitectura (ver `docs/03_arquitectura.md`): cuantización → codificación de fuente (Tema 17) como límite de compresión, y modulación/codificación de canal → capacidad de Shannon (este tema) como límite de transmisión — ambos impuestos por los teoremas de Shannon.

**Etapa:** Documentación y validación

**Criterio de aceptación:** Documento breve (puede vivir en `docs/08_resultados.md` o `docs/01_descripcion_general.md` del módulo) que resume ambos límites y cómo los temas del módulo los ilustran de forma práctica.

**Dependencias:** Tema 17, 21.2.

---

## Estado final

Los 21 temas del módulo de Comunicaciones Digitales quedaron desarrollados con el mismo nivel de detalle: Issue padre + sub-issues progresivos, con las funciones compartidas naciendo en el punto exacto donde se necesitan por primera vez (ver el resumen de dependencias entre funciones en `docs/03_arquitectura.md` del módulo). El siguiente paso natural es trasladar este contenido a Issues reales de GitHub y empezar a asignar equipos por tema, siguiendo el flujo descrito en `GOVERNANCE.md` y `docs/guia_issues_projects.md`.
