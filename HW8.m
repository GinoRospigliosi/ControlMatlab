Klag=10
zc=0.01
pc=0.05
G=tf(9.5*Klag*[1 zc],[1 11+pc 10+11*pc 10*pc+9.5*Klag 9.5*zc 0])
step(G)

