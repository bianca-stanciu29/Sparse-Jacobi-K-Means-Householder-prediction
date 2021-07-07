function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  x0 = zeros(size(c));
  prev_x = x0;
   x = csr_multiplication(G_values, G_colind, G_rowptr, prev_x) + c;
  while (norm(x-prev_x) >= tol)
    prev_x=x;
    x = csr_multiplication(G_values, G_colind, G_rowptr, x) + c;
  endwhile
 
endfunction