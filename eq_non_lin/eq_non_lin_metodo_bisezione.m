
 % definisco gli estremi dell'intervallo
a = 2;
 b = 3;
 % definisco l'errore epsilon tollerato
 epsilon = 1e-4;
 % utilizzo il comando fcnchk così da definire una variabile effe 
 %     da trattare come funzione a tutti gli effetti
 effe = fcnchk('x.^2-6');
 % invoco la funzione bisezione per calcolare la soluzione
 %     notare che mi viene restituito anche il numero it di iterazioni
 [x,it] = bisezione(effe,a,b,epsilon);
 % calcolo la soluzione reale così da poter calcolare l'errore esatto
 x_reale = sqrt(6);
 % trovo l'errore
 errore = abs(x(3:it+2) - x_reale);
 % mostriamo come cambiano le soluzioni all'aumentare del numero
 %     di iterazioni. Notiamo che non è detto che migliorino
 for i=1:it
   fprintf('it=%2d x=%16.13f errore=%12.6e \n',i,x(i+2),errore(i));
 end

% Metodo di bisezione
% -------------------
% restituisce la soluzione calcolata x ed il numero
%   di iterazioni effettuate it
% richiede parametri di ingresso, la funzione, gli estremi
%   dell'intervallo e l'errore tollerato epsilon
function [x,it]=bisezione(f,a,b,epsilon)
% assegno x(1)=a e x(2)=b allo scopo di automatizzare 
%   l'assegnamento degli estremi di ogni intervallo
%   NOTA: ne consegue che le iterazioni reali diventeranno it+2
x(1) = a; x(2) = b;
% calcolo anche il valore della funzione negli estremi
fa = f(a); fb = f(b);

% verifico che la soluzione sia contenuta nell'intervallo
%   in caso contrario esco dalla funzione
if fa * fb > 0 % non ci sono zeri nell'intervallo
    disp('Intervallo non accettabile'); 
    return; 
end

% se invece la soluzione è contenuta, calcolo il numero
%   di iterazioni che sono disposto a fare per ottenere
%   un risultato che stia dentro i margini di tolleranza
%   indicati in epsilon (passato come parametro)
it = ceil((log(b-a) - log(epsilon)) / log(2)); 
% il comando ceil(x) restituisce il primo intero maggiore di x

% avvio il procedimento iterativo, ripetendolo it volte
for k=3:it+2
    % calcolo la x al passo k
    %   notare che a e b sono gli estremi individuati
    %   al passo precedente
    x(k) = (a + b)/2; 
    % calcolo il valore della funzione in quel punto
    fxk = f(x(k));
    % se lo zero è nel sottointervallo di sinistra..
    if fa * fxk <= 0
        % ...allora il nuovo estremo destro è x(k)...
        b = x(k);
        fb = fxk;
    % ...altrimenti se è nel sottointervallo di destra...
    else
        % ...x(k) è il nuovo estremo sinistro
        a = x(k);
        fa = fxk;
    end
end
end