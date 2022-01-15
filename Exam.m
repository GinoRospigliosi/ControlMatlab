% 
% num = 1;
% den = conv(conv([1 0],[1 1]), [1 10 26]);
 Gs = tf([1],[1 6 10]);
 K= 0:0.01:100;
 figure(1);
 rlocus(Gs, K)
 sgrid
 [Gain, Poles] = rlocfind(Gs, -4+4*i)

% Gc = tf([1 2],[1,15]);
% Kc=1:1:1e5;
% figure(2)
% rlocus(Gc*Gs,Kc)
% sgrid
% 
% 
% 
% K1 = 14.4
% K2 = 207.62
% time = 0:0.1:20;
% Ts_uncompensated = feedback(K1*Gs, 1);
% Ts_compensated = feedback(K2*Gc*Gs,1);
% [Y1, T1] = step(Ts_uncompensated, time);
% [Y2, T2] = step(Ts_compensated, time);
% figure(3)
% plot(T1,Y1,T2,Y2);
% legend('Uncomp','Comp')



%Bode
% figure(4)
% S3= zpk([-2],[-1,-4],20);
% bode(S3);

% 
% 
% Nyquist
% figure(5)
% S3= zpk([-3],[-1,-4],20);
% nyquist(S3);

 Gc = tf([1],[1,6 10]);
 rlocus(Gc)
 sgrid

