%Modelo de caída libre usando la solución numérica de Euler.
%Con punto y coma lo declara, sin punto y coma lo imprime.
%Los índices empiezan en 1 %who tf knows why

global cd;   %Es necesario para poder usarlas en todas partes
global g;
global m;

%Una variable simbólica se declara con syms, para lo que sirve es que hace
%que lo declarado sea un símbolo, es decir, que su tipo es símbolo;
%para lo que esto sirve es que puede guardar un valor double, int e 
%inclusive una expresión. Es muy maleable, pero es más lento.
syms v(t) g cd m;

%Y = diff(X)hace lo de abajo, pero Y = diff(x) es diferentes a diff(x)
%Diff clacula la diferencia entre un número y otro: diff([1 4]) = 3, 
%Hacer diff(v,2) es como hacer diff(diff(v)), es decir, solo es el número
%de veces que se va a hacer.

%diff(x, y) diferencia la ecuacion x (es un simbolo) sobre la variable y; 
%es decir, diff(x^2+3y, y) = 3. diff(v, t, 2) sería d^2v/dt^2
%eqn = dv/dt g-(cd/m)*v^2, es la única manera de hacer ecuaciones
%diferenciales, por eso el ==
%Recordar que dx/dt k*t = e^k*e^(k*t) = C * e^(k*t) con C una constante
%cualquiera. Ya que al ser una ecuación diferencial se resuelve al integrar
%Dsolve resuelve ecuaciones diferenciales, si le das una condición,
%convierte las constantes cualquiera en la condición.
eqn = diff(v,t) == g - (cd/m)*v^2;
cond = v(0) == 0;
vSym(t) = dsolve(eqn, cond);

cd = .25;   % coeficiente de resistencia
g = 9.81;   % m/s^2 gravedad
m = 70;     % kg masa
tf = 20;   % s
h = 2;      % s Disminuyendo esto, aumento la precisión

%Descomentar esto la primera vez para que corra y comentarlo otra vez a la
%segunda para que corra bien.
% t = 0:h:tf;
% vt = ones(size(t)); 

%Hacer subs con un solo parámetro actualiza la variable, si yo hiciera y =
%x^2 y luego hiciera x = 2, y sigue siendo una ecuación, al hacer subs(y)
%entonces, y = 4.
vel = subs(vSym);
fplot(vel, [0,tf]); %Grafica en el eje x de 0 a tf.
%ylim([0 60]); %Define el eje y
axis([0 tf 0 (vt(10)*1.1)]); %Esta es otra manera de definir los ejes; esto
%debe de ejecutarse después de haber hecho el código normal.

hold on;

t = 0:h:tf;
%v = zeros (1, 10); %Inicializa el arreglo en cero
v = zeros (size(t)); %Lo mismo, pero con un tamaño de columna específico
size(t);    %Da en resultado 1, 11 porque es el número de renglones y el 
%de columnas respectivamente

%for i = 1:1:10 %Empieza en el 1, va de 1 en 1 y acaba en el 10


% for i = 1:1:length(v)-1
%     %v(i) = t(i); %v(i) = v[i]; de otro lenguaje
%     v(i+1) = v(i) + h*f(v(i));  % La función reemplaza esto (g-(cd/m)*v(i)^2);
% end 
%ESTO FUNCIONA, SOLO LO COMENTAMOS PARA PROBAR EL NUEVO MÉTODO DE EULER

% [t, v] = euler(f, 0, 10, 0, .1);
%Hace falta corregirle más cosas de las que dijo Marcelo pero euler y
%demás métodos su funcionan

plot(t,v)
hold on;

vt = ones(size(t)); %Velocidad terminal
vt = sqrt(m*g/cd)*vt;
plot (t,vt, "--y"); %Línea punteada

xlabel('Tiempo, s'); % Los label deben de ponerse después del plot.
ylabel('Velocidad, m/s');
title('Caída libre');
legend('Velocidad con diferenciales','Velocidad con función', 'Velocidad terminal')
grid on;

function a = f(v) %Esto solo se puede hacer en las versiones más nuevas, a es lo que regresa y v es lo que recibe.   
    global g;
    global cd;
    global m;
    a = g-(cd/m)*v^2;
end