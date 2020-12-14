% define matrices, Q & R
A = [0 0 1 0; 0 0 0 1; 0 1 -3 0; 0 2 -3 0];
B = [0;0;1;1;];
Q = [1 0 0 0; 0 5 0 0; 0 0 1 0; 0 0 0 5;];
% inches to meters
C = [39.37, 0, 0, 0];
R = 10;

% calculate K using LQR
K = lqr(A,B,Q,R);

% define initial positon
x0 = [0; 0; 0; 0;];

% define time vector
tspan = 0:0.01:200;

% define amplitude and frequency to produce a square wave matching the one
% displayed in the HW diagram
amp = 40;
freq = 0.01;
sq = genSquareWave(amp, freq, tspan);

% define contants
gamma_ = 2;
alpha_ = 1;
beta_ = 1;
D_ = 1;
mu_ = 3;
F_ = 0;

% plot system response using yd as input to the nonlinear system as well as
% desired output
% yd is calculate by passing t into genSquareWave
figure(1)
[t,y] = ode45(@(t,x)squareWaveTracker(F_, mu_, D_, gamma_, alpha_, beta_, x, t, K, genSquareWave(amp, freq, t), A, B, C), tspan, x0);
newy = y.*C;
hold on
plot(t,newy,'r')
plot(t,sq,'b')
legend('xc')
title('Output of System')
xlabel('Time(seconds)')
ylabel('Predicted Amplitude')
grid
hold off

% helper functions
function sq = genSquareWave(amp, freq, t)
sq=amp*0.5*(square(2*pi*freq*t)+1) - amp/2;
end

function dxdt = squareWaveTracker(F, muu, D, gam, alph, bet, x, t, K, yd, A, B, C)
syms F_ phidot_ mu_ xcdot_ D_ gamma_ alpha_ phi_ beta_
dxdt = zeros(4,1);

xdd = [F_ - (beta_*(phidot_^2) * sin(phi_)) - (mu_*xcdot_); D_ * sin(phi_)];
pdd = [gamma_ -(beta_*cos(phi_)); -(beta_*cos(phi_)) alpha_];
q = inv(pdd) * xdd;

xc = x(1);
phi = x(2);
xcdot = x(3);
phidot = x(4);

v = -(inv(C*inv(A-(B*K)) * B)) * yd;
F_new = v - (K*x);

vq = subs(q, {F_, beta_, phi_, phidot_, mu_, xcdot_, D_, alpha_, gamma_}, {F_new, bet, phi, phidot, muu, xcdot, D, alph, gam});
final = vpa(vq);

dxdt(1) = xcdot;
dxdt(2) = phidot;
dxdt(3) = final(1);
dxdt(4) = final(2);
disp(t);

end
