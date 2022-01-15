% Nise, N.S. 
% Control Systems Engineering, 7th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 7.0 
% Copyright � 2015 by John Wiley & Sons, Inc.
%																													
% (ch2p6): Polynomials can be multiplied together using the conv(a,b) command 
% (standing for convolve). Thus, P5=(s^3+7s^2+10s+9)(s^4-3s^3+6s^2+2s+1)  
% is generated as follows:

'(ch2p6)'                           % Display label.
P5=conv([1 7 10 9],[1 -3 6 2 1])    % Form (s^3+7s^2+10s+9)(s^4-
                                    % 3s^3+6s^2+2s+1), assign to 
                                    % P5, and display.
	
