function f = perlin_noise (x,g,ax,ay)
%x = the point in 2D for which Perlin noise is calculated
%g = the gradient vectors
%ax,ay = the co-ordinates of the grid nodes

d = pdist2(x,[ax(:) ay(:)]);

[~, ind] = sort(d);
P = [ax(ind(1:4)), ay(ind(1:4))];
G = g(ind(1:4),:);
S = repmat(x,4,1)-P;

x1 = min(P(:,1)); x2 = max(P(:,1)); y1 = min(P(:,2)); y2 = max(P(:,2));

w = diag(G * S');

[~,ind_x] = sort(P(:,1));
[~,ind_1] = sort(P(ind_x(1:2),2));
w_index(4) = ind_x(ind_1(1)); w_index(1) = ind_x(ind_1(2));
[~,ind_2] = sort(P(ind_x(3:4),2));
w_index(3) = ind_x(2+ind_2(1)); w_index(2) = ind_x(2+ind_2(2));
w = w(w_index);

f = (1 /((x2 - x1)*(y2 - y1)) ) * [x2 - x(1),x(1) - x1]* ...
    [w(1) w(4); w(2) w(3)] * [y2 - x(2); x(2) - y1];







