function a = colour_SOM (n,d,ite)
% n = n by n size of grid
% d = training data
% ite = number of iterations

% a = n by n, trained colour map

a = rand(n*n,1,3);
figure
colours = size(d);
imshow(reshape(a,n,n,3))
learning_rate = linspace(1,0.01,ite);

for i = 1 : ite
    
    colours = size(d);
    
    random_ind = randi([1 colours(1)]);
    
    for j = 1 : n*n
        dists(j) = sqrt(sum(( d(random_ind,:) - a(j,:)) .^ 2));
    end
    
%     a1 = reshape(a,n,n,3);
    
    [~,ind] = sort(dists);
    
    x_c = floor(ind(1)/ n);
    y_c =  mod(ind(1),n);
    
    a(ind(1),:) = a(ind(1),:) + learning_rate(i)*( d(random_ind,:) - a(ind(1),:));
    
    x_e = x_c + 1;
    y_e = y_c;
    e_ind = n * y_e + x_e;
    
    if x_e <= n && x_e > 0
        a(e_ind,:) = a(e_ind,:) + (learning_rate(i)*learning_rate(i))*( d(random_ind,:) - a(e_ind,:));
    end
    
    x_w = x_c - 1;
    y_w = y_c;
    w_ind = n * y_w + x_e;
    
    if x_w <= n && x_w > 0
        a(w_ind,:) = a(w_ind,:) + (learning_rate(i)*learning_rate(i))*( d(random_ind,:) - a(w_ind,:));
    end
    
    x_n = x_c;
    y_n = y_c - 1;
    n_ind = n * y_n + x_n ;
    
    if y_n < n && y_n > 0
        a(n_ind,:) = a(n_ind,:) + (learning_rate(i)*learning_rate(i))*( d(random_ind,:) - a(n_ind,:));
    end
    
    x_s = x_c;
    y_s = y_c + 1;
    s_ind = n * y_s + x_s;
    
    if y_s < n && y_s > 0
        a(s_ind,:) = a(s_ind,:) + (learning_rate(i)*learning_rate(i))*( d(random_ind,:) - a(s_ind,:));
    end
    
    
    x_ne = x_c + 1;
    y_ne = y_c - 1;
    ne_ind = n * y_ne + x_ne;
    
    if x_ne <= n && x_ne > 0 && y_ne < n && y_ne > 0
        a(ne_ind,:) = a(ne_ind,:) + (learning_rate(i)*learning_rate(i))*( d(random_ind,:) - a(ne_ind,:));
    end
    
    x_nw = x_c - 1;
    y_nw = y_c - 1;
    nw_ind = n * y_nw + x_nw;
    
    if x_nw <= n && x_nw > 0 && y_nw < n && y_nw > 0
        a(nw_ind,:) = a(nw_ind,:) + (learning_rate(i)*learning_rate(i))*( d(random_ind,:) - a(nw_ind,:));
    end
    
    x_se = x_c + 1;
    y_se = y_c + 1;
    se_ind = n * y_se + x_se;
    
    if x_se <= n && x_se > 0 && y_se < n && y_se > 0
        a(se_ind,:) = a(se_ind,:) + (learning_rate(i)*learning_rate(i))*( d(random_ind,:) - a(se_ind,:));
    end
    
    x_sw = x_c - 1;
    y_sw = y_c + 1;
    sw_ind = n * y_sw + x_sw;
    
    if x_sw <= n && x_sw > 0 && y_sw < n && y_sw > 0
        a(sw_ind,:) = a(sw_ind,:) + (learning_rate(i)*learning_rate(i))*( d(random_ind,:) - a(sw_ind,:));
    end
    
    
    
    
    
    
%     
%     for j = size 
%     
%     d = (sqrt((d(randi([1 size(d)])^2) + a(:,))
    
   
end


