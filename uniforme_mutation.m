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
%   Realiza mutação uniforme
% =========================================================================


function y = uniforme_mutation(x,ub,lb,sigma)

D = 2*rand(length(x),length(x(1,:))) - 1;
% delta(:,1) = sigma*(ub(1) - lb(1))*D(:,1);
% delta(:,2) = sigma*(ub(2) - lb(2))*D(:,2);
if (rand() < 0.4)
    delta(:,1) = sigma*(ub(1) - lb(1))*D(:,1);
    delta(:,2) = sigma*(ub(2) - lb(2))*D(:,2);
else
    delta(:,1) = sigma*(100)*D(:,1);
    delta(:,2) = sigma*(100)*D(:,2);
end 
y = x + 1*delta;
y = boxConstraints(y, ub, lb);

