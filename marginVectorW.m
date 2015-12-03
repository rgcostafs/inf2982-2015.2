%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dado o conjunto de multiplicadores de Lagrange 
% que representam a solucao do problema de otimizacao
% quadratica de uma SVM (caso linear), monta o vetor 
% W de margem maxima separando duas classes.
% Veja Eq. 14 de Burges (1998).

function res = marginVectorW(Alphas, Xs, Ys) %%{
    dims = size(Xs,2); % quantas colunas tem o dado de entrada: dimensoes
    Xjs = Xs;
    for (i = 1:dims) %%{
        Xjs(:,i) = Xjs(:,i) .* Ys;
        Xjs(:,i) = Xjs(:,i) .* Alphas;
    end; %%}
    res = sum(Xjs);  % faz \sum_{i}{\alpha_i y_i X_i}
end; %%}

