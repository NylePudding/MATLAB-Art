function [A] = rgb_pcolour (a,cs)

[n,m] = size(a);
A = zeros(n,m,3);
rescaled_a = zeros(n,m);

minimum = min(min(a));
maximum = max(max(a));

for i = 1:n
    for j = 1:m
        
        rescaled_a(i,j) = ( a(i,j) - minimum ) / ...
        ( maximum - minimum );
        
    end
end


[colours,~] = size(cs);

for i = 1:n
    for j = 1:m
        
        colour_ind = int16(rescaled_a(i,j) * colours);
        
        if colour_ind == 0 
            colour_ind = 1;
        end
        
        A(i,j,1) = cs(colour_ind,1);
        A(i,j,2) = cs(colour_ind,2);
        A(i,j,3) = cs(colour_ind,3);
        
    end
end

