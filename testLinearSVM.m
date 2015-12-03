%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dado o vetor de margem maxima e o coeficiente linear
% da margem, descobre a que classe um novo ponto (XUnk)
% pertence (-1 ou 1).
% Veja Secao 3.4, pág 134 de Burges (1998).

function t = testLinearSVM(W,b,XUnk) %%{
    t = sign(dot(W,XUnk) + b);
end; %%}

