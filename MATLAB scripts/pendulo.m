% El problema del p�ndulo. Es lo mismo que lo que est� en el mlx, pero aqu�
% est� feo.
%theta'' = -g/l sin(theta)
l=1;

f = @(t,thw) [thw(2);-(9.81/l)*sin(thw(1))];
thw0=[pi/8;0];

[t,thw] = ivps(f,0,10,thw0,0.1,4);

plot(t,thw)
legend ('\theta','\omega');