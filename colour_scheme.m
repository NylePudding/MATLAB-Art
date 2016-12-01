function [C] = ColourScheme (n)

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

c2_ind = c1_ind + 350;

c3_ind = c2_ind - 350;

if c2_ind > 3000
    c2_ind = c2_ind - 3000;
end

if c3_ind > 3000
    c3_ind = c3_ind - 3000;
end

C = [];
C = [C; linspace(wheel(c1_ind,1),1,n)' linspace(wheel(c1_ind,2),1,n)' linspace(wheel(c1_ind,3),1,n)'];
C = [C; linspace(wheel(c1_ind,1),0,n)' linspace(wheel(c1_ind,2),0,n)' linspace(wheel(c1_ind,3),0,n)'];

% C = [C; linspace(wheel(c2_ind,1),0,n)' linspace(wheel(c2_ind,2),0,n)' linspace(wheel(c2_ind,3),0,n)'];
% C = [C; linspace(wheel(c2_ind,1),1,n)' linspace(wheel(c2_ind,2),1,n)' linspace(wheel(c2_ind,3),1,n)'];
% C = [C; linspace(wheel(c3_ind,1),1,n)' linspace(wheel(c3_ind,2),1,n)' linspace(wheel(c3_ind,3),1,n)'];
% C = [C; linspace(wheel(c3_ind,1),0,n)' linspace(wheel(c3_ind,2),0,n)' linspace(wheel(c3_ind,3),0,n)'];

% C = [wheel(c1_ind,:); wheel(c2_ind,:); wheel(c3_ind,:)]



