clc;
close all;
clear all;

clients = load('clientes.csv');
PA = [];
PAC = [];
dist = [];

PA_max = 100;
c_max = 500;
c_min = 0.95*c_max;
b_max = 150;
d_max = 85;
x_max = 800;
y_max = 800;
sigma = 0.25;
WDistance = 0.6;

Type = 'PW';

[PA, PAC, dist] = initialSol(clients, PA_max, x_max, y_max);
figure(1)
plot(PA(:,1), PA(:,2), 'b.');

[t0, PA, count] = initialT(PA, clients, PAC, dist, sigma, Type, WDistance);

figure(2)
plot(clients(:,1), clients(:,2), 'b.', PA(:,1), PA(:,2), '.r');
title('Solution after InitialTDist');

figure
plot(PAC, '.')
if (strcmp(Type, 'PW'))
    repeat = 10;
else 
    repeat = 1;
end
fsobj = [];
PABestMatrix = -ones(100,2,repeat);
i = 0;

while(i < repeat)
    [PAbest PACbest, distBest, fobjbest, count, logfobj, logfobjbest] = SA(clients, Type, sigma,WDistance);
    i = i + 1;
    if (strcmp(Type, 'PW')) %obtem os valores para fazer a fronteira pareto
        fsobj(i,1) = fobjAPTotal(PACbest);
        fsobj(i,2) = fobjDist(distBest);
        PABestMatrix(1:length(PAbest),:,i) = PAbest;
    end;
end 

plot(clients(:,1), clients(:,2), 'b.', PAbest(:,1), PAbest(:,2), '.r');
title('Solution after optimization');

figure(1)
hold on
plot(PAbest(:,1), PAbest(:,2), 'r.');
legend('Inital sol', 'Final sol');

figure
plot(logfobj);

figure
plot(logfobjbest);

Clientes_nao_atendidos = length(PAC(PAC==0))