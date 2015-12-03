% Gerador da matriz H usando kernel polinomial
function PKM = polynomialKernelMatrix(Xs, degree) %%{
    temp = Xs * Xs';
    temp = temp + 1;
    temp = temp .^ degree;
    PKM = temp;
end; %%}

