%Como mi m�todo calcula m�nimos y lo que yo quiero es el m�ximo, le pongo
%un menos al final (como en f2= para invertirla. 10/10 a la soluci�n. El 
%m�nimo y el m�ximo est�n en el mismo punto siempre, por eso no importa.

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