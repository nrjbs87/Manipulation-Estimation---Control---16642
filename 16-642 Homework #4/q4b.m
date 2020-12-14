clear all;


x = -2*atan(7^(1/2)/7);
y = 2*atan(7^(1/2)/3);
z = 2*atan(7^(1/2)/7) - 2*atan(7^(1/2)/3);


Jv = [[-0.5*sin(x + y + z) - sin(x + y) - sin(x), -0.5*sin(x + y + z) - sin(x + y), -0.5*sin(x + y + z)], 
      [0.5*cos(x + y + z) + cos(x + y) + cos(x), 0.5*cos(x + y + z) + cos(x + y), 0.5*cos(x + y + z)]];

theta_dot = Jv' * inv(Jv*Jv') * [0; 10];
theta_dot

x = 2*atan(7^(1/2)/7);
y = -2*atan(7^(1/2)/3);
z =  2*atan(7^(1/2)/3) - 2*atan(7^(1/2)/7);

x
y
z

Jv = [[-0.5*sin(x + y + z) - sin(x + y) - sin(x), -0.5*sin(x + y + z) - sin(x + y), -0.5*sin(x + y + z)], 
      [0.5*cos(x + y + z) + cos(x + y) + cos(x), 0.5*cos(x + y + z) + cos(x + y), 0.5*cos(x + y + z)]];

theta_dot = Jv' * inv(Jv*Jv') * [0; 10];
theta_dot