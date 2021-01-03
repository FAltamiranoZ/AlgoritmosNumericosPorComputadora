function [x,i] = Jacobi1(A,b) %Solo converge si la matriz es DiagDom, lo 
%cual aplica para todos los Jacobi y los Seidel.
%Como A = L+U+D, Ax = b, entonces, Lx + Ux + Dx = b y haciendo que las x de
%L, u sean x previa, entonces despejando queda Dx = b - (L+U) * xp,
%entonces despejando queda Jacobi, que es x = {D^-1*b} [- D^-1*(l+u)]*(xp)
%Siendo qye lo que esta entre [] es la T de Jacobi y lo que está entre {}
%es la C.
    TOL = eps;
    i = 0;
    MAX=1000;
    cond = true;
    L = tril(A,-1); %L sin la diagonal, no tiene nada que ver con la L de LUP
    D = diag(diag(A)); %D siempre es una matriz diagonal, lo que significa 
    %que todo es 0 excepto la diagonal principal
    U = triu(A,1); %Tampoco tiene nada que ver con la U de LUP
    x = zeros(size(b));
    while cond
        aux = D\(b -((L+U)*x)); %backslash no resuelve porque a pesar de 
        %que en la primera iteración es D\b, no es A\b, por eso se hace
        %varias veces.
        error = (norm(aux-x))/norm(aux); %No se usa abs porque la norma ya 
        %lo hace
        x = aux;
        i = i + 1;
        cond = abs(error)>TOL && i<MAX;
    end
end

