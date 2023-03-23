function boolean = isSingular(matrix)
% Funkcja ta sprawdza, czy wprowadzona przez nas macierz jest osobliwa,
% gdyz w tym wypadku nie mamy mozliwosci rozbicia jej na macierze LU.
% Funkcja zwraca wartosc logiczna w zaleznosci od wyznacznika podanej
% macierzy. (det=0 => macierz osobliwa)
boolean = isequal(round(det(matrix), 6), 0);
end


