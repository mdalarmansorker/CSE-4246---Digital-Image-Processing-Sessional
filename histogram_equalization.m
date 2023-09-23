% Read an image
originalImage = imread('arman-bg.jpg'); % Replace with your image's filename

% Convert the image to grayscale if it's not already
grayImage = rgb2gray(originalImage); % Skip this step if your image is already grayscale

% Perform histogram equalization
equalizedImage = histeq(grayImage);

% Display the original and equalized images side by side
subplot(2, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(2, 2, 2);
imshow(equalizedImage);
title('Equalized Image');

% Calculate the histogram
histValues = imhist(grayImage);
subplot(2,2,3);
% Plot the histogram
bar(histValues);
title('Histogram of Grayscale Image');
xlabel('Pixel Intensity');
ylabel('Frequency');
