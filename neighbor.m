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

y = PAPos;
size = length(PAPos);

i = rand();
i = 0.5/6;
% PANum =  unique(PACli);
% CliAtendPorPA = [PANum, histc(PACli(:),PANum)];
% CliAtendPorPAOrder = sortrows(CliAtendPorPA,2);
% PioresPAs = CliAtendPorPAOrder(1:3,1); % PAs que atendem menos clientes  
if i <= 1/6
    y = uniforme_mutation(PAPos,ub, lb,sigma,n);
    
elseif i <= 2/6
    y = PAPos;
    r = randperm(size);
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
    
elseif i<= 3/6 %Shift
    y = PAPos;
    r = randperm(size-1,2);
    p = rand();
    shiftSize = 5;
    
    if (p < 0.2)
        if((r(1) + shiftSize) > size)
            idcShift = size;
        else
            idcShift = r(1) + shiftSize;
        end
        
        y(r(1):idcShift-1,1) = y(r(1)+1:idcShift,1);
        y(idcShift,1) = PAPos(r(1),1);
        
        if((r(2) + shiftSize) > size)
            idcShift = size;
        else
            idcShift = r(2) + shiftSize;
        end
        
        y(r(2):idcShift-1,2) = y(r(2)+1:idcShift,2);
        y(idcShift,2) = PAPos(r(2),2);
        
    elseif (p < 0.6)
        
        
        if((r(1) + shiftSize) > size)
            idcShift = size;
        else
            idcShift = r(1) + shiftSize;
        end
        
        y(r(1):idcShift-1,1) = y(r(1)+1:idcShift,1);
        y(idcShift,1) = PAPos(r(1),1);
        
    else
        if((r(1) + shiftSize) > size)
            idcShift = size;
        else
            idcShift = r(1) + shiftSize;
        end
        
        y(r(1):idcShift-1,2) = y(r(1)+1:idcShift,2);
        y(idcShift,2) = PAPos(r(1),2);
    end
elseif i <= 4/6
    
elseif i <= 5/6
    
else 

end


