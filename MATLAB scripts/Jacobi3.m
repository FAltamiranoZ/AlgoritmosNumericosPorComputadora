function [x,i] = Jacobi3(A,b)
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
            x(r) = (b(r) - A(r,1:r-1)*xp(1:r-1) - A(r,r+1:n)*xp(r+1:n))/A(r,r);
        end

        x(n) = (b(n) - (A(n,1:n-1)*xp(1:n-1)))/A(n,n);
        error = (norm(x-xp))/norm(x);
        cond = abs(error)>TOL && i<MAX;
        i = i + 1;
    end
end