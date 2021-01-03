%Recibe tres puntos y genera un 4to punto usando aproximaciones con los 
%dem�s puntos; luego recorre los puntos y vuelve a empezar hasta que 2
%puntos se repitan, lo que indica que se hall� el m�nimo.
%La interpolaci�n de Newton no necesariamente es para 3 puntos, puede ser
%para m�s, pero entre m�s puntos tenga, m�s baja su efectividad porque va
%aumentando su grado
function [xn, i] = interpolacionNewton(f, a, b, c)
TOL = eps;
MAX = 100;
i = 0;
flag = true;
cond = true;
    while cond
        fa = f(a); fb = f(b); fc = f(c);
        f1ab = (fb - fa) / (b - a);
        f1bc = (fc - fb) / (c - b);
        f2abc = (f1bc - f1ab) / (c - a);
        
        %p1 = f(a);
        %p2 = p1 + f1ab * (x - a);
        %p3 = p2 + f2abc * (x - a) * (x - b);
        %%p3 = expand(p3); Esto sirve para que se pueda leer como
        %%normalmente se lee la ecuaci�n, pero no la modifica.
        %fsym = sym(f); Esto convierta la funci�n dada en una expresi�n.
        %dfsym = diff(fsym);
        %%df = matlabFunction (dfsym); Esto se usa para que una expresi�n
        %%se convierta en funci�n.
        %solx = solve(dfsym, x); Esto da lo mismo que xn de abajo.
        %-% x = solx;
        %-% p3 = subs(p3); subs es para que se actualize p3 con los nuevos
        %valores; es decir, en este caso ya sabr�a el valor de x y podr�a
        %resolver la ecuaci�n.
        
        xn = ((a + b) / 2) - (f1ab /(2 * f2abc));
        a = b; b = c; c = xn;
        i = i + 1;
        if (((b - a) == 0) || ((c - b) == 0) || ((c - a) == 0))
            flag = false;
        end
        cond = (abs(xn))> TOL && flag && i <=MAX;
    end
end
