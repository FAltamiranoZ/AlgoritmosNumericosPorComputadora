v = 30;
r = 3;
f = @(h) (pi * h.^2) .* ((3 * r - h) / 3) - v;

%Para saber que intervalo hay que definir para las funciones, siempre se
%debe de graficar primero con valores de pequeños a grandes para ver dónde
%esta aproximadamente el 0 y usar intervalos que lo encierren, de usar
%muy grandes o muy pequeños empieza a explotar; por lo tanto,
%siempre se debe de hacer esto primero.

fprintf('Biseccion');
[x, i1] = FuncionBiseccion (f, 0, 3)
fprintf('Interpolacion');
[x, i2] = interpLin (f, 0, 3)
fprintf('Newton');
[x, i3] = newtonRaphson (f, 1.5)
fprintf('Secante');
[x, i4] = secante (f, 0, 3)
I = [i1, i2, i3, i4];
n = categorical({'Bisección', 'Interpolación', 'Newton', 'Secante'});
b = bar(n, I);
b.FaceColor = 'flat';
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
grid on;
xlabel('Funciones');
ylabel('Número de iteraciones');
title('Efectividad de las funciones');