function m = measureFocus2NoGraph(imgBlurred)
% Horizontal and vertical edge finder

hHoriz = fspecial('sobel');
hVert = hHoriz';

[~,~,~,w] = size(imgBlurred);
m = zeros(1,w);

for k = 1:w
    img = rgb2gray(imgBlurred(:,:,:,k));
    imgV = imfilter(img,hVert);
    imgH = imfilter(img,hHoriz);
    img = .5*imgV + .5*imgH;
    x = mean(img);
    m(k) = mean(x);
end

end


