I = imread('arman-dp.jpg');
I = rgb2gray(I);
subplot(1,2,1); 
imshow(I); 
title("Original Image");
%Segment the image into three regions using k-means clustering
[L, Centers] = imsegkmeans(I, 3);
B = labeloverlay(I, L);
subplot(1,2,2);
imshow(B); 
title("Labeled Image");
