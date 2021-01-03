function [L,U,P,S] = lup(A)
    %no se puede hacer normalmente L*U si A tiene 0 en alguno de los 
    %pivotes, por lo que es necesario intercambiar filas, cosa que 
    %justamente se registrá en P de tal manera que P * A = L * U.
    [m,n]=size(A);
    S = 0;
    
    if m ~= n
        error('Esta matriz no tiene solución');
    end 
    
    U = A;
    L = eye(n);
    P = eye(n);
    
     for j=1 : n-1
        [~,pos] = max(U(j:n,j)); %La posicion del valor máximo en el vector
        pos = pos+j-1;
        
        if pos ~= j %Esto cambia posiciones, still dont know why tho.
            U([j,pos],j:n) = U([pos,j],j:n);
            L([j,pos],1:j-1) = L([pos,j],1:j-1);
            P([j,pos],:) = P([pos,j],:);
            S = S + 1;
        end
        
        for i= j+1:n %Esto es el método
            L(i,j) = U(i,j)/U(j,j); %Pone el multiplicador sobre el pivote
            %que lo generó
            U(i,j:n) = U(i,j:n)-L(i,j)*U(j,j:n); %Gauss "normal". Usamos la
            %L para evitarnos hacer la division otra vez.
        end
        
     end
end

