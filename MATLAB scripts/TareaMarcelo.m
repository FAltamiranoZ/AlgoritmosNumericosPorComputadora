%Tarea entregable viernes 29 de enero.
%Los números normalizados que existen tienen por default el bit implicito marcado en 1, razón por la cual no tomaremos en cuenta a 
%ese bit para calcular la cantidad de números normalizados totales; de la misma manera, tenemos que quitar 2 opciones de las que podríamos
%tener en la parte del exponente, debido a que un exponente con puros ceros se reserva para los ceros y los desnormalizados y un exponente 
%con puros unos se reserva para los infinitos y los nans. Debido a esto, la cantidad total de numeros normalizados que existen son:
n =(2)*(2^52)*(2^11-2); %números normalizados en total.
disp(n);

%Usando la función de MATLAB hex2dec, podemos convertir un número hexadecimal a decimal, tomando en cuenta que podemos darle como argumentos
%números, letras o celdas y MATLAB hace la transformación a formato doble de manera automática; además, si el valor supera el límite 
%establecido por flintmax, en ese caso la conversión puede no ser exacta.
hex2bin('3f847ae147ae1476')

%Problema3:
n = 11;
x =.5;
veces = 0:1:(n-1);

res = ones(1,n);
hs = ones(1,n);
h = 1;
actual=0;

for i = 1 : 1 : n
    hs(i)=hs(i)*h;
    previo=actual;
    actual=(ecuacionDif(x, h));
    res(i)= res(i)*abs((actual-previo)/actual);
    h = h/10;
end

loglog(hs,res);
xlabel('Valor de la H');
ylabel('Error');
title('Problema 3: Error de aproximación de la derivada');
grid on;

%No se puede poner nada que no sean funciones después de esto.

function res = ecuacion(x)
    res = (-.1*(x^4)-.15*(x^3)-.5*(x^2)-.25*(x)+1.2);
end

function res = ecuacionDif(x,h)
    res = (ecuacion(x+h)-ecuacion(x-h))/(2*h);
end

%%Problema 3 version de Marcelo, es decir, sin for:

function [h, fd, te] = dif(f, x, n)
%     funcionS = sym(f);
%     derivadaS = diff(funcionS);
%     derivada = matlabFunction(derivadaS);
%     valorVerdadero = derivada(x);
%     
%     h = 1;
%     
%     ss = zeros(1,n); %step size
%     fd = zeros(1,n); %derivada aprox
%     te = zeros(1,n); %Tamano error
%     
%     for i = 1:1:n
%         ss(i) = h;
%         fd(i) = (f(x+h)-f(x-h))/(2*h);
%         te(i) = abs(valorVerdadero -fd(i));
%         h = h/10;
%     end
    funcionS = sym(f);
    derivadaS = diff(funcionS);
    derivada = matlabFunction(derivadaS);
    valorVerdadero = derivada(x);
    i = 0:1:n-1;
    h = 1./10.^i;
    fd = (f(x+h)- f(x-h))./(2*h);
    te = abd(valorVerdadero - fd);
end