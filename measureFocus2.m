% Horizontal and vertical edge finder

tic

hHoriz = fspecial('sobel');
hVert = hHoriz';

I = imread('pkg1.jpg');
% I = imread('yosemite.jpg');

imgBlurred = generateBlurredImages(I,1,20,10,'disk');

img = [];
imgV = [];
imgH = [];
imgBlend = [];
[~,~,~,w] = size(imgBlurred);
m = zeros(1,w);

for k = 1:w
    img = cat(3,img,rgb2gray(imgBlurred(:,:,:,k)));
    imgV(:,:,k) = imfilter(img(:,:,k),hVert);
    imgH(:,:,k) = imfilter(img(:,:,k),hHoriz);
    imgBlend = cat(3,imgBlend,imfuse(imgV(:,:,k),imgH(:,:,k),'blend'));
    x = mean(imgBlend(:,:,k));
    m(k) = mean(x);
end

toc

imgs = concatenateImages(imgBlurred);
imgsBlur = concatenateImages(imgBlend);

figure
stem(m)

figure
imshow(imgs)

figure
imshow(imgsBlur)
