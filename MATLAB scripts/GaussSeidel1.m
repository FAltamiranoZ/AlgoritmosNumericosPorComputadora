%En Gauss Seidel, se hace lo mismo que en Jacobi1, pero se despeja
%diferente, haciendo x = (D + L)^-1 * (b - Ux) y como (D + L)*x = b - Ux
%entonces x = {(D + L)^-1 * b} [- (D + L)^-1 * U] * x Siendo que lo que 
%esta entre [] es la T de Seidel, y lo de {} es la C de Seidel.
%Podemos ver que la T de Seidel es menor que la de Jacobi, razón por la
%cual convergerá más rápido, la prueba de ello es el código comentado de
%hasta abajo.

function [x,i] = GaussSeidel1(A,b)
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
       i = i+1;
       cond = (norm(x-xp)/norm(x))>tol && i<MAX;
    end
end

% D = diag(diag(A));
% U = triu(A,1);
% L = tril (A, -1);
% T = -D\(L+U);
% J = max(abs(eig(T)));
% T = -(D+L)\U;
% GS = max(abs(eig(T)))