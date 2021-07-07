function [sol] = rgbHistogram(path_to_image, count_bins)

    RGB = imread(path_to_image);
    r = RGB(:, :, 1); %red channel
    g = RGB(:, :, 2); %green channel
    b = RGB(:, :, 3); %blue channel

    n = 256 / count_bins;
    %vectorul de intervale
    v_int = 0:n:256;
    %red channel
    aux_r = histc(r(:), v_int(:));
    aux_r = aux_r';
    sol1 = aux_r(1:end - 1);
    %green channel
    aux_g = histc(g(:), v_int(:));
    aux_g = aux_g';
    sol2 = aux_g(1:end - 1);
    %blue channel

    aux_b = histc(b(:), v_int(:));
    aux_b = aux_b';
    sol3 = aux_b(1:end - 1);
    %alipirea rezultatelor
    sol = [sol1 sol2 sol3];
endfunction
