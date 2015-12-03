%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dado o resultado do treinamento de uma SVM
% com kernel (Alphas, b, kernelName), determina a classificacao
% de um vetor novo (XUnk). Eh preciso passar o conjunto de entrada
% (Xs e Ys) e demais parametros do kernel (nos argumentos 
% variaveis varargin).
% Veja Secao 4, pág 138, Eq. 61 de Burges (1998).

% Funcao de teste para o caso nao linear
function res = testKernelSVM(Xs, Ys, Alphas, b, XUnk, kernelName, varargin) %%{
    accum = 0.0;
    for (i = 1:size(Alphas,1)) %%{
        if (Alphas(i) > 1e-10) %%{
            if (kernelName == 'gaussian')
                accum = accum + Alphas(i) * Ys(i) * gaussianKernel(Xs(i,:), XUnk(:)', double(varargin{1}));
            elseif (kernelName == 'polynomial')
                accum = accum + Alphas(i) * Ys(i) * polynomialKernel(Xs(i,:), XUnk(:)', double(varargin{1}));
            elseif (kernelName == 'hyperbolictangent')
                accum = accum + Alphas(i) * Ys(i) * hyperbolicTangentKernel(Xs(i,:), XUnk(:)', double(varargin{1}), double(varargin{2}));
            end
        end;%%}
    end; %%}

    res = sign(accum + b);
end; %}

