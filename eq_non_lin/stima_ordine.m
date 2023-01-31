function ordine=stima_ordine(xk,iterazioni)
    %xk = vettore degli iterati del nostro metodo (bisez,...)
    %iterazioni = le iterazioni fatte
p=zeros(iterazioni,1);

for k=3:iterazioni-1
    p(k-2)=log(abs(xk(k+1)-xk(k))/abs(xk(k)-xk(k-1)))/log(abs(xk(k)-xk(k-1))/abs(xk(k-1)-xk(k-2)));
end

ordine=p(iterazioni-3);