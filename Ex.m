figure(1);
G = tf([1],[1 4 2 8 5 4])
rlocus(G)
figure(2);
Gs = tf([1],[1 2 3 6 5 3])
rlocus(Gs)

roots([1 4 2 8 5 3])