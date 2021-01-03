%Este código es de Marcelo, y yo solo digo que si tiene comentarios, jejeje
%saludos.

% Un satélite orbitando la Tierra
% La Tierra en el origen (inicialmente)
% El satélite tiene una masa de 20 toneladas 
% y se encuentra a 108 km de altura (eje x)
% Los vectores tienen los datos [Tierra, satélite]
  
% y  = [r;v] 
% y' = [v;a]
% dy/dt = f(t,y)

global G m;
G = 6.67408E-11;              % m3 kg^-1 s^-2 Esta es la constante de 
%gravitación universal, que determina la intensidad de fuerza gravitatoria
%entre 2 cuerpos https://es.wikipedia.org/wiki/Constante_de_gravitaci%C3%B3n_universal
%Estamos usando el valor de Newton, no el más nuevo ni el de Einstein; para
%más información https://es.wikipedia.org/wiki/Intensidad_del_campo_gravitatorio
mT = 5.9736E+24;              % masa de la Tiera en kilogramos
ms = 7.3490e+22;                   % masa del satélite en kilogramos
m = [mT, ms];                 %Vector con las masas

rT = 6371e3;                        % radio de la Tierra m
hs = 384400e3;                      % altura común de un satélite 
%geoestacionario m, http://bibing.us.es/proyectos/abreproy/12114/fichero/Memoria%252FMemoria.pdf
r0 = [ [0;0;0], [rT+hs;0;0] ];      %rT + hs es la distancia desde el 
%centro de la tierra hasta al satélite. Esta dividido de esta manera porque
%el primer vector es la posición de la tierra en x, y, z. y el otro el del
%satélite 
vs = sqrt(G * m(1)/r0(1,2)); %Esta parte sale de que m.v2 / r = G M m / r2; 
%es decir, de que la fuerza centripeta debe de estar igualada a la fuerza
%de atracción gravitatoria
%Problema 3 de la segunda numeración: https://jaespimon.wordpress.com/tag/gravitacion/
%Fuerza centrípeta: http://hyperphysics.phy-astr.gsu.edu/hbasees/cf.html
v0 = [ [0;0;0], [0;vs;0] ]; %misma idea que en r0

ws = vs/(rT+hs); %Estamos asumiendo que es movimiento circular uniforme, 
%por lo que la fórmula para la velocidad angular es ws = (2*pi)/T = v/r. En
%esta fórmula, T es el periodo (tiempo en dar una vuelta completa). 
%https://es.wikipedia.org/wiki/Velocidad_angular	
T = (2*pi)/ws;
h = 60;  %1 paso cada 60 segundos               
nv = 4; %numero de vueltas                
Nk = nv*ceil(T/h);  %ceil(x) es una función techo aplicada sobre x    
pos = zeros(6,Nk+1);    %Hace 6 filas y Nk+1 columnas
pos(:,1) = [r0(:,1);r0(:,2)]; %Convierte las 2 columnas de r0 a 1 y la 
%copia en la primera columna

y = [r0;v0]; %Se hace un solo vector de 2 columnas y 12 filas, estando 
%primero r0 y luego v0. Nunca se usa la primera columna
%Runge Kutta 4
for t=2:Nk+1 %A pesar de que no se le pase t a la función, va a ser 
    %necesario después para la generalización de IVPS. NO QUITAR.
  s1 = f(t,y);
  s2 = f(t+h/2,y+(h/2)*s1);
  s3 = f(t+h/2,y+(h/2)*s2);
  s4 = f(t+h, y+h*s3);
  slope = (s1+2*s2+2*s3+s4)/6;
  %disp(y);
  y = y + slope*h;

  r = y(1:3,:); 
  pos(:,t) = [r(:,1);r(:,2)];         
end

plot3(pos(1,:),pos(2,:),pos(3,:),'ob');
hold on;
plot3(pos(4,:),pos(5,:),pos(6,:),'.k');
grid minor;
 
function ydot = f(~,y)
  global G m;                 
  r = y(1:3,:); %Radio
  v = y(4:6,:); %Velocidad
  dr = r(:,2) - r(:,1);  %En este ejemplo siempre son 0 porque la tierra 
  %esta en el centro y no se ve afectado por la masa del satelite.
  u = dr / norm(dr);    %Recordar que norm es la euclideana, suma todos los
  %elementos elevados al cuadrado y al final saca la raíz        
  dr2 = norm(dr)^2;         	 
  F = (G*m(1)*m(2)/dr2) * u;    %Esta es la fórmula básica de la constante 
  %de gravitación universal pero despejada para Fuerza, donde u es la
  %dirección y dr2 hay que recordar que ya es la norma al cuadrado
  a = [F/m(1), - F/m(2)];       
  ydot = [v;a];
end
