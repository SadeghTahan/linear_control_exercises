clear; clc; close all;
n0 = 1;
alpha0 = 2;
omega0 = 3;
n = 3*n0;
alpha = 2*alpha0;
omega = 5*omega0;
t = -1:0.001:3;
u = double(t>=0);
x = cell(1,10);
x{2} = u;
x{3} = t.*u;
x{4} = t.^n.*u;
x{5} = exp(-alpha*t).*u;
x{6} = t.^n.*exp(-alpha*t).*u;
x{7} = sin(omega*t).*u;
x{8} = cos(omega*t).*u;
x{9} = exp(-alpha*t).*cos(omega*t).*u;
x{10}= exp(-alpha*t).*sin(omega*t).*u;
names = {'\delta(t)','u(t)','t\cdotu(t)', ...
    sprintf('t^{%d}\\cdotu(t)', n),'e^{-\alpha t}u(t)', ...
    sprintf('t^{%d}e^{-\\alpha t}u(t)', n), ...
    'sin(\omega_0 t)u(t)','cos(\omega_0 t)u(t)', ...
    'e^{-\alpha t}cos(\omega_0 t)u(t)', ...
    'e^{-\alpha t}sin(\omega_0 t)u(t)'};
figure('Name','laplace table signal','Position',[100 50 900 850]);
subplot(5,2,1);
stem(0,1,'filled','LineWidth', 2);
title(names{1});
xlim([-1 5]); xlabel('t'); grid on;
for k = 2:10
    subplot(5,2,k);
    plot(t,x{k},'linewidth', 1.5);
    title(names{k}); xlabel('t'); grid on;
end
