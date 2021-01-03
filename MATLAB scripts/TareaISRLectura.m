%%José Francisco Altamirano Zevallos

global neto;
global cuotaFija;
global limiteInf;
global porcentaje;
global bruto;
global nivel;

neto = 1000;

num = xlsread('ISR2018.xlsx');
lInf = num(:,1); %Regresa toda la columna de la primera fila
lSup = num(:,2);
cF = num(:,3);
exLinf = num(:,4);
i = 1;
alto = false;

while (i<12 && alto == false)
    if(i == 11)
        alto = true;
        nivel = i; cuotaFija = cF(i); limiteInf = lInf(i); porcentaje = exLinf(i);
    end
    if (lInf(i) <= neto) && (neto <= lSup(i))
        nivel = i; cuotaFija = cF(i); limiteInf = lInf(i); porcentaje = exLinf(i);
        alto = true;
    else
        i = i + 1;
    end
end

bruto = calculaBruto (neto, cuotaFija, limiteInf, porcentaje);
 
impresion = ['El salario bruto es: ', num2str(bruto), ' y el nivel: ', num2str(nivel)];
disp (impresion);

function res = calculaBruto(neto, cuotaFija, limiteInf, porcentaje)
    res = ((neto + cuotaFija)-(limiteInf*porcentaje))/(1-porcentaje);
end