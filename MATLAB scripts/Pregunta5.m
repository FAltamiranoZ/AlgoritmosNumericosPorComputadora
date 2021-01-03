syms xs1 xs2 xs3; %xs por x simbólica
xs = [xs1, xs2, xs3];
fs = [(xs(1)-1)^2 + (xs(2)-1)^2 + (xs(3)^2)-1; (xs(1)-1)^2 + (xs(2))^2 + ((xs(3)-1)^2)-1; (xs(1))^2 + (xs(2)-1)^2 + ((xs(3)-1)^2 )-1];
js = jacobian(fs,xs);
x = [1;2;3];
J = @(x) [2*x(1)-2, 2*x(2)-2, 2*x(3); 2*x(1)-2, 2*x(2), 2*x(3)-2; 2*x(1), 2*x(2)-2, 2*x(3)-2];
matlabFunction(fs);
[x, i] = newtonRaphsonVar(fs, J, x);
f(x);