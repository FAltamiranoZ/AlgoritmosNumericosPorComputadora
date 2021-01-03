%Si IVP era initial value problem , BVP es boundary value problem. A lo que
%se refiere esto, es que nos dan además de un punto inicial conocido, un
%punto conocido en otra parte de la ecuación.
%ODE es Ecuacion diferencial ordinaria

%El planteamiento del problema está en el cuaderno.
t0 = 0;
tf = 1;
y0 = 1;
y1 = 3;
N = 100;
h = (tf-t0)/(N-1);
M = [0,1;4,0];
f = @(t,yz) M*yz;
g = @(s) shooting1(f,t0,tf,y0,y1,h,s);

%s = -.4 Esta es la primera aproximación. Puse el número 2 porque le 
%pregunte a mis huevos y dijeron que simon, después le fui variando hasta 
%hallar lo más cercano al 3 del final, por eso va en -.4
[z0,i] = FuncionBiseccion(g,-5,0); %Usamos esto para evitar aproximar a 
%mano y andarle preguntando a mis huevos.

%Lo que sucede es que bisección va a evaluar shooting con una s de -5 (f(a))
%y una s de -2.5 ((a + b)/2) (f(x)) y a partir de ahí va a tratar que f(x) 
%sea igual a 0. Como lo que regresa shooting es la dif entre el valor
%conocido en el punto y el valor adivinado en el punto. f(x) va a ser 0
%cuando ya no haya diferencia, siendo entonces que con ello podemos
%aproximar el punto inicial en z. Con lo que podemos resolver el resto con
%una ivps normal.

yz0 = [y0,z0];

[t,yz] = ivps (f, t0, tf, yz0, h, 4);
plot(t,yz(1,:));    
hold on;
plot(t,yz(2,:));


%Ahora con diferencias finitas
%Como teníamos que y'' -4y = 0 para el problema anterior, entonces para
%convertirlo a diferencias finitas, lo que se hace es:
%(yi-1 - 2yi + yi+1)/h^2 - 4yi = 0
%Es decir, cambiamos la y'' por la fórmula de arriba; lo que prosigue, es
%simplemente dejar todo en términos de A*yi-1 + B*yi + C*yi+1 = 0. En este
%caso, A se repetirá en toda la fila e, B en toda la F y C en toda la G.
%Como en este caso en especifico A,C = 1, entonces es una simple columna de
%unos; por ellos, lo podemos resolver usando tridiag.
r = zeros(N-2,1);
r(1) = -1;
r(end) = -3;
e = ones(N - 2,1);
f =  (- (2 + 4 * h^2))*ones(N - 2,1);
g = ones(N - 2,1);
w = tridiag(e,f,g,r);
%plot(w)





