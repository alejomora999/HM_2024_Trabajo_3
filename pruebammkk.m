 %instantes_arribos = [1, 2, 3, 4, 5]; % Ejemplo de tiempos entre arribos
 %tiempos_servicio = [0.8, 1.2, 1.0, 0.9, 1.1]; % Ejemplo de tiempos de servicio

%instantes_arribos = [2, 3, 1, 4, 2]; % Ejemplo de tiempos entre arribos
%tiempos_servicio = [5, 2, 3, 4, 1]; % Ejemplo de tiempos de servicio
 
%instantes_arribos = [1 2 3 7 2 3 8 0 5 1 2 3 7 2 3 8 0 5 1 2 3 7 2 3 8 0 5 1 2 3 7 2 3 8 0 5];
%tiempos_servicio = [9 1 4 1 1 5 3 8 2 9 1 4 1 1 5 3 8 2 9 1 4 1 1 5 3 8 2 9 1 4 1 1 5 3 8 2];
%instantes_arribos =exprnd(1/2,1000);
%tiempos_servicio =exprnd(1/2,1000);
lambda = 24;
mu = 28;
a=lambda/mu;
usuarios = 1000000;
instantes_arribos = exprnd(1/lambda,1,usuarios);
tiempos_servicio = exprnd(1/mu,1,usuarios);
%Twpromedio = xx1(tea,tds,0)
K = 2; % Número de servidores
%instantes_arribos= randi(11,1,usuarios)-1;
%tiempos_servicio=randi(11,1,usuarios)-1; 

probabilidad_bloqueo_3 = simular_cola_MMKK(instantes_arribos, tiempos_servicio, K);
fprintf('La probabilidad de bloqueo_3 es: %.5f\n', probabilidad_bloqueo_3);

probabilidad_bloqueo_6 = erlang_b(a,K);
fprintf('La probabilidad de bloqueo_6 teorico: %.5f\n', probabilidad_bloqueo_6);