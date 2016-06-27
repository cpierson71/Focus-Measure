function imgsBlurred = generateBlurredImages(I,lb,ub,N,blurType)
%img - image to create blurred copies of
%rl,rh - lower and upper bound of radius for disk blur
%N - number of blurred images to create
%First image of output is original image

imgsBlurred = I;

switch blurType
    case 'disk'
        for k = lb:(ub-lb)/(N-1):ub
            h = fspecial('disk',k);
            imgsBlurred = cat(4,imgsBlurred,imfilter(I,h));
        end
    case 'motion'
        for k = lb:(ub-lb)/(N-1):ub
            h = fspecial('motion',k,45);
            imgsBlurred = cat(4,imgsBlurred,imfilter(I,h));
        end
    otherwise     
end
        
end