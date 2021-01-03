%Esta es una combinaci�n de Secante y Bisecci�n, ya que realiza el m�todo
%de la secante, pero para asignar el siguiente punto, no simplemente se
%recorre, si no que lo escoge seg�n su signo (como lo hace bisecci�n)
function [x, i] = interpLin(f, a, b)
    if sign (f(a)) * sign(f(b))>=0
        error ('f(a)f(b)<0 no se satisface')
    end
    TOL = eps;
    fa = f(a);
    max = 66;
    x = b - (f(b)*(b-a))/(f(b)-f(a));
    fx = f(x);
    i = 0;
    while abs((b-a)/x) > TOL && fx ~=0 && i <= max
        if sign (fa)==sign(fx)
            a = x;
            fa = f(a);
        else
            b = x;
        end
        i = i+1;
        x = b - (f(b)*(b-a))/(f(b)-f(a));
        fx = f(x);
    end
end
