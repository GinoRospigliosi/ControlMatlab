%%
%(a)
G = tf([1],poly([0 -3 -4 -8]));
%Gain vector
K =[0:0.01:100];
figure(1)
rlocus(G,K)
%%
%(b)
G = tf([1],poly([0 -3 -4 -8]));
%Gain vector
K =[0:0.01:100];
figure(2)
rlocus(G,K)
axis([-2 0 -2 2])
%(c)
%OS=.1
figure(3)
rlocus(G,K)
z = -log(.1)/sqrt(pi^2+log(0.1)^2) ;
sgrid(z,0)
title ('Root Locus with Percent Overshoot')
figure(4)
rlocus(G,K)
z = -log(.1)/sqrt(pi^2+log(0.1)^2) ;
sgrid(z,0)
title ('Root Locus with Percent Overshoot')
%(d)
[K,p]= rlocfind(G)
%(e)
figure(5)
T = feedback (K*G,1);
step(T);