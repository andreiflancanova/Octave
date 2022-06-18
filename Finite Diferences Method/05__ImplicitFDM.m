%MÉTODO DAS DIFERENÇAS FINITAS IMPLÍCITO
%LIMPAR DADOS PARA INÍCIO DA IMPLEMENTAÇÃO DO CÓDIGO
clear
clc

%DECLARAÇÃO DE VARIÁVEIS E INPUTS (HABILITAR QUANDO FUNCIONAR!)
Lx=input('Insira o valor do comprimento total em x:');
Ly=input('Insira o valor do comprimento total em y:');
nx=input('Insira o número de pontos da discretização em x:');
ny=input('Insira o número de pontos da discretização em y:');

%PRÉ-ALOCAÇÃO DAS VARIÁVEIS
Told=zeros(ny,nx);
Tnew=zeros(ny,nx);

%DISCRETIZAÇÃO DO DOMÍNIO DE SOLUÇÃO
dx=Lx/(nx-1);
dy=Ly/(ny-1);
x=zeros(nx);
y=zeros(ny);

%CONSTANTES DA EQUAÇÃO DE ADVECÇÃO-DIFUSÃO (EXEMPLO)
k=150;           %Condutividade: [W/m.K]
h=450;           %Coeficiente convectivo: [W/m².K]
Tinf=0;          %[ºC]
Sp=-12;
Sc=12500;

%DISCRETIZAÇÃO DAS CONDIÇÕES DE CONTORNO
%DOMÍNIO RETANGULAR
%PAREDE 01 (BORDA DIREITA - ESQUEMA P/ TRÁS EM x)
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
%PAREDE 04 (BORDA SUPERIOR - ESQUEMA PARA TRÁS EM y)
for j=1:nx
    Told(1,j)=0;
    Tnew(1,j)=0;
end

%DISCRETIZAÇÃO DOS NÓS INTERNOS
%COEFICIENTES DA EQUAÇÃO
AW=AE=(1/dx)^2;
AN=AS=(1/dy)^2;
AP=-2*((1/dx)^2+(1/dy)^2)+Sp;


%TERMO ITERATIVO DOS NÓS INTERNOS

