I = imread('../Static/test_img_shapes.jpg');

Im=I;
rmat=Im(:,:,1);
gmat=Im(:,:,2);
bmat=Im(:,:,3);

levelr = 0.63;
levelg = 0.5;
levelb = 0.4;
i1=im2bw(rmat,levelr);
i2=im2bw(gmat,levelg);
i3=im2bw(bmat,levelb);
Isum = (i1&i2&i3);

Icomp = imcomplement(Isum);
Ifilled = imfill(Icomp,'holes');
se = strel('disk', 25);
Iopenned = imopen(Ifilled,se);

Iregion = regionprops(Iopenned, 'centroid');
[labeled,numObjects] = bwlabel(Iopenned,4);
stats = regionprops(labeled,'Eccentricity','Area','BoundingBox');
eccentricities = [stats.Eccentricity];

idxOfSkittles = find(eccentricities);
statsDefects = stats(idxOfSkittles);
figure, imshow(I), hold on
for idx = 1 : length(idxOfSkittles)
    h = rectangle('Position',statsDefects(idx).BoundingBox,'LineWidth',2);
    set(h,'EdgeColor',[.75 0 0]);
end

title(['There are ', num2str(numObjects), ' objects in the image!']);
hold off;