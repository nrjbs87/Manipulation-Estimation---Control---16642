clear
sys = tf(200, [1, 22, 141, 202]);
P = pole(sys);
zplane(P);
step(sys);
