%Como mi método calcula mínimos y lo que yo quiero es el máximo, le pongo
%un menos al final (como en f2= para invertirla. 10/10 a la solución. El 
%mínimo y el máximo están en el mismo punto siempre, por eso no importa.

f = @(x) 43 * x .^ 2 + 55 .* x + 22;

interval = [-5, 5];
fplot(f, interval)
hold on;

fprintf('InterpNewt \n');
[x, i] = interpolacionNewton (f, 5, -3, -18)

fprintf('optAurea \n');
[x, i] = optAurea (f, -3, 3)

fprintf('optNr \n');
[x, i] = optNR (f, 0)