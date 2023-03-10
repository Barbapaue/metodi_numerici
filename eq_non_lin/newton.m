function [x1,xk,it]=newton(fname,fpname,x0,tolx,tolf,nmax)
%x1 = soluzione
%xk = vettore delle soluzioni
%it = numero di iterazioni

%fname = nome funzione
%fpname = nome derivata prima (funzione con al derivata prima) (calcola il nuovo iterato come intersezione con l'asse delle x che passa per l'iterato precedente)
%x0 = iterato iniziale
%tolx = tolleranza sull'asse delle x
%tolf = tolleranza sul valore della funzione
%nmax = iterazioni massime

fx0=fname(x0);
dfx0=fpname(x0);
if abs(dfx0)>eps
    d=fx0/dfx0;
    x1=x0-d;
    fx1=fname(x1);
    it=1;
    xk(it)=x1;
    %fprintf('it=%d  x=%8.15f \n',it,x1);
else
    fprintf('Derivata nulla in x0 - EXIT \n')
    disp(dfx0)
    x1=[];
    xk=[];
    it=[];
    return
end

while it<nmax && abs(fx1)>=tolf && abs(d)>=tolx*abs(x1)
    x0=x1;
    fx0=fname(x0);
    dfx0=fpname(x0);
    if abs(dfx0)>eps
        d=fx0/dfx0;
        x1=x0-d;
        fx1=feval(fname,x1);
        it=it+1;
        xk(it,:)=x1;
        %fprintf('it=%d  x=%8.15f \n',it,x1);
    else
        fprintf('Derivata nulla in xi - EXIT \n')
        disp(dfx0)
        break
    end
end
if it==nmax
    fprintf('raggiunto massimo numero di iterazioni \n');
end

