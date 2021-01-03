%Todo sistema de ecuaciones que se vea expresado como Ax = b se resuelve
%buscando la x, es por ello que en PA = LU, lo cual pasa a ser LUx = Pb y
%de ahí se divide en Ly = Pb, Ux = y

function x = lupSolucion(A,b)
    [L,U,P,~] = lup(A);
    [~,n] = size(A);
    Pb= P*b;
    y = zeros(n,1);
    x = zeros(n,1);

    %Ly = Pb (con Pb ya calculado)
    for j = 1:n-1
        for i = j+1:n
            %Como lup ya hizo para la U todo lo que hace gauss
            %excepto la asignacion la hacemos aquí y en las 3 de abajo
            Pb(i) = Pb(i) - (L(i,j)/L(j,j))*Pb(j);
        end
        y(j) = Pb(j);
    end
    y(n) = Pb(n);

    %Ux = y resolviendo para x
    x(n) = y(n)/U(n,n);
    for i = n-1:-1:1
        x(i) = (y(i) - (U(i,i+1:n) * x(i+1:n))) / U(i,i); %Esto es literal 
        %lo mismo que en Gauss con nombres de vars cambiadas
    end
end
