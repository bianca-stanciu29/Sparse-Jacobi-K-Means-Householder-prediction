function [values colind rowptr]=matrix_to_csr(A)
  [n n]=size(A);
   nz=1;
   rowptr(1)=1;
   m=0;
       for i=1:n
         %p=1; 
         m=0;
         for j=1:n
           if (A(i,j) ~= 0)
             values(nz)=A(i,j);%vectorul de valori nenule
             colind(nz)=j;%vectorul de indici
             nz=nz+1;%numarul de valori nenule
             m=m+1;%numarul de elemente de pe fiecare linie
             rowptr(i+1)=rowptr(i)+m;
           endif
         endfor
       endfor
   endfunction
       