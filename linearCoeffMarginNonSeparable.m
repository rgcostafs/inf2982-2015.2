%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dado o conjunto de multiplicadores de Lagrange 
% que representam a solucao do problema de otimizacao
% quadratica de uma SVM (caso linear), o vetor de margem
% maxima e o dado de entrada (pontos e classes), e o peso
% (penalizacao C), calcula o coeficiente linear do 
% hiperplano de separacao entre duas classes, para o caso
% nao linearmente separavel.
% Veja pág. 131, §3, Eq. 21 de Burges (1998).

function b = linearCoeffMarginNonSeparable(Alphas, W, Xs, Ys, C) %%{
    dots = zeros(size(Xs,1),1);
    for (i = 1:size(Xs,1)) %%{
        dots(i) = dot(Xs(i,:), W);
    end; %%}
    accum = 0.0;
    n = 0;
    for (i = 1:size(Xs,1)) %%{
        if ((Alphas(i) > 1e-15) && (Alphas(i) < C)) %%{ % so considera alphas >= 1e-10 e < C
            accum = accum + Ys(i) - dots(i);
            n = n + 1;
        end; %%}
    end; %%}
    b = accum / n;
end; %%}

