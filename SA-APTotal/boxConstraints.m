%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Elétrica
%
% Autor:
%   Lucas S. Batista
%
% Atualização: 27/09/2018
%
% Nota:
%   Garante que x respeite as restrições de caixa (trunca as vairáveis nos
%   limitantes inferior e superior).
% =========================================================================


function PA = boxConstraints(Sol, ub, lb)

x1 = Sol(:,1);
y1 = Sol(:,2); 
x1(x1 < lb(1)) = lb(1); % x menor que lim minimo
x1(x1 > ub(1)) = ub(1); % x maior que lim máximo

y1(y1 < lb(2)) = lb(2); % y menor que lim minimo
y1(y1 > ub(2)) = ub(2); % y maior que lim máximo

PA(:,1) = x1;
PA(:,2) = y1;

