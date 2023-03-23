% Tworzenie macierzy Hessenberga oraz rozbicie jej na macierze L i U za
% pomoca funkcji LUdecomposition.
% (funkcja magic(n) generuje nam macierz o wylosowanych wartosciach 
% rozmiarow nxn, natomiast hess(matrix) zapisuje dana macierz "matrix" na
% macierz Hessenberga)

% n to ilosc wynikow
n = 100;
MatrixOfTimes = zeros(n, 4);
for i = 1:n
    A = hess(magic(i*2 + 1));
    [L, U] = LUdecomposition(A);
    tic
    invA = inverseLU(L, U);
    timeElapsed1 = toc;

    tic
    invA = inv(A);
    timeElapsed2 = toc;

    tic
    invA = calculateXLU(L, U);
    timeElapsed3 = toc;
    
    MatrixOfTimes(i, 1) = timeElapsed1;
    MatrixOfTimes(i, 2) = timeElapsed2;
    MatrixOfTimes(i, 3) = timeElapsed3;
    MatrixOfTimes(i, 4) = i*2 + 1;
end

x = MatrixOfTimes(:, 4);

% Wykres przedstawiający czasy obliczania odwrotnosci w zaleznosci od
% rozmiaru podanej macierzy Hessenberga.
figure
plot(x, MatrixOfTimes(:, 1), x, MatrixOfTimes(:, 2), x, MatrixOfTimes(:, 3))
xlim([0, n*2+1]);
xlabel("Size of the matrix")
ylabel("Time")
legend({'inverse','inv', 'calculateX'})



MatrixOfCond = zeros(n, 3);
MatrixOfrR = zeros(n, 3);
MatrixOfrL = zeros(n, 3);
MatrixOfedec = zeros(n, 3);

for i = 1:n
    A = hess(magic(i*2 + 1));
    [condinv, rRinv, rLinv, edecinv] = specValues(A, inv(A));
    [condinverse, rRinverse, rLinverse, edecinverse] = specValues(A, inverse(A));
    [condcal, rRcal, rLcal, edeccal] = specValues(A, calculateX(A));
    MatrixOfCond(i, 1) = condinv;
    MatrixOfCond(i, 2) = condinverse;
    MatrixOfCond(i, 3) = condcal;

    MatrixOfrR(i, 1) = rRinv;
    MatrixOfrR(i, 2) = rRinverse;
    MatrixOfrR(i, 3) = rRcal;

    MatrixOfrL(i, 1) = rLinv;
    MatrixOfrL(i, 2) = rLinverse;
    MatrixOfrL(i, 3) = rLcal;

    MatrixOfedec(i, 1) = edecinv;
    MatrixOfedec(i, 2) = edecinverse;
    MatrixOfedec(i, 3) = edeccal;
end

% Wykres przedstawiajacy wartosc rR w zaleznosci od
% rozmiaru podanej macierzy Hessenberga 
figure
plot(x, MatrixOfrR(:, 1), x, MatrixOfrR(:, 2), x, MatrixOfrR(:, 3))
xlim([0, n*2+1]);
ylim([0, 0.1*10^(-13)]);
xlabel("Size of the matrix")
ylabel("rR value")
legend({'inv','inverse', 'calculateX'})

% Wykres przedstawiajacy wartosc rL w zaleznosci od
% rozmiaru podanej macierzy Hessenberga 
figure
plot(x, MatrixOfrL(:, 1), x, MatrixOfrL(:, 2), x, MatrixOfrL(:, 3))
xlim([0, n*2+1]);
ylim([0, 0.1*10^(-13)]);
xlabel("Size of the matrix")
ylabel("rL value")
legend({'inv','inverse', 'calculateX'})

% Wykres przedstawiajacy wartosc cond w zaleznosci od
% rozmiaru podanej macierzy Hessenberga 
figure
plot(x, MatrixOfCond(:, 1), x, MatrixOfCond(:, 2), x, MatrixOfCond(:, 3))
xlim([3, n*2+1]);
xlabel("Size of the matrix")
ylabel("cond value")
legend({'inv','inverse', 'calculateX'})

% Wykres przedstawiajacy wartosc edec w zaleznosci od
% rozmiaru podanej macierzy Hessenberga 
figure
plot(x, MatrixOfedec(:, 1))
xlim([3, n*2+1]);
ylim([0, 0.1*10^(-13)]);
xlabel("Size of the matrix")
ylabel("edec value")