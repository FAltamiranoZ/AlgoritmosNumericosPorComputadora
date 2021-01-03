%Máximo descenso regresa el punto mínimo de la función, lo que hace este
%código es graficar la función generada por la matriz que se esta queriendo
%optimizar y a partir de la gráfica, encontrar el punto mínimo. Esta es una
%solución analítica mientras que la otra es una solución computacional

%Una matriz positiva definida debe de ser simétrica (A = At), debe de
%cumplirse que x' * A * x > 0 y x ~= 0. Recordar que x' es transpuesta
%Si f(x) = (1/2)*(x')*(A)*(x) - b'*x + c entonces la derivada de f será A*x
%= b.
%Recordar que simplify(eq) regresa una ecuacion legible

%Demostrar que el valor de alfa es el que vamos a usar ahorita, VIENE como 
%pregunta en el examen.

A = [1,0;0,2];
b = [1;2];

%Función cuadrática
qf = @(A,b,x1,x2) (1/2) * (A(1,1) * x1 .^ 2 + (A(1,2) + A(2,1)) * x1 .* x2 + A(2,2) * x2 .^ 2) - (b(1) * x1 + b(2) * x2) + (1/2) * b' * (A \ b);
%Esto es (1/2)*x'*A*x - b'x + C (ya desarrollado)
%La ultima parte "(1/2) * b' * (A \ b)" es la C que hace que sea general.
x1 = 0:0.1:2;
x2 = 0:0.1:2;
[X1,X2] = meshgrid(x1,x2); %Lo que hace meshgrid es que hace una copia de
%x1 y x2, es decir, si x va de 1 a 3 y y de 1 a 5 entonces X1 y X2 seran
%una matriz de 5 * 3, donde todas las filas de x1 seran de 1 a 3 y en el
%caso de X2, todas las columnas seran de 1 a 5.

f = qf(A,b,X1,X2);
mesh(X1,X2, f); %Esto hace la primera grafica

xlabel ('x1');
ylabel('x2');
hold on;
%pause(5);
[cs, h] = contour(x1,x2,f); %Esto son las curvas de nivel
%pause(5);
[fx, fy] = gradient(f, .25); %calcula el gradiente en el punto .25
quiver (x1,x2, -fx, -fy); %Esto grafica las flechas generadas por gradient
hold off;

%minValue = min(min(f)); %da el valor minimo no la posicion del valor minimo
[col, i] = min(f); %regresa i = 11 porque es la posicion 11 en donde se 
%encuentra el valor mas pequeño
[~,jmin] = min(col); %saca la pos en j
imin = i(jmin); %saca la pos en 1
minValue = f(imin,jmin); %es lo mismo que el de arriba pero ahora se las 
%coordenadas