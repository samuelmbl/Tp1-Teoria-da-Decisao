%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% 
% Nota:
%   Define a fun��o objetivo.
% LocPA = [ XCoord YCoord; ...]
% =========================================================================


function [TotalPA] = fobj(LocPA)
    TotalPA = length(LocPA(:,1));
end

