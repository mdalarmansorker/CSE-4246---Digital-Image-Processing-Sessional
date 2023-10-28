I = imread("arman-bg2.jpg"); 
subplot(1,2,1);
imshow(I); 
title("Orginal Image");
%Segment the image into 50 regions by using k-means clustering
%Return the label matrix L and the cluster centroid locations C
%The cluster certroid locations are the RGB vallues of each of the 50
%colors
[L, C] = imsegkmeans(I, 50);
%Convert the label matrix into an RGB image. Specify the cluster centroid locations, C as the colormap for the new image
J = label2rgb(L, im2double(C));
%Display the quantized image
subplot(1,2,2);
imshow(J); 
title("Color Quantized Image");
%Write the original and compressed image to file
%The quantized image file is approximate one quarter the size of the original image file
imwrite(I, 'arman-dp-original.png');
imwrite(J, 'arman-dp-quantized.png');
