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

%Cs = [0.5;1.0;2.0;5.0;10.0;20.0;50.0;100.0;1000.0;100000.0];
%sigmas = [0.01; 0.02; 0.03; 0.04];

Cs = [1;1000.0];
sigmas = [0.03;1];

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
            if (testKernelSVM(X, y, alphas, b, X(k,:), 'gaussian', sigmas(j)) == sign(y(k)))
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

printf('Tecle algo para continuar...\n');
pause();

printf('\n\nTerceiro exemplo: \nCasos linear e nao linear usando dataset Adult Database com tamanho variavel de entrada (a1a)\n');

source a1a.oct;

X = Xs;
y = Ys;

tams = [50;100;150;200;300;400];

for (i = 1:size(tams,1)) %%{
    printf('Tecle algo para rodar a SVM com separador linear (%d exemplos)...\n', tams(i));
    pause();

    [marginvector linearcoef deltatime] = solveLinearSVMNonSeparable(Xs(1:tams(i),:),y(1:tams(i)),1000.0);

    printf('Levou %.3f segundos.\n', deltatime);

    ok = 0.0;
    for (j = 1:tams(i)) %%{
        if (testLinearSVM(marginvector, linearcoef, X(j,:)) == sign(y(j)))
            ok = ok + 1.0;
        end;
    end; %%}

    printf('Erro de treinamento: %.3f\n', (1.0 - ok/double(tams(i))));

end; %%}

for (i = 1:size(tams,1)) %%{
    printf('Tecle algo para rodar a SVM com kernel gaussiano (sigma = 0.01, C = 1000.0) (%d exemplos)...\n', tams(i));
    pause();

        [alphas b deltatime] = solveKernelSVM(X(1:tams(i),:), y(1:tams(i)), 'gaussian', 1000.0, 0.1);

        printf('Levou %.3f segundos.\n', deltatime);

        ok = 0.0;
        for (k = 1:tams(i)) %%{
            if (testKernelSVM(X(1:tams(i),:), y(1:tams(i)), alphas, b, X(k,:), 'gaussian', 0.0001) == sign(y(k)))
                ok = ok + 1.0;
            end;
        end; %%}

        printf('Erro de treinamento: %.3f\n', (1.0 - ok/double(size(X,1))));
        fflush(stdout);
        fflush(stderr);
end; %%}

