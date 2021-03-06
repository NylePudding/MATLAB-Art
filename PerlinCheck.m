clc
close all
clear

grid_interval = 1;
upper_bound = 1;
point_interval = 0.01

% % perlin_noise(x,g,ax,ay)

[ax,ay] = meshgrid(0:grid_interval:upper_bound,0:grid_interval:upper_bound); % grid
[xx,yy] = meshgrid(0:point_interval:upper_bound,0:point_interval:upper_bound); % test data

ax = ax(:); ay = ay(:); 

g = randn(numel(ax),2); g = g./repmat(sqrt(sum(g.^2,2)),1,2)*2;
for i = 1:numel(xx)
    f(i) = perlin_noise([xx(i) yy(i)],g,ax,ay);
end
figure, surf(xx,yy,reshape(f,size(xx)))
shading interp
rotate3d

%%

clc, close all, clear

grid_interval = 1;
upper_bound = 1;
point_interval = 0.01

% % perlin_noise(x,g,ax,ay)

[ax1,ay1] = meshgrid(0:1:1,0:1:1); % grid
[xx1,yy1] = meshgrid(0:point_interval:1,0:point_interval:1); % test data

ax1 = ax1(:); ay1 = ay1(:); 

g1 = randn(4,2); g1 = g1./repmat(sqrt(sum(g1.^2,2)),1,2)*2;
for i = 1:numel(xx1)
    f1(i) = perlin_noise([xx1(i) yy1(i)],g1,ax1,ay1);
end

[ax2,ay2] = meshgrid(1:1:2,0:1:1); % grid
[xx2,yy2] = meshgrid(1:point_interval:2,0:point_interval:1); % test data

ax2 = ax2(:); ay2 = ay2(:); 

g2 = randn(2,2); g2 = g2./repmat(sqrt(sum(g2.^2,2)),1,2)*2;
g2 = [g1(3,:);g1(4,:);g2(1,:);g2(2,:);];
for i = 1:numel(xx2)
    f2(i) = perlin_noise([xx2(i) yy2(i)],g2,ax2,ay2);
end


% [ax3,ay3] = meshgrid(0:1:1,1:1:2); % grid
% [xx3,yy3] = meshgrid(0:point_interval:1,1:point_interval:2); % test data
% 
% ax3 = ax3(:); ay3 = ay3(:); 
% 
% g3 = randn(2,2); g3 = g3./repmat(sqrt(sum(g3.^2,2)),1,2)*2;
% g3 = [g3(1,:);g1(1,:);g3(2,:);g1(3,:)]
% for i = 1:numel(xx3)
%     f3(i) = perlin_noise([xx3(i) yy3(i)],g3,ax3,ay3);
% end
% 
% [ax4,ay4] = meshgrid(1:1:2,1:1:2); % grid
% [xx4,yy4] = meshgrid(1:point_interval:2,1:point_interval:2); % test data
% 
% ax4 = ax4(:); ay4 = ay4(:); 
% 
% g4 = randn(1,2); g4 = g4./repmat(sqrt(sum(g4.^2,2)),1,2)*2;
% g4 = [g3(3,:); g1(3,:);g4(1,:);g2(3,:)]
% for i = 1:numel(xx3)
%     f4(i) = perlin_noise([xx4(i) yy2(i)],g4,ax4,ay4);
% end

f = [f1 f2];
xx = [xx1 xx2];
yy = [yy1 yy2];

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




