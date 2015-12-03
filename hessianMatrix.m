%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dado o conjunto pontos e classes de entrada,
% monta a matriz hessiana da funcao objetivo da
% otimizacao do problema dual para as SVMs lineares.
% Veja pág. 133, §3, Eq. 28 de Burges (1998).

function h = hessianMatrix(Xs,Ys) %%{
    dims = size(Xs,2);
    Xjs = Xs;
    for (i = 1:dims) %%{
        Xjs(:,i) = Xjs(:,i) .* Ys;
    end; %%}
    h = Xjs * Xjs'; 
end;%%}

