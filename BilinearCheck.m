clc
close all
clear

% perlin_noise(x,g,ax,ay)

[ax,ay] = meshgrid(1:4,1:4); % grid
[xx,yy] = meshgrid(1.005:0.05:4,1.005:0.05:4); % test data

ax = ax(:); ay = ay(:);
F = rand(numel(ax),1); % function valuse on the grid

for i = 1:numel(xx)
    x = [xx(i) yy(i)];
    
    % find the cell to figure out the corner function values
    d = pdist2(x,[ax(:) ay(:)]);    
    [~, ind] = sort(d);
    corners = ind(1:4);
    P = [ax(corners), ay(corners)];
    [~,ind_x] = sort(P(:,1));
    [~,ind_1] = sort(P(ind_x(1:2),2));
    w_index(4) = ind_x(ind_1(1)); w_index(1) = ind_x(ind_1(2));
    [~,ind_2] = sort(P(ind_x(3:4),2));
    w_index(3) = ind_x(2+ind_2(1)); w_index(2) = ind_x(2+ind_2(2));
    Ind = corners(w_index);
    
    f(i) = bilinear_interpolation(x,1,2,2,3,F(Ind));
end
figure, surf(xx,yy,reshape(f,size(xx)))
shading interp
rotate3d
