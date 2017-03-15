function [A] = im_mask (im1,im2,a, mask)
% im1 = First image
% im2 = Second image
% mask = The matrix of the letter mask

[n,~] = size(im1);

A = zeros(n,n,3);

for i = 1:n
    for j = 1:n
        if mask(i,j) == 0
            if a(i,j) < -4
                A(i,j,:) = im1(i,j,:);
            else
                A(i,j,:) = im2(i,j,:);
            end
        else
            A(i,j,:) = im2(i,j,:);
        end
    end
end

