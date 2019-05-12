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


function y = neighbor(PAPos,ub,lb,sigma,n)
%(x,ub,lb,sigma,xlimites,n)
%PAPos => [X1 Y1; X2 Y2; ...] Posição de cada PA

size = length(PAPos);

i = rand();
% PANum =  unique(PACli);
% CliAtendPorPA = [PANum, histc(PACli(:),PANum)];
% CliAtendPorPAOrder = sortrows(CliAtendPorPA,2);
% PioresPAs = CliAtendPorPAOrder(1:3,1); % PAs que atendem menos clientes  
if i <= 0.2
    y = uniforme_mutation(PAPos,ub, lb,sigma,n);
    
elseif i <= 0.6
    y = PAPos;
    r = randperm(size,4);
    p = rand();
    
    if(p<0.2)
        % Switch X values
        y(r(1),1) = PAPos(r(2),1);
        y(r(2),1) = PAPos(r(1),1);
        
        % Switch Y values
        y(r(3),2) = PAPos(r(4),2);
        y(r(4),2) = PAPos(r(3),2);
        
    elseif (p < 0.6)
        % Switch X values
        y(r(1),1) = PAPos(r(2),1);
        y(r(2),1) = PAPos(r(1),1);
        
    else
        % Switch Y values
        y(r(3),2) = PAPos(r(4),2);
        y(r(4),2) = PAPos(r(3),2);
    end
    
else %Shift
    y = PAPos;
    shiftSize = 5;
    r = randperm(size -(shiftSize + 1),2);
    p = rand();
    
    if (p < 0.2)
        %troca X
        idcShift = r(1) + shiftSize;
        y(r(1):idcShift-1,1) = y(r(1)+1:idcShift,1);
        y(idcShift,1) = PAPos(r(1),1);
        
        %troca y
        idcShift = r(2) + shiftSize;
        y(r(2):idcShift-1,2) = y(r(2)+1:idcShift,2);
        y(idcShift,2) = PAPos(r(2),2);
        
    elseif (p < 0.6)
        %troca x
        idcShift = r(1) + shiftSize;
        y(r(1):idcShift-1,1) = y(r(1)+1:idcShift,1);
        y(idcShift,1) = PAPos(r(1),1);
        
    else
       
        idcShift = r(1) + shiftSize;
        y(r(1):idcShift-1,2) = y(r(1)+1:idcShift,2);
        y(idcShift,2) = PAPos(r(1),2);
    end
end


