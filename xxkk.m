
function p_bloqueo = xxkk(tiempo_arribo, tiempo_servicio, K)
    % Simular una cola M/M/K/K/INFINITO
    %
    % Parámetros:
    %   tiempo_arribo  - Vector con los tiempos entre arribos consecutivos
    %   tiempo_servicio  - Vector con los tiempos de servicio
    %   K              - Número de servidores (y capacidad del sistema)
    %
    % Resultado:
    %   p_bloqueo      - Probabilidad de bloqueo

    % Inicialización
    num_arribos = length(tiempo_arribo)
    num_servicios = length(tiempo_servicio)

    if num_arribos ~= num_servicios
        error('El número de arribos debe ser igual al número de servicios.');
    end

    % Tiempo actual y estado de los servidores
    tiempo = 0;
    servidores = zeros(1, K); % 0 indica que el servidor está libre, >0 indica tiempo restante de servicio
    bloqueados = 0;

    % Simulación
    for i = 1:num_arribos
        % Actualizar el tiempo actual
        tiempo = tiempo + tiempo_arribo(i);

        % Actualizar el estado de los servidores
        for j = 1:K
            if servidores(j) > 0
                servidores(j) = max(0, servidores(j) - tiempo_arribo(i));
            end
        end

        % Intentar asignar el cliente a un servidor libre
        servidor_libre = find(servidores == 0, 1);
        if isempty(servidor_libre)
            % No hay servidores libres, cliente bloqueado
            bloqueados = bloqueados + 1;
        else
            % Asignar el cliente a un servidor libre
            servidores(servidor_libre) = tiempo_servicio(i);
        end
    end
    servidores
    % Calcular la probabilidad de bloqueo
    p_bloqueo = bloqueados / num_arribos;
end


