%Rk es el gradiente de la funci�n y me indica en que direcci�n se encuentra
%el m�nimo, alfak me dice el tama�o del paso que tengo que dar para
%acercarme al m�nimo. Alfa debe de recalcularse en cada paso para tener un
%acercamiento �ptimo, ya que si es demasiado grande podr�a ser que nunca
%converga al m�nimo porque se pasa de un lado al otro del valle de manera
%constante o si es muy chico que tarde demasiado en converger al valor
%correcto. Los pasos los va dando sobre las curvas de nivel.
%Recordar que una curva de nivel une todos los puntos que compartan la
%misma altura, se suele usar en topograf�a.

%A es un sistema de ecuaciones, b sus respuestas y x una aproximacion
function [x, i] = maximoDescenso(A, b, x) %o gradiente �ptimo o cauchy
    if ~isPositiveDefinite(A)
        error ('La matriz no es positiva definida');
    end
    
    MAX = 1000;
    i = 0;
    TOL = eps;
    rk = b - A * x;
    cond = norm(rk)~=0; %Para evitar entrar si empezamos con la respuesta.
    
    while cond
        xp = x;
        alpha = (dot(rk, rk))/(rk' * A * rk);
        %dot(A,B) = A(:,i)'*B(:,i) con i = tama�o matriz
        x = xp + alpha * rk;
        rk = b - A * xp;
        i = i+1;
        cond = (norm(x-xp)/norm(x))> TOL && i<MAX;
    end
end