function outputMatrix = calculateX(matrix)
% Funkcja ta zwraca wynik X dla rownania AX = I (i XA = I), gdzie:
% - A to podana macierz "matrix", ktora jest macierza Hessenberga
% - I to macierz jednostkowa.
% Obliczanie tego wyniku polega na nastepujacych operacjach. Z poczatku
% rozbijamy macierz A na macierze L i U za pomoca funkcji LUdecomposition.
% Nastepnie dokonujemy obliczen AX = I = LUX, (zapisujac): 
%   L(UX) = I
%   UX = Z
%   LZ = I
% Obliczamy kolejno Z ze wzoru LZ = I i na koncu X ze wzoru UX = Z.

% Rozbijamy podana macierz na macierze L i U
[L, U] = LUdecomposition(matrix);

n = rank(matrix);
Z = zeros(n);
X = zeros(n);

% Obliczamy macierz Z
for i = 1:n
    column = zeros(1,n);
    column(i) = 1;
    for j = (i+1):n
        column(j) = -L(j,j-1)*column(j-1);
    end
    Z(:,i) = column;
end

% Obliczamy macierz X
for i = 1:n
    column = zeros(1,n);
    for j = 0:(n-1)
        ourSum = 0;
        for k = 0:(n-1)
            ourSum = ourSum + column(n-k)*U(n-j,n-k);
        end
        column(n-j) = (Z(n-j,i)-ourSum)/U(n-j, n-j);
    end
    X(:,i) = column;
end

% Zwracamy wynik
outputMatrix = X;

end