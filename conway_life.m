function [a,m] = conway_life(m, ite)
[~,n] = size(m);
% a = randi([0 1],s);
a = zeros(n);

for j = 1:1
    %m = randi(2, s) - 1;
    
    for i = 1:ite
       neighbours = conv2(m, [1 1 1; 1 0 1; 1 1 1], 'same');
       m = double((m & neighbours == 2) | neighbours == 3);
       a = a + m;
       a(a>1) = 0.3;
       a = a - 0.01;
    end
end


%cm = colour_scheme(30);
% colormap(cm)
% pcolor(a), shading flat
% axis equal off

end

