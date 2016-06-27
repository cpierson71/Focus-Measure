function imgsBlurred = generateBlurredImages(I,rl,rh,N,blurType)
%img - image to create blurred copies of
%rl,rh - lower and upper bound of radius for disk blur
%N - number of blurred images to create
%First image of output is original image

imgsBlurred = I;

switch blurType
    case 'disk'
        for k = rl:(rh-rl)/N:rh
            h = fspecial('disk',k);
            imgsBlurred = cat(4,imgsBlurred,imfilter(I,h));
        end
    case 'motion'
        for k = 5:59/N:60
            h = fspecial('motion',k,45);
            imgsBlurred = cat(4,imgsBlurred,imfilter(I,h));
        end
    otherwise     
end
        
end