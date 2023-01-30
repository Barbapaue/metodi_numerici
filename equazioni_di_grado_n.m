%equazioni in mathlab

close all
clear all
clc

syms a b c x
eqn = a*x^2 + b*x + c == 0;

soluzioni_possibili = solve(eqn);

disp(soluzioni_possibili);

soluzioni_per_a = solve(eqn, a);

disp(soluzioni_per_a);

%derivate
f=x^2;

derivata_prima=diff(f,x);
derivata_seconda=diff(derivata_prima, x);
derivata_seconda2=diff(f, x, 2);

disp(derivata_prima);
disp(derivata_seconda);
disp(derivata_seconda2);

%derivata parziale
g=a^2 * b^2;

derivata_parziale_a=diff(g, a);

disp(derivata_parziale_a);

%limiti
K=(abs(a)/abs(2*sqrt(4-a)*(2+sqrt(4-a))));
limit(K, a, 4);
