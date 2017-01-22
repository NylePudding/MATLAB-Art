clc, clear all, close all

s = 60;
a = zeros(s);

for j = 1:25
    m = randi(2, s) - 1;
    for i = 1:15
       neighbours = conv2(m, [1 1 1; 1 0 1; 1 1 1], 'same');
       m = double((m & neighbours == 2) | neighbours == 3);
       a = m + a;
    end

end

pcolor(a) 
shading interp
% shading flat
axis equal off
% colormap gray
% cm = rand(5,3);
% cm = [zeros(10,3);cm];
% cm = [ones(5,3);cm];

cm = colour_scheme(50);
[~,ind] = sort(cm(:,1));
cm = cm(ind,:);
colormap(cm)

%%
clc, clear all, close all

s = 501;
a = ones(s);

axis square

for j = 1:1
    m = randi(2, s) - 1;
    for i = 1:1000
       neighbours = conv2(m, [1 1 1; 1 0 1; 1 1 1], 'same');
       m = double((m & neighbours == 2) | neighbours == 3);
       a = a + m;
       a(a>1) = 0.5 + (rand / 2);
       a = a - 0.02;
    end
end

% ScrData = membrane(1,250,9,2);
% b = makeAbsird( ScrData, 32, randi([0 1],32));
% imshow(imfuse(a,b))

cm = colour_scheme(30);
colormap(cm)
pcolor(a), shading flat
axis equal off
% colormap gray
% cm = rand(6,3);
% cm = [zeros(1,3);cm];
% cm = [ones(1,3);cm];
% [~,ind] = sort(cm(:,2));
% cm = cm(ind,:);

%%

clc, clear all, close all
figure('color',[0.3 0 0])
hold on
axis square off
[x,y] = deal(0);
[rx,ry] = deal(0.001);
T = 8000;
t = linspace(0,120*pi,T);
for i = 1:T
    rx = rx*1.00003;
    ry = ry*1.00004;
    xn = x+rx*sin(1.2*t(i))-rx*cos(t(i)*3);
    yn = y+ry*cos(t(i));   
    plot([x xn],[y yn],'linewidth',3*((T-i)/T)+0.001,'color',[1 1 1]*i/T)   
    x = xn;y=yn;
    drawnow
end
 
 
%% 
 
clear all
clc
close all
% -----------------------------
[fi,pa] = uigetfile('*.jpg');
AA = imread([pa,'/',fi]);
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
 
 
 %%
 
clear all
clc
close all
[p1,p2] = uigetfile('*.jpg','*.png');
aa = imread([p2,'\',p1]);
imshow(aa), hold on
r = 200/size(aa,1);
ab = imresize(aa,r);
a = rgb2gray(ab);
X = [1 size(aa,2)];Y = [1 size(aa,1)];
imcontour(X,Y,a,'k');
 
 
BR = edge(aa(:,:,1),'sobel');
BG = edge(aa(:,:,2),'sobel');
BB = edge(aa(:,:,3),'sobel');
ed = 1-(BR | BG | BB);
ad = uint8(double(aa).*cat(3,ed,ed,ed));
figure, imshow(ad)
 
figure, imshow(ab), hold on
XX = [1 size(a,2)];YY = [1 size(a,1)];
imcontour(XX,YY,a,'k');
 
figure('color','w')
[C,H] = imcontour(X,Y,a,'k');
axis off
[im,map] = rgb2ind(ab,5);
figure('color','w')
contourf(double(flipud(a)),5)
axis equal off
colormap(map)
N = 10; % number of colours
K = 3; % filter size
[im,map] = rgb2ind(ab,N); ac = medfilt2(im,[K,K]);
figure, imshow(aa), hold on
imcontour(X,Y,ac,N,'k');

