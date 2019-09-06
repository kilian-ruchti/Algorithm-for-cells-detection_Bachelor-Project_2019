function [tmp] = testflooding(tmp, I, i, j, Binary_blue, val)
% This function implements the flood fill algorithm

[m,n,~] = size(I);

% tmp(i,j)

if (tmp(i,j) == 0)
    
    tmp(i,j) = 1;
%     imshow(tmp)
    
    % Stop condition, to not go beyond image borders.
    if(i == 0 || j == 0 || i == m+1 || j == n+1)
        % break
        
        % The case were the pixel is on a corner

    elseif(i == 1 && j == 1) % On the top left corner, so can't go to the 'north' and 'west'
        if(I(i+1,j,1) >= val)
            output1 = testflooding(tmp, I, i+1, j, Binary_blue, val);
            tmp = tmp + output1;
        end
        if(I(i,j+1,1) >= val)
            output2 = testflooding(tmp, I, i, j+1, Binary_blue, val);
            tmp = tmp + output2;
        end

    elseif(i == 1 && j == n) % On the top right corner, so can't go to the 'north' and 'east'
        if(I(i+1,j,1) >= val)            
            output1 = testflooding(tmp, I, i+1, j, Binary_blue, val);
            tmp = tmp + output1;
        end
        if(I(i,j-1,1) >= val)
            output2 = testflooding(tmp, I, i, j-1, Binary_blue, val);
            tmp = tmp + output2;
        end

    elseif(i == m && j == 1) % On the bottom left corner, so can't go to the 'south' and 'west'
        if(I(i-1,j,1) >= val)
            output1 = testflooding(tmp, I, i-1, j, Binary_blue, val);
            tmp = tmp + output1;
        end
        if(I(i,j+1,1) >= val)
            output2 = testflooding(tmp, I, i, j+1, Binary_blue, val);
            tmp = tmp + output2;
        end

    elseif(i == m && j == n) % On the bottom right corner, so can't go to the 'south' and 'east'
        if(I(i-1,j,1) >= val)            
            output1 = testflooding(tmp, I, i-1, j, Binary_blue, val);
            tmp = tmp + output1;
        end
        if(I(i,j-1,1) >= val)
            output2 = testflooding(tmp, I, i, j-1, Binary_blue, val);
            tmp = tmp + output2;
        end
    
        
    elseif(i == 1) % On the first line, so can't go to the 'north'
        if(I(i+1,j,1) >= val)
            output1 = testflooding(tmp, I, i+1, j, Binary_blue, val);
            tmp = tmp + output1;
        end
        if(I(i,j-1,1) >= val)
            output2 = testflooding(tmp, I, i, j-1, Binary_blue, val);
            tmp = tmp + output2;
        end
        if(I(i,j+1,1) >= val)
            output3 = testflooding(tmp, I, i, j+1, Binary_blue, val);
            tmp = tmp + output3;
        end

    elseif(j == 1) % On the first column, so can't go to the 'west'
        if(I(i-1,j,1) >= val)            
            output1 = testflooding(tmp, I, i-1, j, Binary_blue, val);
            tmp = tmp + output1;
        end
        if(I(i+1,j,1) >= val)
            output2 = testflooding(tmp, I, i+1, j, Binary_blue, val);
            tmp = tmp + output2;
        end
        if(I(i,j+1,1) >= val)
            output3 = testflooding(tmp, I, i, j+1, Binary_blue, val);
            tmp = tmp + output3;
        end


    elseif(i == m) % On the last line, so can't go to the 'south'
        if(I(i-1,j,1) >= val)            
            output1 = testflooding(tmp, I, i-1, j, Binary_blue, val);
            tmp = tmp + output1;
        end
        if(I(i,j-1,1) >= val)
            output2 = testflooding(tmp, I, i, j-1, Binary_blue, val);
            tmp = tmp + output2;
        end
        if(I(i,j+1,1) >= val)
            output3 = testflooding(tmp, I, i, j+1, Binary_blue, val);
            tmp = tmp + output3;
        end


    elseif(j == n) % On the last column, so can't go to the 'east'
        if(I(i-1,j,1) >= val)            
            output1 = testflooding(tmp, I, i-1, j, Binary_blue, val);
            tmp = tmp + output1;
        end
        if(I(i+1,j,1) >= val)
            output2 = testflooding(tmp, I, i+1, j, Binary_blue, val);
            tmp = tmp + output2;
        end
        if(I(i,j-1,1) >= val)
            output3 = testflooding(tmp, I, i, j-1, Binary_blue, val);
            tmp = tmp + output3;
        end


    else % Normal case
        if(I(i-1,j,1) >= val)            
            output1 = testflooding(tmp, I, i-1, j, Binary_blue, val);
            tmp = tmp + output1;
        end
        if(I(i+1,j,1) >= val)
            output2 = testflooding(tmp, I, i+1, j, Binary_blue, val);
            tmp = tmp + output2;
        end
        if(I(i,j-1,1) >= val)
            output3 = testflooding(tmp, I, i, j-1, Binary_blue, val);
            tmp = tmp + output3;
        end
        if(I(i,j+1,1) >= val)
            output4 = testflooding(tmp, I, i, j+1, Binary_blue, val);
            tmp = tmp + output4;
        end
    end
end

end


%%

