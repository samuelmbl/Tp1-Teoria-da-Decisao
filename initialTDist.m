%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Elétrica
%
% Autor:
%   Lucas S. Batista
%
% Atualização: 26/09/2018
%
% Nota:
%   Define a temperatura inicial.
% =========================================================================


function [to, PA, count] = initialTDist(PA_ref, clients, PAC, dist, sigma)
    count = 0;

    N   = 100;      % número de testes
    tau = 0.20;     % taxa de aceitação inicial
    
    x0 = fobjDist(dist);
    
    DeltaE(1) = x0;
    j = 1;
    
    for i=2:1:N,
        [new_PA, ~, new_dist] = generateNewSolution(PA_ref, clients, sigma);
        
        xi = fobjDist(new_dist);
        
        if(xi > x0),
            DeltaE(j) = xi-x0;
            j = j + 1;
        else
            PA = new_PA; %Melhor solucao encontrada ate o momento
        end;
        
    end;

    DeltaEM = mean(DeltaE);
    to = - DeltaEM/log(tau);
end

