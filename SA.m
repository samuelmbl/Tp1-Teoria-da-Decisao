function [PAbest, PACbest, distbest, fobjbest, count, logfobj, logfobjbest] = SA(clients, Type, sigma, WDistance)
    PA = [];
    PAC = [];
    dist = [];
    
    PA_max = 100;
    c_max = 500;
    c_min = 0.95*c_max;
    b_max = 150;
    d_max = 85;
    x_max = 800;
    y_max = 800;

    % Contador de est�gios do m�todo
    k = 0;

    % Contador do n�mero de avalia��es de f(.)
    count = 1; 
    n = 2;
    % Gera solu��o inicial
    [PA, PAC, dist] = initialSol(clients, PA_max, x_max, y_max);
     
%     figure(1)
%     plot(PA(:,1), PA(:,2), 'b.');

    % Define temperatura inicial
    [to, PA, count] = initialT(PA, clients, PAC, dist, sigma, Type,WDistance);
    [PAC dist] = selectPACcalcDist(PA, clients);
    if strcmp(Type, 'Distance'),
        fobj = fobjDist(dist)
    elseif strcmp(Type, 'APTotal'),
        fobj = fobjAPTotal(PAC)
    elseif strcmp(Type, 'PW'),
        fobj = WDistance*fobjDistWP(dist) + (1-WDistance)*fobjAPTotalWP(PAC);
    end;
    t = to;

    % Armazena melhor solu��o encontrada
    PAbest  = PA;
    PACbest = PAC;
    distbest = dist;
    fobjbest = fobj;
    
    logfobj(1) = fobj;
    logfobjbest(1) = fobjbest;

    % Crit�rio de parada do algoritmo
    numEstagiosEstagnados = 0;

    % Crit�rio de parada
    while (numEstagiosEstagnados <= 20 && count < 20000), 

        % Crit�rios para mudan�a de temperatura
        numAceites = 0;
        numTentativas = 0;

        % Fitness da solu��o submetida ao est�gio k
        fevalin = fobjbest;

        while (numAceites < 12*n && numTentativas < 100*n),

            % Gera uma solu��o na vizinhan�a de PA
            
            [new_PA new_PAC new_dist] = generateNewSolution(PA, clients, sigma);
            
            if strcmp(Type, 'Distance'),
                new_fobj = fobjDist(new_dist);
            elseif strcmp(Type, 'APTotal'),
                new_fobj = fobjAPTotal(new_PAC);
            elseif strcmp(Type, 'PW'),
                new_fobj = WDistance*fobjDistWP(new_dist) + (1-WDistance)*fobjAPTotalWP(new_PAC);
            end;
            
%             [yretorno,ycusto] = fobj(y,projetos,capital);
            count = count + 1;        
            logfobj(end+1) = new_fobj;
            % Atualiza solu��o    
            DeltaE = new_fobj - fobj;
            if(DeltaE <= 0 || rand <= exp(-DeltaE/(t))),
                PA = new_PA;
                PAC = new_PAC;
                dist = new_dist;
                fobj = new_fobj;
                numAceites = numAceites + 1;

                % Atualiza melhor solu��o encontrada
                if (fobj < fobjbest)
                    PAbest  = PA;
                    PACbest = PAC;
                    distbest = dist;
                    fobjbest = fobj;
                    logfobjbest(end+1) = fobjbest;
                end        
            end
            numTentativas = numTentativas + 1;   

            % Armazena a solu��o corrente
%             memoryfile(size(memoryfile,1)+1,:) = [x(:)' xretorno xcusto];
        end

        % Atualiza a temperatura
        t = 0.5*t;

        % Avalia crit�rio de estagna��o
        if (fevalin > fobjbest),
            numEstagiosEstagnados = 0;
        else
            numEstagiosEstagnados = numEstagiosEstagnados + 1;        
        end

        % Avalia crit�rio de reinicializa��o da temperatura
        if (t < 1e-1),
            t = to;
        end

        % Atualiza contador de est�gios de temperatura
        k = k + 1;   
    end
    fprintf('\n')
end
