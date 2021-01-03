%ecuaciones de primer orden
%ivps (f, t0, tf, y0, h, solver)
%el resto (f, t0, y0, h, tf)

% a) y' = t
% b) y' = t^2*y
% c) y' = 2*(t+1)*y

%----------------------------------Parte 1---------------------------------
f = @(t,y) t^2*y;

[t,y] = ivps(f,0,2,1,0.1,4);
[t,y] = trapecio(f,0,1,.1,2);

plot(t,y);

%----------------------------------Parte 2---------------------------------
%Con estos no funcionan los métodos de euler y demás que están por
%separado, porque no están hechos para más de una ecuación.
% f = @(t,y1y2) [-0.5*y1y2(1);
%                4 - 0.3*y1y2(2) - 0.1*y1y2(1)];
% y1y20=[4;6];

%[t,y1y2] = ivps(f,0,2,y1y20,0.5,1);

% plot(t,y1y2)
% legend ('y1','y2');
