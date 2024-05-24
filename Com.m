% Parámetros
A = 10; % Tráfico ofrecido en Erlangs
N = 15; % Número de canales disponibles

% Función Erlang B
erlangB = @(A, N) (A^N / factorial(N)) / sum(A.^(0:N) ./ factorial(0:N));

% Calcular probabilidad de pérdida
P_b = erlangB(A, N);

% Mostrar resultado
fprintf('Probabilidad de pérdida de llamadas: %.5f\n', P_b);

% Gráfico de la probabilidad de pérdida en función del número de canales
N_values = 1:20;
P_b_values = arrayfun(@(N) erlangB(A, N), N_values);

figure;
plot(N_values, P_b_values, '-o');
xlabel('Número de canales');
ylabel('Probabilidad de pérdida de llamadas');
title('Probabilidad de pérdida de llamadas en función del número de canales');
grid on;