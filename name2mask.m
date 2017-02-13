function [letter_mask] = name2mask (name)

    letter = name(1:1);
    
    file_name = strcat('letter/',upper(letter),'.png');

    l = rgb2gray(imread(file_name));
    
    letter_mask = im2bw(l, 0.5);

end