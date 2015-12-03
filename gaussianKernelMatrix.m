% Gerador da matriz H usando kernel gaussiano
function GKM = gaussianKernelMatrix(Xs, sigma) %%{
    sz = size(Xs,1);
    dims = size(Xs,2);
    A = eye(sz);
    for (i = 1:sz) %%{
        for (j = i:sz) %%{
            diff = Xs(i,:) - Xs(j,:);
            A(i,j) = exp(-1.0*(dot(diff,diff)) / (2*sigma*sigma));
            A(j,i) = A(i,j);
        end; %%}
    end; %%}
    GKM = A;
end; %%}

