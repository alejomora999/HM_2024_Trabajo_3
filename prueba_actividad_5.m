datos = agostornd_grupo3(1,1000000);
lambda = 1/mean(datos);
k=15;
Amin = 0.1;
Amax = 0.9*k;
simulaciones = 100;
A = linspace(Amin,Amax,simulaciones);
mu = lambda./A;
%usuarios = 1000000;
usuarios = 200000; %Cambiar usuarios
tiempomedio = zeros(1,numel(mu));
for n = 1:numel(mu)
    tea = agostornd_grupo3(1,usuarios);
    tds = exprnd(1/mu(n),1,usuarios);
    tiempomedio(n) = simular_cola_MMKK(tea,tds,k); % La función de la cola
end
A = linspace(Amin,Amax,1000);
mu = lambda./A;
teorico = zeros(1,numel(A)); 
for n = 1:numel(A)
    teorico(n) = erlang_b(A(n),k);% Valor teórico obtenido para la cola 
end
figure(15);
superplot(A,teorico,...
    'Promedios probabilidad de Bloqueo','A=\frac{\lambda}{\mu}',...
    '$\overline{P_k}$');
hold on;

A = linspace(Amin,Amax,simulaciones);
superplot(A,tiempomedio);
hold off;

legend({'Exponencial','Agosto'},...
    'location','best');
xlim([Amin Amax]);