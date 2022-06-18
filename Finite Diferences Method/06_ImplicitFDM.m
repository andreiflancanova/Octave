%M�TODO DAS DIFEREN�AS FINITAS IMPL�CITO
%LIMPAR DADOS PARA IN�CIO DA IMPLEMENTA��O DO C�DIGO
clear
clc

%DECLARA��O DE VARI�VEIS E INPUTS (HABILITAR QUANDO FUNCIONAR!)
%Lx=input('Insira o valor do comprimento total em x:');
%Ly=input('Insira o valor do comprimento total em y:');
%nx=input('Insira o n�mero de pontos da discretiza��o em x:');
%ny=input('Insira o n�mero de pontos da discretiza��o em y:');

Lx=10;
nx=5;
Ly=15;
ny=7;

%PR�-ALOCA��O DAS VARI�VEIS
Told=zeros(nx,ny);
x=zeros(nx,1);
y=zeros(ny,1);

%DISCRETIZA��O DO DOM�NIO DE SOLU��O
dx=Lx/(nx-1);
dy=Ly/(ny-1);
b=dx/dy;

%DISCRETIZA��O DAS CONDI��ES DE CONTORNO
%DOM�NIO RETANGULAR
%PAREDE 03 (BORDA INFERIOR - ESQUEMA PARA FRENTE EM y)
%PAREDE 04 (BORDA SUPERIOR - ESQUEMA PARA TR�S EM y)
for i=1:nx
    x(i)=(i-1)*dx;
    Told(i,1)=0;
    Told(i,ny)=(100)*sin(pi().*x(i)./Lx);
end
%PAREDE 01 (BORDA ESQUERDA - ESQUEMA P/ FRENTE EM x)
%PAREDE 02 (BORDA DIREITA - ESQUEMA P/ TR�S EM x)
for j=1:ny
    Told(1,j)=0;
    Told(nx,j)=0;
end
%ITERA��O

EGSM=1;
PR=1.0e-04;
Tnew=Told;
while EGSM>PR
    for i=2:nx-1
        for j=2:ny-1
            Tnew(i,j)=0,25*(Told(i-1,j)+Told(i,j-1)+Told(i,j+1)+Told(i+1,j));
        end
    end
    EGS=abs(Tnew-Told);
    EGSM=max(EGS,[],'all')
    Told=Tnew;
end
EGSM
Tnew
