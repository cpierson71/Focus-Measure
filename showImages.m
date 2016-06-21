function [imgs] = showImages(imgBlurred)

imgs = [];

[~,~,~,w] = size(imgBlurred);

for k = 1:w
   imgs = [imgs, rgb2gray(imgBlurred(:,:,:,k))];
end

end