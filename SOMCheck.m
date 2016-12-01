clc
close all
clear

cm = [rand(1000,3)];

n = 50;

a = colour_SOM(n,cm,1000);
b = reshape(a,n,n,3);

figure 
imshow(b)

