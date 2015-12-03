%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dado o conjunto de multiplicadores de Lagrange 
% que representam a solucao do problema de otimizacao
% quadratica de uma SVM (caso linear), o vetor de margem
% maxima e o dado de entrada (pontos e classes), 
% calcula o coeficiente linear do hiperplano de separacao
% entre duas classes.  
% Veja pág. 131, §3, Eq. 21 de Burges (1998).

function b = linearCoeffMargin(Alphas, W, Xs, Ys) %%{
    dots = zeros(size(Xs,1),1);
    for (i = 1:size(Xs,1)) %%{     % computa os produtos escalares entre
        dots(i) = dot(Xs(i,:), W); % a margem e os pontos de entrada.
    end; %%}
    accum = 0.0;
    n = 0.0;
    for (i = 1:size(Xs,1)) %%{
        if (Alphas(i) > 1e-10) %%{ % somente considera valores maiores do que 1e-10
            accum = accum + Ys(i) - dots(i);
            n = n + 1.0;
        end; %%}
    end; %%}
    b = accum / n; % b = (1.0 / n) * (\sum_{i, \alpha_i > 0}{y_i - X_i \cdot W}
end; %%}

