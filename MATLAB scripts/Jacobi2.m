function [x,i] = Jacobi2(A,b)
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
        x(1) = (b(1) - (U(1,2:n)*xp(2:n)))/D(1,1); %Primer vector de x
        
        %parfor hace que corra en paralelo.
        for r = 2:1:n-1
            x(r) = (b(r) - L(r,1:r-1)*xp(1:r-1) - U(r,r+1:n)*xp(r+1:n))/D(r,r);
        end
        
        x(n) = (b(n) - (L(n,1:n-1)*xp(1:n-1)))/D(n,n); %EL punto que falto 
        %en la última iteración.
        error = (norm(x-xp))/norm(x);
        cond = abs(error)>TOL && i<MAX;
        i = i + 1;
    end
end