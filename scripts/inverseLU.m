function inversed = inverseLU(L, U)
n = rank(L);
invL = eye(n);
invU = eye(n);

% Odwracanie macierzy L oraz zapisanie odwrotnosci
% jako L^(-1) = invL.
% (Ta metoda bierze ponownie pod uwage, ze mamy tutaj rozklad macierzy
% Hessenberga, do innych to nie zadziala)
for i = 1:(n-1)
    invL(i+1,:) = invL(i+1,:) - L(i+1,i).*invL(i,:);
end

% Odwracanie macierzy U oraz zapisanie odwrotnosci
% jako U^(-1) = invU.
for i = 1:n
    invU(n-(i-1),:) = invU(n-(i-1),:)/U(n-(i-1), n-(i-1));
    U(n-(i-1),:) = U(n-(i-1),:)./U(n-(i-1), n-(i-1)); 
end
for i = 1:(n-1)
    for j = i:(n-1)
        invU(n-j,:) = invU(n-j,:) - invU(n-i+1,:)*U(n-j,n-i+1);
    end
end

% Zwracanie naszego wyniku macierzy odwrotnej do podanej "matrix"
inversed = invU*invL;

end