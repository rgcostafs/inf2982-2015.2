% Gerador da matriz H usando kernel tangente hiperbolica
function THK = hyperbolicTangentKernelMatrix(Xs, kappa, delta) %%{
    temp = Xs * Xs';
    temp = temp .* kappa;
    temp = temp .- delta;
    temp = tanh(temp);
    THK = temp;
end; %%}

