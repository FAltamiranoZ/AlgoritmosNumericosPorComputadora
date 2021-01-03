%Para resolver ecuaciones diferenciales de la forma dy/dx = f(x,y) (lo que
%hemos hecho todo este tiempo), haremos y = yp + h*y' (prima, ya no es
%transpuesto).
%Se dice que un m�todo de primer orden es el que usa solo una xp,si fuera
%de segundo orden usaria xp y xpp. Euler es de primer orden.
%Euler tiene 2 errores, uno local de cada vez que se hace y uno arrastrado.
%Para calcularlo se pueden usar series de Taylor y para reducirlo, bajar el
%tama�o de la h

%euler(ecuaci�n diferencial, punto inicial, valor en el punto inicial,
%tama�o del paso (n�mero de puntos graficados), punto final).

function [t,y] = euler (f, t0, y0, h, tf)
    t = t0:h:tf; %Define el �rea sobre la que se trabajar� (x)
    y = zeros(size(t));
    y(1) = y0;
    for i = 1:length(y)-1
        y(i+1) = y(i) + h*f(t(i),y(i));
    end
end

