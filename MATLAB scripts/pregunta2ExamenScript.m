pe = 200; pa = 1000; r = 1; g = 9.81;
%f = @(h) ((pi * (r ^ 3)) * (4 / 3) * pe) - ((pa.* ((pi * h)) ./ 3) * ((3 * r) - h));
%%vEsfera = (4/3) * r^3 * pi;
%%pEsfera = pe * vEsfera * g; %peso del fluido desplazado
%%Va = vEsfera - ((pi * h.^2) .* ((3 * r - h) / 3));
%%ff = pa * Va * g; %Fuerza flotación
%%f = @(h) pEsfera - ff; Esta es la buena
f = @(h) (4*pi*r^3/3)*(pa-pe) - pa*(pi*h.^2/3).*(3*r-h);

%interval = [0, 2];
interval = [0, 2*r];
fplot(f, interval)
hold on;
grid on;

fprintf('Biseccion');
[x, i] = FuncionBiseccion (f, 1.4, 1.6)