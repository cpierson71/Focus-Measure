I = imread('yosemite.jpg');
I2 = gpuArray(I);
imgBlurred = generateBlurredImages(I,1,20,10,'disk');
imgBlurred2 = generateBlurredImages(I2,1,20,10,'disk');

tic
fprintf('Vertical only \n')
m = measureFocusNoGraph(imgBlurred);
toc

tic
fprintf('Horizontal and vertical \n')
m2 = measureFocus2NoGraph(imgBlurred);
toc

tic
fprintf('GPU. Vertical only \n')
m = measureFocusNoGraphGPU(imgBlurred2);
toc

tic
fprintf('GPU. Horizontal and vertical \n')
m2 = measureFocus2NoGraphGPU(imgBlurred2);
toc



figure
subplot(3,1,1)
stem(m)
title('Vertical edges only')
subplot(3,1,2)
stem(m2)
title('Horizontal and vertical edges')
subplot(3,1,3)
stem(m-m2)
title('Difference between vert. edges and both edges')