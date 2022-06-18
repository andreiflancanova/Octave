%MÉTODO DAS DIFERENÇAS FINITAS IMPLÍCITO
%LIMPAR DADOS PARA INÍCIO DA IMPLEMENTAÇÃO DO CÓDIGO
clear
clc

%DECLARAÇÃO DAS VARIÁVEIS
Lx=.1;
Ly=.1;
nx=20;
ny=20;

%DISCRETIZAÇÃO DO DOMÍNIO DE SOLUÇÃO
dx=Lx/(nx-1);
dy=Ly/(ny-1);

%CONTADORES PARA PERCORRER O DOMÍNIO
for j=1:nx
    x(j)=(j-1)*dx;
end

for i=1:ny
    y(i)=(i-1)*dy;
end
