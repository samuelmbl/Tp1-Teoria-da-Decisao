clc;
close all;
clear all;

clients = load('../clientes.csv');
PA = [];
PAC = [];
p = [];
c = [];
b = [];
d = [];

PA_max = 100;
c_max = 500;
c_min = 0.95*c_max;
b_max = 150;
d_max = 85;
x_max = 800;
y_max = 800;
p_max = 100;

[PA, PAC] = initialSol(p_max, c_max, x_max, y_max);

plot(clients(:,1), clients(:,2), 'b.', PA(:,1), PA(:,2), '.r');