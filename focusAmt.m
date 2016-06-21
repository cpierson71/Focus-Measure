hHoriz = fspecial('sobel');
hVert = hHoriz';

img1 = imgBlurred(:,:,:,1);
img2 = imgBlurred(:,:,:,10);

img1 = rgb2gray(img1);
img2 = rgb2gray(img2);

edge1 = imfilter(img1,hVert);
edge2 = imfilter(img2,hVert);

level1 = graythresh(edge1);
level2 = graythresh(edge2);

edge1 = im2bw(edge1,level1+.3);
edge2 = im2bw(edge2,level2+.3);

% edge1 = medfilt2(edge1,[15 15]);
% edge2 = medfilt2(edge2,[15 15]);

figure
imshow(edge1)
figure
imshow(edge2)



