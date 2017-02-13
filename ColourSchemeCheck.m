close all, clear, clc

n = 50;

[xx, yy] = meshgrid(1:n,1:n);



% JAN
cs = colour_scheme(n,1,1,1);

% FEB
cs = colour_scheme(n,1,1,500);

% MAR
cs = colour_scheme(n,1,1,1350);

% APR
cs = colour_scheme(n,9,1,500);

% MAY
cs = colour_scheme(n,3,1,2000);

% JUN
cs = colour_scheme(n,9,1,500);

% JUL
cs = colour_scheme(n,3,1,2950);

% AUG
cs = colour_scheme(n,1,1,2000);

% SEP
cs = colour_scheme(n,2,1,1000);

% OCT
cs = colour_scheme(n,9,1,500);

% NOV
cs = colour_scheme(n,2,1,2400);

% DEC
cs = colour_scheme(n,1,1,1700);


colormap(cs);
pcolor(xx);

% a = rgb_pcolour(xx,cs);

% imshow(a);

axis square
axis equal off
shading interp