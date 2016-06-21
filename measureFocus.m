
hHoriz = fspecial('sobel');
hVert = hHoriz';

% I = imread('pkg1.jpg');
I = imread('yosemite.jpg');

imgBlurred = generateBlurredImages(I,1,20,10);

img = [];
[x,y,~,w] = size(imgBlurred);
m = zeros(1,w);

for k = 1:w
    img = cat(3,img,rgb2gray(imgBlurred(:,:,:,k)));
    img(:,:,k) = imfilter(img(:,:,k),hVert);
    x = mean(img(:,:,k));
    m(k) = mean(x);
end

imgs = concatenateImages(imgBlurred);
imgsBlur = concatenateImages(img);

figure
stem(m)

figure
subplot(2,1,1)
subimage(imgs)
axis off
subplot(2,1,2)
subimage(imgsBlur)
axis off


