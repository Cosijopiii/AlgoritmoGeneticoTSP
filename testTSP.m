%% El problema del Agente viajero (Traveling Salesman Problem)
% El Problema del Agente Viajero (TSP por sus siglas en inglés) o problema
% del viajante, responde a la siguiente pregunta: Dada una lista de ciudades y las distancias entre cada par de ellas, ¿cuál es la ruta más corta posible que visita cada ciudad exactamente una vez y regresa a la ciudad origen?.
% Este problema se resolvio diseñando un algoritmo genetico que permutara las ruta mas optima
% de una ciudad a otra.


% valores de entrada 
k=[  0   29  20  21  16  31  100 12  4   31  18;
     29  0   15  29  28  40  72  21  29  41  12;
     20  15  0   15  14  25  81  9   23  27  13;
     21  29  15  0   4   12  92  12  25  13  25;
     16  28  14  4   0   16  94  9   20  16  22;
     31  40  25  12  16  0   95  24  36  3   37;
     100 72  81  92  94  95  0   90  101 99  84;
     12  21  9   12  9   24  90  0   15  25  13;
     4   29  23  25  20  36  101 15  0   35  18;
     31  41  27  13  16  3   99  25  35  0   38;
     18  12  13  25  22  37  84  13  18  38  0];
 
 size=11;
%  G=randi([1,100],size,size);
%  for i=1:size
%     for j=1:size
%         if i==j
%            G(i,j)=0; 
%         end
%     end
% end
%  matrixAdj = triu(G) + triu(G,1)';
% k=matrixAdj;
kweig=zeros(1,1);
l=triu(k);
s=1; 
 for i=1:size
    for j=1:size
        if l(i,j)~=0
            kweig(s,1)=l(i,j);
         s=s+1;
        end
     end
 end
    [x,c]=tsp(700,k,size);
 
 
   fir=ones(size);
   
    for i=1:size
        for j=1:size
            if i==j
               fir(i,j)=0; 
            end
        end
    end
  
%   bg = biograph(k,[],'ShowArrows','off','ShowWeights','on');
%   h = view(bg);
      
%    h = graph(matr);
    gr1 = graph(fir);
    gr2 = graph(fir);
   % highlight(gr2,c,'NodeColor','g')
  
    
 
   gr2.Edges.Weight=kweig;
    
    LWidths = 5*gr2.Edges.Weight/max(gr2.Edges.Weight);
    p=plot(gr2,'EdgeLabel',gr2.Edges.Weight,'LineWidth',LWidths);
    
    highlight(p,c,'NodeColor','red')
    for i=1:size-1
    highlight(p,c(i),c(i+1),'EdgeColor','red','LineWidth',2);
    end
    title('map')  
   
   
    figure
    subplot(2,2,1)
    plot(gr1);
    title('map')
    
    subplot(2,2,2)  
    plot(x);
    title('evol')
    
    subplot(2,2,[3 4])
     LWidths = 5*gr2.Edges.Weight/max(gr2.Edges.Weight);
    p=plot(gr2,'EdgeLabel',gr2.Edges.Weight,'LineWidth',LWidths);
    
    highlight(p,c,'NodeColor','red')
    for i=1:size-1
    highlight(p,c(i),c(i+1),'EdgeColor','red','LineWidth',2);
    end
    title('map') 
    
    
    sigma=0;
    for i=1:length(c)-1
      sigma=sigma+k(c(i),c(i+1));
    end
    disp('optimal path')
    disp(c);
    disp('Weight');
    disp(sigma)
   