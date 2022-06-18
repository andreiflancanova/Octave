%M�TODO DAS DIFEREN�AS FINITAS IMPL�CITO
%LIMPAR DADOS PARA IN�CIO DA IMPLEMENTA��O DO C�DIGO
clear
clc

%DECLARA��O DE VARI�VEIS E INPUTS (HABILITAR QUANDO FUNCIONAR!)
Lx=input('Insira o valor do comprimento total em x:');
Ly=input('Insira o valor do comprimento total em y:');
nx=input('Insira o n�mero de pontos da discretiza��o em x:');
ny=input('Insira o n�mero de pontos da discretiza��o em y:');

%PR�-ALOCA��O DAS VARI�VEIS
Told=zeros(ny,nx);
Tnew=zeros(ny,nx);

%DISCRETIZA��O DO DOM�NIO DE SOLU��O
dx=Lx/(nx-1);
dy=Ly/(ny-1);
x=zeros(nx);
y=zeros(ny);

%CONSTANTES DA EQUA��O DE ADVEC��O-DIFUS�O (EXEMPLO)
k=150;           %Condutividade: [W/m.K]
h=450;           %Coeficiente convectivo: [W/m�.K]
Tinf=0;          %[�C]
Sp=-12;
Sc=12500;

%DISCRETIZA��O DAS CONDI��ES DE CONTORNO
%DOM�NIO RETANGULAR
%PAREDE 01 (BORDA DIREITA - ESQUEMA P/ TR�S EM x)
for i=2:ny-1
    Told(i,nx)=Told(i,nx-1);
    Tnew(i,nx)=Tnew(i,nx-1);
end
%PAREDE 02 (BORDA INFERIOR - ESQUEMA PARA FRENTE EM y)
for j=1:nx
    Told(1,j)=0;
    Tnew(1,j)=0;
end
%PAREDE 03 (BORDA ESQUERDA - ESQUEMA PARA FRENTE EM x)
for i=2:ny-1
    Told(i,nx)=100;
    Tnew(i,nx)=100;
end
%PAREDE 04 (BORDA SUPERIOR - ESQUEMA PARA TR�S EM y)
for j=1:nx
    Told(1,j)=0;
    Tnew(1,j)=0;
end

%DISCRETIZA��O DOS N�S INTERNOS
%COEFICIENTES DA EQUA��O
AW=AE=(1/dx)^2;
AN=AS=(1/dy)^2;
AP=-2*((1/dx)^2+(1/dy)^2)+Sp;


%TERMO ITERATIVO DOS N�S INTERNOS

