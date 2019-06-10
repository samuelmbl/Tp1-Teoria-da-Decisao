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


function y = neighbor(PAPos,ub,lb,sigma)
%(x,ub,lb,sigma,xlimites)
%PAPos => [X1 Y1; X2 Y2; ...] Posição de cada PA
%ub =>
%lb =>
%sigma =>

    size = length(PAPos);
    if size < 30
       
    end 
    i = rand();
    % PANum =  unique(PACli);
    % CliAtendPorPA = [PANum, histc(PACli(:),PANum)];
    % CliAtendPorPAOrder = sortrows(CliAtendPorPA,2);
    % PioresPAs = CliAtendPorPAOrder(1:3,1); % PAs que atendem menos clientes
    if i <= 0.4
        y = uniforme_mutation(PAPos,ub, lb,sigma);

    elseif i <= 0.6
        y = PAPos;
        r = randperm(size); %randperm(size,4);
        r = r(1:4);
        p = rand();

        if(p<0.2)
            % Switch X values
            y(r(1),1) = PAPos(r(2),1);
            y(r(2),1) = PAPos(r(1),1);

            % Switch Y values
            y(r(1),2) = PAPos(r(3),2);
            y(r(3),2) = PAPos(r(1),2);

        elseif (p < 0.6)
            % Switch X values
            y(r(1),1) = PAPos(r(2),1);
            y(r(2),1) = PAPos(r(1),1);

        else
            % Switch Y values
            y(r(3),2) = PAPos(r(4),2);
            y(r(4),2) = PAPos(r(3),2);
        end

    elseif i <= 0.9 %Shift
        y = PAPos;
        shiftSize = 10;
        r = randperm(size -(shiftSize + 1));%randperm(size -(shiftSize + 1),2);
        r = r(1:2);
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
    else    % Adicionar/Remover Ponto de Acesso
        y = PAPos;
        p = rand();
        if(p < 0.6) %Probabilidade de remover um ponto
            point_removed = randperm(size); %randperm(size, 1);
            point_removed = point_removed(1);
            y(point_removed:size-1,:) = PAPos((point_removed+1):size,:);
            y = y(1:size-1, :);
        elseif(size <100) %Probabilidade de adicionar um ponto
            y(end,:) = [(ub(1)-lb(1))*rand(), (ub(2)-lb(2))*rand()];
        end;
        
    end
end


