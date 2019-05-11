% Retorna uma solucao inicial no formato [PA, PAC], sendo:
% PA: Posicao [x, y] de cada ponto de acesso
% PAC: Ponto de acesso que atendera cada cliente.

function [PA, PAC] = initialSol(pa_max, c_max, x_max, y_max)    
    pa_en = pa_max;
    PA = rand(pa_en, 2);
    PA(:,1) = PA(:,1)*x_max;
    PA(:,2) = PA(:,2)*y_max;
    
    PAC = [];
%     TODO:
%     1) Avaliar distancia de cada cliente para o ponto de acesso
%     2) Definir PA de acordo com a proximidade
%     3) Limitar banda em 150
%     4) Repetir ate atender o numero minimo de clientes 
    
    

end
