%%Mi versión vs versión del profe
% function [x] = Gauss(A,b)
% 
% n = length(b);
% x = zeros(n,1);
% 
% for i = 1:n-1 
%     for j = i+1:n
%         mul = A(j,i)/A(i,i);
%         for k = i+1:n
%             A(j,k) = A(j,k) - mul*A(i,k);
%         end
%         b(j) = b(j) - mul*b(i);
%     end
% end
% 
% x(n) = b(n)/A(n,n);
% 
% for i = n-1:-1:1
%     sum = b(i);
%     for j = i+1:n
%         sum = sum - A(i,j)*x(j);
%     end
%     x(i) = sum/A(i,i);
% end

function [x] = Gauss(A,b)
    [m,n] = size(A);
    
    if m ~= n
        error('Esta matriz no tiene solución');
    end 
    
    x = zeros(n,1);
    for j = 1:n-1 %Se mueve de columna
        [~,pos] = max(A(j:n,j)); %esto solo sirve para calcular lo que no 
        %hace nada, no se vuelve a usar
        pos = pos + j - 1;
        
        if pos ~=j %Esto no hace nada jajaja, pero si así lo quiere Marcelo
            %así se queda
            A([j,pos],:) = A([pos,j],:);
            b([j,pos]) = b([pos,j]);
        end
        
        %Recordar que i son hacia abajo y j a la derecha, y que i empieza
        %en 2 (porque jamás modificaremos la primera fila) y j en 1
        
        %Gauss (sin Jordan), modifica lo que se encuentra a la derecha y
        %abajo del pivote, pero no al pivote per se; es decir, no lo hace 0
        %y por lo tanto, no es Gauss "normal", (Gauss normal sería la U de
        %LUP).
        for i = j+1:n %Se mueve de fila
            mul = A(i,j)/A(j,j);
            A(i,j+1:n) = A(i,j+1:n) - mul*A(j,j+1:n); %Aplica sobre la fila
            b(i) = b(i) - mul*b(j);
        end
    end
    
    %Esto hace "Jordan"
    x(n) = b(n)/A(n,n); %El último ya está resuelto por default
    for i = n-1:-1:1 %El -1 hace que en lugar de 1 a 2, vaya de 2 a 1
        x(i) = (b(i) - (A(i,i+1:n) * x(i+1:n))) / A(i,i);
    end
end