inputImage = imread('arman-dp.jpg');

subplot(2, 2, 1); imshow(inputImage); title('Original Image');

grayImage = rgb2gray(inputImage);

sobelX = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
sobelY = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

prewittX = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
prewittY = [-1, -1, -1; 0, 0, 0; 1, 1, 1];

robertX = [1, 0; 0, -1];
robertY = [0, 1; -1, 0];

Sobel = zeros(size(grayImage));
Prewitt = zeros(size(grayImage));
Robert = zeros(size(grayImage));

for i = 1:size(grayImage, 1) - 2
    for j = 1:size(grayImage, 2) - 2
        prewittGx = sum(sum(prewittX .* double(grayImage(i:i+2, j:j+2))));
        prewittGy = sum(sum(prewittY .* double(grayImage(i:i+2, j:j+2))));
        robertGx = sum(sum(robertX .* double(grayImage(i:i+1, j:j+1))));
        robertGy = sum(sum(robertY .* double(grayImage(i:i+1, j:j+1))));
        Gx = sum(sum(sobelX .* double(grayImage(i:i+2, j:j+2))));
        Gy = sum(sum(sobelY .* double(grayImage(i:i+2, j:j+2))));
        
        Sobel(i, j) = sqrt(Gx^2 + Gy^2);
        Prewitt(i, j) = sqrt(prewittGx^2 + prewittGy^2);
        Robert(i, j) = sqrt(robertGx^2 + robertGy^2);
        
    end
end
Sobel = uint8(Sobel);
Prewitt = uint8(255 * (Prewitt / max(Prewitt(:))));
Robert = uint8(255 * (Robert / max(Robert(:))));

subplot(2, 2, 2); imshow(Sobel); title('Sobel Edge Detection');
subplot(2, 2, 3); imshow(Prewitt); title('Prewitt Edge Detection');
subplot(2, 2, 4); imshow(Robert); title('Robert Edge Detection');
