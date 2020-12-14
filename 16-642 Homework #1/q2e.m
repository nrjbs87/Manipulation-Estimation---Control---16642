% define matrices, Q & R
A = [0 0 1 0; 0 0 0 1; 0 1 -3 0; 0 2 -3 0];
B = [0;0;1;1;];
Q = [1 0 0 0; 0 5 0 0; 0 0 1 0; 0 0 0 5;];
R = 10;

% calculate K using LQR
K = lqr(A,B,Q,R);

% define initial positons
x0_1  = [0; 0.1; 0; 0;];
% x0_2  = [0; 0.5; 0; 0;];
% x0_3  = [0; 1.0886; 0; 0;];
% x0_4  = [0; 1.1; 0; 0;];

% define contants
gamma_ = 2;
alpha_ = 1;
beta_ = 1;
D_ = 1;
mu_ = 3;
F_ = 0;

% define time vector
tspan = 0:0.01:30;

% plot system response using nonlinear state equations
% replace initial condition as final input to ODE45 depending on which
% graph is desired
figure(1)
[t,y] = ode45(@(t,x)nonLinearSystem(F_, mu_, D_, gamma_, alpha_, beta_, x, t, K), tspan, x0_1);
plot(t,y)
legend('xc','phi','xc-dot','phi-dot')
xlabel('Time(seconds)')
ylabel('State Value')
grid

% helper functions
function dxdt = nonLinearSystem(F, muu, D, gam, alph, bet, x, t, K)
syms F_ phidot_ mu_ xcdot_ D_ gamma_ alpha_ phi_ beta_
dxdt = zeros(4,1);

xdd = [F_ - (beta_*(phidot_^2) * sin(phi_)) - (mu_*xcdot_); D_ * sin(phi_)];
pdd = [gamma_ -(beta_*cos(phi_)); -(beta_*cos(phi_)) alpha_];
q = inv(pdd) * xdd;

xc = x(1);
phi = x(2);
xcdot = x(3);
phidot = x(4);

F_new = -K * x;
vq = subs(q, {F_, beta_, phi_, phidot_, mu_, xcdot_, D_, alpha_, gamma_}, {F_new, bet, phi, phidot, muu, xcdot, D, alph, gam});
final = vpa(vq);

dxdt(1) = xcdot;
dxdt(2) = phidot;
dxdt(3) = final(1);
dxdt(4) = final(2);
disp(t);

end




