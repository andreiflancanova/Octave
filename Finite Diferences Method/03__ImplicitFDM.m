%MÉTODO DAS DIFERENÇAS FINITAS IMPLÍCITO
%LIMPAR DADOS PARA INÍCIO DA IMPLEMENTAÇÃO DO CÓDIGO
clear
clc

%DECLARAÇÃO DE VARIÁVEIS E INPUTS (HABILITAR QUANDO FUNCIONAR!)
Lx=input('Insira o valor do comprimento total em x:')
Ly=input('Insira o valor do comprimento total em y:')
nx=input('Insira o número de pontos da discretização em x:')
ny=input('Insira o número de pontos da discretização em y:')

%DISCRETIZAÇÃO DO DOMÍNIO DE SOLUÇÃO
dx=Lx/(nx-1);
dy=Ly/(ny-1);

for i=1:2*nx-1
    x(i)=(i-1)*dx;
end

for j=1:2*ny-1
    y(j)=(j-1)*dy;
end

%CONSTANTES DA EQUAÇÃO
k=150;           %Condutividade: [W/m.K]
h=450;           %Coeficiente convectivo: [W/m².K]
Tinf=0;          %[ºC]
Sp=-12;
Sc=12500;

%CHUTE INICIAL DA SOLUÇÃO
for i=1:2*nx-1;
    for j=1:2*ny-1;
        Told(i,j)=75;
        Tnew(i,j)=75
    end
end

erro=1;
prec=0,001;

while erro>prec
    %DISCRETIZAÇÃO DAS CONDIÇÕES DE CONTORNO
    %PAREDE 01
    for j=1:ny
        Told(j,1)=100;
        Tnew(j,1)=100;
    end

    %PAREDE 02 (sem pontos acima --> ESQUEMA P/ TRÁS)
    for i=2:nx
        Told(ny,i)=Told(ny-1,i);
        Tnew(ny,i)=Tnew(ny-1,i);
    end

    %PAREDE 03 (sem pontos a esquerda --> ESQUEMA P/ FRENTE)
    for j=ny+1:2*ny-2
        Told(j,nx+1)=Told(j,nx);
        Tnew(j,nx+1)=Tnew(j,nx);
    end

    %PAREDE 04
    for i=nx:2*nx-1
        Told(2ny-1,i)=50;
        Tnew(2ny-1,i)=50; 
    end

    %PAREDE 05 (termo de geração --> ESQUEMA P/ TRÁS)
    for j=2:2*ny-2
        Told(j,2*nx-1)=(k/(k+h*dx))*((h*dx/k)*Tinf+Told(j,2*nx-2);
        Tnew(j,2*nx-1)=(k/(k+h*dx))*((h*dx/k)*Tinf+Tnew(j,2*nx-2);
    end

    %PAREDE 06
    for i=2:2*nx-1
        Told(1,i)=50;
        Tnew(1,i)=50;
    end

    %NÓS INTERNOS
    AW=AE=1;
    AN=AS=(dx/dy)^2;
    AP=-2*(1+(dx/dy)^2)+Sp*(dx)^2;
    Su=-Sc*(dx)^2;
    
    %1º for
    for i=2:2*nx-2
        for j=2:ny-1
            Tnew(j,i)=(-1/AP)*(-Su+AW*Told(j,i-1)+AE*Told(j,i+1)+AN*Told(j+1,i)+AS*Told(j-1,i)
            %Desvio entre os valores:
            desv(j,i)=abs(Tnew(j,i)-Told(j,i);    
        end
    end
    
    %2º for
    for i=nx+1:2*nx-2
        for j=ny:2*ny-2
            Tnew(j,i)=(-1/AP)*(-Su+AW*Told(j,i-1)+AE*Told(j,i+1)+AN*Told(j+1,i)+AS*Told(j-1,i);
            %Desvio entre os valores:
            desv(j,i)=abs(Tnew(j,i)-Told(j,i);
        end
    end
    
    %Avaliando o erro
    erro=max(desv)
    disp(erro)
end

%PLOTANDO O GRÁFICO DA SOLUÇÃO
[X,Y]=meshgrid(x(i),y(j));
surfc(X,Y,Told)

