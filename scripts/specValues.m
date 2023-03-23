function [cond, rR, rL, edec] = specValues(matrix, inversed)

n = rank(matrix);

% Przypisujemy zmienne
cond = norm(inversed)*norm(matrix);
rR = norm(matrix*inversed - eye(n))/(norm(matrix)*norm(inversed));
rL = norm(inversed*matrix - eye(n))/(norm(matrix)*norm(inversed));

% Tworzymy macierze rozkladu i zapisujemy zmienna
[L, U] = LUdecomposition(matrix);
edec = norm(matrix-L*U)/norm(matrix);

end