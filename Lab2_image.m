img = imread('arman-bg.jpg');
subplot(3,2,1);
imshow(img);
title("MD Al Arman Sorker");

rgbimg = rgb2gray(img);
subplot(3,2,2);
imshow(rgbimg);
title("Black and white image");

negimg=255-img;
subplot(3,2,3);
imshow(negimg);
title("Negative Image");

hflip=rgbimg(:,end:-1:1);
subplot(3,2,4);
imshow(hflip);
title("Horizontal flipped image");

vflip = rgbimg(end:-1:1,:);
subplot(3,2,5);
imshow(vflip);
title("Vartical flipped image");