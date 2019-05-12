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
%   Realiza muta��o uniforme
% =========================================================================


function y = uniforme_mutation(x,ub,lb,sigma)

D = 2*rand(length(x),size(x,2)) - 1;
delta = sigma*(ub - lb).*D;

y = x + 1*delta;
y = boxConstraints(y, ub, lb);

