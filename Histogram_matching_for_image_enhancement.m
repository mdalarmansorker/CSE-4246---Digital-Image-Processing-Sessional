clear all;
clc;
img = imread("arman-bg.jpg");
% subplot(5,1,1);
figure(1);
imshow(img);
title('Arman')
img = imresize(img, [16, 16]);
[r,c] = size(img);
bit = 8;
L = 2^bit;

numIntensityLevels = 255;
histValues = zeros(1, numIntensityLevels + 1);
for i = 1:r
    for j = 1:c
        intensityValue = img(i, j) + 1;
        histValues(intensityValue) = histValues(intensityValue) + 1;
    end
end
% subplot(5,1,2);
figure(2);
bar(histValues);
title('Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');

%pdf = Pr(rk)=nk/r
n = 64*64;
probability = zeros(1, L);
index = 1;
for i = 1:L
    probability(index) = histValues(index)/n;
    index = index + 1;
end
% subplot(5,1,3);
figure(3);
bar(probability);
title('PDF Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');

%cdf = comulative sum of pdf
cdf = zeros(1, L);
cdf(1) = probability(1);
for i = 2:L
    cdf(i) = probability(i) + cdf(i-1);
end
% subplot(5,1,4);
figure(4);
bar(cdf);
title('CDF Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');

%(L-1)CDF = em
em = cdf*(L-1);
figure(5);
bar(em);
title('EM = CDF*(L-1)');
xlabel('Pixel Intensity');
ylabel('Frequency');

%GL - rounding of
gl = round(em);
% for i=1:256
%     fprintf("%d ",gl(i));
% end
% fprintf('\n');
figure(6);
bar(gl);
title('GL Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');

%fcount(gl+1) = fcount(gl+1)+histValues
fcount = zeros(1, L);
for i=1:L
    fcount(gl(i)+1) = fcount(gl(i)+1) + histValues(i);
end
figure(7);
bar(fcount);
title('fcount')
xlabel('Pixel Intensity');
ylabel('Frequency');