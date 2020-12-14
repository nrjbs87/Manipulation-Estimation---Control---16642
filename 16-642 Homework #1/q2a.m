% %%%%%%%%%%%%%%%%%%
%       %Q2a%
% %%%%%%%%%%%%%%%%%%

% define variables in symbolic MATLAB
syms F phidot u xcdot D gamma alpha phi beta

% define xc double dot and phi double dot as symbolic MATLAB equations 
% all of this is based off my hand-written calculations 
xdd = [F - (beta*(phidot^2) * sin(phi)) - (u*xcdot); D * sin(phi)];
pdd = [gamma -(beta*cos(phi)); -(beta*cos(phi)) alpha];

% q is a variable named I defined to store the results of taking the
% inverse of xdd and pdd
q = inv(pdd) * xdd;