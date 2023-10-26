clc;clear all;
a = imread('arman-bg.jpg'); a = rgb2gray(a);
a = imresize(a, [256 256], 'nearest');
na = double(a)/255;
figure(1); imshow(a); title('Orginal Image');

%adding salt and pepper noise
b = imnoise(na, 'salt & pepper', 0.02);
figure(2);
subplot(3, 3, 1); imshow(b); title('Salt & Pepper image');
%filtering
f1 = (1/9)*ones(3, 3);
f2 = (1/16)*[1,2,1;2,4,2;1,2,1];
f1_img = imfilter(b, f1);
f2_img = imfilter(b, f2);

subplot(3, 3, 2); imshow(f1_img); title("1/9 Avg Filtering");
subplot(3, 3, 3); imshow(f2_img); title('1/16 Avg Filtering');

% Apply mean, median, and mode filtering to Salt & Pepper Noised Image
window_size = 3; % Adjust the window size as needed
mean_filtered = imfilter(b, fspecial('average', window_size));
median_filtered = medfilt2(b, [window_size, window_size]);
mode_filtered = ordfilt2(b, round((window_size^2)/2), ones(window_size, window_size));

% Display the results of mean, median, and mode filtering
subplot(3, 3, 4); imshow(mean_filtered); title('Mean Filtering to SP');
subplot(3, 3, 5); imshow(median_filtered); title('Median Filtering to SP');
subplot(3, 3, 6); imshow(mode_filtered); title('Mode (Rank) Filtering to SP');
% Apply adaptive filtering (adaptive histogram equalization)
adaptive_filtered = adapthisteq(b);
subplot(3, 3, 7); imshow(adaptive_filtered); title('Adaptive Filtering to SP');

%adding gaussian noise
c = imnoise(na, 'gaussian',0,0.01);
figure(3);
subplot(3, 3, 1); imshow(c); title('Gaussian Image');
f1_img_g = imfilter(c, f1);
f2_img_g = imfilter(c, f2);

subplot(3, 3, 2); imshow(f1_img_g); title("1/9 Avg Filtering to G");
subplot(3, 3, 3); imshow(f2_img_g); title('1/16 Avg Filtering');
% Apply mean, median, and mode filtering to Gaussian Noised Image
window_size = 3; % Adjust the window size as needed
mean_filtered = imfilter(c, fspecial('average', window_size));
median_filtered = medfilt2(c, [window_size, window_size]);
mode_filtered = ordfilt2(c, round((window_size^2)/2), ones(window_size, window_size));
% Apply adaptive filtering (adaptive histogram equalization)
adaptive_filtered = adapthisteq(c);

% Display the results of mean, median, and mode filtering
subplot(3, 3, 4); imshow(mean_filtered); title('Mean Filtering to G');
subplot(3, 3, 5); imshow(median_filtered); title('Median Filtering to G');
subplot(3, 3, 6); imshow(mode_filtered); title('Mode (Rank) Filtering to G');
subplot(3, 3, 7); imshow(adaptive_filtered); title('Adaptive Filtering to G');
