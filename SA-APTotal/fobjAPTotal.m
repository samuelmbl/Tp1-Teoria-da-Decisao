%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% 
% Nota:
%   Define a função objetivo.
% LocPA = [ XCoord YCoord; ...]
% =========================================================================


function [Retorno, QuantPA] = fobj(LocPA, ClientesAtend, BandaConsumidaPA)
    numClientes = 500;
    percentualAtend = 0.95;
    
    
    penClientesAtend = max(0, numClientes * percentualAtend - size(find(ClientesAtend ==1),1))^2;
    penBandaConsumida = 0;
    
    for i = 1 : size(BandaConsumidaPA,1)
        penBandaConsumida = penBandaConsumida + max(0,BandaConsumida(i) - 150)^2;
    end
    
Retorno = size(LocPA,1) + penClientesAtend + penBandaConsumida;  
QuantPA  = size(LocPA,1);

