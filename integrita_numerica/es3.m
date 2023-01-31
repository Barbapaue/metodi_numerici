clc
clear all
format short e
close all
syms x real 
%.......................................
%   fx=cos(x); a=0; b=2;
fx=x.*exp(x).*cos(x.^2);   a=-2*pi; b=0;
%fx=(sin(x)).^(13/2).*cos(x); a=0; b=pi/2;
% fx=(sin(x)).^(5/2).*cos(x); a=0; b=pi/2;
 %  fx=(sin(x)).^(1/2).*cos(x); a=0; b=pi/2;
%.......................................

f=matlabFunction(fx);
I=double(int(fx,x,a,b)); 

cont1=1;
 
for k=4:10
    fprintf('trapezi composita con k=%d: ',k)
    [INt(cont1),Nt(cont1)]=traptoll(f,a,b,10^(-k));
    
    [INs(cont1),Ns(cont1)]=simptoll(f,a,b,10^(-k));
    cont1=cont1+1;
end

disp(' ')
disp('----------------------')
disp('   errore trapezi')
disp('----------------------')
Et=abs(INt-I).' 
 
disp('----------------------')
disp('   errore simpson')
disp('----------------------')
Es=abs(INs-I).' 

figure(1) 
semilogy(4:10 ,Et,'r*-',4:10,Es,'bo-')
legend('errore trapezi','errore simpson')

figure(2)
hold on
title('Numero sottointervalli')
plot(4:10,Nt,'r*-',4:10,Ns,'bo-')
legend('trapezi','simpson')

 
