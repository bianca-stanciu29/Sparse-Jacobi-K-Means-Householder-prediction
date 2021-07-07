function [G_J, c_J] = Jacobi_factorization(A, b)
    [n n] = size(A);
    %initializarea matricelor D,L,U
    D = L = U = zeros(n, n);
    %matricea D este formata din elementele de pe diagonala principala
    for i = 1:n
        D(i, i) = A(i, i);
    endfor

    %matricea U este formata din elementele de deasupra diagonalei principale ale matricei A (luate cu semn schimbat) si 0 in rest
    for i = 1:n

        for j = i + 1:n
            U(i, j) = -A(i, j);
        endfor

    endfor

    %matricea L este formata din elementele de sub diagonala principala a matricei A, luate cu semn schimbat si 0 in rest
    for i = 1:n

        for j = 1:i - 1
            L(i, j) = -A(i, j);
        endfor

    endfor

    %conform metodei Jacobi: N = D, P = L + U
    P = L + U;
    N = inv(D);
    %matricea de iteratie Jacobi
    G_J = N * P;
    %vectorul de iteratie Jacobi
    c_J = N * b;
endfunction
