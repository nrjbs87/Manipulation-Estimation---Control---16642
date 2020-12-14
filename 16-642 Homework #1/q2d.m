% define matrices, Q & R
A = [0 0 1 0; 0 0 0 1; 0 1 -3 0; 0 2 -3 0];
B = [0;0;1;1;];
Q = [1 0 0 0; 0 5 0 0; 0 0 1 0; 0 0 0 5;];
R = 10;

% calculate K using LQR
K = lqr(A,B,Q,R);

% define time vector
tspan = 0:0.1:30;

% define initial positons
x0_1  = [0; 0.1; 0; 0;];
x0_2  = [0; 0.5; 0; 0;];
x0_3  = [0; 1.0886; 0; 0;];
x0_4  = [0; 1.1; 0; 0;];

% plot system response for each initial positon using optimal feedback
% control 
hold on
figure(1)
[t,y] = ode45(@(t,x)(A-B*K)*x , tspan, x0_1);
plot(t,y)
legend('xc','phi','xc-dot','phi-dot')
xlabel('Time(seconds)')
ylabel('State Value')
grid

figure(2)
[t,y] = ode45(@(t,x)(A-B*K)*x , tspan, x0_2);
plot(t,y)
legend('xc','phi','xc-dot','phi-dot')
xlabel('Time(seconds)')
ylabel('State Value')
grid

figure(3)
[t,y] = ode45(@(t,x)(A-B*K)*x , tspan, x0_3);
plot(t,y)
legend('xc','phi','xc-dot','phi-dot')
xlabel('Time(seconds)')
ylabel('State Value')
grid
 
figure(4)
[t,y] = ode45(@(t,x)(A-B*K)*x , tspan, x0_4);
plot(t,y)
legend('xc','phi','xc-dot','phi-dot')
xlabel('Time(seconds)')
ylabel('State Value')
grid
hold off
