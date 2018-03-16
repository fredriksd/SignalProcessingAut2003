%Assignment 3
clear all, close all 
%Read image
rgbImg = imread('../Static/test_img_shapes.jpg');

%Convert to grayscale
grayImg = rgb2gray(rgbImg);
%Convert grayscale to binary
newImg = imbinarize(grayImg);

%RGB channels
R = rgbImg(:,:,1);
G = rgbImg(:,:,2);
B = rgbImg(:,:,3);

[imgRows, imgCols, dim] = size(rgbImg);

%Initialize arrays for the three image objects
redRect = zeros(imgRows, imgCols);
greenRect = zeros(imgRows, imgCols);
blueCircle = zeros(imgRows, imgCols);

%Loop through the rows and columns of 
%the original image and set the indexes if the criterias
%for the different objects match:
%red [237 27 36]
%green [48 180 70]
%blue [38 144 186]
%Note that it is only the objects that are being set, not the 
%inscribed objects. This will be inverted later (due to imfill)
for i = 1:imgRows
    for j = 1:imgCols
        if((R(i,j) > 200) && (G(i,j) < 60) && (B(i,j) > 20))
           redRect(i,j) = 1;
        else
            redRect(i,j) = 0;
        end
        if((G(i,j) > 170) && B(i,j) < 70)
           greenRect(i,j) = 1;
        else
            greenRect(i,j) = 0;
        end
        if(G(i,j) > 150 && (B(i,j) > 190) && R(i,j) < 10)
           blueCircle(i,j) = 1;
        else
            blueCircle(i,j) = 0;    
        end
        
        %if((R(i,j) > 230) && (G(i,j) > 200))
        %    newImg(i,j) = 1;
            
       % else
        %    newImg(i,j) = 0;
       % end
    end
end

%Fill the black holes
redRect = imfill(redRect, 'holes');
greenRect = imfill(greenRect, 'holes');
blueCircle = imfill(blueCircle, 'holes');

%Invert the matrices
redRect = imcomplement(logical(redRect));
greenRect = imcomplement(logical(greenRect));
blueCircle = imcomplement(logical(blueCircle));


subplot(3,2,1)
imshow(rgbImg)
title('Original');
subplot(3,2,2)
imshow(greenRect)
title('Green rectangle');
subplot(3,2,3)
imshow(redRect)
title('Red rectangle');
subplot(3,2,4)
imshow(blueCircle)
title('Blue circle');
subplot(3,2,5)
imshow(newImg), title('Grayscale to binary')


