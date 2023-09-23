% Read an image
originalImage = imread('arman-bg.jpg'); % Replace with your image's filename

% Convert the image to grayscale if it's not already
grayImage = rgb2gray(originalImage); % Skip this step if your image is already grayscale

% Get the number of intensity levels (usually 256 for grayscale)
numIntensityLevels = 256;

% Initialize an array to store histogram values
histValues = zeros(1, numIntensityLevels);

% Iterate through the image and count intensity occurrences
[m, n] = size(grayImage);
for i = 1:m
    for j = 1:n
        intensityValue = grayImage(i, j) + 1; 
        histValues(intensityValue) = histValues(intensityValue) + 1;
    end
end

% Plot the histogram
bar(histValues);
title('Histogram of Grayscale Image (Manual)');
xlabel('Pixel Intensity');
ylabel('Frequency');
