function ydot = fSistSol(~,y)
  global G m;                 
  r = y(1:3,:); %Radio
  v = y(4:6,:); %Velocidad
  dr = r(:,2) - r(:,1);  %En este ejemplo siempre son 0 porque la tierra 
  %esta en el centro y no se ve afectado por la masa del satelite.
  u = dr / norm(dr);    %Recordar que norm es la euclideana, suma todos los
  %elementos elevados al cuadrado y al final saca la raíz        
  dr2 = norm(dr)^2;         	 
  F = (G*m(1)*m(2)/dr2) * u;    %Esta es la fórmula básica de la constante 
  %de gravitación universal pero despejada para Fuerza, donde u es la
  %dirección y dr2 hay que recordar que ya es la norma al cuadrado
  a = [F/m(1), - F/m(2)];       
  ydot = [v;a];
end