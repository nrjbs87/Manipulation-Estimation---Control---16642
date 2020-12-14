% %%%%%%%%%%%%%%%%%%
%       %Q1d%
% %%%%%%%%%%%%%%%%%%

% define matrices 
A = [0 1 0; 0 0 1; 1 5 7];
B = [1; 0; 0;];
C = [0 1 3];

% calculate K-matrix to force the eigenvalues we want
p = [-1 + 1i; -1-1i; -2;];
K = place(A,B,p);
