A = [0 1 0; 0 0 1; 1 5 7];
B = [1; 0; 0;];
C = [0 1 3];
% 
% %%%%%%%%%%%%%%%%%%
%       %Q1a%
% %%%%%%%%%%%%%%%%%%
% e_values = eig(A);
% e_values

% %%%%%%%%%%%%%%%%%%
%       %Q1b%
% %%%%%%%%%%%%%%%%%%
% Q = [B,A*B,(A^2 * B)];
% rank(Q)
% 
% %%%%%%%%%%%%%%%%%%
%       %Q1c%
% %%%%%%%%%%%%%%%%%%
% A_exp = expm(A);
% x0 = [0; 1; 0;];
% 
% t = linspace(0, 2, 50);   % Time Vector
% y = zeros(size(t));
% for ts = 1:length(t);
%     y(ts) = C* expm(A*t(ts)) * x0        % Evaluate System At Each Time & Input
% end
% 
% figure(1)
% plot(t, y)
% title('Output of Unforced System')
% xlabel('Time(seconds)')
% ylabel('Amplitude')
% 
% grid
% 
% %%%%%%%%%%%%%%%%%%
%       %Q1d%
% %%%%%%%%%%%%%%%%%%
p = [-1 + 1i; -1-1i; -2;];
K = place(A,B,p);
% 
% %%%%%%%%%%%%%%%%%%
%       %Q1e%
% %%%%%%%%%%%%%%%%%%
A_exp = expm(A);
x0 = [0; 1; 0;];

t = linspace(0, 10, 50);   
y = zeros(size(t));
for ts = 1:length(t);
    y(ts) = C* expm((A-(B*K))*t(ts)) * x0        
end

figure(1)
plot(t, y)
title('Output of System Under Feedback Law')
xlabel('Time(seconds)')
ylabel('Amplitude')
grid


