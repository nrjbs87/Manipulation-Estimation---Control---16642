%%%%%%%%%%%%%%%%%%
      %Q1b%
%%%%%%%%%%%%%%%%%%

% define matrices 
A = [0 1 0; 0 0 1; 1 5 7];
B = [1; 0; 0;];
C = [0 1 3];

% calculate rank
Q = [B,A*B,(A^2 * B)];
rank(Q)