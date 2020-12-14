clear all
clc
% define matrices, Q & R
A = [0 0 1 0; 0 0 0 1; 0 1 -3 0; 0 2 -3 0];
B = [0;0;1;1;];
Q = [5 0 0 0; 0 50 0 0; 0 0 5 0; 0 0 0 50;];
%Q = [10 0 0 0; 0 50 0 0; 0 0 10 0; 0 0 0 50;];

% inches to meters
C = [39.37, 0, 0, 0];
% R toggled here
R = 0.1;
% calculate K using LQR
K = lqr(A,B,Q,R);
% K = Kc for controller
poles = eig(A-B*K);
% push poles left to speed up the observer 
poles_pushedleft = poles * 5;
K0 = place(A',C',poles_pushedleft)';

tf = 200;
% IF BLOWING UP  FIX THIS
dt = .0001;
tspan = 0:dt:tf;

x(:,1) = [0; 0; 0; 0];
xhat(:,1) = [1 ; 0; 0; 0]; 
t(1) = 0;

% define contants
muu = 3;
D = 1;
gam = 2;
alph = 1;
bet = 1;

% define amplitude and frequency to produce a square wave
amp = 40;
freq = 0.01;

for k = 1:(ceil(tf/dt))
  yd = genSquareWave(amp, freq, tspan(k));
  v = -(inv(C*inv(A-(B*K)) * B)) * yd;
  curr_x = x(:,k);
  k1 = dt*squareWaveTracker(muu, D, gam, alph, bet, curr_x      , K, v, xhat(:,k));
  k2 = dt*squareWaveTracker(muu, D, gam, alph, bet, curr_x+k1/2 , K, v, xhat(:,k));
  k3 = dt*squareWaveTracker(muu, D, gam, alph, bet, curr_x+k2/2 , K, v, xhat(:,k));
  k4 = dt*squareWaveTracker(muu, D, gam, alph, bet, curr_x+k3   , K, v, xhat(:,k));
  x(:,k+1) = curr_x + k1/6 + k2/3 + k3/3 + k4/6;
  t(k+1) = t(k) + dt;
  
  u = -K*xhat(:,k) + v;
  % changed to k+1
  y = C * x(:,k+1);
  
  curr_xhat = xhat(:,k);
  k1 = dt*obsvODE(A, curr_xhat,        B, u, K0, y, C);
  k2 = dt*obsvODE(A, curr_xhat + k1/2, B, u, K0, y, C);
  k3 = dt*obsvODE(A, curr_xhat + k2/2, B, u, K0, y, C);
  k4 = dt*obsvODE(A, curr_xhat + k3,   B, u, K0, y, C);
  xhat(:,k+1) = curr_xhat + k1/6 + k2/3 + k3/3 + k4/6; 
end

hold on

%plot observer 
y_arr_xhat = C' .* xhat;
plot(t,y_arr_xhat(1,:));

% plot actual
y_arr_x = C' .* x;
plot(t, y_arr_x(1,:));
%plot(t, y_arr_x);
% 
xlabel('time(seconds)');
ylabel('y(t)');
legend('x hat solution', 'x exact solution')
title('Observer vs actual')

% figure(4);
% plot (t, x);
% legend({'pos','angle','dPos','dAngle'});


function xhat = obsvODE(A, xhat, B, u, K0, y, C)
xhat = (A*xhat) + (B*u)+ K0*(y-(C*xhat));
end

% helper functions
function sq = genSquareWave(amp, freq, t)
sq=amp*0.5*(square(2*pi*freq*t)+1) - amp/2;
end

function dxdt = squareWaveTracker(mu_, D_, gamma_, alpha_, beta_, x, K, v, xhat)
dxdt = zeros(4,1);

u = v - (K*xhat);
xc = x(1);
phi = x(2);
xcdot = x(3);
phidot = x(4);

xdd = [u - (beta_*(phidot^2) * sin(phi)) - (mu_*xcdot); D_ * sin(phi)];
pdd = [gamma_ -(beta_*cos(phi)); -(beta_*cos(phi)), alpha_];
q = inv(pdd) * xdd;

dxdt(1) = xcdot;
dxdt(2) = phidot;
dxdt(3) = q(1,:);
dxdt(4) = q(2,:);
%disp(t);

end
