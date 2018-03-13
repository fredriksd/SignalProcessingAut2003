%Exercise 2

close all, clear all
%Read image 
rgbImg = imread('Static/test_img.jpg');

%RGB Channels
R = rgbImg(:,:,1);
G = rgbImg(:,:,2);
B = rgbImg(:,:,3);


[imgRows, imgCols, dim] = size(rgbImg);

%Initialize new arrays based on the original
%image's size
newImgCircle = zeros(imgRows, imgCols);
newImgTriangle = zeros(imgRows, imgCols);
newImgStar = zeros(imgRows, imgCols);
newImgRectangle = zeros(imgRows, imgCols);

%Loop through  the empty arrays and fill them up
%with logical values depending on color criterias:
%triangle [63, 71, 234]
%rectangle [35, 177, 77]
%circle [237 27 36]
%Star [254 242 0]

for i = 1:imgRows
    for j = 1:imgCols
        if((R(i,j) > 230) && G(i,j) < 100)
           newImgCircle(i,j) = 1;
        else
            newImgCircle(i,j) = 0;
        end
        
        if(B(i,j) > 120)
           newImgTriangle(i,j) = 1;
        else
            newImgTriangle(i,j) = 0;
        end
        if((R(i,j) > 230) && G(i,j) > 200)
           newImgStar(i,j) = 1;
        else
            newImgStar(i,j) = 0;
        end
        
        if(G(i,j) > 150 && (B(i,j) > 50) && (R(i,j) < 50))
           newImgRectangle(i,j) = 1;
        else
            newImgRectangle(i,j) = 0;    
        end
    end
end

%Display images
subplot(3,2,1)
imshow(rgbImg)
subplot(3,2,2)
imshow(newImgTriangle)
subplot(3,2,3)
imshow(newImgCircle)
subplot(3,2,4)
imshow(newImgRectangle)
subplot(3,2,5)
imshow(newImgStar)

