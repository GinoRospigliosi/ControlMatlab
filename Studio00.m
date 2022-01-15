%Studio 00
%Gino Rospigliosi
%ENME462
%Section 0105
%%
% Problem 1.
% Use MATLAB to represent and generate the transfer function

% Using Control System Toolbox
'Rational Expression Method, Polynomial Form' %Display Label
s = tf('s'); % Define 's' as an LTI object in polynomial form
G = 5*(s+15)*(s+26)*(s+72)/(s*(s+55)*(s^2+5*s+30)*(s+56)*(s^2+27*s+52))

%%
% Problem 2.
% Use MATLAB to generate partial fraction expansion of the following function

% Using Control System Toolbox
'Rational Expression Method, Polynomial Form' %Display Label
s = tf('s'); % Define 's' as an LTI object in polynomial form
F = ((10^4)*(s+5)*(s+70))/(s*(s+45)*(s+55)*(s^2+7*s+110)*(s^2+6*s+95))

% Numerator and Denominator from F(s)
numf = (10^4)*poly([-5 -70]);
demf = conv(poly([0 -45 -55]),conv([1 7 110],[1 6 95]));
% K = residue; p = roots of denominator; k = direct quotient
% Use resisdue function for expansion
[K,p,k]=residue(numf,demf)

%In Partial Expansion Form
%F = -(0.0018)/(s+55) + (0.0066)/(s+45) + (0.9513+0.0896i)/(s+3.5-9.8869i) + (0.9513-0.0896i)/(s+3.5+9.8869i) + (-1.0213 - 0.1349i)/(s+3-9.2736i) + (-1.0213 + 0.1349i)/(s+3+9.2736i) + (0.1353)/(s)
disp("F = -(0.0018)/(s+55) + (0.0066)/(s+45) + (0.9513+0.0896i)/(s+3.5-9.8869i) + (0.9513-0.0896i)/(s+3.5+9.8869i)")
%%
% Problem 3.
% Use MATLAB and the SYMBOLIC MATH TOOLBOX to find the Laplace Transform of the following functions
% (1) f(t)=8t^2cos (3t+45°)
% (2) f(t)=3te^-2tsin (4t+60°)
%%
%(1)
syms t % Construct symbolic object for frequency variable "t'
f = 8*t^2*cosd(3*t+45)
F = laplace(f) % Find Laplace transform
%pretty(F) %Pretty Print Laplace 
%%
%(2)
syms t % Construct symbolic object for frequency variable 't'
f = 3*t*exp(-2*t)*cosd(3*t+45)
F = laplace(f) % Find Laplace transform
%pretty(F) %Pretty Print Laplace 
%%
% Problem 4.
% Using MATLAB find and plot the angular velocity response to a unit step input

syms s % Construct symbolic object for frequency variable 's'
f = (20.83)/((s+100)*(s+1.71))
F = ilaplace(f) % Find Laplace transform
%With step input
w = (20.83)/(s*(s+100)*(s+1.71))
W = ilaplace(w) % Find Laplace transform

%Using Sys Transfer Function And Step Input
sys = tf([20.83],poly([-100 -1.71]))
step(sys,6);
%Using Solution From Inverse Laplace Transform
figure(2);
x = [0:0.01:5];
check = (2083*exp(-100*x))/982900 - (208300*exp(-(171*x)/100))/1680759 + 2083/17100;
plot(x,check)


