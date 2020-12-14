clear all;
clc;

% define transfer function 
sys = tf([1, 10], [1, 71, 1070, 1000, 0]);

% % tune parameters for PID
Kp = 560;
Ki = 1;
Kd = 329;

% create controller 
C = pid(Kp, Ki, Kd);

% create contol system
sys_cl = feedback(C * sys, 1);
sys_cl;

% step through to see response
[y, t] = step(sys_cl);
%step(sys_cl);

figure
plot(t, y);
xline(0.0, '--g');
xline(0.5, '--g');
yline(1.05, '--r');
yline(0.9, '--');
xlabel('time(seconds)');
ylabel('y(t)');
title('PID response of closed loop system');

grid


