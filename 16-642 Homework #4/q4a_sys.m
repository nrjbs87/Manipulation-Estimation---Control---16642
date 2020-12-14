clear all
syms x y z;

%eqn1 = cos(x + y + z) == 1;
eqn1 = x + y + z == 0;
%eqn2 = sin(x + y + z) == 0;
eqn2 = sin(x + y + z)/2 + sin(x + y) + sin(x) == 0;
eqn3 = cos(x + y + z)/2 + cos(x + y) + cos(x) == 2;

sol = solve([eqn1, eqn2, eqn3], [x,y,z]);

%[A,B] = equationsToMatrix([eqn1, eqn2, eqn3], [x, y, z]);

%X = solve(A,B)