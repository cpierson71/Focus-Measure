function [imgsMerged] = concatenateImages(imgs)

imgsMerged = [];

[~,~,z,w] = size(imgs);

if z == 3  %Images are RGB
    for k = 1:w
        imgsMerged = [imgsMerged, rgb2gray(imgs(:,:,:,k))];
    end
else
    for k = 1:z
        imgsMerged = [imgsMerged, imgs(:,:,k)];
    end
end

end