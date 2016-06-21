function imgsBlurred = generateBlurredImages(I,rl,rh,N)
%img - image to create blurred copies of
%rl,rh - lower and upper bound of radius for disk blur
%N - number of blurred images to create
%First image of output is original image

imgsBlurred = I;

for k = rl:N\(rh-rl):rh
    h = fspecial('disk',k);
    imgsBlurred = cat(4,imgsBlurred,imfilter(I,h));
end

end