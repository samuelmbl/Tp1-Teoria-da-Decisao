%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia El�trica
%
% Autor:
%   Lucas S. Batista
%
% Atualiza��o: 26/09/2018
%
% Nota:
%   Aproxima o ponto de �timo (minimiza��o) de um problema irrestrito
%   usando o Algoritmo Simulated Annealing (VERS�O SIMPLES).
% =========================================================================


function [xbest, jxbest, nfe] = SAdiscreto()

%
% Sintaxe
% [xbest, jxbest, nfe] = SAdiscreto()
%
% Exemplo
% [xbest, jxbest, nfe] = SAdiscreto()
%


% Contador de est�gios do m�todo
k = 0;

% Contador do n�mero de avalia��es de f(.)
nfe = 0; 

% Gera solu��o inicial
[x,custo,n] = initialSol();

% Define temperatura inicial
[to,x,jx,nfe] = initialT(x,custo,nfe,n);
t = to;

% Armazena melhor solu��o encontrada
xbest  = x;
jxbest = jx;

% Armazena a solu��o corrente
memoryfile(1,:) = [xbest(:)' jxbest];

% Crit�rio de parada do algoritmo
numEstagiosEstagnados = 0;


% Crit�rio de parada
while (numEstagiosEstagnados <= 10 && nfe < 5000),
        
    % Crit�rios para mudan�a de temperatura
    numAceites = 0;
    numTentativas = 0;
       
    % Fitness da solu��o submetida ao est�gio k
    fevalin = jxbest;

    while (numAceites < 12*n && numTentativas < 100*n),
        
        % Gera uma solu��o na vizinhan�a de x
        y = neighbor(x);
        jy  = fobj(y,custo,n);
        nfe = nfe + 1;        
        
        % Atualiza solu��o    
        DeltaE = (jy - jx);
        if (DeltaE <= 0 || rand <= exp(-DeltaE/t)),
            x  = y;
            jx = jy;            
            numAceites = numAceites + 1;
            
            % Atualiza melhor solu��o encontrada
            if (jx < jxbest),
                xbest  = x;
                jxbest = jx;                
            end        
        end
        numTentativas = numTentativas + 1;   
        
        % Armazena a solu��o corrente
        memoryfile(size(memoryfile,1)+1,:) = [x(:)' jx];
    end
                
    % Atualiza a temperatura
    t = 0.5*t;
    
    % Avalia crit�rio de estagna��o
    if (jxbest < fevalin),
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

figure
plot(0:size(memoryfile,1)-1,memoryfile(:,end),'k-','linewidth',2)
xlabel('N�mero de itera��es')
ylabel('Valor da fun��o objetivo')



