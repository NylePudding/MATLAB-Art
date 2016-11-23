clc
close all
clear

interval = 1;
upper_bound = 2;

% % perlin_noise(x,g,ax,ay)

[ax,ay] = meshgrid(0:interval:upper_bound,0:interval:upper_bound); % grid
[xx,yy] = meshgrid(0:0.001:upper_bound,0:00.1:upper_bound); % test data

ax = ax(:); ay = ay(:); 

g = randn(numel(ax),2); g = g./repmat(sqrt(sum(g.^2,2)),1,2)*2;
for i = 1:numel(xx)
    f(i) = perlin_noise([xx(i) yy(i)],g,ax,ay);
end
figure, surf(xx,yy,reshape(f,size(xx)))
shading interp
rotate3d


% no_points = 10000;
% 
% 
% points = linspace(0,upper_bound,no_points);
% points = [points;linspace(0,upper_bound,no_points)];
% points = points';
% 
% g = randn(numel(ax),2);
% 
% for i = 1:numel(points(:,1))
%     f(i) = perlin_noise(points(i,:),g,ax,ay);
% end
% 
% 
% f;
% 
% plot(f)




