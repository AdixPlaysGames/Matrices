function [L, U] = LUdecomposition(matrix)
% Funkcja ta rozklada wprowadzona macierz na macierze L i U korzystajac z
% algorytmu Doolittle'a. Algorytm ten jest jednak zalterowany, gdyz
% zakladamy, ze wprowadzone macierze sa tylko macierzami Hessenberga.

% Sprawdzamy czy macierz jest osobliwa
if isSingular(matrix)
    error("Wprowadzona macierz jest osobliwa!");
end
% Sprawdzamy czy macierz jest macierza Hessenberga
if not(isHessenberg(matrix))
    error("Wprowadzona macierz nie jest macierza Hessenberga!")
end

n = rank(matrix);
L = zeros(n);
U = zeros(n);

for i = 1:n
    L(i, i) = 1;
    for j = 1:i
        firstSum = 0;
        for k = 1:(j-1)
            % Ten warunek (if) skraca obliczenia, przyspieszajac tym samym
            % caly algorytm , JEDNAK JEDYNIE (jak juz wczesniej wspomniane)
            % dla macierzy Hassenberga. Dla danych "j" i "k" wartosci 
            % L(j,k) sa rowne zero, dlatego firstsum pozostaje niezmienna.
            if (j >= i+2 && k <= j-2)
                return;
            else
                firstSum = firstSum + L(j,k)*U(k,i);
            end
        end
        U(j,i) = matrix(j,i) - firstSum;
    end
    for j = (i+1):n
        % Warunek ten, podobnie jak poprzedni, skraca obliczenia algorytmu.
        % Dziala on na podobnej zasadzie, wartosci okreslonych "j" i "i" sa
        % dla L(j, i) rowne zero.
        if (j >= 2 && i <= j-2)
            L(j,i) = 0;
        else
            secondSum = 0;
            for k = 1:(i-1)
                secondSum = secondSum + L(j,k)*U(k,i);
            end
            L(j,i) = (matrix(j,i) - secondSum)/U(i,i);
        end
    end
end

end