n = 10000;
tramas = cell(1,n);
tamPrevioSArre = [];
tamPostSArre = [];
largo = randi([5, 10], [1, n]);
flag = [1, 0, 1];
[~, tamFlag] = size(flag);
esc = [1, 1, 1];
[~, tamEsc] = size(esc);
for i=1 : n %Generación de tramas
    tramas{i} = randi([0, 1], [1, largo(i)]);
    [~, tamPrevioS] = size(tramas{i});
    tamPrevioSArre(i) = tamPrevioS;
end

tramasPrevioS = tramas; %Como se ve la trama antes de realizar el byte stuffing.

for i = 1 : n %Detectado de repeticiones
    temp = tramas{i};
    indice = strfind(temp, esc);
    tamTemp = 0;
    arregloIndice = [];
    if ~isempty(indice) %Detecta escapes
        [~, tamIndice] = size(indice);
        for j = 1 : tamIndice
            arregloIndice = [arregloIndice indice(j)];
        end
        for j = 1 : tamIndice
            temp = [temp(1 : (arregloIndice(j) - 1 + tamTemp)) esc temp(arregloIndice(j) : end)];
            tamTemp = tamTemp + tamEsc;
        end
        tramas{i} = temp;
    end
    
    temp = tramas{i};
    indice = strfind(temp, flag);
    tamTemp = 0;
    arregloIndice = [];
    if ~isempty(indice) %Detecta flags
        [~, tamIndice] = size(indice);
        for j = 1 : tamIndice
            arregloIndice = [arregloIndice indice(j)];
        end
        for j = 1 : tamIndice
            temp = [temp(1 : (arregloIndice(j) - 1 + tamTemp)) esc temp(arregloIndice(j) : end)];
            tamTemp = tamTemp + tamEsc;
        end
        tramas{i} = temp;
    end
    
    [~, tamPostS] = size(tramas{i});
    tamPostSArre(i) = tamPostS;
end

for i=1 : n %Agregado de banderas de inicio y fin
    temp = tramas{i};
    tramas{i} = [flag, temp, flag];
end

tramasPostS = tramas; %Como se ve la trama después de realizar el byte stuffing.

error = 0.2;
% error = 0.1;
% error = 0.05;
% error = 0.02;

for i=1:1:( n*error)
    vectorIndices(i) = randi(n,1,1); %Genera números al azar entre 1 y 
    %10000, dichos números son los índices de las tramas que se verán
    %modificadas
end

for k=1:1:n*error
   [s,t] = size(tramas{vectorIndices(k)});
   Inderr = randi(t,1,1);
   errr = randi([0, 1], 1);
   tramas{vectorIndices(k)} = [tramas{vectorIndices(k)}(1:Inderr-1) errr tramas{vectorIndices(k)}(Inderr:end)];
end

%1.-
% histogram(tamPrevioSArre);

%2.-
% edges = linspace(5, 80, 75); % Create 20 bins.
% histogram(tamPostSArre, 'BinEdges',edges);

% %3.- Esto aun no está
tramasCortas = tramas;
tramasLargas = tramas;
for i = 1:1:n
    [~, tamTrama] = size(tramas{i});
    if tamTrama < 17
        tramasLargas{i} = [];
    else
        tramasCortas{i} = [];
    end
end
erroresCorta = [];
erroresLarga = [];
for i = 1 : 1 : n
    if ~isempty(tramasCortas{i}) & ismember(i, vectorIndices)
        erroresCorta = [erroresCorta sum(vectorIndices==i)];
        %erroresCorta = erroresCorta + sum(vectorIndices==i); %Para saber
        %cuantos errores hay en la corta.
    end
    if ~isempty(tramasLargas{i}) & ismember(i, vectorIndices)
        erroresLarga = [erroresLarga sum(vectorIndices==i)];
        %erroresLarga = erroresLarga + sum(vectorIndices==i); %Para saber
        %cuantos errores hay en la larga.
    end
end


% % %4.
% fprintf('Numero de bytes erróneos por trama: ');
% disp(n*error);

%5.-
[a,b] = histc(vectorIndices,unique(vectorIndices));
y = a(b);
cuentaTramasMas1Error = 0;
for i = 1 : 1 : n * error
    if y(i) ~= 1
        cuentaTramasMas1Error = cuentaTramasMas1Error + 1;
    end
end
tramasAfectadas = (n*error) - cuentaTramasMas1Error;


grid on;

%7. Tramas a descartar
numDescartar = 0;
for p = 1:n
[~,dim] = size(tramas{p});
    if(tramas{p}(1) ~= 1 || tramas{p}(2) ~= 0 || tramas{p}(3) ~=1 || tramas{p}(dim) ~= 1 || tramas{p}(dim-1) ~= 0 || tramas{p}(dim-2) ~= 1)
           numDescartar = numDescartar + 1;
    end
end

%6. Tramas correctamente identificadas
numTramasIdentificadasC = n - numDescartar;

%8. Tasa de tramas descartadas
tasaTramD = (numDescartar/tramasAfectadas)*100;

figure(1);
histogram(tamPrevioSArre);
title('1. Distribución de las longitudes')
xlabel('Tamaño de la trama')
ylabel('Número de tramas')

edges = linspace(5, 80, 75); % Create 20 bins.
figure(2);
histogram(tamPostSArre, 'BinEdges',edges);
title('2. Distribución de las longitudes después de ByteStuffing')
xlabel('Tamaño de la trama')
ylabel('Número de tramas')

figure(3);
histogram(erroresCorta);
title('3.1. Distribución de bytes errones por trama (Longitud mínima)')
xlabel('Tamaño de la trama')
ylabel('Número de errores por trama')

figure(4);
histogram(erroresLarga);
title('3.2. Distribución de bytes errones por trama (Longitud media)')
xlabel('Tamaño de la trama')
ylabel('Número de errores por trama')

fprintf('4. Numero de bytes erróneos: ');
disp(n*error);

fprintf('5. Numero de tramas con al menos un error: ');
disp(tramasAfectadas);

fprintf('6. Numero de tramas correctamente identificadas: ');
disp(numTramasIdentificadasC); 

fprintf('7. Numero total tramas descartadas: ');
disp(numDescartar);

fprintf('8. Tasa de tramas descartadas: (Porcentual)');
disp(tasaTramD);

