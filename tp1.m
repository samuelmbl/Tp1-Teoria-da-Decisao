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

[PA, PAC, dist] = initialSol(clients, PA_max, x_max, y_max);
figure(1)
plot(PA(:,1), PA(:,2), 'b.');

[t0, PA, count] = initialT(PA, clients, PAC, dist, sigma, 'Distance');

figure(1)
hold on
plot(PA(:,1), PA(:,2), 'r.');
legend('Inital sol', 'initialT sol');

figure(2)
plot(clients(:,1), clients(:,2), 'b.', PA(:,1), PA(:,2), '.r');
title('Solution after InitialTDist');

figure
plot(PAC, '.')

[PAbest, PACbest, distbest, fobjbest, count, logfobj, logfobjbest] = SA(clients, 'Distance');
plot(clients(:,1), clients(:,2), 'b.', PAbest(:,1), PAbest(:,2), '.r');
title('Solution after optimization');

Clientes_nao_atendidos = length(PAC(PAC==0))