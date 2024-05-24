function [] = superstem(x,y,titulo,ejex,ejey,colordelta)
%% Funci�n SUPERSTEM
%   Utiliza la funci�n stem para realizar la gr�fica de f[n]. SUPERSTEM
%   cambia el fondo de la figura a color blanco y el tama�o de las fuentes.
%   Adicionalmente ajusta de forma autom�tica los l�mites de las gr�ficas.
%
%   La funci�n permite agregar el t�tulo de la gr�fica, y el nombre de los
%   ejes como par�metros de entrada.
%
%   Ejemplo:
%
%   n = -15:15;
%   SUPERSTEM(n,sinc(n/5),'Gr�fica de sinc[n/5]','n','sinc[n/5]');
%
%   Funci�n SUPERSTEM, Versi�n 4.0, 10 de octubre de 2019
%   - se realizaron ajustes gr�ficos para concordar con las proporciones de
%   la funci�n SUPERPLOT.
%   Versi�n 3.0, 29 de septiembre de 2017
%   - se modific� el interprete de los ejes a LaTeX. El interprete del
%   t�tulo no se modific�.
%   Versi�n 2.0, 28 de noviembre de 2016
%   - Se corrige un error que no permitia graficar secuencias constantes.
%   - Se modifican los l�mites de la variable independiente, para que
%   queden a media unidad de cada extremo.
%   Versi�n 1.0, 26 de noviembre de 2016
%   Elaborada por Hans L�pez, hanslop@gmail.com
%    
    switch nargin
        case 0
            disp('Faltan argumentos de entrada');
            return;
        case 1
            stem(x,'.','Linewidth',2,'MarkerSize',16);
            grid on;
            set(gca,'FontSize',14);
            set(gcf,'Color','white');
          
            xminimo = 0.5;
            xmaximo = length(x)+0.5;
            yminimo = min(x)-0.1*(max(x)-min(x));
            ymaximo = max(x)+0.1*(max(x)-min(x));

            if yminimo ~= ymaximo
                axis([xminimo, xmaximo, yminimo, ymaximo]);
            elseif ymaximo>0
                axis([xminimo, xmaximo, -0.1*ymaximo, 1.1*ymaximo]);
            elseif ymaximo<0
                axis([xminimo, xmaximo, 1.1*ymaximo, -0.1*ymaximo]);
            else
                axis([xminimo, xmaximo, -1, 1]);
            end
            
            return;
        case 2
            stem(x,y,'.','Linewidth',2,'MarkerSize',16);
        case 3
            stem(x,y,'.','Linewidth',2,'MarkerSize',16);
            title(titulo,'FontSize',16);
        case 4
            stem(x,y,'.','Linewidth',2,'MarkerSize',16);
            title(titulo,'FontSize',16);
            xlabel(ejex,'FontSize',16,'Interpreter','latex');
        case 5
            stem(x,y,'.','Linewidth',2,'MarkerSize',16);      
            title(titulo,'FontSize',16);
            xlabel(ejex,'FontSize',16,'Interpreter','latex');
            ylabel(ejey,'FontSize',16,'Interpreter','latex');
        case 6
            stem(x(y>0),y(y>0),'^','color',colordelta,'Linewidth',2,'MarkerSize',16);
            hold on;
            stem(x(y<0),y(y<0),'v','color',colordelta,'Linewidth',2,'MarkerSize',16);
            hold off;
            title(titulo,'FontSize',16);
            xlabel(ejex,'FontSize',16,'Interpreter','latex');
            ylabel(ejey,'FontSize',16,'Interpreter','latex');    
    end
    grid on;
    set(gca,'FontSize',14);
    set(gca,'TickLabelInterpreter','latex');
    set(gcf,'Color','white');
    xminimo = min(x)-0.5;
    xmaximo = max(x)+0.5;
    yminimo = min(y)-0.1*(max(y)-min(y));
    ymaximo = max(y)+0.1*(max(y)-min(y));
    
    if yminimo ~= ymaximo
        axis([xminimo, xmaximo, yminimo, ymaximo]);
    elseif ymaximo>0
        axis([xminimo, xmaximo, -0.1*ymaximo, 1.1*ymaximo]);
    elseif ymaximo<0
        axis([xminimo, xmaximo, 1.1*ymaximo, -0.1*ymaximo]);
    else
        axis([xminimo, xmaximo, -1, 1]);
    end
  
end