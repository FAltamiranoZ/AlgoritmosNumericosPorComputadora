%e,f,g,r tienen el mismo tamaño que la matriz, siendo que en el caso de e,
%su vector empieza en 0 y que en g, termina en 0. 
%e,f, g  se introducen como una fila o columna, r como columna
%Este código es una versión alternativa de Gauss, cambiando en el la parte
%en la que se calcula el inicio y el trabajo de la parte inferior.
%En esto, e(1) = 0, g(n) = 0

function [x,j] = tridiag(e,f,g,r)
    j = 0;
    x = zeros(size(r));
    n = length(x);
    
    %Se calculan primero porque para g(1) solo es necesario trabajar con 1
    %elemento de la diagonal
    g(1) = g(1) / f(1);
    r(1) = r(1) / f(1);
    
    %Trabajo de parte inferior
    for i = 2:1:n
        aux = f(n) - e(n) * g(i - 1);
        if (i<n)
            g(i) = g(i)/aux;
        end
        r(i) = (r(i) - e(i) * r(i - 1))/aux;
        j = j +1;
    end
    
    %De la misma manera, al acabar el proceso, ya esta definido de manera
    %automática la r inferior, ya que no es necesario resolver la parte
    %superior (todos son 0) de f(n).
    x(n) = r(n);
    
    %Trabajo de la parte superior
    for i = (n - 1):-1:1
        x(i) = r(i) - g(i) * x(i + 1);
    end
    
end
