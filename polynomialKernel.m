%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dados dois vetores, e um grau, calcula
% o kernel (x.y + 1)^g.
% Veja pág. 142, Eq. 74 de Burges (1998).

function pk = polynomialKernel(x, y, degree) %%{
    pk = (dot(x, y) + 1)^degree;
end; %%}

