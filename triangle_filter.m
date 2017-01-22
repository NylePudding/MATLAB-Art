function triangle_filter( AA )
%TRIANGLE_FILTER Summary of this function goes here
%   Detailed explanation goes here

if ndims(AA) == 1, A = cat(3,A,A,A); else A = AA; end
% -----------------------------
 
 
A = imresize(A,300/size(A,1));
sz = size(A);
[x,y] = meshgrid(1:sz(2),1:sz(1));
N = 200;
ps = 10;
gen = 50;
corners = [0 0;0 1;1 0;1 1] .* repmat([sz(2),sz(1)],4,1);
P = cell(1,ps); % population
Fi = zeros(1,2*ps);
Im = cell(1,2*ps);
for i = 1:ps
    P{i} = [rand(N,1)*sz(2),rand(N,1)*sz(1)];
    [Fi(i),Im{i}] = fitness_image_match_colour(x,y,A,[corners;P{i}]);
end
figure
for k = 1:gen
    disp(k)
    % generate offspring
    O = cell(1,ps);
    for i = 1:ps
        parent1 = P{randi(ps)}; parent2 = P{randi(ps)};
        cop = randi(N); % crossover point
        O{i} = [parent1(1:cop,:);parent2(cop + 1:end,:)]; % crossover
        % O = P;
        O{i} = O{i} + randn(N,2)*0.2.*(rand(N,2)<0.15); % mutation
        [Fi(ps+i),Im{ps+i}] = ...
            fitness_image_match_colour(x,y,A,[corners;O{i}]);
    end
    % reorder
    [Fi,indFi] = sort(Fi,'descend');
    G = [P O];
    Im = Im(indFi);
    P = G(1:ps);
    disp(Fi(1))
    imshow(Im{1})
    drawnow
end


end

