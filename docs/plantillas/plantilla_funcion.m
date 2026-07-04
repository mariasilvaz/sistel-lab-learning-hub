function [salida1, salida2] = plantilla_funcion(entrada1, entrada2)
% PLANTILLA_FUNCION  Resumen de una línea de qué hace la función.
%
% Propósito:
%   Descripción de 2-4 líneas: qué calcula o qué representa esta función,
%   y por qué existe como pieza reutilizable (en vez de vivir dentro de
%   un script de sistema). Ver "Dos tipos de código" en
%   docs/estandares/estandar_codigo.md.
%
% Entradas:
%   entrada1  - Descripción, tipo y unidades (ej: SNR en dB, escalar)
%   entrada2  - Descripción, tipo y unidades
%
% Salidas:
%   salida1   - Descripción, tipo y unidades
%   salida2   - Descripción, tipo y unidades
%
% Ejemplo de uso:
%   [salida1, salida2] = plantilla_funcion(10, 'QPSK');
%
% Autor: Nombre Apellido
% Fecha: AAAA-MM-DD
% Versión: 1.0

% -------------------------------------------------------------------
% Recordatorios del estándar (borra estos comentarios al usar la plantilla):
%
%   - Esta función NO debe imprimir resultados (fprintf/disp) ni generar
%     gráficas. Esa responsabilidad es del script de sistema que la invoca.
%   - Una función, una responsabilidad. Si necesitas calcular y graficar,
%     son dos funciones distintas (o cálculo aquí + graficado en el script
%     de sistema).
%   - Si esta función supera ~80 líneas de código efectivo, evalúa dividirla
%     en subfunciones.
%   - Nombres de variables en snake_case, descriptivos, con unidad como
%     sufijo cuando aplique (snr_db, tiempo_s, frecuencia_hz).
% -------------------------------------------------------------------

%% Validación básica de entradas (opcional pero recomendado)
% arguments
%     entrada1 (1,1) double
%     entrada2 (1,:) char
% end

%% Cálculo
% Comenta cada bloque lógico explicando qué hace y por qué, no cómo.
% Ejemplo:
% simbolos = simbolos / sqrt(mean(abs(simbolos).^2));  % normaliza energía
%           % de símbolo a 1 para comparar BER bajo el mismo Eb/No.

salida1 = [];  % TODO: reemplazar por el cálculo real
salida2 = [];  % TODO: reemplazar por el cálculo real

end
