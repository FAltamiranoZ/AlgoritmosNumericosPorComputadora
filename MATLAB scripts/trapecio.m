%Este m�todo es el de Heun!!!, est� explicado en midPoint. Esta versi�n
%solo tiene un corrector; se pueden tener m�s si queremos ser m�s exactos
%y no nos importa tanto que sea m�s lento.

function [t,y] = trapecio (f, t0, y0, h, tf)
    t = t0:h:tf;
    y = zeros(size(t));
    y(1) = y0;
    for i = 1:1:length(t)-1
        s1 = f(t(i),y(i));
        yp =  y(i) + h*s1;
        s2 = f(t(i)+h,yp);
        y(i+1) = y(i) + h*((s1+s2)/2);
%y(i+1) = y(i) + h*((f(t(i),y(i)) + f(t(i)+h, y(i) + h * f(t(i),y(i))))/2);
    end
end