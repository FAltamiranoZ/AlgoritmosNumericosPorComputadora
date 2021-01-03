function [x,i] = GaussSeidel3(A,b)
%Lo que cambio del GaussSeidel2 es que todas las L,U,D las cambiamos por A
    TOL = eps;
    i = 0;
    MAX=1000;
    cond = true;
    
    x = zeros(size(b));
    n = length(x);
    while cond
        xp = x;
        x(1) = (b(1) - (A(1,2:n)*xp(2:n)))/A(1,1);
        
        for r = 2:1:n-1
            x(r) = (b(r) - A(r,1:r-1)*x(1:r-1) - A(r,r+1:n)*xp(r+1:n))/A(r,r);
        end
        
        x(n) = (b(n) - (A(n,1:n-1)*xp(1:n-1)))/A(n,n);
        error = (norm(x-xp))/norm(x);
        i = i + 1;
        cond = abs(error)>TOL && i<MAX; 
    end
end