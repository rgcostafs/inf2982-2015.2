printf('\n\nPrimeiro exemplo: caso linear nao separavel 2d\n');
printf('Dado a ser carregado: data01.m\n');

printf('Tecle algo para continuar...\n');
pause();

load('data01.m');

y(y==0)=-1;

plotData(X,y);

Cs = [0.5;1.0;2.0;5.0;10.0;20.0;50.0;100.0;1000.0];

for (i = 1:size(Cs,1)) %%{
    printf('Tecle algo para rodar a SVM com separador linear (C == %.3f)...\n', Cs(i));
    pause();

    [marginvector linearcoef deltatime] = solveLinearSVMNonSeparable(X,y,Cs(i));

    printf('Levou %.3f segundos. Veja agora o separador...\n', deltatime);

    visualizeBoundaryLinear(X, y, marginvector, linearcoef, 1);

    ok = 0.0;
    for (j = 1:size(X,1)) %%{
        if (testLinearSVM(marginvector, linearcoef, X(j,:)) == sign(y(j)))
            ok = ok + 1.0;
        end;
    end; %%}

    printf('Erro de treinamento: %.3f\n', (1.0 - ok/double(size(X,1))));

end; %%}

printf('Tecle algo para continuar...\n');
pause();

printf('\n\nSegundo exemplo: caso nao linear nao separavel 2d\n');
printf('Dado a ser carregado: data02.m\n');

printf('Tecle algo para continuar...\n');
pause();

load('data02.m');

y(y==0)=-1;

plotData(X,y);

Cs = [0.5;1.0;2.0;5.0;10.0;20.0;50.0;100.0;1000.0;100000.0];

sigmas = [0.01; 0.02; 0.03; 0.04];

fig = 1;

for (i = 1:size(Cs,1)) %%{
    for (j = 1:size(sigmas,1)) %%{
        printf('Tecle algo para rodar a SVM com kernels\n');
        printf('Kernel gaussiano, sigma = %.3f, C = %.3f\n', sigmas(j), Cs(i));

        [alphas b deltatime] = solveKernelSVM(X, y, 'gaussian', Cs(i), sigmas(j));

        printf('Levou %.3f segundos. Veja agora o separador (fig. %d) ...\n', deltatime, fig);

        visualizeBoundary(X, y, alphas, b, 'gaussian', fig, sigmas(j));

        ok = 0.0;
        for (k = 1:size(X,1)) %%{
            if (testKernelSVM(X, y, alphas, b, X(k,:), 'gaussian', sigmas(j)) == sign(y(i)))
                ok = ok + 1.0;
            end;
        end; %%}

        fig = fig + 1;

        printf('Erro de treinamento: %.3f\n', (1.0 - ok/double(size(X,1))));
        fflush(stdout);
        fflush(stderr);
        pause();
    end; %%}
end; %%}

