%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia El�trica
%
% Autor:
%   Lucas S. Batista
%
% Atualiza��o: 27/09/2018
%
% Nota:
%   Garante que x respeite as restri��es de caixa (trunca as vair�veis nos
%   limitantes inferior e superior).
% =========================================================================


function PA = boxConstraints(Sol, ub, lb)

x1 = Sol(:,1);
y1 = Sol(:,2); 
x1(x1 < lb(1)) = lb(1); % x menor que lim minimo
x1(x1 > ub(1)) = ub(1); % x maior que lim m�ximo

y1(y1 < lb(2)) = lb(2); % y menor que lim minimo
y1(y1 > ub(2)) = ub(2); % y maior que lim m�ximo

PA(:,1) = x1;
PA(:,2) = y1;

