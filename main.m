clc; clear; close all

checkbox_drawer %choix des affichages

N = 500;
choix = menu("Nombre de capteurs Nc", "10", "40", "100");
if choix == 1
    Nc = 10;
elseif choix == 2
    Nc = 40;
else
    Nc = 100;
end
f0 = 1e3; %Hz
fe = 40e3;
c = 1500; %m/s
lambda = c/f0;
dt = 1/fe;
dT = 0.01; %precision theta
t = ((0:N-1)*dt)';
w = 2*pi*f0;
SNR = 5;
choix = menu("Choix de la distance inter-capteurs d", "lambda/2", "lambda/3", "3lambda/2");
if choix == 1
    d = lambda/2; %bien
elseif choix == 2
    d = lambda/3; %mieux
else
    d = 3*lambda/2; %trop grande
end

sourceCount = input("Choix du nombre de sources :");
phis = zeros(sourceCount, 1);
thetas = zeros(sourceCount, 1);
for i = 1:sourceCount
    phis(i) = input("Valeur de phi: ");
    thetas(i) = input("Valeur de theta: ");
end
thetas = deg2rad(thetas);

s = 0;
x = 0;
for i = 1:sourceCount
    s_i = signal(N, w, fe, phis(i), SNR);
    d_i = steering_vector(Nc, w, thetas(i), c, d);
    s = s + s_i;
    x = x + d_i * s_i;
    
end

figure()
hold on
for i = 1:sourceCount
    d_i = steering_vector(Nc, w, thetas(i), c, d);
    plot(real(d_i'*x))
    plot(imag(d_i'*x))
end
grid()
title("Vecteur directionnel")

theta_est = steering_function(thetas, d, Nc, w, dT, N, c, x);