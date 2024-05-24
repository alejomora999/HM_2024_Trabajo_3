function ETw = colamm1(tea, tds)
    usuarios =  numel(tea);
    %reloj = zeros(1,usuarios);
    inicio = zeros(1,usuarios);
    salida = zeros(1,usuarios);
    %espera = zeros(1,usuarios);
    reloj = cumsum(tea);
    inicio(1) = reloj(1);
    salida(1) = inicio(1) + tds(1);
    for n=2:usuarios
        if salida(n-1) > reloj(n)
            inicio(n) = salida(n-1);
        else
            inicio(n) = reloj(n);
        end
        salida(n) = inicio(n) + tds(n);
    end    
    espera = inicio - reloj;
    ETw = mean (espera);

end