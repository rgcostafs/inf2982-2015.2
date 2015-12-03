% Montador da matriz H de acordo com o kernel escolhido
function h = kernelMatrix(Xs, Ys, kernelName, varargin) %%{
    dims = size(Xs,2);
    Xjs = Xs;
    for (i = 1:dims) %%{
        Xjs(:,i) = Xjs(:,i) .* Ys;
    end; %%}
    if (strcmp(tolower(kernelName), 'gaussian'))
        h = gaussianKernelMatrix(Xjs, double(varargin{1}));
        return;
    end;
    if (strcmp(tolower(kernelName), 'polynomial'))
        h = polynomialKernelMatrix(Xjs, double(varargin{1}));
        return;
    end;
    if (strcmp(tolower(kernelName), 'hyperbolictangent'))
        h = hyperbolicTangentKernelMatrix(Xjs, double(varargin{1}), double(varargin{2}));
        return;
    end;
    h = zeros(1,1);
end;%%}

