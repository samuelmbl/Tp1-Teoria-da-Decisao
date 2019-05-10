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
%   Define a vizinhança.
% =========================================================================


function y = neighbor(x)

y = x;
n = length(x);
r = randperm(n);
if rand() <= 0.5, % exchange two random positions
    y(r(1)) = x(r(2));
    y(r(2)) = x(r(1));
else              % exchange two neighbors positions
    if r(1) < n,
        y(r(1)) = x(r(1)+1);
        y(r(1)+1) = x(r(1));
    else
        y(r(1)) = x(r(1)-1);
        y(r(1)-1) = x(r(1));
    end
end


