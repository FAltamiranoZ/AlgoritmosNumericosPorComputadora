n = 100000;
cont = 0;

x = rand (1,n); %Genera n�meros al azar del 0 al 1, siendo los par�metros
%el n�mero de filas y columnas respectivamente.
y = rand (1,n);
r2 = x.^2 + y.^2; % Se necesita el punto para poder elevar a una potencia 
%a una matriz.
dentro = r2 <=1;
fuera = r2 >1;
p = sum(dentro)/n; %Promedio
de = sqrt((sum((r2-p).^2))/n);%Desviaci�n estandar
ee = de/(sqrt(p));%Error estandar
me = 1.96*ee; %Margen de error, se usa 1.96 por el intervalo de 
%confianza de .95; sigue una distribuci�n normal.
li = p - me; %L�mite inferior
ls = p + me; %L�mite superior
ic = [li, ls]; %Intervalo de confianza

plot(x(dentro), y(dentro), 'b.'); %blue, point
hold on;
plot(x(fuera), y(fuera), 'r.');

%for i = 1 : n Versi�n inefectiva
%   if x(i)^2 + y(i)^2 <=1
%       cont = cont+1;
%   end
%end
%p = cont / n;
%Hay que hallar un intervalo de confianza del 95%, tarea.

disp(4*p); %Display el n�mero de cosas dentro.
disp(ic);

%Versi�n 2

x=rand(1,n);
y=sqrt(1-x.^2);
disp(mean(y)*4);