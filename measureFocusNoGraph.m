function m = measureFocusNoGraph(imgBlurred)

hVert = fspecial('sobel')';
[~,~,~,w] = size(imgBlurred);
m = zeros(1,w);

for k = 1:w
    img = rgb2gray(imgBlurred(:,:,:,k));
    img = imfilter(img,hVert);
    x = mean(img);
    m(k) = mean(x);
end


end

