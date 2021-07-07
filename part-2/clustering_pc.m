function [centroid] = clustering_pc(points, NC)
 cluster=[ ];
 [n m] = size(points);
 indice=1;
 p=1;
 while p<= NC
   for j=1:n+1
     if(rem(j,NC) == p)
     v(j) = p;%vector de aparitie unde j retine indicele pentru pct si p nr clusterului
   endif
  
 endfor
 p= p + 1;
endwhile
for j=1:n+1
  if( v(j) == 0) %daca j este multiplu lui NC
  v(j)=NC;
endif
endfor
%matricea de centroizi initiala
for k=1:NC
  for j=1:m
    suma = 0;
    puncte = 0;
    for i=1:n
      %se verifica ca un punct apartine de un anumit centroid
      if ( v(i) == k )
        %calculez suma de pe fiecare coloana
        suma = suma + points(i,j);
        %retin numarul de puncte din clusterul respectiv
        puncte = puncte + 1;
      endif
    endfor
    %atribui centroidului media(centrul de masa) al clusterului K
    centroid(k,j) = suma./puncte ;
  endfor
endfor

last_centroid=zeros(NC,m);
%se initializeaza minimul cu infinit
min=exp(1000);
%cat timp centroizii sunt diferiti
while(isequal(centroid,last_centroid) == 0)
  last_centroid=centroid;
  index = zeros(n,1);
  for i=1:n
    aux_indice=1;
    min=exp(1000);
    for j=1:NC
      %distanta euclediana fara de fiecare centroid
      min_dist = sqrt( sum((points(i,:) - centroid(j,:)) .^2));
      if(min_dist < min)
      min = min_dist;
      aux_indice=j;
    endif
  endfor
  %vector de aparitie unde i retine indicele pentru pct si aux_indice nr clusterului
  index(i)=aux_indice;
endfor
for k=1:NC
  for j=1:m
suma = 0;
nr=0;
for i=1:n
  %se verifica ca un punct apartine de un anumit centroid
  if( index(i) == k)
  suma = suma + points(i,j);
  nr = nr+1;
endif
endfor

centroid(k,j) = suma ./ nr;
endfor
endfor
endwhile 
endfunction

 


