%Solución analítica de ecuaciones diferenciales.
%Todas estan en el cuaderno después del repaso del primer parcial.
syms y(t)
%Separación de variables 
%y' = cy;
%y(0) = y0 = 3;
c = 2;
%Es homogénea si se puede igualar a 0 y no depende de otra cosa.
eqn = diff(y,t) == c * y;
cnd = y(0) == 3;
yG = dsolve(eqn); %Da la solución general
yP = dsolve(eqn,cnd); %Da la solución en particular
fplot(yP, [0 2]);
xlabel('t');
ylabel('y');
title('dy/dt=cy; y(0) = 3');
%hold on;

%Otros ejercicios:

%c = 4;
eqn = diff(y,t) == -2*t*y;
cnd = y(0) == 4;
yG = dsolve(eqn);
yP = dsolve(eqn,cnd);


%c = -2;
eqn = diff(y,t) == y^2;
cnd = y(1) == 1;
yG = dsolve(eqn);
yP = dsolve(eqn,cnd);



eqn = diff(y,t) == -4/t - y/t;
cnd = y(1) == 0;
yG = dsolve(eqn);
yP = dsolve(eqn,cnd);
%Factor de integración
syms t y C;
funcion = (y/t) + 4/t;
integracion = int(1/t);
mult = exp(integracion);
ecuacion = mult * funcion;
eqn = int(ecuacion, t) == C;
yG = solve(eqn, y);
const = solve(subs(yG, t, 1), C);
yP = subs(yG, C, const);
%Método general
%dy/dt = (-y-4)/t -> (-y-4)*dt - t*dy = 0
%Sea M = -y-4, N = -t -> parcial de M sobre y y de N sobre t = -1, -1; por
%lo tanto, tienen una solución especifica.
%Como F = -t*y + 4*t +C1 = C2, -t * y + 4 * t = C2 - C1 con C2-C1 = k.
%Entonces-t*y +4*t = k que es = yG

syms x(t)%Esto es vital
eqn = diff(x,t) == -t/x;
cnd = x(0) == 3;
xG = dsolve(eqn)
xP = dsolve(eqn,cnd)
fplot(xP, [-3 3]);
hold on;

cnd = x(0) == -3; %Hago 2 porque tiene 2 soluciones.
xP = dsolve(eqn,cnd);
fplot(xP, [-3 3]);
axis equal square;
grid on;
