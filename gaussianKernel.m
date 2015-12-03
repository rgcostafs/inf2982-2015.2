%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dados dois vetores, e um grau, calcula
% o kernel (exp(-||x-y||^2 / 2*sigma^2).
% Veja pág. 142, Eq. 75 de Burges (1998).

function gk = gaussianKernel(x, y, sigma) %%{
    diff = x - y;
    sz = dot(diff,diff);
    gk = exp(-sz/(2.0*sigma*sigma));
end; %%}

