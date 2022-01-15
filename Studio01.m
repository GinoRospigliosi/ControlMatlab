
%Studio 01
%Gino Rospigliosi
%ENME462
%Section 0105
%%
%Method 1- Convolution Integral
clear all; clc
t = 0:0.01:10; % Time in Seconds with increments of 0.01
k = 2; % Spring Stiffness (N/m)
m = 1; % Mass [kg]
omega = sqrt(k/m); % radians/sec
x = (1/k) * (1 - cos(omega*t)); %Solution Response 
plot(t,x)
axis([0,10,-0.01,1.2])
xlabel 'Time [s]'
ylabel 'Displacement [m]'
%%
%Method 2- ODE Function
clear all; clc
x_o = [0,0];
t_o = 0;
t_f = 10;
[t,x] = ode45(@S_M_ODE,[t_o,t_f],x_o);
plot(t,x(:,1))
axis([0,10,-0.01,1.2])
xlabel 'Time [s]'
ylabel 'Displacement [m]'
%x1=x(t)
%x2=x prime(t)
function xp = S_M_ODE(t,x)
xp= zeros(2,1);
k = 2; % Spring Stiffness [N/m]
m = 1; % Mass [kg]
F = 1; %Unit Step Load, [N]
xp(1) = x(2); %%Differential Formula '(x1 prime)'
xp(2) = -k/m*x(1)+1/m*F; %Differential Formula '(x2 prime)'
end
%%
%Method 3- Simulink