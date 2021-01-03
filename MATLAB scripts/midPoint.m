%Este método y el de Heun (o del trapecio) son de segundo orden,
%debido a que usa y, y+1, y+1/2. Ambos corrigen el problema de Euler de
%agarrar la misma derivada para todo siendo que midpoint toma una derivada
%al inicio y otra a la mitad y Heun una al inicio y otra al final. 

function [t,y] = midPoint (f, t0, y0, h, tf)
    t = t0:h:tf;
    y = zeros(size(t));
    y(1) = y0;
    for i = 1:1:length(t)-1
        s1 = f(t(i),y(i));
        ym =  y(i) + h * s1;
        y(i+1) = y(i) + h * f(t(i) +h/2,ym); 
        %Esto es y(i) + h * f(t(i+.5), y(i+.5))
        %y(i+1) = y(i) +  h * f(t(i) + h/2, y(i) + h * f(t(i),y(i)))
    end
end