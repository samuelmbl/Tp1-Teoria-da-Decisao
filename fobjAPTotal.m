%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% 
% Nota:
%   Define a fun��o objetivo.
% LocPA = [ XCoord YCoord; ...]
% =========================================================================


function [TotalPA] = fobjAPTotal(PAC)
    TotalPA = length(unique(PAC))-1;
end

