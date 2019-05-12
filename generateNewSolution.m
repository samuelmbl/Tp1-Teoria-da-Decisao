function [PA, PAC, dist] = generateNewSolution(PA_ref, clients, sigma)
    count = 0;
    PAC = [];
    dist = [];
    
    while(isempty(PAC) && count<100),
%         TODO: Nao cosegui usar a neighbor. Tava dando pau no ub e lb, mas
%         acho que era por nao saber usar.
        PA = neighbor(PA_ref,[800; 800],[0; 0],sigma);
        [PAC, dist] = selectPACcalcDist(PA, clients);
        count = count + 1;
    end;
    if(count == 100)
        PAC = [];
        PA = [];
        dist = [];
    end;

end