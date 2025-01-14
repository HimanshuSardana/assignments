% Not required in MATLAB
pkg load symbolic
% ---

clc;
clear all;

f = @(x) x^3 + 3*x^2 + 5;
f_prime = @(x) 3*x^2 + 6*x;

x0 = -3;
tolerance = 1e-8;

x = x0;
while abs(f(x)) > tolerance
    x = x - f(x) / f_prime(x);
end

disp(x);
fprintf('%f', f(-3.4260));
