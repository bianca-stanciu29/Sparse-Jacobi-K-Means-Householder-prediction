function [A b] = generate_probabilities_system(rows)
  i=1;
  n=(rows * (rows +1)) / 2;
  A=zeros(n,n);
  for l=1:rows
    if ( l==1 ) %colt sus
      A(i,i) = 4;
      A(i,i+1)=-1;
      A(i,i+2)=-1;
      A(i+1,i)=-1;
      A(i+2,i)=-1;
      b(i,1)=0;
      i=i+1;
    endif
    if ( l>1 && l<rows) %daca nu e primul nivel sau ultimul
      for k=1:l %se parcurg elementele de pe linie
        if (k == 1)%margine stanga
          A(i,i) = 5;
          A(i,i+1)=-1;
          A(i,i+l)=-1;
          A(i,i+l+1)=-1;
          A(i+1,i)=-1;
          A(i+l,i)=-1;
          A(i+1+l,i)=-1;
          b(i,1)=0;
          i=i+1;
        endif
        if(k>1 && k<l) %mijloc
        A(i,i)=6;
        A(i+1,i)=-1;
        A(i+l,i)=-1;
        A(i+l+1,i)=-1;
        A(i,i+1)=-1;
        A(i,i+l)=-1;
        A(i,i+l+1)=-1;
        b(i,1)=0;
        i=i+1;
      endif
      if (k == l) %margine dreapta
        
        A(i,i)=5;
        A(i,i+l)=-1;
        A(i,i+l+1)=-1;
        A(i+l,i)=-1;
        A(i+l+1,i)=-1;
        b(i,1)=0;
        i=i+1;
      endif
    endfor
  endif
  if ( l== rows ) %daca este ultima linie 
    for k=1:l
      if ( k == 1 ) %colt stanga
        A(i,i) = 4;
        A(i+1,i)=-1;
        A(i,i+1)=-1;
        b(i,1)=1;
        i=i+1;
      endif
      if (k>1 && k<l) %mijloc
        A(i,i)=5;
        A(i,i+1)=-1;
        A(i+1,i)=-1;
        b(i,1)=1;
         i=i+1;
       endif
       if( k==l ) %colt dreapta
       A(i,i)=4;
       b(i,1)=1;
     endif
   endfor
 endif
endfor
endfunction
      
