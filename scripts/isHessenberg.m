function boolean = isHessenberg(matrix)
% Funkcja ta sprawdza czy wprowadzona macierz (z zalozenia nieosobliwa)
% jest macierza Hessenberga. Zwraca ona wartosc logiczna, podobnie jak
% funkcja "isSingular()".
n = rank(matrix);
boolean = 1;
for i = 1:(n-2)
    for j = (i+2):n
        if not(isequal(round(matrix(j, i), 6), 0))
            boolean = 0;
            return
        end
    end
end
end