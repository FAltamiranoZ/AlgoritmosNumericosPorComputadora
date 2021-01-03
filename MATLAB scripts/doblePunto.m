%Solución NO Marcelística de la tarea
s= '3fe921fb54442d18';

hex2num(s) %Esto ya me da el resultado

%Esto es para hacer el resultado a manita
e = hex2dec(s(1:3)); %Los primeros 3 del hexadecimal me regresan el exponente.
re = e - ((2^10)-1);
f = s(4:end);
f2 = hexToBinaryVector(f);
tamV = size(f2); %Toda esta parte del tamaño es importante porque me 
%podrían dar la Mantissa sin la parte de la izquierda, pq son puros 0 y por
%lo tanto, desde un punto de vista lineal no afectan.
tam = tamV(2);
tamR = 52 - tam + 1;
i = tamR:1:52;
exponentes = 1./2.^i;
m = f2.*exponentes;
mantissa = 1 + sum(m);
res = (2 ^ re) * (mantissa) %Recordar cambiar el signo, se puede checar en f2.

%%Notas extras
%64 ceros = 0; si en el exponente hay puros 1 y 0 en lo demas entonces es
%inf; si en el exponente hay puros 1 y en todo lo demas excepto en la
%casilla 64 de izquierda a derecha entonces es NAN.
% exp va de -1022 a 1023, no de -1023 a 1024 por los reservados.