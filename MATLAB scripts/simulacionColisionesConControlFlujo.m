t0 = clock;
p = .1;
% p = .07;
% p = .05;
% p = .01;
% p = .005;
transmisionesA = 0;
transmisionesB = 0;
colisiones = 0;
retransmisionesA = 0;
retransmisionesAck = 0;
tramasPerdidasA = 0;
tramasPerdidasB = 0;
ack = 0;
retransmisionesGlobal = 0;
while etime(clock, t0) < 5 %Durante 5 segundos
  pause(.05);%Detenerse cada .05 segundos o 50 milisegundos hasta que se 
  %complete el loop se vuelve a empezar< por lo tanto, son 20 intentos cada
  %segundo.
  
  %Esto imprime en que momento vamos
  format shortg
  c = clock;
  disp(c(6)); %Para que solo despliegue los segundos.
  
  if (retransmisionesA == 0)
      if (ack == 0)
        if(rand < p)
              A = 1;
        else 
              A = 0;
        end
      else
          A = 0; %Si hay un ack en camino entonces A no transmite por el 
          %stop and wait
      end
  else
      A = 1; %Si hay una retransmisión, A lo retransmite inmediatamente
  end
  
  if(rand < p)
      B = 1;
  else 
      B = 0;
  end
  
  if(A == 1 && B == 0 && ack == 0) %Llega a C y se manda un ack
      ack = 1;
  end
  
  if(A == 1 && B == 1 && ack == 0)
      colisiones = colisiones + 1;
      retransmisionesA = retransmisionesA + 1;
      retransmisionesGlobal = retransmisionesGlobal + 1;
      tramasPerdidasB = tramasPerdidasB + 1;
  end
  
  if(A == 0 && B == 0 && ack == 1)
      transmisionesA = transmisionesA + 1;
      ack = 0;
      retransmisionesA = 0;
  end
  
  if(A == 0 && B == 1 && ack == 1)
      colisiones = colisiones + 1;
      retransmisionesAck = retransmisionesAck + 1;
      retransmisionesGlobal = retransmisionesGlobal + 1;
      tramasPerdidasB = tramasPerdidasB + 1;
  end
  
  if (retransmisionesA == 3)
      retransmisionesA = 0;
      tramasPerdidasA = tramasPerdidasA + 1;
  end
  
  if (ack == 1)
      retransmisionesA = 0;
  end
  
  if (retransmisionesAck == 3)
      retransmisionesAck = 0;
      tramasPerdidasA = tramasPerdidasA + 1;
  end
  
end

disp(colisiones);
disp(transmisionesA);
disp(transmisionesB);
disp(tramasPerdidasA);
disp(tramasPerdidasB);
tramasPerdidas = tramasPerdidasA + tramasPerdidasB;
disp(tramasPerdidas);
disp(retransmisionesGlobal);