%Funcao de visualizacao
%Baseada na funcao original de Andrew Ng (Machine Learning - Coursera)
%Curso finalizado em Nov/2015.

function v = visualizeBoundary(X, y, alphas, b, kernelName, figure, varargin)
    %VISUALIZEBOUNDARY plots a non-linear decision boundary learned by the SVM
    %   VISUALIZEBOUNDARYLINEAR(X, y, model) plots a non-linear decision 
    %   boundary learned by the SVM and overlays the data on it

    % Plot the training data on top of the boundary
    plotData(X, y, figure)

    % Make classification predictions over a grid of values
    x1plot = linspace(min(X(:,1)), max(X(:,1)), 100)';
    x2plot = linspace(min(X(:,2)), max(X(:,2)), 100)';

    [X1, X2] = meshgrid(x1plot, x2plot);
    vals = zeros(size(X1));
    
    for i = 1:size(x1plot, 1)
        for j = 1:size(x2plot, 1)
            vals(j, i) = testKernelSVM(X, y, alphas, b, [x1plot(i) x2plot(j)], kernelName, varargin{:});
        end
    end

    % Plot the SVM boundary
    hold on
    contour(X1, X2, vals, [0 0], 'linecolor', 'b');
    hold off;

    v = vals;
end;
