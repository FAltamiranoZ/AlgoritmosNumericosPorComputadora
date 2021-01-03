function d = determinanteLU(A)
    [~,U,~,S] = lup(A);
    [~,n] = size(A);
    multU = 1;
    
    for i = 1 : n
        multU = multU*U(i,i); %Solo es la multiplicaci�n de la diagonal
        %porque el determinante de toda matriz triangular como L o U es la
        %multiplicaci�n de su diagonal, no tomamos L porque ser�a igual a 1
    end
    %determinanteA = determinanteU * determinanteP con determinante de P =
    %(-1)^s con s la cantidad de cambios que hice. Esto es necesario debido
    %a que un cambio de posici�n en la matriz si afecta al determinante,
    %cosa que en matrices triangulares solo se ve como un cambio de signo.
    d = multU *((-1)^S);
end