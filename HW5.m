K=[40:0.1:400];
e=(14580+2312.*K)./(14580+4624.*K);
Z=(16.7)./(2.*sqrt((72.9+19652.*K)));
OS=100.*exp((-pi.*Z)./((1-Z.^2).^(1/2)));
figure(1)
plot(K,e)
title('Steady-State Error vs K')
xlabel('K') 
ylabel('Steady-State Error')
figure(2)
plot(K,OS)
title('Percent Overshoot vs K')
xlabel('K') 
ylabel('Percent Overshoot') 


