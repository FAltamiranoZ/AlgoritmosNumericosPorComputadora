%Este m�todo toma los puntos dados y genera otros dos puntos x1 y x2 con
%ellos, los cuales usar� para evaluar en la funci�n e ir recorriendo los
%puntos dados cada vez m�s hacia dentro de la f hasta llegar al punto donde
%a = b, es decir, el m�nimo. Explota si le das una funci�n que no tenga un 
%m�nimo!!!, por ello para m�ximos se invierte el signo
%https://www.youtube.com/watch?v=4QKTbEH563w 3:56

function [x, i] = optAurea(f, a, b) %Esto va hacia el m�nimo.
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