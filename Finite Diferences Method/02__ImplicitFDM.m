%M�TODO DAS DIFEREN�AS FINITAS IMPL�CITO
%LIMPAR DADOS PARA IN�CIO DA IMPLEMENTA��O DO C�DIGO
clear
clc

%DECLARA��O DAS VARI�VEIS
Lx=.1;
Ly=.1;
nx=20;
ny=20;

%DISCRETIZA��O DO DOM�NIO DE SOLU��O
dx=Lx/(nx-1);
dy=Ly/(ny-1);

%CONTADORES PARA PERCORRER O DOM�NIO
for j=1:nx
    x(j)=(j-1)*dx;
end

for i=1:ny
    y(i)=(i-1)*dy;
end
