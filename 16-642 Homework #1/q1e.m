% %%%%%%%%%%%%%%%%%%
%       %Q1e%
% %%%%%%%%%%%%%%%%%%

% define matrices 
A = [0 1 0; 0 0 1; 1 5 7];
B = [1; 0; 0;];
C = [0 1 3];

% define exponential matrix and initial positon 
A_exp = expm(A);
x0 = [0; 1; 0;];

% define time vector
t = linspace(0, 10, 1000);   
y = zeros(size(t));

p = [-1 + 1i; -1-1i; -2;];
K = place(A,B,p);

%evaluate system at each time & input, using the feedback law u=-Kx


for ts = 1:length(t);
    y(ts) = C* expm((A-(B*K))*t(ts)) * x0;        
end

figure(1)
plot(t, y)
title('Output of System Under Feedback Law')
xlabel('Time(seconds)')
ylabel('Amplitude')
grid
