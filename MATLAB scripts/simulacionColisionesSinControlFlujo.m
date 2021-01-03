t0 = clock;
%Los segundos son el número de segundos necesarios para llegar a 50
%colisiones.
p = .1; %255 segundos
% p = .07; %575 segundos
% p = .05; %910 segundos
% p = .01; %950 segundos
% p = .005; %101520 segundos
transmisionesA = 0;
transmisionesB = 0;
colisiones = 0;
while etime(clock, t0) < 5 %Durante 5 segundos
  pause(.05);%Detenerse cada .05 segundos o 50 milisegundos hasta que se 
  %complete el loop se vuelve a empezar< por lo tanto, son 20 intentos cada
  %segundo.
  
  %Esto imprime en que momento vamos
  format shortg
  c = clock;
  disp(c(6)); %Para que solo despliegue los segundos.
  
  if(rand < p)
      A = 1;
  else 
      A = 0;
  end
  
  if(rand < p)
      B = 1;
  else 
      B = 0;
  end
  
  if(A == 1 && B == 0)
      transmisionesA = transmisionesA + 1;
  end
  
  if(B == 1 && A == 0)
      transmisionesB = transmisionesB + 1;
  end
  
  if(B == 1 && A == 1)
      colisiones = colisiones + 1;
  end
  
end

disp(colisiones);
disp(transmisionesA);
disp(transmisionesB);
tramasPerdidas = colisiones*2;
disp(tramasPerdidas);