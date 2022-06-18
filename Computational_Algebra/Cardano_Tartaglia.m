%F�RMULA PARA O POLIN�MIO DE 3� GRAU
%LIMPAR A MEM�RIA E O PROMPT
clear
clc

%ENTRADA DOS COEFICIENTES
a2=input('Insira o coeficiente que acompanha o x�:');

a1=input('Insira o coeficiente que acompanha o x:');

a0=input('Insira o coeficiente que acompanha o x�:');

%C�LCULO DAS CONSTANTES AUXILIARES
Q=(3.*a1-(a2).^2)/9
R=(9.*a1.*a2-27.*a0-2.*(a2).^3)/54
U=((Q).^(3)+(R).^(2)).^.5
S=nthroot((R+U),3)
T=nthroot((R-U),3)

if (U>0)
    fprintf('Uma �nica solu��o � real e as outras duas s�o imagin�rias e conjugadas.')
    format long
    x1=S+T-(1./3).*a2
    x2=-0.5*(S+T)-(1/3).*a2+0.5.*(3)^(.5).*(S-T).*i
    x3=-0.5*(S+T)-(1/3)*a2-0.5*(3)^(.5)*(S-T).*i
elseif (U==0)
    fprintf('Todas as solu��es s�o reais e, no m�nimo, duas delas s�o iguais.')
else
    fprintf('Todas as solu��es s�o reais e distintas entre si.')
    a=acos(-R/(-Q^3)^.5);
    x1=2*cos((1/3)*a)*(-Q)^.5
    x2=2*cos((1/3)*a+(2/3)*pi())*(-Q)^.5
    x3=2*cos((1/3)*a+(4/3)*pi())*(-Q)^.5
end




