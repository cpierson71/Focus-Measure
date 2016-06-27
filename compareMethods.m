I = imread('yosemite.jpg');
imgBlurred = generateBlurredImages(I,1,20,10,'disk');

tic
fprintf('Vertical only \n')
m = measureFocusNoGraph(imgBlurred);
toc

tic
fprintf('Horizontal and vertical \n')
m2 = measureFocus2NoGraph(imgBlurred);
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