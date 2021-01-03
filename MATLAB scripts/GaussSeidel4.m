%Partiendo de x = (D + L)^-1 * b - (D + L)^-1 * U * xp que es el despeje de
%GaussSeidel1 entonces:
%x = (D + L)^-1 * b - (D + L)^-1 * (U + D + L - D - L) * xp 
%x = (D + L)^-1 * b - (D + L)^-1 * (A - D - L) * xp
%x = xp + (D + L)^-1 * rk con rk igual que arriba

function [x,i] = GaussSeidel4(A,b)
    L = tril(A,-1);
    D = diag(diag(A));
    DmasL = D + L;

    TOL = eps;
    MAX = 1000;
    i = 0;
    x = zeros(size(b));
    cond = true;
    while cond
       r = b - A*x;
       xp = x;
       x = xp + DmasL\r;
       i = i+1;
       cond = (norm(x-xp)/norm(x))>TOL && i<MAX;
    end
end
