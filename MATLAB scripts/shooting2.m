%José Francisco Altamirano Zevallos

%Para hacer que funcionara, solo había que cambiar que en lugar de pasarle
%y1, le pasamos y2, e yz(2,end).
function dif = shooting2(f,t0,tf,y0,y2,h,s)
    yz0 = [y0;s];
    [~,yz] = ivps(f,t0,tf,yz0,h,5);
    dif = y2-yz(2,end);
end

