function [PA, PAC, dist] = generateNewSolution(PA_ref, clients, sigma)
    count = 0;
    PAC = [];
    dist = [];
    add = 4;
    while(isempty(PAC) && count<=100),
        if(count ==100 && length(PA_ref(:,1)) < 100),
            PA_ref(end+1:end+add, :) = 800*rand(add,2);
            add = add + 4;
            count = 0;
        end;
        PA = neighbor(PA_ref,[800; 800],[0; 0],sigma);
        [PAC, dist] = selectPACcalcDist(PA, clients);
        count = count + 1;
        

    end;
end