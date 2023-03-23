% Matrix Comparator
n = 303;
A = hess(magic(n));
Ainv = inv(A);
Ainverse = inverse(A);
AcalculateX = calculateX(A);

AinvmAinverse = abs(Ainv - Ainverse);
AinvmAcalculateX = abs(Ainv - AcalculateX);
AinversemAcalculateX = abs(Ainverse - AcalculateX);

pot = 201;

map = hot(100);
figure
x=[1,n];
y=[1,n];
imagesc(x,y,AinversemAcalculateX);
xlim([1, n]);
ylim([1, n]);
set(gca,"YDir", "normal");
colormap(flipud(map))
colorbar;
lims=clim;
mlim = 0;
plim = 1*10^(-pot);
clim([mlim,plim]);

