load blurredImages.mat

hHoriz = fspecial('sobel');
hVert = hHoriz';

img = [];
[x,y,~,w] = size(imgBlurred);
m = zeros(1,w);

for k = 1:w
    img = cat(3,img,rgb2gray(imgBlurred(:,:,:,k)));
    img(:,:,k) = imfilter(img(:,:,k),hVert);
    x = mean(img(:,:,k));
    m(k) = mean(x);
end

imgs = showImages(imgBlurred);

figure
stem(m)
figure
imshow(imgs)


