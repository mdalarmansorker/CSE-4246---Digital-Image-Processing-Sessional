clc; clear all;
img=imread("arman-bg.jpg");
img = im2double(img);
rn=img(:,:,1);
gn=img(:,:,2);
bn=img(:,:,3);

n = 0.5.*((rn-gn)+(rn-bn));
d=sqrt(((rn-gn).^2) + (rn-bn).*(gn-bn));
theta=acos(n./d);
if bn>gn
    H=(2*pi)-theta;
else
    H=theta;
end

S=1-(3./(rn+gn+bn)+0.000001).*min(min(rn, gn),bn);
I=(rn+gn+bn)./3;
HSI = cat(3, H, S, I);

Hb = HSI;
Sb = HSI;
Ib = HSI;
sb1 = zeros(size(img));
sb1(:, :, 2) = S;
Hb(:,:,2:3)=255;
Sb(:,:,[1,3])=255;
Ib(:,:,1:2)=255;

subplot(3,3,1);
imshow(img);
title("Main image");
subplot(3,3,2);
imshow(Hb);
title("Hue band");
subplot(3,3,3);
imshow(Sb);
title("Saturation band");
subplot(3,3,4);
imshow(Ib);
title("Intensity band");
subplot(3,3, 5);
imshow(HSI);
title("HSI");

%--------------------HSI to RGB-----------------------

RGB_image = zeros(size(HSI));
[height, width, ~] = size(HSI);

for i = 1:height
    for j = 1:width
        Hr = HSI(i, j, 1);
        Sr = HSI(i, j, 2);
        Ir = HSI(i, j, 3);

        % Ensure H is in the range [0, 360]
        Hr = mod(Hr, 360);

        if Hr >= 0 && Hr < 120
            B = Ir * (1 - Sr);
            R = Ir * (1 + (Sr * cosd(Hr) / cosd(60 - Hr)));
            G = 3 * Ir - (R + B);
        elseif Hr >= 120 && Hr < 240
            Hr = Hr - 120;
            R = Ir * (1 - Sr);
            G = Ir * (1 + (Sr * cosd(Hr) / cosd(60 - Hr)));
            B = 3 * Ir - (R + G);
        else
            H = Hr - 240;
            G = Ir * (1 - Sr);
            B = Ir * (1 + (Sr * cosd(Hr) / cosd(60 - Hr)));
            R = 3 * Ir - (G + B);
        end

        % Assign the RGB values to the corresponding pixel in the RGB image
        RGB_image(i, j, 1) = R;
        RGB_image(i, j, 2) = G;
        RGB_image(i, j, 3) = B;
    end
end
R = RGB_image;
R(:,:,2:3) = 0;
G = RGB_image;
G(:,:,1:2:3) = 0;
B = RGB_image;
B(:,:,1:2) = 0;
% Create the RGB image
subplot(3,3, 6);
imshow(R);
title("Red Band");
subplot(3,3, 7);
imshow(G);
title("Green Band");
subplot(3,3, 8);
imshow(B);
title("Blue Band");
subplot(3,3, 9);
imshow(RGB_image);
title("HSI -> RGB");
