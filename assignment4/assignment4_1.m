%Exercise 1: Code explanation

%Code that takes gray scale of image, pads it, and convolutes it 
%with a padded average filter. The result is transformed back into
%time domain and plotted after being typecasted back to uint8.
%This is equivalent to 
imfilter(grayIm, hAvgFilter, 'conv')

close all, clear all
I = imread('Static/lenna.png');
grayIm = double(rgb2gray(I));
[imgRows, imgCols] = size(grayIm);
filterRows = 10;
filterCols = 10;
paddedImgRows = imgRows+2*filterRows;
paddedImgCols = imgCols + 2*filterCols;
grayPadded = imresize(grayIm, [paddedImgRows, paddedImgCols]);
grayPadded(filterRows+1:imgRows+filterRows, filterCols...
    +1:imgCols+filterCols) = grayIm;

hAvgFilter = ones(10,10)/100;
hAvgFilterPadded = zeros(paddedImgRows, paddedImgCols);
hAvgFilterPadded(end-filterRows+1:end,...
    end-filterCols+1:end) = hAvgFilter;

ftGrayPadded = fft2(grayPadded);
fthAvgFilterPadded = fft2(hAvgFilterPadded);
iftGrayPadded = ifft2(ftGrayPadded.*fthAvgFilterPadded);
iftGrayWithoutPadded = iftGrayPadded(filterRows+1:imgRows+...
    filterRows, filterCols+1:imgCols);
iftCenteredImg = iftGrayPadded(filterRows+1:end-filterRows,...
    filterCols+1:end-filterCols);

figure(1)
imshow(uint8(iftGrayPadded));
figure(2)
imshow(uint8(iftGrayWithoutPadded));
figure(3)
imshow(uint8(iftCenteredImg));


    
