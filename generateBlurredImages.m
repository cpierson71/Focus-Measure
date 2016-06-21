img = imread('pkg1.jpg');
% img = rgb2gray(img);
imgBlurred = [img];
N = 17;
% imgBlurred = zeros([size(img), N]);

for k = 1:2:N

h = fspecial('disk',k);
imgBlurred = cat(4,imgBlurred,imfilter(img,h));

end

