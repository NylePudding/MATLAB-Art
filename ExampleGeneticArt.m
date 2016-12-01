function ExampleGeneticArt
% A lot of black in the colout palette
clc
close all
global x y f1 f2
%%
rng(1994)
T = 1000;
t = linspace(0,4,T)-2;
[x,y] = meshgrid(t,t);
f1 = @(k1,k2,x,y) k1*sin(randn*4*y).*x.^2 + k2*cos(randn*4*x).*y.^2;
f2 = @(k1,k2,x,y) sin(k1*x).*sin(k2*y);
oldf = zeros(T);
figure('color','w')
for i = 1:30
    p1 = randn*f1(randn,randn,x,y) + randn*f2(randn*10,randn*10,x,y);
    p2 = randn*f1(randn,randn,x,y) + randn*f2(randn*10,randn*10,x,y);
    f = f2(rand*3,rand*3,p1+2*randn,p2+2*randn);
    ff = 2*f+flipud(f)+fliplr(f);
    show_pattern(ff)
    pause(1)
end
end
function show_pattern(s)
pcolor(s), shading interp
axis equal off
% colormap gray
cm = rand(18,3);
cm = [zeros(8,3);cm];
[~,ind] = sort(cm(:,1));
cm = cm(ind,:);
colormap(cm)
end