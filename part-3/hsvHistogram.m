function [sol] = hsvHistogram(path_to_image, count_bins)
    [H S V] = RGBhsv(path_to_image);
    n = 1.01 / count_bins;
    v_int = 0:n:1.01;
    %H channel
    aux_H = histc(H(:), v_int);
    aux_H = aux_H';
    %S channel
    aux_S = histc(S(:), v_int);
    aux_S = aux_S';

    %V channel

    aux_V = histc(V(:), v_int);
    aux_V = aux_V';

    sol = [aux_H(1:end - 1) aux_S(1:end - 1) aux_V(1:end - 1)];

endfunction
