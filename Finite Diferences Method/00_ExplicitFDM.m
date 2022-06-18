%MÉTODO DAS DIFERENÇAS FINITAS IMPLÍCITO
%LIMPAR DADOS PARA INÍCIO DA IMPLEMENTAÇÃO DO CÓDIGO
clear
clc

%DECLARAÇÃO DE VARIÁVEIS E INPUTS (HABILITAR QUANDO FUNCIONAR!)
x0=0;
t0=0;
xf=1;
tf=.5;
c=1;
dx=.2;
dt=.01;

%PARÂMETROS INICIAIS
L=(c*dt)/(dx)^2;
nx=(xf-x0)/(dx);
ni=nx+1;
nt=(tf-t0)/(dt);
nj=nt+1;
xi=[x0:dx:xf];
tj=[t0:dt:tf];
u=zeros(nj,ni);

%CONDIÇÕES DE CONTORNO
u(:,1)=0;
u(:,ni)=0;
u(1,:)=sin(pi*xi);

%MÉTODO DAS DIFERENÇAS FINITAS EXPLÍCITO
for j=1:nj-1
  for i=2:ni-1
    u(j+1,i)=L*u(j,i+1)+(1-2*L)*u(j,i)+L*u(j,i-1);
  end
end
k=[1:1:ni];
b(k,:)=u(10*(k-1)+1,:);

%PLOTANDO O GRÁFICO DA SOLUÇÃO
[X,T]=meshgrid(xi,tj);
surfc(X,T,u)

