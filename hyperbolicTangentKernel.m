%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dados dois vetores, e mais dois parâmetros
% kappa e delta, calcula tanh(k*dot(x,t) - delta).
% Veja pág. 142, Eq. 75 de Burges (1998)

function hk = hyperbolicTangentKernel(x, y, kappa, delta) %%{
    hk = tanh(kappa * dot(x,y) - delta);
end; %%}

