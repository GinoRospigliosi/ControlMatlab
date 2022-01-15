% Nise, N.S. 
% Control Systems Engineering, 7th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 7.0 
% Copyright � 2015 by John Wiley & Sons, Inc.
%																													
% (ch2p8) Example 2.3: Let us do Example 2.3 in the book using MATLAB.

'(ch2p8) Example 2.3'               % Display label.
numy=32;                            % Define numerator. 
deny=poly([0 -4 -8]);               % Define denominator.
[r,p,k] = residue(numy,deny)        % Calculate residues, poles, and 
                                    % direct quotient.
