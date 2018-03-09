%Exercise 4
clc, close all, clear all
I = imread('Static/lenna.png');
noisyI = imnoise(I,'salt & pepper', 0.05);

%Gaussian filtering
%hGaussian = fspecial('gaussian',3,0.5);
%FilterGaussian = imfilter(noisyI, hGaussian);
FilterGaussian = imgaussfilt(noisyI, 2);

%Average filtering
hAverage = fspecial('average',3);
hAverage5 = fspecial('average',5);
FilterAverage = imfilter(noisyI, hAverage);
FilterAverage5 = imfilter(noisyI, hAverage5);

%Median filter
FilterR = uint8(medfilt2(double(noisyI(:,:,1))));%Red channel: I(:,:,1)
FilterG = uint8(medfilt2(double(noisyI(:,:,2))));%Green channel: I(:,:,2)
FilterB = uint8(medfilt2(double(noisyI(:,:,3))));%Blue channel: I(:,:,3)

FilterMedian = cat(3,FilterR, FilterG, FilterB);

subplot(3,2,1)
imshow(I), title('Original')
subplot(3,2,2)
imshow(noisyI), title('Image with noise')
subplot(3,2,3)
imshow(FilterAverage), title('Image filtered with average 3x3')
subplot(3,2,4)
imshow(FilterAverage5), title('Image filtered with average 5x5')
subplot(3,2,5)
imshow(FilterGaussian), title('Image filtered with Gaussian \sigma = 2')
subplot(3,2,6)
imshow(FilterMedian), title('Image filtered with median')

