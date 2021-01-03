%Salió de aquí https://es.scribd.com/document/225415654/Algoritmo-Matlab-Del-Sistema-Solar-en-Miniatura
%Pinche Cesar ¬¬

clear 
clc 
figure(1)

xmer=[]; %Vector posicion inicial de Mercurio
xt=[]; %Vector posicion inicial de la Tierra
xj=[]; %Vector posicion inicial de Jupiter
xn=[]; %Vector posicion inicial de Neptuno

vmer=[]; %Vector velocidad inicial de Mercurio
vt=[]; %Vector velocidad inicial de la Tierra
vj=[]; %Vector velocidad inicial de Jupiter
vn=[]; %Vector velocidad inicial de Neptuno 


F1=[]; %Vector fuerza entre Mercurio y el Sol
F3=[]; %Vector fuerza entre la Tierra y el Sol
F5=[]; %Vector fuerza entre Jupiter y el Sol
F8=[]; %Vector fuerza entre Neptuno y el Sol

est1=[]; %Vector grafica de la orbita de Mercurio
est3=[]; %Vector grafica de la orbita de la Tierra
est5=[]; %Vector grafica de la orbita de Jupiter
est8=[]; %Vector grafica de la orbita de Neptuno

M=1e20; %Masa M del Sol 
mmer=0.4; %Masa mmer de Mercurio
mt=1; %Masa mt de la Tierra
mj=10; %Masa mj de Jupiter 
mn=7; %Masa mn de Neptuno

G=6.67e-11; %Constante gravitacional 
h=0.01; %Paso de integracion

xmer=[-1e3;0]; %Posicion inicial de Mercurio
xt=[-1e3;400]; %Posicion inicial de la Tierra
xj=[-1e3;1000]; %Posicion inicial de Jupiter
xn=[-1e3;1500]; %Posicion inicial de Neptuno

vmer=[0;-2e3]; %Velocidad inicial de Mercurio
vt=[0;-2e3]; %Velocidad inicial de la Tierra
vj=[0;-2e3]; %Velocidad inicial de Jupiter
vn=[0;-2e3]; %Velocidad inicial de Neptuno

F1=-G*(mmer*M/norm(xmer)^2)*(xmer/norm(xmer)); %Resultado Fuerza Gravitacional Mercurio - Sol
F3=-G*(mt*M/norm(xt)^2)*(xt/norm(xt)); %Resultado Fuerza Gravitacional Tierra - Sol
F5=-G*(mj*M/norm(xj)^2)*(xj/norm(xj)); %Resultado Fuerza Gravitacional Jupiter - Sol
F8=-G*(mn*M/norm(xn)^2)*(xn/norm(xn)); %Resultado Fuerza Gravitacional Neptuno - Sol 

for step=1:300
    hold off
    scatter(xmer(1)/6.9,xmer(2)/6.9,40,'black','filled'); %Dibujo posicion de Mercurio  
    hold on
    scatter(xt(1)/6.2,xt(2)/6.2,100,'blue','filled'); %Dibujo posicion de la Tierra
    hold on 
    scatter(xj(1)/3.8,xj(2)/3.8,250,'green','filled'); %Dibujo posicion de Jupiter  
    hold on
    scatter(xn(1)/3.1,xn(2)/3.1,115,'cyan','filled'); %Dibujo posicion de Neptuno  
    hold on 
    title(['step : ' num2str(step)]); 
    scatter(0,0,900,'yellow','filled'); %Dibujo posicion del Sol 
    %legend('PROGRAMA PARA VISUALIZAR EL SISTEMA SOLAR') 
    axis([-350 420 -1000 1600]); 
    grid
    if (size(est3,2)>0)
    plot((est1(1,:))/6.9,(est1(2,:))/6.9,'black'); %La linea plot esta dividida entre 6.9 para alcanzar la escala
        plot((est3(1,:))/6.2,(est3(2,:))/6.2,'blue'); %La linea plot esta dividida entre 6.2 para alcanzar la escala
    plot((est5(1,:))/3.8,(est5(2,:))/3.8,'green'); %La linea plot esta dividida entre 3.8 para alcanzar la escala
    plot((est8(1,:))/3.1,(est8(2,:))/3.1,'cyan'); %La linea plot esta dividida entre 3.1 para alcanzar la escala
    end
    pause(0.01);
    
    xamer=xmer;
    xat=xt;
    xaj=xj;
    xan=xn;
    vamer=vmer;
    vat=vt;
    vaj=vj;
    van=vn;
    est1=[xamer est1]; %Grafico de la estela de Mercurio en un plano
    est3=[xat est3]; %Grafico de la estela de la Tierra en un plano
    est5=[xaj est5]; %Grafico de la estela de Jupiter en un plano
    est8=[xan est8]; %Grafico de la estela de Neptuno en un plano
    F1=-G*(mmer*M/norm(xamer)^2)*(xamer/norm(xamer));
    F3=-G*(mt*M/norm(xat)^2)*(xat/norm(xat));
    F5=-G*(mj*M/norm(xaj)^2)*(xaj/norm(xaj));
    F8=-G*(mn*M/norm(xan)^2)*(xan/norm(xan));
    vpmmer= vamer + (h/2)*(F1/mmer);
    vpmt = vat + (h/2)*(F3/mt);
    vpmj = vaj + (h/2)*(F5/mj);
    vpmn = van + (h/2)*(F8/mn);
    xpmmer = xamer + (h/2)*vamer;
    xpmt = xat + (h/2)*vat;
    xpmj = xaj + (h/2)*vaj;
    xpmn = xan + (h/2)*van;
    F1=-G*(mmer*M/norm(xpmmer)^2)*(xpmmer/norm(xpmmer));
    F3=-G*(mt*M/norm(xpmt)^2)*(xpmt/norm(xpmt));
    F5=-G*(mj*M/norm(xpmj)^2)*(xpmj/norm(xpmj));
    F8=-G*(mn*M/norm(xpmn)^2)*(xpmn/norm(xpmn));
    vmer = vamer + h*(F1/mmer);
    vt = vat + h*(F3/mt);
    vj = vaj + h*(F5/mj);
    vn = van + h*(F8/mn);
    xmer = xamer + h*vpmmer;
    xt = xat + h*vpmt;
    xj = xaj + h*vpmj;
    xn = xan + h*vpmn;
end
