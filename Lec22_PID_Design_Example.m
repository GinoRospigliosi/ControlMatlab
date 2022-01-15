%% Example 9.5: PID Design
% Script for designing a PID using Matlab for Example 9.5 in Control
% Systems Engineering, seventh edition by Norman S. Nise (Wiley)
% 
% Author: Yancy Diaz-Mercado
% Date:   04/19/2021
% 
% All rights reserved
%% Define the plant
% Use zpk() command to get the transfer function from the zero/pole
% locations
OL_poles = [-3, -6,- 10];
OL_zeros = -8;
OL_amplitude = 1;
G = zpk(OL_zeros,OL_poles,OL_amplitude);
%% Plot the root locus
figure
rlocus(G)
%% Get damping ratio
POS = 20; % Desired Percent Overshoot (POS) expressed in percentage
dampingRatio = -(log(POS/100)/sqrt(pi^2+log(POS/100)^2)); % From second order system equation
% Compute peak time and natural frequency from closed-loop poles found in class
Uncompensated_DominantPoles_FromClass = -5.415+10.57j;
Compensated_DominantPoles_FromClass = -8.13+15.87j;
Uncomp_DampedFreqOsc = abs(imag(Uncompensated_DominantPoles_FromClass));
Comp_DampedFreqOsc = abs(imag(Compensated_DominantPoles_FromClass));
%
Uncompensated_PeakTime = pi/Uncomp_DampedFreqOsc;% approximately 0.297 sec
Compensated_PeakTime = pi/Comp_DampedFreqOsc;% approximately 0.198 sec
%
Uncompensated_NatFreq = Uncomp_DampedFreqOsc/sqrt(1-dampingRatio^2);
Compensated_NatFreq = Comp_DampedFreqOsc/sqrt(1-dampingRatio^2);
% Plot the constant damping ratio line. Also plot the uncompensated and
% compensated natural frequency lines to verify hand calculations done in
% class
sgrid(dampingRatio,[Uncompensated_NatFreq,Compensated_NatFreq]);
title('Root Locus for Uncompensated System')
%% Find the control control gain and closed-loop pole locations
% Click on the plot to find the gain and desired dominant poles
disp('Click on the plot to find the desired dominant poles and corresponding gain')
[Uncomp_Gain_Click, Uncomp_CLP_Click] = rlocfind(G);
% Selection might be slightly off because uncertainty in clicking. This
% will only affect design slightlyt. However, we could also provide desired
% closed-loop poles and it will find the closest match on the root locus
[Uncomp_Gain, Uncomp_CLP] = rlocfind(G,Uncompensated_DominantPoles_FromClass);
%% Provide a PD design
% Compute the phase mismatch
phase_PD = 180 - (...
    +sum(atan2d(imag(Compensated_DominantPoles_FromClass)-imag(OL_zeros),real(Compensated_DominantPoles_FromClass)-real(OL_zeros)))...
    -sum(atan2d(imag(Compensated_DominantPoles_FromClass)-imag(OL_poles),real(Compensated_DominantPoles_FromClass)-real(OL_poles))));
% Use geometry of pole location to compute zero location to 
PD_zero_location = imag(Compensated_DominantPoles_FromClass)*cotd(phase_PD) - real(Compensated_DominantPoles_FromClass);
% Plot new root locus and find gain to the desired dominant poles
G_PD = zpk(-PD_zero_location,[],1);
PD_CompensatedSystem = G_PD*G;
figure
rlocus(PD_CompensatedSystem) % Plot root locus
sgrid(dampingRatio,[Uncompensated_NatFreq,Compensated_NatFreq]); % add constant damping and natural frequency lines
[Comp_Gain_PD, Comp_CLP] = rlocfind(PD_CompensatedSystem,Compensated_DominantPoles_FromClass); % Find gain and CLP near desired dominant poles
title('Root Locus for PD Compensated System')
%% Provide a PI Design
PI_zero_location = 0.5;
PI_pole_location = 0;
G_PI = zpk(-PI_zero_location,-PI_pole_location,1);
PID_CompensatedSystem = G_PI*PD_CompensatedSystem;
% Plot new root locus and find gain to the desired dominant poles
figure
rlocus(PID_CompensatedSystem) % Plot root locus
sgrid(dampingRatio,[Uncompensated_NatFreq,Compensated_NatFreq]); % add constant damping and natural frequency lines
[Comp_Gain_PID, Comp_CLP_PID] = rlocfind(PID_CompensatedSystem,Compensated_DominantPoles_FromClass); % Find gain and CLP near desired dominant poles
title('Root Locus for PID Compensated System')
%% Plot the step response and step info for the unity-feedback closed-loop system
feedbackTransferFunction = 1; % Unity in both cases
ClosedLoopTransferFunction_Uncomp = feedback(Uncomp_Gain*G,feedbackTransferFunction);
ForwardPathTransferFunction_PD = Comp_Gain_PD*PD_CompensatedSystem;
ClosedLoopTransferFunction_PD = feedback(ForwardPathTransferFunction_PD,feedbackTransferFunction);
ForwardPathTransferFunction_PID = Comp_Gain_PID*PID_CompensatedSystem;
ClosedLoopTransferFunction_PID = feedback(ForwardPathTransferFunction_PID,feedbackTransferFunction);
hStep = figure;
step(ClosedLoopTransferFunction_Uncomp)
hold on
step(ClosedLoopTransferFunction_PD)
step(ClosedLoopTransferFunction_PID)
legend('Uncompensated','PD Compensated','PID Compensated','location','southeast');
% Display step information in table
S = stepinfo(ClosedLoopTransferFunction_Uncomp);
S(2) = stepinfo(ClosedLoopTransferFunction_PD);
S(3) = stepinfo(ClosedLoopTransferFunction_PID);
T = struct2table(S,'RowNames',{'Uncompensated','PD Compensated','PID Compensated'})