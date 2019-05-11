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
%   Define a temperatura inicial.
% =========================================================================


function [to,x,jx,nfe] = initialT(x,custo,nfe,n)

% Problema de Designa��o Simples:
% Considere que existem n tarefas e n agentes, de tal forma
% que cada tarefa deve ser atribu�da a um agente e cada
% agente s� pode receber uma tarefa. A execu��o da tarefa i
% pelo agente j tem um custo cij. Formule um problema que
% atribua as tarefas de forma a minimizar o custo total de
% execu��o.

N   = 100;      % n�mero de testes
tau = 0.20;     % taxa de aceita��o inicial
X   = zeros(N,n);
jX  = zeros(N,1);

jx  = fobj(x,custo,n);
nfe = nfe + 1;
X(1,:) = x;
jX(1)  = jx;

i = 1;
DeltaE = 100;
for k = 2:N,
    X(k,:) = neighbor(x);
    jX(k)  = fobj(X(k,:),custo,n);
    nfe = nfe + 1; 
    
    DE = jX(k) - jx;
    if DE > 0,
        DeltaE(i) = DE;
        i = i + 1;
    end
end

[fmin,jmin] = min(jX);
x  = X(jmin,:);
jx = fmin;

DeltaEM = mean(DeltaE);
to = - DeltaEM/log(tau);


