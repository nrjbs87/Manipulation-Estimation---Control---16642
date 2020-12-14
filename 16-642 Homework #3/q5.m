clear all 
x = [-1 0 1 0 -1];
y = [1 1 0 -1 -1];
z = [1 1 1 1 1];

pgon = polyshape(x,y);

hold on
figure(1);
plot(pgon);
title('Plots of (a), (b), & (c)', 'FontSize',14);

hold on
figure(2);
plot(pgon);
title('Plots of (d), (e), & (f)', 'FontSize',14);

A = [ 1 0 4; 0 1 0; 0 0 1];
B = [0.866 0.5 0; -0.5 0.866 0; 0 0 1];

x_new = zeros(5,1);
y_new = zeros(5,1);

%%%%%%%%%%%
%    a    %
%%%%%%%%%%%
for i = 1:length(x)
    %a
    p = A * [x(i);y(i);z(i)];
    x_new(i) = p(1);
    y_new(i) = p(2);
end
hold on 
pgon_new = polyshape(x_new,y_new);
figure(1)
plot(pgon_new);
%title('A, relative to the fixed frame');

%%%%%%%%%%%
%    b    %
%%%%%%%%%%%
for i = 1:length(x)
    %b
    p = A * B * [x(i);y(i);z(i)]; 
    x_new(i) = p(1);
    y_new(i) = p(2);
end
hold on 
pgon_new = polyshape(x_new,y_new);
figure(1)
plot(pgon_new);
%title('A, relative to the fixed frame, followed by B, relative to the current frame');

%%%%%%%%%%%
%    c    %
%%%%%%%%%%%
for i = 1:length(x)
    %c
    p = B * A * [x(i);y(i);z(i)];
    x_new(i) = p(1);
    y_new(i) = p(2);
end
hold on 
pgon_new = polyshape(x_new,y_new);
figure(1)
plot(pgon_new);
legend('original', '(a)', '(b)', '(c)','FontSize',14);
%title('A, relative to the fixed frame, followed by B, relative to the fixed frame');

%%%%%%%%%%%
%    d    %
%%%%%%%%%%%

for i = 1:length(x)
    %d
    p = B * [x(i);y(i);z(i)];
    x_new(i) = p(1);
    y_new(i) = p(2);
end
hold on 
pgon_new = polyshape(x_new,y_new);
figure(2);
plot(pgon_new);
%title('B, relative to the fixed frame')

%%%%%%%%%%%
%    e    %
%%%%%%%%%%%
for i = 1:length(x)
    %e
    p = A * B * [x(i);y(i);z(i)];
    x_new(i) = p(1);
    y_new(i) = p(2);
end
hold on 
pgon_new = polyshape(x_new,y_new);
figure(2);
plot(pgon_new);
%title('B, relative to the fixed frame, followed by A, relative to the fixed frame')

%%%%%%%%%%%
%    f    %
%%%%%%%%%%%
for i = 1:length(x)
    %f
    p = B * A * [x(i);y(i);z(i)]; 
    x_new(i) = p(1);
    y_new(i) = p(2);
end
hold on 
pgon_new = polyshape(x_new,y_new);
figure(2);
plot(pgon_new);
legend('original', '(d)', '(e)', '(f)','FontSize',14);
