
sys_hot_tail = tf([1167.5],[1 26.9 1167.5])
sys_control = tf([1107.7],[1 21.97 1107.7])
step(sys_hot_tail,sys_control)
legend({'Hot-Tail','Control'})
hot_tail = stepinfo(sys_hot_tail)
control = stepinfo(sys_control)