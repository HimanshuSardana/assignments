% Newton's Method

% Algorithm
% 1. Set i = 1, x0 = initial guess
% 2. Compute x1 = x0 - f(x0)/f'(x0)
% 3. If |x1 - x0| < tol, then stop
% 4. Set x0 = x1 and i = i + 1

clc;
clear all;
import symbolic

sym x;
f = @(x) x^2 - 2;
i = 1;


x0 = input('Enter initial guess: ');
tol = 10^-6;

diff(f)
