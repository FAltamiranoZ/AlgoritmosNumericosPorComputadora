%La velocidad en caida libre no debe de pasar de 36 m/s a los 4 s
%V = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t)
v = 33;
t = 4;
cd = .25;
g = 9.81;
f = @(m) sqrt(g*m/cd).*tanh(sqrt(g*cd./m)*t) - v; %La m es un vector, por lo 
%que es necesario poner el . para las operaciones que incluyan vectores con
%división, ya que la división no es una operación reconocida en algebra
%lineal de vectores. En el caso del primer punto, tanto el primer operando
%como el segundo son vectores, por lo que es necesario poner el punto para
%que multiplique cada elemento con el que le pertenece y no considere
%alguno de los 2 como constante.

%f2 = @(x) sin(x^2);
%fPrima = @(m) diff(m^2 + m, m);
%syms f(x)
%f(x) = sin(x^2);
%df = diff(f,x)
%syms f22(x)
%f22(x) = f2;
%df2 = diff(f22,x)


interval = [50, 150];
fplot(f, interval)
grid on;

%Los parámetros que se pasan a las funciones de debajo deberían de ser los
%mismos del intervalo para la maxima funcionalidad; no se hace esto ahorita
%para experimentar. Se puede buffear aun más la funcionalidad al darle un
%intervalo muy cercano a donde se hace 0
fprintf('Biseccion');
[x, i] = FuncionBiseccion (f, 10, 200)
fprintf('Interpolacion');
[x, i] = interpLin (f, 10, 200)
fprintf('Newton');
[x, i] = newtonRaphson (f, 200)
fprintf('Secante');
[x, i] = secante (f, 10, 200)
%dependiendo de la funcion, es la efectividad del metodo; es decir, en este
%caso interpLin es mejor y más rápido si la función es más horizontal y es
%peor si la recta es más vertical.
