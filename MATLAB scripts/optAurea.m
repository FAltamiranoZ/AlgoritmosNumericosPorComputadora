%Este método toma los puntos dados y genera otros dos puntos x1 y x2 con
%ellos, los cuales usará para evaluar en la función e ir recorriendo los
%puntos dados cada vez más hacia dentro de la f hasta llegar al punto donde
%a = b, es decir, el mínimo. Explota si le das una función que no tenga un 
%mínimo!!!, por ello para máximos se invierte el signo
%https://www.youtube.com/watch?v=4QKTbEH563w 3:56

function [x, i] = optAurea(f, a, b) %Esto va hacia el mínimo.
    phi = (1 + sqrt(5)) / 2;
    g = phi - 1;
    d = g * (b - a);

    x1 = a + d;
    f1 = f(x1);
    x2 = b - d;
    f2 = f(x2);
    
    TOL = sqrt(eps);
    MAX = 60;
    i = 0;
    x = (a + b) / 2;
    
    cond = true;
    while cond
        d = g * d;
        if (f1 < f2)
            a = x2;
            x2 = x1;
            f2 = f1;
            x1 = a + d;
            f1 = f(x1);
        else
            b = x1;
            x1 = x2;
            f1 = f2;
            x2 = b - d;
            f2 = f(x2);
        end
        x = (a + b)/2; %La x es solo para el error, si no tengo con que 
        %hacer una tasa, entonces no hago esto
        i = i + 1;
        cond = (abs((b - a) / x)) > TOL && i < MAX;
    end
end