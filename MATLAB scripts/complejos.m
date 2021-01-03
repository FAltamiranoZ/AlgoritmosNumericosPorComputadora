y = @(x) x.^2 + 1;

fplot (y, [-4, 4]);
grid on;
x = sqrt(-1); %Lo regresa en formato polar.
a = 2 + 3i; %tambien se puede poner j en lugar de i.
%[1 0 1] es un vector horizontal = [1, 0, 1] y si se hace [1 ; 0; 1] sale
%en vertical al hacer a' sale transpuesta. Al hacer p = [2 6 -43] también 
%se hace un polinomio de 2x^2 + 6x - 43 al que le puedo hacer roots (p) y
%así para las raíces.
%fzero(funcion, numero cercano) halla las raíces reales de las funciones.
%Si a es un numero complejo, a' es su conjugado y abs(a) da la norma; es
%decir, |a|. angle(a) saca el ángulo de la representación polar y real(a),
%imag(a) da las partes reales e imaginarias. abs(a) * exp(i*angle(a)) == a
% (abs(a))^n * (exp(i * n * angle(a))) es una manera de elevar a la
% potencia n. ES D' MOIVRE

t = 0:255;
z1 = exp(1i * 1 * (2 * pi / 256)* t); %A pesar de que en esta parte pude
%haberlo dejado como i para representar la parte imaginaria, esto causa
%confusión, por lo que lo escribiré como 1i
plot( t, real(z1))%Como esta es la parte real, entonces va a graficar el
%coseno, y en la imag el sen, porque cada punto de t tiene una parte real y
%una imaginaria.
hold on;
plot(t , imag(z1))

z2 = exp(1i * 2 * (2 * pi / 256)* t);
plot( t, real(z2))
hold on;
plot(t , imag(z2))