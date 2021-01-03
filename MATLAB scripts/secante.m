%Este método toma 2 puntos x1 y x2 y traza una recta entre ambos 
%(la secante), se fija donde intersecta la secante con el eje de las x y 
%saca x3, luego repite el proceso con x2 y x3 y así
%https://www.youtube.com/watch?v=_MfjXOLUnyw a partir de 1:03
function [x1, i] = secante(f, x1, x2)
    TOL = eps;
    MAX = 66;
    i = 0;
   
    cond = true;
    while cond
        xn = x1 - ((x1 - x2) / (f(x1) - f(x2))) * f(x1);
        x2 = x1;
        x1 = xn;
        i = i + 1;
        cond = (abs((x1-x2)/x1))> TOL && f(x1) ~=0 && i <=MAX;
    end
end