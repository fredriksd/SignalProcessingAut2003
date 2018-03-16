%Exercise 5
%Create a program to detect edges, both horizontal
%and vertical edges by using convolution in Fourier domain.
clear, close all
x = 500;
y = 500;
h_length = 3;
no_of_indx = 20; % Size of the blocks
I = zeros(x,y);

for i=1:2*no_of_indx:x
    for j=1:2*no_of_indx:y
        I(i:i+no_of_indx,j:j+no_of_indx) = 255;
    end
end
[rows, cols] = size(I);

%Highpass filter matrix
h = [-1 -1 -1;
      -1 8 -1;
      -1 -1 -1];

%hLowPass = fspecial('gaussian',3, 2);
%hAllPass = zeros(size(hLowPass,1),size(hLowPass,2));
%hAllPass(2,2) = 1;
%hHighPass = hAllPass - hLowPass;

ImFilter = imfilter(I, h,'conv');

hFilter = zeros(rows, cols);

for i = 1:size(h,1)
    for j = 1:size(h,2)
        hFilter(i,j) = h(i,j);
    end
end

%take the Fourier transform of image and 
%filter, and thereafter multiply them together
%and take inverse Fourier transform of result
fourierI = fft2(I);
fourierH = fft2(hFilter);
filterI = real(ifft2(fourierI .* fourierH));

%Plot the images for comparison
subplot(2,2,1)
imshow(uint8(I)), title('Original')
subplot(2,2,3)
imshow(uint8(filterI)),title('Convolution with Fourier Transform')
subplot(2,2,4)
imshow(uint8(ImFilter)), title('imfilter()')