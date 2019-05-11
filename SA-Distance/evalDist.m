function [dist] = evalDist(ponto, v_pontos)
    dist = sqrt((ponto(1)-v_pontos(:,1)).^2 + (ponto(2)-v_pontos(:,2)).^2);
%     TODO: adicionar penalidade
end