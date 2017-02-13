function [m] = start_formation (s,lines)

b = zeros(s/2);

b(1:end,end) = 1;
b(end,1:end) = 1;

ext = randperm(s,lines);


for i = 1:s/2
    if any(ext==i)
        b(i:end,i) = 1;
        b(i,i:end) = 1;
    end
end


m = [b fliplr(b);
     flipud(b) flipud(fliplr(b))];