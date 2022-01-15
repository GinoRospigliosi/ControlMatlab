
G =zpk([], [-2 -4 -6 -8], 353.04)
Gc = zpk([-5 -0.0478], [-2 -4 -6 -8 -14.6 -0.001], 1367)
time = 0:0.1:4;
Ts_uncompensated = feedback(G, 1);
Ts_compensated = feedback(Gc,1);
s= pole(Ts_uncompensated)
sc= pole(Ts_compensated)


[Y1, T1] = step(Ts_uncompensated, time);
[Y2, T2] = step(Ts_compensated, time);
figure(3)
plot(T1,Y1,T2,Y2);
legend('Uncomp','Comp')