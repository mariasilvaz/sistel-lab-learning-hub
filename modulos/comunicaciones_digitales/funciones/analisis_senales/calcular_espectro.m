function [frecuencia_hz, espectro_mag] = calcular_espectro(senal, fs, varargin)
% CALCULAR_ESPECTRO  Espectro en frecuencia de una señal, centrado y con escala configurable.
%
% Propósito:
%   La función fft() de MATLAB, por defecto, entrega el espectro sin
%   centrar (las frecuencias negativas quedan al final del vector) y sin
%   normalizar por la longitud de la señal. Eso obliga a repetir
%   manualmente fftshift, normalización y construcción del eje de
%   frecuencia en cada práctica que necesite graficar un espectro. Esta
%   función centraliza esos ajustes de alineación y escala para que todos
%   los temas del módulo grafiquen espectros de forma consistente.
%
% Entradas:
%   senal      - Vector de la señal en el tiempo (muestras), fila o columna.
%   fs         - Frecuencia de muestreo [Hz], escalar > 0.
%
% Parámetros nombre-valor (opcionales):
%   'tipo'     - 'amplitud' (por defecto) o 'potencia'.
%                Controla si se normaliza por N (amplitud) o por N^2 (potencia).
%   'escala'   - 'db' (por defecto) o 'lineal'.
%   'centrado' - true (por defecto) o false. Si es false, no aplica
%                fftshift y el eje de frecuencia va de 0 a fs (equivalente
%                a la salida cruda de fft(), pero ya normalizada).
%
% Salidas:
%   frecuencia_hz  - Vector de frecuencias [Hz], mismo largo que la señal.
%                    Centrado en 0 (incluye negativas) si 'centrado'=true.
%   espectro_mag   - Magnitud del espectro, en la escala solicitada.
%
% Ejemplo de uso:
%   [f, mag] = calcular_espectro(senal, 1e6);
%   plot(f, mag);
%   xlabel('Frecuencia [Hz]'); ylabel('Magnitud [dB]'); grid on;
%
%   [f, mag] = calcular_espectro(senal, 1e6, 'tipo', 'potencia', 'escala', 'lineal');
%
% Autor: (por definir cuando se desarrolle el tema que primero la use)
% Fecha: (por definir)
% Versión: 1.0

    %% Validación y valores por defecto de los parámetros opcionales
    p = inputParser;
    addParameter(p, 'tipo', 'amplitud', @(x) ismember(x, {'amplitud', 'potencia'}));
    addParameter(p, 'escala', 'db', @(x) ismember(x, {'db', 'lineal'}));
    addParameter(p, 'centrado', true, @islogical);
    parse(p, varargin{:});
    tipo     = p.Results.tipo;
    escala   = p.Results.escala;
    centrado = p.Results.centrado;

    senal = senal(:);              % fuerza columna, independiente de cómo llegue
    N = length(senal);

    %% Cálculo del espectro (aquí ocurre el ajuste de alineación y escala)
    espectro_crudo = fft(senal);
    if centrado
        espectro_crudo = fftshift(espectro_crudo);
        frecuencia_hz = (-floor(N/2):ceil(N/2) - 1)' * (fs / N);
    else
        frecuencia_hz = (0:N-1)' * (fs / N);
    end

    switch tipo
        case 'amplitud'
            espectro_mag_lineal = abs(espectro_crudo) / N;        % normaliza por N
        case 'potencia'
            espectro_mag_lineal = (abs(espectro_crudo) .^ 2) / N^2; % normaliza por N^2
    end

    switch escala
        case 'lineal'
            espectro_mag = espectro_mag_lineal;
        case 'db'
            piso_minimo = eps;  % evita log(0) en componentes nulas del espectro
            if strcmp(tipo, 'potencia')
                espectro_mag = 10 * log10(espectro_mag_lineal + piso_minimo);
            else
                espectro_mag = 20 * log10(espectro_mag_lineal + piso_minimo);
            end
    end

end
