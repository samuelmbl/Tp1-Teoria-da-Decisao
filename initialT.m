function [to, PA, count] = initialT(PA_ref, clients, PAC, dist, sigma, Type)
%     Types:
%     'Distance' = will calculate t0 with fobjDist(dist)
%     'APTotal' = will calculate t0 with fobjAPTotal(dist)
% 
    count = 0;
    PA = PA_ref;
    
    N   = 1000;      % número de testes
    tau = 0.20;     % taxa de aceitação inicial
    
    if strcmp(Type, 'Distance'),
        x0 = fobjDist(dist);
    elseif strcmp(Type, 'APTotal'),
        x0 = fobjAPTotal(PA_ref);
    end;
    
    DeltaE(1) = x0;
    j = 1;
    
    for i=2:1:N,
        [new_PA, PAC, new_dist] = generateNewSolution(PA_ref, clients, sigma);
        
    if strcmp(Type, 'Distance'),
        xi = fobjDist(new_dist);
    elseif strcmp(Type, 'APTotal'),
        xi = fobjAPTotal(PA);
    end;
        DeltaE(j) = abs(xi-x0);
        j = j + 1;
        if(xi < x0),
            PA = new_PA; %Melhor solucao encontrada ate o momento
        end;
        
    end;

    DeltaEM = mean(DeltaE);
    to = - DeltaEM/log(tau);
end

