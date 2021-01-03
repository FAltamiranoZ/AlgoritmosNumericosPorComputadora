%Este es el que les pase para que hicieran ISRLectura, es lo mismo pero más
%bonito

global neto;
global cuotaFija;
global limiteInf;
global porcentaje;
global bruto;
nivel;
neto = 500; %%Puse este numero para probar

if (.01 <= neto) && (neto <= 567.41)
    nivel = 1; cuotaFija = 0; limiteInf = .01; porcentaje = .0192;
end

if (567.42 <= neto) && (neto <= 4621.35)
    nivel = 2; cuotaFija = 11.11; limiteInf = 578.53; porcentaje = .064;
end

if (4621.36 <= neto) && (neto <= 7936.24)
    nivel = 3; cuotaFija = 288.33; limiteInf = 4910.19; porcentaje = .1088;
end

if (7936.25 <= neto) && (neto <= 9113.81)
    nivel = 4; cuotaFija = 692.96; limiteInf = 8629.21; porcentaje = .016;
end

if (9113.82 <= neto) && (neto <= 10738.07)
    nivel = 5; cuotaFija = 917.26; limiteInf = 10031.08; porcentaje = .1792;
end

if (10738.08 <= neto) && (neto <= 20841.87)
    nivel = 6; cuotaFija = 1271.87; limiteInf = 12009.95; porcentaje = .2136;
end

if (20841.88 <= neto) && (neto <= 31014.95)
    nivel = 7; cuotaFija = 3880.44; limiteInf = 24222.32; porcentaje = .2352;
end

if (31014.96 <= neto) && (neto <= 55311.81)
    nivel = 8; cuotaFija = 7162.74; limiteInf = 38177.70; porcentaje = .3;
end

if (55311.82 <= neto) && (neto <= 71832.98)
    nivel = 9; cuotaFija = 17575.69; limiteInf = 72887.51; porcentaje = .32;
end

if (71832.99 <= neto) && (neto <= 200114.98)
    nivel = 10; cuotaFija = 25350.35; limiteInf = 97183.34; porcentaje = .34;
end

if (200114.99 <= neto)
    nivel = 11; cuotaFija = 91435.02; limiteInf = 291550.01; porcentaje = .35;
end

bruto = calculaBruto (neto, cuotaFija, limiteInf, porcentaje);

impresion = ['El salario bruto es: ', num2str(bruto), ' y el nivel: ', num2str(nivel)];
disp (impresion);

function res = calculaBruto(neto, cuotaFija, limiteInf, porcentaje)
    res = ((neto + cuotaFija)-(limiteInf*porcentaje))/(1-porcentaje);
end