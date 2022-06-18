%SOLU��ES DE SISTEMAS LINEARES
%M�TODO ITERATIVO - ALGORITMO DE GAUSS-SEIDEL

%LIMPAR MEM�RIA E PROMPT
clear
clc
%----------------------------------------------------------------------------------------------------
%FORMULA��O MATRICIAL DO SISTEMA LINEAR
n=input('Insira a dimens�o do sistema linear: ');

%ALOCA��O INICIAL DAS VARI�VEIS
A=zeros(n,n);
b=zeros(n,1);
xold=zeros(n,1);
EGS=zeros(n,1);
MB=zeros(n,n);
C=zeros(1,n);
L1=zeros(n,n);
D=zeros(n,n);
F=zeros(n,n);
R1=zeros(n,n);
%DEFINI��O DOS STRINGS AUXILIARES
TFS1='Matriz A, elemento (%d;%d): ';        %Matriz A
TFS2='Vetor b, elemento (%d): ';            %Vetor b
TFS3='Vetor x inicial, elemento (%d): ';    %Vetor x inicial    
TFS4='O erro da itera��o %d � %.5f: \n';
TFS5='A solu��o obtida ap�s %d itera��es, com um erro de %.5f, � %.5f: \n';

%MATRIZ DOS COEFICIENTES (A)
for i=1:n
    for j=1:n
        fprintf(TFS1,i,j)
        A(i,j)=input('');
    end
end

%VETOR DO TERMO INDEPENDENTE (b)
for i=1:n
    fprintf(TFS2,i)
    b(i)=input("");
end

%VETOR x(0) DA APROXIMA��O INICIAL
for i=1:n
    fprintf(TFS3,i)
    xold(i)=input('');
end
%----------------------------------------------------------------------------------------------------
%TESTE DE CONVERG�NCIA: CRIT�RIO DE SASSENFELD
%PREDOMIN�NCIA DA DIAGONAL PRINCIPAL
for i=1:n
    for j=1:n
        if j==i
            MB(i,j)=0;
        else
            MB(i,j)=abs(A(i,j))./abs(A(i,i));
           
        end
        
    end
    C=C+MB(i,:);
end
beta=max(C);

if beta<1
    fprintf('O m�todo de Gauss-Seidel pode ser aplicado.\n')
else
    fprintf('O m�todo de Gauss-Seidel n�o pode ser aplicado. Diagonal Principal n�o predominante.\n')
end

%----------------------------------------------------------------------------------------------------
%MATRIZES AUXILIARES DO M�TODO

%MATRIZ TRIANGULAR INFERIOR COM DIAGONAL NULA (L1)
for i=1:n
    for j=1:n
        if j<i
            L1(i,j)=A(i,j)/A(i,i);
        else
            L1(i,j)=0;
        end
    end
end


%MATRIZ DIAGONAL (D)
for i=1:n
    for j=1:n
        if j==i
            D(i,j)=A(i,j);
        else
            D(i,j)=0;
        end
    end
end

%MATRIZ TRIANGULAR SUPERIOR COM DIAGONAL NULA (R1)
for i=1:n
    for j=1:n
        if j>i
            R1(i,j)=A(i,j)/A(i,i);
        else
            R1(i,j)=0;
        end
    end
end

%TERMO DE ITERA��O
%DEFINI��O DO ERRO INICIAL E PRECIS�O
EGSM=1;
PR=1.0e-04;
F=inv(D);
%DEFINI��O DO TERMO ITERATIVO
xnew=xold; %1� itera��o com a aproxima��o inicial
IC=1;
while EGSM>PR
    for k=1:n
        xnew(k,:)=-L1(k,:)*xnew-R1(k,:)*xold+F(k,:)*b;
    end
EGS=abs(xnew-xold); %C�lculo do vetor do erro para cada passo
EGSM=max(EGS);      % C�lculo do erro m�ximo
xold=xnew;          %Atribui��o da solu��o obtida no passo presente como aproxima��o para o pr�ximo    
fprintf(TFS4,IC,EGSM)
fprintf(TFS5,IC,EGSM,xnew)
IC=IC+1;
end
xnew