close all, clear, clc

n = 50;

[xx, yy] = meshgrid(1:n,1:n);

cs = colour_scheme(n,7,1);

colormap(cs);
pcolor(xx);

axis square
axis equal off
shading interp