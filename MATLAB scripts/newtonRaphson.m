%Lo que hace este método es tomar 1 punto y evaluarlo en la derivada de la
%función, sacando con esto una recta tangente al punto y tomando como un
%nuevo punto el lugar en el que la recta tangente generada se intersecte
%con el 0. Cambia de lado del 0 automaticamente debido al - casi al inicio
%de la fórmula.
%https://es.wikipedia.org/wiki/M%C3%A9todo_de_Newton#/media/File:NewtonIteration_Ani.gif

function [x, i] = newtonRaphson(f, x)
    TOL = eps;
    MAX = 66;
    i = 0;
    
    fsym = sym(f);
    dfsym = diff(fsym);
    df = matlabFunction (dfsym);
    %Se debe de poner el matlabFunction para que no de vueltas hasta la 
    %eternidad (exclusivo a funciones).
    
%     actual = 1;
%     previo = 0;
    %Es mejor hacerlo de manera que no use valores absolutos.
    
    %Por alguna extraña razón, prefiere la condición así:
    %(abs((actual-previo)/actual)) > TOL && fx ~=0 && i <= MAX
    %Es decir, solo con el orden diferente.
   
    %El while pregunta y luego entra, el do while entra y luego pregunta; 
    %esta es una manera en la cual se evita repetir la condicion afuera 
    %para hacer una primera iteracion para los valores de actual y previo
    %%while fx ~=0 && i <= MAX && TOL < (abs((actual-previo)/actual)) 
    cond = true;
    while cond %Asi se hace un do while
        xp = x; %xprevio en lugar de previo 
        x = xp - (f(xp)/df(xp));
        i = i+1;
        cond = (abs((x-xp)/x))> TOL && f(x) ~=0 && i <=MAX;
    end
end