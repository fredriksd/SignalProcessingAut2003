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

%Padding the original image
paddedI = imresize(I, [rows + 2*h_length, cols + 2*h_length]);
paddedI(h_length + 1:rows + h_length, h_length + 1:cols + h_length) = I;

%Highpass filter matrix
h = [-1 -1 -1;
      -1 8 -1;
      -1 -1 -1];

ImFilter = imfilter(I, h,'conv');

hFilter = zeros(rows+2*h_length, cols+2*h_length);
%hFilter(end-3+1:end, end-3+1:end) = h;

%Adding matrix h to upper left corner of hFilter
for i = 1:size(h,1)
    for j = 1:size(h,2)
        hFilter(i,j) = h(i,j);
    end
end


%take the Fourier transform of image and 
%filter, and thereafter multiply them together
%and take inverse Fourier transform of result
fourierI = fft2(paddedI);
fourierH = fft2(hFilter);
filterI = real(ifft2(fourierI .* fourierH));

%Unpadding image
filterIUnpadded = filterI(h_length+1:rows+h_length,h_length+1:cols+h_length);

%Plot the images for comparison
figure(2);
subplot(1,3,1)
imshow(uint8(I)), title('Original')
subplot(1,3,2)
imshow(uint8(filterIUnpadded)),title('Convolution with Fourier Transform')
subplot(1,3,3)
imshow(uint8(ImFilter)), title('imfilter()')