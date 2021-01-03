f = @(x) 2 * sin(x)  - (x.^2 / 10);

interval = [1, 2];
fplot(f, interval)

grid on;

fprintf('Newton - Raphson optimizacion \n');
[x, i, min] = optNR (f, 1.5) %Algo sigue fallando
%fminbnd (f, 1, 2) es esto pero propio de matlab, puedo traer format long;
%para mejorarlo.