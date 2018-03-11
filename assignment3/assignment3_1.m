close all, clear all
 
I = imread('Static/test.jpg');

R = I(:,:,1); %Red 
G = I(:,:,2); %Green
B = I(:,:,3); %Blue

%{
R = uint8(double(R)*0.90);

%G = sqrt(double(G));
%G = double(G)*0.75*1.45;
G = double(G)*1.22;
G = uint8(G);
 
B = double(B);
B = B*0.90; 
B = uint8(B);
%}

R = uint8((double(R)*1.05)*0.82);
G = uint8((double(G)*1.47)*0.82);
B = uint8(double(B)*1.05)*0.60;

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
