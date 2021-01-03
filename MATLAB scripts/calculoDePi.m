n = 100000;
res = 0;

%Esta es una buena opción, pero queremos minimizar el error.
%for i = 0:1:n
%    res = res +((-1)^i)/((2*i)+1);
%end
%res = 4 * res;
%disp(res);

errorMax = .00001;
%error = 10;
%i = 0;
%Esto también funciona, pero queremos que el error máximo se calcule solo
%para que funcione para todo tipo de cálculo
%while(errorMax<error)
%    res = res +((-1)^i)/((2*i)+1);
%    error = abs((pi-res*4)/pi); %Cada iteración va disminuyendo el error 
%    %hasta llegar al deseado.
%    i= i + 1;
%end
%res = 4*res;
%disp(res);
%disp(error);
%disp(i);

previo = 0;
actual = 1;
i = 1;
while(errorMax < (abs((actual-previo)/actual)))
    previo = actual;
    actual = previo +((-1)^i)/((2*i)+1);
    i= i + 1;
end
disp(actual*4);
disp(i);
