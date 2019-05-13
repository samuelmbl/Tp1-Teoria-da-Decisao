%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% 
% Nota:
%   Define a função objetivo.
% LocPA = [ XCoord YCoord; ...]
% =========================================================================


function [TotalPA] = fobjAPTotalWP(PAC)
    TotalPA = (length(unique(PAC))-1)/100;
end

