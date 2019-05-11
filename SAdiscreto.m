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


function [xbest, xrbest, xcbest, capital, nfe] = SAdiscreto()

%
% Sintaxe
% [xbest, xrbest, xcbest, capital, nfe] = SAdiscreto()
%
% Exemplo
% [xbest, xrbest, xcbest, capital, nfe] = SAdiscreto()
%


% Contador de estágios do método
k = 0;

% Contador do número de avaliações de f(.)
nfe = 0; 

% Gera solução inicial
[x,projetos,capital,n] = initialSol();

% Define temperatura inicial
[to,x,xretorno,xcusto,nfe] = initialT(x,projetos,capital,nfe,n); 
t = to;

% Armazena melhor solução encontrada
xbest  = x;
xrbest = xretorno;
xcbest = xcusto;

% Armazena a solução corrente
memoryfile(1,:) = [xbest(:)' xrbest xcbest];

% Critério de parada do algoritmo
numEstagiosEstagnados = 0;


% Critério de parada
while (numEstagiosEstagnados <= 10 && nfe < 10000), 
        
    % Critérios para mudança de temperatura
    numAceites = 0;
    numTentativas = 0;
       
    % Fitness da solução submetida ao estágio k
    fevalin = xrbest;

    while (numAceites < 12*n && numTentativas < 100*n),
        
        % Gera uma solução na vizinhança de x
        y = neighbor(x);
        [yretorno,ycusto] = fobj(y,projetos,capital);
        nfe = nfe + 1;        
        
        % Atualiza solução    
        DeltaE = -(yretorno - xretorno);
        if (DeltaE <= 0 || rand <= exp(-DeltaE/t)),
            x = y;
            xretorno = yretorno;
            xcusto   = ycusto;
            numAceites = numAceites + 1;
            
            % Atualiza melhor solução encontrada
            if (xretorno > xrbest)
                xbest  = x;
                xrbest = xretorno;
                xcbest = xcusto;
            end        
        end
        numTentativas = numTentativas + 1;   
        
        % Armazena a solução corrente
        memoryfile(size(memoryfile,1)+1,:) = [x(:)' xretorno xcusto];
    end
                
    % Atualiza a temperatura
    t = 0.5*t;
    
    % Avalia critério de estagnação
    if (xrbest > fevalin),
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
