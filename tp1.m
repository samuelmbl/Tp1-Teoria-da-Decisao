clc;
close all;
clear all;

clients = load('clientes.csv');

plot(clients(:,1), clients(:,2), 'b.');


%% c)

p = [];
PA = [];
PAC = [];
c = [];
b = [];
d = [];

b_max = 150;
d_max = 85;
c_min = 475;
c_total = 500;
p_max = 100;
x_max = 800;
y_max = 800;

