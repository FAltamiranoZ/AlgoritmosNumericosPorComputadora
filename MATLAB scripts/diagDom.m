%Una funcion es estrictamente dominante cuando es dominante por filas o
%columnas; siendo esto cuando se cumple la siguiente condición para todas
%las filas o todas las columnas: valor absoluto del elemento de la diagonal
%> suma de todos los valores absolutos de los elementos en su fila o
%columna (norma de la columna o fila).

function bool = diagDom(A)
    [~,n] = size(A);
    bool = true;
    A2 = abs(A);
    %sum(matriz,dimension)
    sumaF = sum(A2,2); %Suma filas
    sumaC = sum(A2); %= sum(A2,1) suma columnas 
    i = 1;
    while i < n && bool
        sumaF(i) = sumaF(i) - A2(i,i);
        sumaC(i) = sumaC(i) - A2(i,i);
        absPiv = abs(A2(i,i));
        if absPiv < (norm (sumaF(i))) || absPiv < (norm (sumaC(i)))%Da el
            %mismo resultado con o sin el norm, pero Marcelo le puso 10
            %así, sooo... NO TOCAR
            bool = false;
        end
        i = i + 1;
    end
end