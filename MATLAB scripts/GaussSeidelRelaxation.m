%Podemos ver que mientras GaussSeidel normal tarda 45 iteraciones en
%alcanzar el resultado y Jacobi4 tarda 90, el nuevo método tarda solamente
%32 iteraciones, por lo que es más veloz.
function [x,i] = GaussSeidelRelaxation(A,b, lambda)
    L = tril(A,-1);
    U = triu(A,1);
    D = diag(diag(A));
 
    tol = eps;
    MAX = 1000;
    i = 0;
    x = zeros(size(b));
    cond = true;
    while cond
       xp = x;
       x = ((D+L)^-1)*b - ((D+L)^-1)*U*x;
       x = lambda*x + (1-lambda) * xp;
       i = i+1;
       cond = (norm(x-xp)/norm(x))>tol && i<MAX;
    end
end
