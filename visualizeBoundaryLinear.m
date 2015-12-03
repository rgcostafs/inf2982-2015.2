% Creditos: Andrew Ng (Machine Learning - Coursera)

function visualizeBoundaryLinear(X, y, w, b, figure)
    %VISUALIZEBOUNDARYLINEAR plots a linear decision boundary learned by the
    %SVM
    %   VISUALIZEBOUNDARYLINEAR(X, y, model) plots a linear decision boundary 
    %   learned by the SVM and overlays the data on it

    xp = linspace(min(X(:,1)), max(X(:,1)), 100);
    yp = - (w(1)*xp + b)/w(2);
    plotData(X, y, figure);
    hold on;
    plot(xp, yp, '-b'); 
    hold off;
end;

