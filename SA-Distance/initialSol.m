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
%   Define a solu��o inicial.
% =========================================================================


function [x,custo,n] = initialSol()

% Problema de Designa��o Simples:
% Considere que existem n tarefas e n agentes, de tal forma
% que cada tarefa deve ser atribu�da a um agente e cada
% agente s� pode receber uma tarefa. A execu��o da tarefa i
% pelo agente j tem um custo cij. Formule um problema que
% atribua as tarefas de forma a minimizar o custo total de
% execu��o.

n = 10;

% custo = [   t1 t2 ... tn
%          a1
%          a2
%          ...
%          an              ]
custo = 100*rand(n,n);

%      a1 a2 ... an
% x = [tx ty ... tz]
x = randperm(n);


