figure(2);
usuarios = 2000;
lambda = 8;
k = 15;

A = linspace(0.05,10*k,10000); % cambiar el 0.95 por el A sugerido en clase
teorico = zeros(1,numel(A));
for n = 1:numel(A)
    teorico(n) = erlang_b(A(n),k);
end
superplot(A,teorico);

hold on;

% Resultado de Simulación: promedios de bloqueo
A = linspace(0.05,10*k,20); % cambiar el 0.95 por el A sugerido en clase
mu = lambda./A;
promedios = zeros(1,numel(A));

for n = 1:numel(A)
    tea = exprnd(1/lambda,1,usuarios);
    tds =  exprnd(1/mu(n),1,usuarios);
    promedios(n) = simular_cola_MMKK(tea,tds,k); % usar su función 
    
end

superstem(A,promedios,'Promedios probabilidad de Bloqueo',...
    '$A=\frac{\lambda}{\mu}$','$\:\overline{P_k}$');
xlim([0.05,10*k]);
hold off;

legend({'Teórico','Simulación'},'Location','northwest')


