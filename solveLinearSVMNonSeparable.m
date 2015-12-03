%
% rcfernandes@inf.puc-rio.br
% Nov, 2015
% 
% Dado o conjunto pontos e classes de entrada,
% resolve o problema de achar o separador linear
% (hyperplano) para o caso linearmente separavel.
% Veja pág. 135, Eqs. 43, 44, 45 e 46 de Burges (1998).

function [marginvector linearcoef deltatime] = solveLinearSVMNonSeparable(Xs,Ys,C) %%{
    % Monta a matriz Hessiana = yi*yj*dot(Xi,Xj), i,j in {1,...,n}, n = numero de pontos de entrada
    H = hessianMatrix(Xs,Ys);

    % A matriz da parte linear da funcao objetivo
    q = -1.0*ones(size(Xs,1),1);

    % Ax = b. Restricao de igualdade. Soma do produto dos multiplicadores de Lagrage * a classe = 0
    % sum(alpha_i * y_i) = 0
    % A = matriz igual à transposta da matriz de classes (1 linha, n colunas)
    % b = [0]. A_{1,n} * alphas_{n,1} = b_{1,1}
    A = Ys';
    b = zeros(1,1);

    % Todos os multiplicadores de Lagrange devem >= 0. Estas sao restricoes de limite inferior (lb).
    lb = zeros(size(Xs,1), 1); 

    % Todos os multiplicadores de Lagrange devem <= C. Estas sao restricoes de limite superior (ub).
    ub = C * ones(size(Xs,1),1);

    %== Formulacao atendida pela funcao qp do Octave:
    %
    %  min 0.5 x'*H*x + x'*q      <--- funcao objetivo da minimizacao: H: parte quadratica; q: parte linear
    %
    %  subject to
    %
    %     A*x = b                 <--- restricao de igualdade: A: matriz de coeficientes; x: multip. de Lagrange; b: valor da restricao.
    %     lb <= x <= ub           <--- restricoes de limite: lb: limite inferior; ub: limite superior.
    %     A_lb <= A_in*x <= A_ub  <--- restricoes de limite especificas para cada multiplicador de Lagrange. Nao foi usado.
    %==
    t1 = time();
    [alphas, obj, info, lambda] = qp (zeros(size(Xs,1),1), H, q, A, b, lb, ub);
    t2 = time();

    deltatime = t2-t1;

    marginvector = marginVectorW(alphas,Xs,Ys);
    linearcoef = linearCoeffMarginNonSeparable(alphas, marginvector, Xs, Ys, C);
%%}
end;
