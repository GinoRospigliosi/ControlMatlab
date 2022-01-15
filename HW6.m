%Problem 1a
sys_a= tf(feedback(zpk([],[0 -5],2),1))
s_a= pole(sys_a)
disp("Stable since poles only in the LHP")
%Problem 1b
sys_b= tf(feedback(zpk([-1],[0 -2 -2],4),1))
s_b= pole(sys_b)
disp("Stable since poles only in the LHP")
%Problem 1c
sys_c= tf(feedback(zpk([0 2/7],[2 5 -2],7),1))
s_c= pole(sys_c)
disp("Unstable since poles in the RHP")
%Problem 1d
G = tf([7],[1 1 2 5 3]);
fb = tf([1 1], 1);
sys_d= tf(feedback(G, fb))
s_d= pole(sys_d)
disp("Unstable since poles in the RHP")

