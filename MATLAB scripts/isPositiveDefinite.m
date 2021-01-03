function [square, sym, pd] = isPositiveDefinite(A)
    [m,n] = size(A);
    square = n == m;
    sym = square && isequal(A,A');
    pd = sym && all(eig(A) > 0);
end

%Otra manera de checar es si x'*A*x >0