%Ejercicios de matrices.
A = [2,1;1,2]; %Recordar que el ; es para cambiar de columna
x = [1:2];
norm(x); %Tamaño del  vector, la norma.
atand(x(2)/x(1)); %arco tangente
a = pi/4;
R = [cos(a), sin(a); -sin(a), cos(a)];
A = gallery (3);%MATLAB tiene matrices pre hechas almacenadas
poly(A); %Nos trae el polinomio característico
%En este caso, lo que nos da es 1*(lamda^3) - 6 *(lambda ^2) + 11 *
%(lambda) - 6;
roots(poly(A));

A = magic (4); %Hace un cuadrado mágico de 4*4
A(1,2);
A(5); %Estos dos son lo mismo porque en el segundo caso recorre hacia abajo
%y luego se mueve hacia la derecha.
A(1 : 4, 3); %Del uno al 4 de la tercera columna
A(1:end, end-1);
A(:, end -1); %Son dos maneras de decir, todo de la última columna
max(A(:,3)) %Máximo del intervalo.
x = [1;2;3;4];
A(2,:)*x;

%Links útiles:
%https://la.mathworks.com/company/newsletters/articles/matrix-indexing-in-matlab.html
%https://www.khanacademy.org/math/precalculus/precalc-matrices/properties-of-matrix-multiplication/a/properties-of-matrix-multiplication
%https://comunidad.itam.mx/cursossharepoint/Licenciatura/LI_COM/LI_COM14105/201901licom14105-001/Materiales/MatrixDifferentiation.pdf