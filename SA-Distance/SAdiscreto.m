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
%   Aproxima o ponto de ótimo (minimização) de um problema irrestrito
%   usando o Algoritmo Simulated Annealing (VERSÃO SIMPLES).
% =========================================================================


function [xbest, jxbest, nfe] = SAdiscreto()

%
% Sintaxe
% [xbest, jxbest, nfe] = SAdiscreto()
%
% Exemplo
% [xbest, jxbest, nfe] = SAdiscreto()
%


% Contador de estágios do método
k = 0;

% Contador do número de avaliações de f(.)
nfe = 0; 

% Gera solução inicial
[x,custo,n] = initialSol();

% Define temperatura inicial
[to,x,jx,nfe] = initialT(x,custo,nfe,n);
t = to;

% Armazena melhor solução encontrada
xbest  = x;
jxbest = jx;

% Armazena a solução corrente
memoryfile(1,:) = [xbest(:)' jxbest];

% Critério de parada do algoritmo
numEstagiosEstagnados = 0;


% Critério de parada
while (numEstagiosEstagnados <= 10 && nfe < 5000),
        
    % Critérios para mudança de temperatura
    numAceites = 0;
    numTentativas = 0;
       
    % Fitness da solução submetida ao estágio k
    fevalin = jxbest;

    while (numAceites < 12*n && numTentativas < 100*n),
        
        % Gera uma solução na vizinhança de x
        y = neighbor(x);
        jy  = fobj(y,custo,n);
        nfe = nfe + 1;        
        
        % Atualiza solução    
        DeltaE = (jy - jx);
        if (DeltaE <= 0 || rand <= exp(-DeltaE/t)),
            x  = y;
            jx = jy;            
            numAceites = numAceites + 1;
            
            % Atualiza melhor solução encontrada
            if (jx < jxbest),
                xbest  = x;
                jxbest = jx;                
            end        
        end
        numTentativas = numTentativas + 1;   
        
        % Armazena a solução corrente
        memoryfile(size(memoryfile,1)+1,:) = [x(:)' jx];
    end
                
    % Atualiza a temperatura
    t = 0.5*t;
    
    % Avalia critério de estagnação
    if (jxbest < fevalin),
        numEstagiosEstagnados = 0;
    else
        numEstagiosEstagnados = numEstagiosEstagnados + 1;        
    end
    
    % Avalia critério de reinicialização da temperatura
    if (t < 1e-1),        
        t = to;
    end
        
    % Atualiza contador de estágios de temperatura
    k = k + 1;   
end
fprintf('\n')

figure
plot(0:size(memoryfile,1)-1,memoryfile(:,end),'k-','linewidth',2)
xlabel('Número de iterações')
ylabel('Valor da função objetivo')



