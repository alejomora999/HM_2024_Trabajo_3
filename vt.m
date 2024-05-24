function [H,Hmin,Hmax] = vt(traza)
%% Funci�n Varianza - Tiempo
%   vt(traza) realiza el diagrama Varianza - Tiempo de un vector de datos
%   (traza). La regresi�n lineal se realiza mediante el M�todo de M�nimos
%   Cuadrados.
%
%   En la leyenda se muestra el estimado del Par�metro de Hurst, H. Tanto
%   la estimaci�n de H, como el intervalo de confianza, se retornan en el
%   orden: H Hmin Hmax (para un 95% de confianza).
%
%   Ejemplo:
%
%   traza = exprnd(1,1,1000000);
%   [H Hmin Hmax] = vt(traza);
%
%   Genera el diagrama varianza - tiempo de una traza de datos
%   exponencialmente distribuida de media 1 y longitud 100000. En H se
%   almacena la estimaci�n del Par�metro de Hurst; en Hmin y Hmax, se
%   almacenan los l�mites del intervalo de confianza.
%
%   Funci�n vt, Versi�n 3.0, 26 de mayo de 2017.
%   - Se modifican las etiquetas de los ejes y la leyenda.
%
%   Versi�n 2.0, 3 de junio de 2016.
%   - Se incluye la funci�n pendienteci().
%   - Se elimina la necesidad de usar la funci�n superplot().
%   - Se realizan ajustes gr�ficos.
%
%   Versi�n 1.0, 5 de noviembre de 2015.
%
%   Elaborada por Hans L�pez, hanslop@gmail.com
%
L = length(traza);
gruposmax = fix(L/sqrt(L));
varianza = zeros(1,gruposmax-1);


for n = 2:gruposmax
    columnas = fix(L/n);
    datos = reshape(traza(1:n*columnas),[n,columnas]);
    promedios = mean(datos);
    varianza(n-1) = var(promedios);  
end

x = log10(2:gruposmax);
y = log10(varianza);

[m,b,ml,mh] = pendienteci(x,y);

Hmin = ml/2+1;
H = m/2+1;
Hmax = mh/2+1;

plot(x,y,'s','MarkerFaceColor','b');
title('Diagrama Varianza - Tiempo','FontSize',18);
xlabel('$\log m$','FontSize',18,'Interpreter','latex');
ylabel('$\log S_{X^{(m)}}^2$','FontSize',18,'Interpreter','latex');
grid on;
set(gca,'FontSize',16);
set(gcf,'Color','white');
axis([min(x) max(x) min(y)-0.1*(max(y)-min(y)) max(y)+0.1*(max(y)-min(y))]);

hold on;
plot(x,m*x+b,'r','Linewidth',2);

x1 = min(x)+ 0.45*(max(x)-min(x));
x2 = min(x)+ 0.55*(max(x)-min(x));
plot([x1 x1 x2],[m*x1+b m*x2+b m*x2+b],'k:','Linewidth',2);

hold off;
legend({'$\log S_{X^{(m)}}^2$','Regresi\''on Lineal',...
    ['$2H-2$, ',num2str(Hmin) ' $< H <$ ' num2str(Hmax)]},...
    'Interpreter','latex');
end

%% funci�n para la regresi�n lineal simple

function [m,b,ml,mh] = pendienteci(x,y)
% Regresi�n por m�nimos cuadrados
A = x*x';
B = sum(x);
C = x*y';
m = (C-B*mean(y))/(A-B*mean(x));
b = mean(y)-m*mean(x);

% C�lculo de s
error = y - m*x - b;
n = length(x);
s = sqrt(error*error'/(n-2));
ex = x - mean(x);
Sxx = ex*ex';

% C�lculo del intervalo de confianza de m

ml = m - tinv(0.975,n-2)*s/sqrt(Sxx);
mh = m + tinv(0.975,n-2)*s/sqrt(Sxx);

end