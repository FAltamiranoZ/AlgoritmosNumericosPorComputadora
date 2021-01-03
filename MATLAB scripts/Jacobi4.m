%Empezando con la ecuacion de Jacobi1: x = D^-1*b - D^-1*(l+u)*(xp), 
%en la parte de L + U  agregamos + D - D como un cero falso,para así poder
%sacar la A, de manera que la ecuación quede como: 
%x = D^-1*b - D^-1*(A - D)*(xp) -> simplificando:
%x = D^-1*(b-A*xp) + xp lo que queda como xp + D^-1*rk con rk= b-Ax
%Por lo tanto, la matriz M que se nos pide es D. y se tienen que reacomodar
%las ecuaciones de A de forma que: A =[-8,-1,-2;2,-6,-1;-3,-1,7] y
%b = [-20;-38;-34], ya que de otra manera, la matriz no seria diagonalmente
%dominante y por lo tanto, no se podría aplicar el método.
function [x,i] = Jacobi4(A,b)
    D = diag(diag(A));
    TOL = eps;
    MAX = 1000;
    i = 0;
    x = zeros(size(b));
    cond = true;
    while cond
       r = b - A*x;
       xp = x;
       x = xp + D\r;
       i = i+1;
       cond = (norm(x-xp)/norm(x))>TOL && i<MAX;
    end
end
