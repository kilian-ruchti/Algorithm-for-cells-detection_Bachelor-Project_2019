function [outputImg] = disksForCells(img, i, j, out)


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

