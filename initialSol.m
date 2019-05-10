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
%   Define solu��o inicial.
% =========================================================================


function [x,projetos,capital,n] = initialSol()

% Problema da Mochila Bin�rio:
% Considere n projetos e um capital de investimento b. O
% projeto j tem um custo aj e um retorno esperado pj.
% Formule um problema que permita selecionar o portf�lio
% de projetos que maximiza o retorno sem exceder os recursos
% dispon�veis.
    
% projetos = [a1 a2 ... aj ... an
%             p1 p2 ... pj ... pn]
n = 100;
rnd = rand(2,n);
projetos(1,:) = 10*rnd(1,:);
projetos(2,:) = 100*rnd(2,:);
capital  = 0.4*sum(projetos(1,:));

% solu��o candidata inicial (aleat�ria)
x = round(rand(1,n));   
