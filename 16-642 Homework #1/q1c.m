% %%%%%%%%%%%%%%%%%%
%       %Q1c%
% %%%%%%%%%%%%%%%%%%

% define matrices 
A = [0 1 0; 0 0 1; 1 5 7];
B = [1; 0; 0;];
C = [0 1 3];

% define exponential matrix and initial positon 
A_exp = expm(A);
x0 = [0; 1; 0;];

% define time vector
t = linspace(0, 2, 50);  
y = zeros(size(t));

% evaluate system at each time & input
for ts = 1:length(t);
    y(ts) = C* expm(A*t(ts)) * x0        
end

figure(1)
plot(t, y)
title('Output of Unforced System')
xlabel('Time(seconds)')
ylabel('Amplitude')

grid