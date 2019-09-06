function [outputImg] = disksForCells(img, i, j, out)
% This function modifies value of neigbors pixels under certains conditions

outputImg = out;

if(img(i-1,j) == 0)
    outputImg(i-1,j) = 1;
end

if(img(i+1,j) == 0)
    outputImg(i+1,j) = 1;
end

if(img(i,j-1) == 0)
    outputImg(i,j-1) = 1;
end

if(img(i,j+1) == 0)
    outputImg(i,j+1) = 1;
end

end

