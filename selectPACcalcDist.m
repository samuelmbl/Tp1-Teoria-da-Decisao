function [PAC, dist] = selectPACcalcDist(PA, clients)
    c_size = length(clients(:,1));
    PAC = zeros(c_size,1);
    dist = zeros(c_size,1);
    b = zeros(length(PA(:,1)),1);
    d_max = 85;  %m
    b_max = 150; %MB
    
    for PA_index=1:1:length(PA(:,1)),
        [sorted_dist index] = sort(evalDist(PA(PA_index,:), clients(:,1:2)));
        
        for j=1:1:length(sorted_dist(sorted_dist<d_max)),
            if(PAC(index(j)) == 0 && (b(PA_index)+ clients(index(j),3)) < b_max),
                PAC(index(j)) = PA_index;
                dist(index(j)) = sorted_dist(j);
                b(PA_index) = b(PA_index) + clients(index(j),3);
            end;
        end;
    end;
    
    if(length(PAC(PAC>0)) < 0.95*c_size),
        PAC = [];
        dist = [];
    end;
end