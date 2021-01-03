function invA = inversaLU(A)
%Como a*a^-1 = identidad y como lo puedo hacer vector por vector para
%hacerlo más rápido entonces hago: A*a^-1 = id1, A*a^-2 = id2 y así hasta
%calcular todas, las cuales uno después.
%https://www.youtube.com/watch?v=MRHbcuh6EA8 5:32
    [~,n] = size(A);
    id = eye(n);
    invA = [];
    for i = 1:n
        invA = [invA, lupSolucion(A, id(:,i))]; %Es decir, se le va a pasar
        %id(:,1) como la b para que la trabaje así.
        %[L,U,P,~] = lup(A);
        %invA = [invA, lupCalcula(id(:,i), L, U, P)];
        %Esta para evitar calcular LUPS varias veces, es la que se imprime 
        %para entregar a Marcelo porque no existe jeje.
    end
end

