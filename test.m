clear;
x0 = [0.02; 4000; 250];

[x, fval, exitflag, output] = fminunc(@Meyer,x0);