clear all

% load in params
data = load('kalman_data.mat');
real_state = load("X.mat");
X = real_state.X;
V = data.V;
W = data.W;
Y = data.Y;
model_params = data.model_params;
t = data.t;
u = data.u;

% initialize x1, x2, H and p
xNew = [25;15];
pNew = eye(2) * 10;
H = [1, 0];

xNew_arr = zeros(2, length(t));

for i = 1:length(t)
[xNew, pNew] = prediction(xNew, pNew, model_params, u(:,i), V);   
[xNew, pNew] = update(xNew, pNew, H, W, Y(i));
xNew_arr(:,i) = xNew;
end

err = X - xNew_arr;

figure(1)
plot(t, X)
hold on
plot(t, xNew_arr, '--')
title('Kalman Filter State Estimate vs. Actual State')
xlabel('Time')
ylabel('Population')
legend('Hare_{actual}', 'Lynx_{actual}', 'Hare_{predict}', 'Lynx_{predict}','FontSize',14)

figure(2)
plot(t,err)
title('Kalman Filter State Estimate vs. Actual State Error')
xlabel('Time')
ylabel('Population')
legend('Hare_{error}', 'Lynx_{error}','FontSize',14)