%% NOMBRE_DEL_TEMA — Título breve del sistema que arma este script
%
% Descripción:
%   Qué sistema completo simula este script (ej: cadena
%   transmisor-canal-receptor para comparar esquemas de modulación) y qué
%   tema/práctica documenta. Debe implementar el tema descrito en el
%   nombre_del_tema.md de esta misma carpeta.
%
% Requiere:
%   MATLAB              R20XXx o superior (probado en R20XXx)
%   Toolboxes           Nombre del/los toolbox(es), o "ninguno"
%   Funciones propias:
%     - nombre_funcion_1.m
%     - nombre_funcion_2.m
%
% Guía asociada:
%   practicas/NN_nombre_del_tema/nombre_del_tema.md
%
% Autor: Nombre Apellido
% Fecha: AAAA-MM-DD
% Versión: 1.0

% -------------------------------------------------------------------
% Recordatorios del estándar (borra estos comentarios al usar la plantilla):
%
%   - Todos los parámetros modificables van en el bloque de abajo, con
%     unidad y rango como comentario. Nada de valores "mágicos" sueltos
%     más adelante en el código.
%   - Aquí sí van los fprintf() con resultados y las llamadas a graficar
%     (a diferencia de las funciones en funciones/).
%   - El script debe correr sin errores con los parámetros por defecto,
%     sin modificar nada.
%   - Debe comparar al menos dos escenarios/configuraciones distintas
%     (ver docs/estandares/estandar_pedagogico.md).
% -------------------------------------------------------------------

clear; clc; close all;

%% Parámetros configurables
snr_db      = 10;        % Relación señal a ruido [dB]. Rango típico: -5 a 30.
esquema_mod = 'QPSK';    % Esquema de modulación. Opciones: 'BPSK','QPSK','16QAM'.
num_bits    = 1e5;       % Número de bits a simular. Rango: 1e3 a 1e6.
fs          = 1e6;       % Frecuencia de muestreo [Hz].

% Parámetros del segundo escenario de comparación (ajusta según el tema)
snr_db_comparacion = 5;  % [dB] — escenario alterno para contrastar contra el anterior

%% 1. Generación de la señal / secuencia base
% bits = generar_secuencia_binaria(num_bits);

%% 2. Procesamiento / transmisión (invoca funciones propias)
% simbolos = nombre_funcion_1(bits, esquema_mod);

%% 3. Canal
% simbolos_rx = nombre_funcion_2(simbolos, snr_db);

%% 4. Recepción y métricas de desempeño
% ber_sim = calcular_ber(bits, bits_recuperados);
% fprintf('BER simulada: %.4e (SNR = %.1f dB, esquema = %s)\n', ...
%     ber_sim, snr_db, esquema_mod);

%% 5. Visualización (señales intermedias, no solo el resultado final)
% figure;
% plot(...);
% title('Título descriptivo');
% xlabel('Eje X [unidad]');
% ylabel('Eje Y [unidad]');
% legend('Serie 1', 'Serie 2');
% grid on;

%% 6. Comparación de escenarios
% Repite el bloque 2-4 con snr_db_comparacion (u otro parámetro alterno) y
% presenta ambos resultados en la misma gráfica o en gráficas alineadas,
% no en ejecuciones desconectadas entre sí.
