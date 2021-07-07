function [H S V] = RGBhsv(path_to_image)
    RGB = imread(path_to_image);
    r = RGB(:, :, 1); %red channel
    g = RGB(:, :, 2); %green channel
    b = RGB(:, :, 3); %blue channel
    %convertirea la tipul double
    R = double(r) / 255;
    G = double(g) / 255;
    B = double(b) / 255;
    %minimul dintre canale
    C_min = min(min(R, G), B);
    %maximul dintre canale
    C_max = max(max(R, G), B);
    %matricea diferenta
    delta = C_max - C_min;
    %initializarea matricelor cu zero
    H = zeros(size(delta));
    S = zeros(size(delta));
    V = C_max;
    %variabila auxiliara pentru salvarea elementelor din C_max egale cu R
    aux1 = find(C_max == R);
    %formula din scheletul dat in enuntul temei
    aux11 = mod(((G(aux1) - B(aux1)) ./ delta(aux1)), 6);
    H(aux1) = 60 * aux11;
    %variabila auxiliara pentru salvarea elementelor din C_max egale cu G
    aux2 = find(C_max == G);
    %formula din scheletul dat in enuntul temei
    aux22 = ((B(aux2) - R(aux2)) ./ delta(aux2)) + 2;
    H(aux2) = 60 * aux22;
    %variabila auxiliara pentru salvarea elementelor din C_max egale cu B
    aux3 = find(C_max == B);
    %formula din scheletul dat in enuntul temei
    aux33 = ((R(aux3) - G(aux3)) ./ delta(aux3)) + 4;
    H(aux3) = 60 * aux33;
    %cazul in care diferenta este 0
    H(find(delta == 0)) = 0;
    H = H / 360;
    %cand C_max este diferit de zero
    S(find(C_max ~= 0)) = delta(find(C_max ~= 0)) ./ C_max(find(C_max ~= 0));

endfunction
