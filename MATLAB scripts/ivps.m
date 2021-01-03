%José Francisco Altamirano Zevallos

%Initial value problems, solution.
%Esta aguanta funciones simultáneas, a diferencia de las mismas funciones
%que tenemos pero por separado.
%Para todas las funciones de aquí, su error local = O(h^(grado +1)) y el 
%error global = O(h^(grado)). Por ejemplo, Euler al ser de primer orden 
%tiene error local de O(h^2) y global de O(h^1)

function [t,y] = ivps (f, t0, tf, y0, h, solver)

    switch solver
        case 1
            fhandle=@euler;
        case 2
            fhandle=@trapecio;
        case 3
            fhandle=@midpoint;
        case 4
            fhandle=@rk4;
        case 5
            fhandle=@ralston;
    end
       
    t = t0:h:tf;
    y = zeros(length(y0),length(t));
    y(:,1) = y0;
    
    for i = 1:length(y)-1
        y(:,i+1) = y(:,i) + h*fhandle(f,t(i),y(:,i),h);
    end
    
    function phi = euler(f,t,y,~)
        phi = f(t,y);
    end

    function phi = trapecio(f,t,y,h)
        s1 = f(t,y);
        yp = y + h*s1;
        s2 = f(t+h,yp);
        phi = (s1+s2)/2;
    end
    
    function phi = midpoint(f,t,y,h)
        s1 = f(t,y);
        ym = y + h*s1;
        phi = f(t+h/2,ym);
    end

    %Si solo dejamos s1, es euler; si dejamos solo s2 sin que se
    %multiplique por nada y que la segunda parte no se divida entre 2, es 
    %midpoint, si dejamos s1, s2 y ambos multiplicados por 1/2 sin que la 
    %segunda parte se divida entre 2, es Heun de un corrector.
    %Este es un método de cuarto orden, y su ventaja es que usa la
    %pendiente calculada previamente como un factor que afecta para la
    %próxima pendiente y así sigue hasta llegar a la 4ta pendiente, que es
    %bastante exacta, y a sacar el promedio de las 4 pendientes (las s),
    %sale una muy exacta.
    function phi = rk4(f,t,y,h)
        s1 = f(t,y);
        s2 = f(t + h/2,y + (s1 * h)/2);
        s3 = f(t + h/2,y + (s2 * h)/2);
        s4 = f(t + h,y + s3 * h);
        phi = (s1 + 2 * s2 + 2*s3 + s4)/6;
    end

    function phi = ralston(f,t,y,h)
        k1 = f(t,y);
        k2 = f(t + (3/4)*h, y + (3/4)*k1*h);
        phi = k1/3 + (2/3)*k2;
    end
end