function [x,i] = GaussSeidel2(A,b)
    TOL = eps;
    i = 0;
    MAX=1000;
    cond = true;
    
    L = tril(A,-1);
    D = diag(diag(A));
    U = triu(A,1);
    x = zeros(size(b));
    n = length(x);
    while cond
        xp = x;
        x(1) = (b(1) - (U(1,2:n)*xp(2:n)))/D(1,1);
        
        for r = 2:1:n-1
            x(r) = (b(r) - L(r,1:r-1)*x(1:r-1) - U(r,r+1:n)*xp(r+1:n))/D(r,r);
            %Lo único que cambió del jacobi 2 es que hacemos en esta línea
            %L * x en vez de L * xp
        end
        
        x(n) = (b(n) - (L(n,1:n-1)*xp(1:n-1)))/D(n,n);
        error = (norm(x-xp))/norm(x);
        i = i + 1;
        cond = abs(error)>TOL && i<MAX; 
    end
end