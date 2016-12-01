function [f,im] = fitness_image_match_colour(x,y,A,data)
dt = DelaunayTri(data);
Labels = pointLocation(dt, [x(:) y(:)]);
maxval = 255*numel(A);
re = A(:,:,1); gr = A(:,:,2); bl = A(:,:,3);
for i = 1:max(Labels)
    re(Labels == i) = nanmean(double(re(Labels == i)));
    gr(Labels == i) = nanmean(double(gr(Labels == i)));
    bl(Labels == i) = nanmean(double(bl(Labels == i)));
end
im = cat(3,re,gr,bl);
f = (maxval - sum(abs(double(im(:)) - double(A(:)))))/maxval;
end
