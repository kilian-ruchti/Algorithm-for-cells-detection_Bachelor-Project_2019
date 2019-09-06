%% Partie 1

clear all
clc

tmp = imread("30K.tif");
img(:,:,1) = tmp(:,:,1);
img(:,:,2) = tmp(:,:,2);
img(:,:,3) = tmp(:,:,3);

I = imcrop(img,[357 1267 430 350]);
% I = im2double(imcrop(img,[357 1267 90 90]));
% blue = imcomplement(I(:,:,3));

figure; imshow(I), title('Original image')
figure; imshowpair(imcomplement(I(:,:,1)), imcomplement(I(:,:,3)), 'montage')
title('Complement of the red component of the RGB image - Complement of the blue  component of the RGB image')    


[Gx, Gy] = imgradientxy(I(:,:,1));
[Gmag_R, Gdir] = imgradient(Gx, Gy);

% figure; imshow(I), title('img r')
figure; imshow(Gmag_R, []), title('Gradient magnitude of the red component')


%% Partie 1.5

clear all
clc

tmp = imread("30K.tif");
img(:,:,1) = tmp(:,:,1);
img(:,:,2) = tmp(:,:,2);
img(:,:,3) = tmp(:,:,3);

I = imcrop(img,[357 1267 430 350]);
img = I;
figure; imshow(img), title('igms')

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

[Gx, Gy] = imgradientxy(r);
[Gmag_R, Gdir] = imgradient(Gx, Gy);

figure; imshow(r), title('igms')
figure; imshow(Gmag_R, []), title('magnitude')


[Gx, Gy] = imgradientxy(g);
[Gmag_G, Gdir] = imgradient(Gx, Gy);

figure; imshow(g), title('igms')
figure; imshow(Gmag_G, []), title('magnitude')


[Gx, Gy] = imgradientxy(b);
[Gmag_B, Gdir] = imgradient(Gx, Gy);

figure; imshow(b), title('igms')
figure; imshow(Gmag_B, []), title('magnitude')
% 

%% Partie 2

clc;
clear all;

tmp = imread("30K.tif");
img(:,:,1) = tmp(:,:,1);
img(:,:,2) = tmp(:,:,2);
img(:,:,3) = tmp(:,:,3);

croped = im2double(imcrop(img,[357 1267 430 350]));

a = croped(:,:,1);

lap = [0 -1 0; -1 8 -1; 0 -1 0];%// Change - Centre is now positive
resp = imfilter(a, lap, 'conv'); 


%// Change - Normalize the filtered image
minR = min(resp(:));
maxR = max(resp(:));
resp = (resp - minR) / (maxR - minR);

%// Change - Adding to original image now
sharpened = a + resp;

%// Change - Normalize the sharpened result
minA = min(sharpened(:));
maxA = max(sharpened(:));
sharpened = (sharpened - minA) / (maxA - minA);

%// Change - Perform linear contrast enhancement
sharpened = imadjust(sharpened, [60/255 200/255], [0 1]);

test = croped;
test(:,:,1) = sharpened;

figure; 
imshowpair(croped, test, 'montage'); title('Orginal image                    - Sharpened image with Laplacian filter');

%%
%% Partie 3
% clc;
% close all;

% step 1
aa = im2double(imread("30K.tif"));
tmp = imcrop(aa,[357 1267 430 350]);
croped(:,:,1) = tmp(:,:,1);
croped(:,:,2) = tmp(:,:,2);
croped(:,:,3) = tmp(:,:,3);
 
I = croped(:,:,1);

figure; imshow(I)
title('Original Image');

% step 2
[~,threshold] = edge(I,'sobel');
fudgeFactor = 0.5;
BWs = edge(I,'sobel',threshold * fudgeFactor);
figure; imshow(BWs)
title('Binary Gradient Mask')

% step 3
se90 = strel('line',3,90);
se0 = strel('line',3,0);
BWsdil = imdilate(BWs,[se90 se0]);
figure; imshow(BWsdil)
title('Dilated Gradient Mask')

% step 4
BWdfill = imfill(BWsdil,'holes');
figure; imshow(BWdfill)
title('Binary Image with Filled Holes')

% step 5

% step 6
seD = strel('diamond',1);
BWfinal = imerode(BWdfill,seD);
BWfinal = imerode(BWfinal,seD);
figure; imshow(BWfinal)
title('Segmented Image');

% step 7
imshow(labeloverlay(I,BWfinal))
title('Mask Over Original Image')

% result
BWoutline = bwperim(BWfinal);
Segout = I; 
Segout(BWoutline) = 255; 
figure; imshow(Segout)
title('Outlined Original Image')





%% Partie 4
clear all
clc

tmp = im2double(imread("30K.tif"));
img(:,:,1) = tmp(:,:,1);
img(:,:,2) = tmp(:,:,2);
img(:,:,3) = tmp(:,:,3);

% I = imcrop(img,[357 1267 430 350]);
I = imcrop(img,[357 1267 100 100]);

red = I(:,:,1);
green = I(:,:,2);
blue = I(:,:,3);

Binary_blue = 2*imbinarize(blue,0.18);


[m,n,o] = size(I);
output = zeros(m,n);
 
value_red = 0.4;

tmp = zeros(m,n);

% figure;
for i = 1:m
    for j = 1:n
        if(Binary_blue(i,j) > 0)
            [tmp] = testflooding(tmp, I, i, j, Binary_blue, value_red);
            output = output + tmp;
        end
    end
end


result = zeros(m,n,3);

for i = 1:m
    for j = 1:n
        if(output(i,j) > 0)
            output(i,j) = 1;
        end
    end
end

output = output-Binary_blue;

result(:,:,1) = output;
result(:,:,3) = Binary_blue;

figure; imshowpair(result, I, 'montage'); title('value red >= 0.4')


test = output.*Gmag_R;

result(:,:,1) = test;
result(:,:,3) = Binary_blue;

figure; imshowpair(result, I, 'montage'); title('value red >= 0.35')

%% Partie 5
clear all
clc

tmp = im2double(imread("30K.tif"));
I(:,:,1) = tmp(:,:,1);
I(:,:,2) = tmp(:,:,2);
I(:,:,3) = tmp(:,:,3);

I = imcrop(I,[360 1250 250 250]);
% I = imcrop(I,[357 1267 50 50]);

red = I(:,:,1);
green = I(:,:,2);
blue = I(:,:,3);

Binary_blue = imbinarize(blue,0.2);
figure;imshow(blue); title('Blue component')

figure; imshow(I); title('Comparison image')
% figure; imshow(blue); title('original blue component')
figure; imshow(Binary_blue); title('Binary blue component (with threshold value at 0.2)')


[m,n,~] = size(I);

temp = double(Binary_blue);

out = zeros(m,n);
layers = 3;

output = DrawCircles(temp, layers);

final(:,:,1) = output-temp;
final(:,:,2) = zeros(m,n);
final(:,:,3) = temp;

figure; imshow(final); title('Final results after 3 layers')

