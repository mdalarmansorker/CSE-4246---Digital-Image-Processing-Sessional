clc; clear all;
img=imread("arman-bg.jpg");
img = im2double(img);
rn=img(:,:,1)/255;
gn=img(:,:,2)/255;
bn=img(:,:,3)/255;

n = 0.5.*((rn-gn)+(rn-bn));
d=sqrt(((rn-gn).^2) + (rn-bn).*(gn-bn));
theta=acos(n./d);
if bn>gn
    H=(2*pi)-theta;
else
    H=theta;
end

S=1-(3./(rn+gn+bn)).*min(min(rn, gn),bn);
I=(rn+gn+bn)./3;
I=I.*255;
subplot(2,2,1);
imshow(img);
title("RGB image");
subplot(2,2,2);
imshow(H);
title("Hue band");
subplot(2,2,3);
imshow(S);
title("Saturation band");
subplot(2,2,4);
imshow(I);
title("Intensity band");
grayimg=rgb2gray(img);
figure(2);
imshow(grayimg);
title("Gray Image");
diff=I-grayimg;
figure(3);
imshow(diff);
title("Difference Image");

