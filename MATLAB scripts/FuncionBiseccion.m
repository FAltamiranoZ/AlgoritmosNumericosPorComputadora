%Para hallar raíces se usan métodos cerrados y abiertos, los cerrados son 
%exactos y los abiertos no.

%Lo que hace esta función es que quiere encontrar la raíz; es decir, busca
%donde se intersecta la recta con el eje x. Para hacer esto, va a tomar un
%2 puntos dados entre la recta y los va a multiplicar, si el resultado es
%positivo, entonces actualiza el punto a, si no, el punto b y continua
%hasta que el punto sea 0
function [x, i] = biseccion(f, a, b)
    if sign (f(a)) * sign(f(b))>=0
        error ('f(a)f(b)<0 no se satisface') %Evita que siga avanzando el 
        %programa y muestra lo escrito como mensaje
    end
    max = log2((b-a)/eps(a));
    TOL = eps; %(tolerancia)
    i = 0;
    x = (a+b)/2;
    fx = f(x);
    fa = f(a);
    intervalo = num2hex(abs(b-a));
    %fprintf('%2i %20.16f %20.16f %s \n', i, x, fx, intervalo); %el print con 
    %formato recibe el formato para cada una de las prox variables, por eso
    %son 4 vars despues de los 4 %.  %20.16f es que se quieren 16 decimales
    %y %s es que se quiere que siga leyendo hasta encontrar un espacio
    %vacío.
    while abs((b-a)/x) > TOL && fx ~=0 && i <=max
        %Aquí ponemos el error relativo, como hicimos en el 
        %calculoDePi debido a que el error que damos puede ser demasiado
        %grande en cálculos muy pequeños o viceversa. IMPORTANTE
        x = (a+b)/2;
        if sign (fa)==sign(fx)
            a = x;
            fa = f(a);
        else
            b = x;
        end
        intervalo = num2hex(abs(b-a));
        i = i+1;
        x = (a+b)/2;%%x no se actualiza con los nuevos valores ya sea 
        %de a o de b del último loop
        fx = f(x);
%         fprintf('%2i %20.16f %20.16f %s \n', i, x, fx, intervalo);
%Esto también funciona pero lo quite para usarla sin que me floodee todo
    end
    log2((b-a)/eps(x))
end
%Podemos ver al final que en esta funcion en el imprimir en la parte
%hexadecimal se va reduciendo cada vez un bit, que es lo que siempre pasa
%al hacer una division hexadecimal

%Esta funcion tiene convergencia lineal, por lo que no es el mas rapido.