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
%   Define vizinhança.
% =========================================================================


function y = neighbor(x)

y = x;
n = length(x);

if rand() <= 0.5, p = 1; else p = 2; end

r = randperm(n);
y(r(1:p)) = not(x(r(1:p)));
