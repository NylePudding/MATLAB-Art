close all
clc
clear

A=peaks(300);
A=A-mean(mean(A));
A=10*A/max(max(A));
A=round(A);
stereogram(A,'crossed-eyes');