%-% �ndice
%Montecarlo usa cosas de proba y genera un area en la que cuenta los puntos
%de dentro y los de fuera.

%Calculo de Pi calcula pi (duh) pero lo hace sin epsilon, tomar eso en
%cuenta.

%Tarea ISR Lectura tiene como cargar los datos de excel

%TareaMarcelo calcula el error en la derivada

%Doble punto tiene toda la info sobre normalizados.

%Paracaidista dice como hacer una ecuaci�n diferencial y como hacer
%graficas normales.

%Bisecci�n dice como hacer un print con formato, aunque el while que
%hicimos es poco efectivo, se puede mejorar.

%Newton Raphson y secante estan hechas de la manera que Marcelo quiere; es
%decir, con las tolerancias correctas y los do while.

%Optimizaci�n �urea dice que hacer en caso de que no tenga como hacer una tasa para
%la tolerancia.

%Interpolaci�n de Newton tiene como importar una funci�n y convertirla a 
%simb�lica y viceversa.

%Recordar que Newton y �urea buscan m�nimos y que bisecci�n, secante,
%interpolaci�n y raphson buscan ra�ces.

%En esfera, caida libre segura, y aurea intento ejecuto las funciones
%especificadas. ES MUY IMPORTANTE que la funci�n reciba datos que sean muy
%cercanos a lo que se busca, para saber que datos son cercanos se recomienda
%graficar antes la funci�n en un intervalo definido para definir los
%puntos. Adem�s, es necesario para generar funciones el dejarlas igualadas
%a 0, no despejarlas. En esfera tambi�n se pone como hacer una gr�fica de
%barras.



%%Notas varias
%Para cualquier script, al declarar una funci�n no se puede hacer nada m�s
%que declarar m�s funciones debajo.
global q;
q = 23; %Esta es la manera en la que se hacen variables que puedan 
%recuperar las funciones que esten escritas en el script.
syms w; %Hace que w pueda guardar lo que sea, inclusive texto. Suele usarse
%para derivar o cosas por el estilo.
x = rand (n, m); %Genera un arreglo de numeros entre 0 y 1 de n filas y m 
%columnas. de igual manera con ones() y zeros()
sum(x); %Suma todos los elementos del vector
x = y <=z; %Genera un vector x con los puntos del vector y que sean menores
%que la constante z
a = [x, y, z]; %Genera un arreglo con los elementos x, y, z

disp(x); %Si declaras x como un vector as�: 
%['El salario bruto es: ', num2str(bruto), ' y el nivel: ', num2str(nivel)]
%lo imprime de manera bonita, num2str es necesario.
pi; %regresa el valor de pi.
hex2num(s);
hex2dec(s);
hexToBinaryVector(s);
%sea r un arreglo r(k) me da el k valor del arreglo.
%Se puede escribir realmax, realmin, Inf, NaN en la ventana para conseguir
%sus valores, o realmax en binarios se hace con (1 + 1-2^(-52))*(2^1023)
%Eps aumenta segun el numero y viceversa, por ello debe de ser adaptable.
%eps es de 52 bits, por lo que cualquier cosa de 53 es ignorado.
%1e-16 es 1 * 10 ^ (-16).