img = imread('arman-bg.jpg');
%if normalize by divided by 255 - all 255 will be 1.
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

C = 255 - R;
M = 255 - G;
Y = 255 - B;
CMY = cat(3, C, M,Y);

Cb = CMY;
Mb = CMY;
Yb = CMY;
Cb(:,:,2:3)=255;
Mb(:,:,1:2:3)=255;
Yb(:,:,1:2)=255;
figure(1);
subplot(3,2,1);
imshow(img);
title("RGB Image");

subplot(3,2,2);
imshow(Cb);
title('C band');
subplot(3,2,3);
imshow(Mb);
title('M band');
subplot(3,2,4);
imshow(Yb);
title('Y band');
subplot(3,2,5);
imshow(CMY);
title('CMY');

%-----------CMY to RGB------------
Cr = CMY(:,:,1);
Mr = CMY(:,:,2);
Yr = CMY(:,:,3);

Rr = 255 - Cr;
Gr = 255 - Mr;
Br = 255 - Yr;
RGBr = cat(3, Rr, Gr, Br);

subplot(3,2,6);
imshow(RGBr);
title("CMY to RGB");
