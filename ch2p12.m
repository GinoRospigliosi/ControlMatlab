% Nise, N.S. 
% Control Systems Engineering, 7th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 7.0 
% Copyright © 2015 by John Wiley & Sons, Inc.

% (ch2p12:Functions of time, can be easily plotted 
% using MATLAB’s plot(X,Y,S), where X is the 
% independent variable, Y is the dependent variable, 
% and S is a character string describing the plot’s 
% color, marker, and line characteristic. Type HELP PLOT 
% in the Command Window  to see a list of choices for S. 
% Multiple plots also can be obtained using 
% plot(X1,Y1,S1,X2,Y2,S2,X3,Y3,S3,. . .).
% In the following example we plot on the same graph 
% sin(5t) in red and cos(5t) in green for 
% t = 0 to 10 seconds in 0.01 second increments. 
% Time is specified as follows:t = start:increment:final.

'(ch2p12)'				% Display label.
t=0:0.01:10;			% Specify time range and increment.
f1=cos(5*t);			% Specify f1 to be cos(5t).
f2=sin(5*t);			% Specify f2 to be sin(5t)
plot(t,f1,'r',t,f2,'g')	% Plot f1 in red and f2 in green.
pause
