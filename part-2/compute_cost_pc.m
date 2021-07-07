function cost = compute_cost_pc(points, centroids)
    cost = 0;
    [n m] = size(points);
    NC = size(centroids, 1);
    index = zeros(n, 1);
    minDistance = exp(1000);
    last_centroid = zeros(NC, m);
    %secventa urmatoare de cod  e preluata din clustering_pc.m
    %deoarece a fost necesara utilizarea lui index, care nu era dat ca parametru
    for i = 1:n
        aux_indice = 1;
        min = exp(1000);

        for j = 1:NC
            %distanta euclediana fara de fiecare centroid
            min_dist = sqrt(sum((points(i, :) - centroids(j, :)).^2));

            if (min_dist < min)
                min = min_dist;
                aux_indice = j;
            endif

        endfor

        index(i) = aux_indice;
    endfor

    for i = 1:NC

        for j = 1:n
            Distance = 0;

            if (index(j) == i) %se verifica ca un punct apartine de un anumit centroid
                %se calculeaza distanta dintre punct si centroid
                Distance = sqrt(sum((points(j, :) - centroids(i, :)).^2));
            endif

            cost = cost + Distance; %distanta calculata se adauga la costul total
        endfor

    endfor

    % TODO compute clustering solution cost
end
