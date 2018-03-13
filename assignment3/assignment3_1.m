close all, clear all
 
I = imread('Static/test.jpg');

R = I(:,:,1); %Red 
G = I(:,:,2); %Green
B = I(:,:,3); %Blue

%Square root of green channel
G = double(G);
G = sqrt(G);
%Normalizing channel
G = (G-min(min(G))).*((255-0)./(max(max(G))-min(min(G)))) + 0;
%Typecast it back into uint8
G = uint8(G);

%Square of blue channel
B = double(B);
B = B.^2; 
%Normalizing channel
B = (B-min(min(B))).*((255-0)./(max(max(B))-min(min(B)))) + 0;
%Typecast it back into uint8
B = uint8(B);

%Concatenating channels to make new image
newI = cat(3, R, G, B);

 
%newI = I;
%newI(:,:,1) = R;
%newI(:,:,2) = uint8(G);
%newI(:,:,3) = uint8(B);
 
%Image plot
figure(1)
subplot(1,2,1)
imshow(I), title('Original')
subplot(1,2,2)
imshow(newI), title('Modified')
 

 %Histography plot
figure(2)
subplot(3,1,1)
imhist(R), title('Histography, red channel')
subplot(3,1,2)
imhist(G), title('Histography, green channel')
subplot(3,1,3)
imhist(B), title('Histography, blue channel')
