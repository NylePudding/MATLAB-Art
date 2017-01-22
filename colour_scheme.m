function [C] = ColourScheme (n, t, g)
%n = total number of colours
%t = type of colour scheme
%g = gender

wheel = zeros(3000,3);
wheel(1:500,1) = 1;
wheel(1:500,2) = 0;
wheel(1:500,3) = linspace(0,1,500);

wheel(501:1000,1) = linspace(1,0,500);
wheel(501:1000,2) = 0;
wheel(501:1000,3) = 1;

wheel(1001:1500,1) = 0;
wheel(1001:1500,2) = linspace(0,1,500);
wheel(1001:1500,3) = 1;

wheel(1501:2000,1) = 0;
wheel(1501:2000,2) = 1;
wheel(1501:2000,3) = linspace(1,0,500);

wheel(2001:2500,1) = linspace(0,1,500);
wheel(2001:2500,2) = 1;
wheel(2001:2500,3) = 0;

wheel(2501:3000,1) = 1;
wheel(2501:3000,2) = linspace(0,1,500);
wheel(2501:3000,3) = 0;

c1_ind = randi([0 3000]);



C = [ ];

if t == 5
    
    c2_ind = c1_ind + 300;
    
    if c2_ind > 3000
        c2_ind = c2_ind - 3000;
    end
    
    C1 = [ linspace(wheel(c1_ind,1),0,n)' linspace(wheel(c1_ind,2),0,n)' linspace(wheel(c1_ind,3),0,n)'];
    C2 = [ linspace(wheel(c2_ind,1),0,n)' linspace(wheel(c2_ind,2),0,n)' linspace(wheel(c2_ind,3),0,n)'];
    
    
    C = [C1; flipud(C2)]
    
end

if t == 4
    
    c2_ind = c1_ind + 100;
    c3_ind = c1_ind + 100 + 100;
    
    if c2_ind > 3000
        c2_ind = c2_ind - 3000;
    end
    if c2_ind < 1 
        c2_ind = 3000 + c2_ind;    
    end
    
    if c3_ind > 3000
        c3_ind = c3_ind - 3000;
    end
    if c3_ind < 1 
        c3_ind = 3000 + c3_ind;    
    end
    
    darkness = sum(wheel(c1_ind,:)) + sum(wheel(c2_ind,:)) + sum(wheel(c3_ind,:));
    
    if darkness > 9/2
    
        C1 = [ linspace(wheel(c1_ind,1),0,n)' linspace(wheel(c1_ind,2),0,n)' linspace(wheel(c1_ind,3),0,n)'];
        C4 = [ linspace(wheel(c3_ind,1),0,n)' linspace(wheel(c3_ind,2),0,n)' linspace(wheel(c3_ind,3),0,n)'];
    end
    if darkness <= 9/2
        C1 = [ linspace(wheel(c1_ind,1),1,n)' linspace(wheel(c1_ind,2),1,n)' linspace(wheel(c1_ind,3),1,n)'];
        C4 = [ linspace(wheel(c3_ind,1),1,n)' linspace(wheel(c3_ind,2),1,n)' linspace(wheel(c3_ind,3),1,n)'];
    end
    
    C2 = [ linspace(wheel(c1_ind,1),wheel(c2_ind,1),n)' ... 
           linspace(wheel(c1_ind,2),wheel(c2_ind,2),n)' ...
           linspace(wheel(c1_ind,3),wheel(c2_ind,3),n)'     ];
    C3 = [ linspace(wheel(c2_ind,1),wheel(c3_ind,1),n)' ... 
           linspace(wheel(c2_ind,2),wheel(c3_ind,2),n)' ...
           linspace(wheel(c2_ind,3),wheel(c3_ind,3),n)'     ];
    
    C = [flipud(C1); C2; C3];
end

if t == 1
    C1 = [ linspace(wheel(c1_ind,1),0,n)' linspace(wheel(c1_ind,2),0,n)' linspace(wheel(c1_ind,3),0,n)'];
    C2 = [ linspace(wheel(c1_ind,1),1,n)' linspace(wheel(c1_ind,2),1,n)' linspace(wheel(c1_ind,3),1,n)'];
    C = [flipud(C1); C2];
end

if t == 2
    
    c2_ind = c1_ind + 300;

    c3_ind = c1_ind - 300;

    if c2_ind > 3000
        c2_ind = c2_ind - 3000;
    end
    if c2_ind < 1 
        c2_ind = 3000 + c2_ind;    
    end

    if c3_ind > 3000
        c3_ind = c3_ind - 3000;
    end
    if c3_ind < 1 
        c3_ind = 3000 + c3_ind;    
    end
    
    C1 = [ linspace(wheel(c1_ind,1),0,n)' linspace(wheel(c1_ind,2),0,n)' linspace(wheel(c1_ind,3),0,n)'];
    C2 = [ linspace(wheel(c1_ind,1),1,n)' linspace(wheel(c1_ind,2),1,n)' linspace(wheel(c1_ind,3),1,n)'];
    C3 = [ linspace(wheel(c2_ind,1),1,n)' linspace(wheel(c2_ind,2),1,n)' linspace(wheel(c2_ind,3),1,n)'];
    C4 = [ linspace(wheel(c2_ind,1),0,n)' linspace(wheel(c2_ind,2),0,n)' linspace(wheel(c2_ind,3),0,n)'];
    C5 = [ linspace(wheel(c3_ind,1),0,n)' linspace(wheel(c3_ind,2),0,n)' linspace(wheel(c3_ind,3),0,n)'];
    C6 = [ linspace(wheel(c3_ind,1),1,n)' linspace(wheel(c3_ind,2),1,n)' linspace(wheel(c3_ind,3),1,n)'];
    
    C = [flipud(C1); C2; flipud(C3); C4; flipud(C5); C6];
end

if t == 3
    
    c2_ind = c1_ind + 1000;

    c3_ind = c1_ind - 1000;

    if c2_ind > 3000
        c2_ind = c2_ind - 3000;
    end
    if c2_ind < 1 
        c2_ind = 3000 + c2_ind;    
    end
    

    if c3_ind > 3000
        c3_ind = c3_ind - 3000;
    end
    if c3_ind < 1 
        c3_ind = 3000 + c3_ind;    
    end
    
    C1 = [ linspace(wheel(c1_ind,1),0,n)' linspace(wheel(c1_ind,2),0,n)' linspace(wheel(c1_ind,3),0,n)'];
    C2 = [ linspace(wheel(c1_ind,1),1,n)' linspace(wheel(c1_ind,2),1,n)' linspace(wheel(c1_ind,3),1,n)'];
    C3 = [ linspace(wheel(c2_ind,1),1,n)' linspace(wheel(c2_ind,2),1,n)' linspace(wheel(c2_ind,3),1,n)'];
    C4 = [ linspace(wheel(c2_ind,1),0,n)' linspace(wheel(c2_ind,2),0,n)' linspace(wheel(c2_ind,3),0,n)'];
    C5 = [ linspace(wheel(c3_ind,1),0,n)' linspace(wheel(c3_ind,2),0,n)' linspace(wheel(c3_ind,3),0,n)'];
    C6 = [ linspace(wheel(c3_ind,1),1,n)' linspace(wheel(c3_ind,2),1,n)' linspace(wheel(c3_ind,3),1,n)'];
    
    C = [flipud(C1); C2; flipud(C3); C4; flipud(C5); C6];
    
end


% C = [C; linspace(wheel(c2_ind,1),0,n)' linspace(wheel(c2_ind,2),0,n)' linspace(wheel(c2_ind,3),0,n)'];
% C = [C; linspace(wheel(c2_ind,1),1,n)' linspace(wheel(c2_ind,2),1,n)' linspace(wheel(c2_ind,3),1,n)'];
% C = [C; linspace(wheel(c3_ind,1),1,n)' linspace(wheel(c3_ind,2),1,n)' linspace(wheel(c3_ind,3),1,n)'];
% C = [C; linspace(wheel(c3_ind,1),0,n)' linspace(wheel(c3_ind,2),0,n)' linspace(wheel(c3_ind,3),0,n)'];

% C = [wheel(c1_ind,:); wheel(c2_ind,:); wheel(c3_ind,:)]



