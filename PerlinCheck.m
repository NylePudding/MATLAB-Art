clc
close all
clear

% % perlin_noise(x,g,ax,ay)

[ax,ay] = meshgrid(0:10,0:10); % grid
% [xx,yy] = meshgrid(1.005:0.025:4,1.005:0.025:4); % test data
% 
ax = ax(:); ay = ay(:); 
% 
% g = randn(numel(ax),2); g = g./repmat(sqrt(sum(g.^2,2)),1,2)*2;
% for i = 1:numel(xx)
%     f(i) = perlin_noise([xx(i) yy(i)],g,ax,ay);
% end
% figure, surf(xx,yy,reshape(f,size(xx)))
% shading interp
% rotate3d


no_points = 1000


points = linspace(0,1,no_points);
points = [points;linspace(0,0,no_points)];
points = points';

g = randn(numel(points),2);

for i = 1:numel(points(:,1))
    f(i) = perlin_noise(points(i,:),g,ax,ay);
    
end


f

plot(f)




