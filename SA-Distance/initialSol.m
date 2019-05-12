% Retorna uma solucao inicial no formato [PA, PAC, dist], sendo:
% PA: Posicao [x, y] de cada ponto de acesso.
% PAC: Ponto de acesso que atendera cada cliente.
% dist: Distancia entre o ponto de acesso e o cliente atendido.

function [PA, PAC, dist] = initialSol(clients, pa_max, x_max, y_max)    
    PAC = [];
    PA = [];
    dist = [];
    count = 0;
    
    pa_en = pa_max;
    while(isempty(PAC) && count<100),
        PA = rand(pa_en, 2);
        PA(:,1) = PA(:,1)*x_max;
        PA(:,2) = PA(:,2)*y_max;

        [PAC, dist] = selectPACcalcDist(PA, clients);
        count = count + 1;
    end;
    if(count == 100)
        PAC = [];
        PA = [];
        dist = [];
    end;
end
