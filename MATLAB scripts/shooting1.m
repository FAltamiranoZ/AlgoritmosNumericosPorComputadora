%Shooting transforma un BVP en un IVP.
%La s me la va a dar otro método como bisección, por ejemplo.

function dif = shooting1(f,t0,tf,y0,y1,h,s)
    %Puedo evaluar cuanto vale y en 0, pero no z en 0, por eso está la 
    %adivinanza con el s. Esto se debe a que tengo un valor de boundary,
    %pero no me dieron el otro inicial que necesitaba; Eso es lo que voy a
    %sacar aquí.
    yz0 = [y0;s];
    [t,yz] = ivps(f,t0,tf,yz0,h,5);
    dif = y1-yz(1,end); %Primer valor de la última columna, ve la 
    %diferencia entre el valor que nos dieron y el aproximado por la
    %función; si es 0 la diferencia, se detiene bisección y regresa el
    %valor inicial aproximado
end

