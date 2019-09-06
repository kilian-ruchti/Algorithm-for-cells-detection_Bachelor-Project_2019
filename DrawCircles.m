function [outputImage] = DrawCircles(temp, layers)

[m,n,~] = size(temp);
outputImage = temp;

for k = 1:layers
    newCircle = zeros(m,n);
    
    for i = 1:m 
        for j = 1:n
            if(i == 1 && j == 1)
                if(outputImage(i,j) == 1 && outputImage(i+1,j) == 0)
                    newCircle(i+1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j+1) == 0)
                    newCircle(i,j+1) = 1;
                end

            elseif(i == 1 && j == n)
                if(outputImage(i,j) == 1 && outputImage(i+1,j) == 0)
                    newCircle(i+1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j-1) == 0)
                    newCircle(i,j-1) = 1;
                end
                
            elseif(i == 1)
                if(outputImage(i,j) == 1 && outputImage(i+1,j) == 0)
                    newCircle(i+1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j-1) == 0)
                    newCircle(i,j-1) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j+1) == 0)
                    newCircle(i,j+1) = 1;
                end
                
                
            elseif(i == m && j == 1)
                if(outputImage(i,j) == 1 && outputImage(i-1,j) == 0)
                    newCircle(i-1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j+1) == 0)
                    newCircle(i,j+1) = 1;
                end

            elseif(i == m && j == n)
                if(outputImage(i,j) == 1 && outputImage(i-1,j) == 0)
                    newCircle(i-1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j-1) == 0)
                    newCircle(i,j-1) = 1;
                end
                
            elseif(i == m)
                if(outputImage(i,j) == 1 && outputImage(i-1,j) == 0)
                    newCircle(i-1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j-1) == 0)
                    newCircle(i,j-1) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j+1) == 0)
                    newCircle(i,j+1) = 1;
                end
                
                
            elseif(j == 1)
                if(outputImage(i,j) == 1 && outputImage(i-1,j) == 0)
                    newCircle(i-1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i+1,j) == 0)
                    newCircle(i+1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j+1) == 0)
                    newCircle(i,j+1) = 1;
                end
                
                
            elseif(j == n)
                if(outputImage(i,j) == 1 && outputImage(i-1,j) == 0)
                    newCircle(i-1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i+1,j) == 0)
                    newCircle(i+1,j) = 1;
                end
                if(outputImage(i,j) == 1 && outputImage(i,j-1) == 0)
                    newCircle(i,j-1) = 1;
                end
            else
                if(outputImage(i,j) == 1 && (outputImage(i-1,j) == 0 || outputImage(i+1,j) == 0 || outputImage(i,j-1) == 0 || outputImage(i,j+1) == 0))
                    newCircle = disksForCells(outputImage, i, j, newCircle);
                end
            end
        end
    end
    
    outputImage = outputImage + newCircle;
    
%     if(layers == 2)
    figure; imshow(newCircle); title('New layer around the cell')
    figure; imshow(outputImage); title('Whole layers on the cell')
%     end
    
end
end



