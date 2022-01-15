%(9)
s1=[-1.5 -1.5];
s2=[1.572 -1.572];
clf;
figure(1);
scatter(s1,s2, 100, 'r','x')
xlim([-2 2]);
ylim([-2 2]);
title("Imaginary vs Real")
ylabel("Imaginary (s)")
xlabel("Real (s)")
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
grid on
