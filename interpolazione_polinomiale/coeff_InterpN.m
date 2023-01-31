  function a = coeff_InterpN(x,y)
% Calcola la tabella delle differenze divise memorizzando solo gli
% elementi della diagonale, che rappresentano i coefficienti del polinomio
% interpolatore di Newton
n = length(x);
a=y;
 for i=1:n
     for k=n-1:-1:i
        a(k+1)=(a(k+1)-a(k))/(x(k+1)-x(k-i+1));
     end
 end

 %Codice per il calcolo vettoriale, più efficiente in matlab, dei
 %coefficienti a
%    for k = 1:n-1
%       y(k+1:n) = (y(k+1:n)-y(k)) ./ (x(k+1:n) - x(k)); 
%    end
%    a = y;

