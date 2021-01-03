%Se puede reemplazar por eig, porque eso es lo que calcula
function [lambda,x] = powerMethod(A)

TOL = eps;
MAX = 100;
i = 0;

[~ , n] = size(A); %Esto es para que no guarde la variable y evitar que 
%explote el método.
cond = true;

LpoX = ones(n, 1);
lambda = norm(LpoX);
x = LpoX / lambda;

while cond 
    lambdaA = lambda;
    LpoX = A*x;
    lambda = norm(LpoX);
    x = LpoX / lambda;
    i = i+1;
    cond = abs((lambda - lambdaA)/lambda) > TOL && i < MAX;
end
end

