syms t
f = 1-exp(-t)*(cosd(sqrt(8)*t-19.47))
F = laplace(f)