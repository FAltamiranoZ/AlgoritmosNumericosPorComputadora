%Lo más recomendable es hacerla simbólica y resolver hasta js ahí y luego
%pasarla a lo que sería (a mano) pero ya teniendo la respuesta correcta.
f = @(x) [x(1)^2 + x(1)*x(2) - 10; x(2) + 3*x(1)*x(2)^2 - 57];
%b = [0;0];
J = @(x) [2*x(1) + x(2), x(1); 3*x(2)^2, 1 + 6*x(1)*x(2)]; %Jacobiana a 
%mano; es decir, der parcial de f1 en x1, x2; der parcial de f2 en x1,x2
x = [3;5];
[x, i] = newtonRaphsonVar(f, J, x);
f(x); %no da exacto 0 pero muuuuuy cerca.

syms xs1 xs2; %xs por x simbólica
xs = [xs1, xs2];
fs = [xs(1)^2 + xs(1)*xs(2) - 10; xs(2) + 3*xs(1)*xs(2)^2 - 57];
js = jacobian(fs,xs);
matlabFunction(fs);
matlabFunction(js); %esto es lo que causa problema, porque no lo convierte 
%en una matriz, solo hace un mega vector

% syms xs1 xs2 xs3; %xs por x simbólica
% xs = [xs1, xs2, xs3];
% fs = [(xs(1)-1)^2 + (xs(2)-1)^2 + (xs(3)^2)-1; (xs(1)-1)^2 + (xs(2))^2 + ((xs(3)-1)^2)-1; (xs(1))^2 + (xs(2)-1)^2 + ((xs(3)-1)^2 )-1];
% js = jacobian(fs,xs);
% x = [1;2;3];
% J = @(x) [2*x(1)-2, 2*x(2)-2, 2*x(3); 2*x(1)-2, 2*x(2), 2*x(3)-2; 2*x(1), 2*x(2)-2, 2*x(3)-2];
% matlabFunction(fs);
% [x, i] = newtonRaphsonVar(fs, J, x);
% f(x);

f2 = @(x) [3* x(1) - cos(x(2)*x(3)) - 3/2; 4 * x(1)^2 - 625 * x(2)^2 + 2 * x(2) - 1; exp(-x(1) * x(2)) + 20 * x(3) + (10 * pi - 3)/ 3];
J2 = @(x) [3, sin(x(2)*x(3))*x(3), sin(x(2)*x(3))*x(2); 8*x(1), -1250*x(2) + 2, 0; -x(2)*exp(-x(1)*x(2)), -x(1)*exp(-x(1)*x(2)), 20];
x2 = [1;1;1];
%x2s = [xs1, xs2, xs3];
%f2s = [3* x2s(1) - cos(x2s(2)*x2s(3)) - 3/2; 4 * x2s(1)^2 - 625 * x2s(2)^2 + 2 * x2s(2) - 1; exp(-x2s(1) * x2s(2)) + 20 * x2s(3) + (10 * pi - 3)/ 3];
%j2s = jacobian(f2s,x2s)
[x2, i2] = newtonRaphsonVar(f2, J2, x2);
f2(x2);