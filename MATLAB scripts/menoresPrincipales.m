%Una matriz cuadrada de m*n puede tener menores de orden k con el dominio
%de k yendo desde 1 hasta n con k perteneciente a los naturales.

%A lo que esto se refiere es que un menor de orden 4 en caso de que la
%matriz sea de 5*5 es una nueva matriz a la cual se le quita una columna y
%una fila para convertirla en una matriz de 4*4 (por ello se llama de orden
%4), esta matriz no tiene ninguna otra regla y puede haber o no integrantes
%de la diagonal principal.

%En el caso de una menor principal, si es de grado 1, solo contiene a11, si
%es de grado 2, entonces debe contener a11 y a22 (matriz de 2 *2) y así
%para todos los grados; es decir, debe de tener el mismo número de
%integrantes de la diagonal principal que el grado y estos deben de ir en
%orden, por lo tanto, las filas y columnas removidas siempre van del final
%(anm) hasta el inicio (a11).

%Por último, a las matrices generadas por cualquier menor, se les debe de
%sacar el determinante para efectivamente, ser un menor.
function menoresA = menoresPrincipales(A)
    %Lo que hace A(i:j, k:l) es que me regresa la submatriz que va desde
    %la fila i hasta la j y las columnas k hasta la l.
    [~,n] = size(A);
    menoresA = zeros(1,n); %Esto evita tener un arreglo que no tenga un 
    %espacio predefinido y por lo tanto mejora su velocidad.
    for i = 1:n
        menoresA(i) = det((A(1:i,1:i)));
    end
end