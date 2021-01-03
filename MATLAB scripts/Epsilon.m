%Recordar que e en matlab es x10 ^ a la lo que siga.

%En la ventana de comandos, se pueden poner format hex (regresa con format 
%long) para sacar el resultado en hexadecimal; Inf para el valor de 
%infinito y NaN para ver el resultado que se da en operaciones no numéricas
%(Es una constante).
%También se puede poner realmax y realmin para los valores
%correspondientes.

%La manera de alcanzar el realmax con binarios se usa:
%(1 + 1-2^(-52))*(2^1023)

%Cálculo de epsilon
%Es la precisión relativa de la máquina
%Es decir, si yo sumo 1 + eps me da 1, cualquier número más chico que eps
%para ese número no se suma, si es mayor entonces si se suma.
%Se puede aplicar eps(a cualquier número que sea potencia de 2) y se va
%viendo como entre mayor sea el número, mayor será el error.

x = 1;
while (1 < (1 + x / 2))
    x = x/2;
end
disp(x); %Esto es eps

y = 0;
for i=1:10
    y = y + .1;
end
disp (y);
%isequal(y, 1)
y == 1; %Esto regresa un valor lógico entre 1 y 0, es decir, booleano; da 
%falso porque .1 no se puede representar de manera exacta.

vector = 0 : .1 : 1;
disp(vector)
vector(11) == 1; %Este es verdadero porque matlab hace el ajuste solo

cero = 1 - .9 - .1;
cero == 0; %Esto da falso por lo mismo, lo cual nos dice que para hacer 
%comparaciones de, parar el for cuando llegue a 0 es incorrecto, hay que
%hacer aproximaciones con el epsilon para evitar que sea un loop eterno.

%Por ejemplo, tomando un número más pequeño que eps, por decir s1, y lo
%sumo, claramente no aparecerá.
s1 = 1*10^-16;
1 + s1;

%Al hacer (2^53 + 1) - 2^53, no tomará en cuenta el 1, porque el 1 es muy
%chiquito relativamente al 2^53; es decir, el error que no se toma en
%cuenta es relativo al numero. ES POR ESO QUE EL EPS AUMENTA SEGÚN AUMENTA
%EL NÚMERO.
%Entonces, como todo número esta conformado por 52 bits, todo aquello que
%sea de 53 bits será ignorado; ese, es el rango de error.

b = 1e-16 + 1 - 1e-16;
c = 1e-16 - 1e-16 + 1;
%Es decir, aquí el orden de los factores si altera el producto, así que
%siempre tenemos que hacerlas en órden para evitar perder números.