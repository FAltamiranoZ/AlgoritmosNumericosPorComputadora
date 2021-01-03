%f(x0) = f(xp) + j(xp) * (x-xp) es Newton Raphson para sistemas de ecuaciones
%no lineales. se despeja como -(j(xp)\f(xp)) + xp. Recordar que no se puede
%dividir simplemente entre una matriz, razón por la que multiplicamos por
%la inversa, que es lo mismo que resolver \. J es jacobiano.

function [x, i] = newtonRaphsonVar(f, J, x)
    TOL = eps;
    MAX = 66;
    i = 0;
    cond = true;
    while cond 
        xp = x;  
        x = xp - J(xp)\f(xp);
        i = i+1;
        cond = (norm(x-xp)/norm(x))> TOL && all(f(x) ~=0) && i <=MAX;
    end
end