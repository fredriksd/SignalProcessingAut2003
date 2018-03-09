close all, clear all 
image = imread('Static/test.jpg');

h_lp = [1/9,1/9,1/9;
        1/9,1/9,1/9;
        1/9,1/9,1/9];
    

h_hori = [-1 2 1;
          -1 2 1;
          -1 2 1];

h_vert = [-1 -1 -1;
           2 2 2;
           -1 -1 -1];
h_both = [-1 -1 -1;
          -1 8 -1;
          -1 -1 -1];

h_gauss = [ 0.0113    0.0838    0.0113;
            0.0838    0.6193    0.0838;
            0.0113    0.0838    0.0113];

%imageFilter = conv2(double(image), h_lp, 'same');
imageHlp= imfilter(image,h_lp, 'conv');
imageHhori = imfilter(image,h_hori,'conv');
imageHvert = imfilter(image,h_vert,'conv');
imageHboth = imfilter(image,h_both, 'conv');
imageHgauss = imfilter(image,h_gauss,'conv');

figure('Name','Different filters applied to lenna.jpg')
subplot(3,2,1)
imshow(image), title('Original')
subplot(3,2,2)
imshow(imageHlp), title('Hlp filter')
subplot(3,2,3)
imshow(imageHhori), title('Horisontal filter')
subplot(3,2,4)
imshow(imageHvert), title('Vertical filter')
subplot(3,2,5)
imshow(imageHboth), title('Both horisontal and vertical filter')
subplot(3,2,6)
imshow(imageHgauss), title('Gauss filter')


