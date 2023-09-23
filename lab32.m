a = [0 3 4 3 4;
    2 0 1 2 5;
    2 7 7 6 6;
    2 2 2 1 1;
    1 1 1 0 1;];
% for i = 1:5
%     for j = 1:5
%         disp(a(i,j));
%     end
% end
% Get the number of intensity levels (usually 256 for grayscale)
[r,c] = size(a);
bit = 3;
L = 2^bit;
count = zeros(1,L);
numIntensityLevels = 7;

% Initialize an array to store histogram values
histValues = zeros(1, 8);
[m, n] = size(a);
for i = 1:m
    for j = 1:n
        intensityValue = a(i, j) + 1; 
        histValues(intensityValue) = histValues(intensityValue) + 1;
    end
end
subplot(3,2,1);
bar(histValues);
title('Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');

%pdf
probability = zeros(1,8);
index = 1;
for i=1:8
    probability(index) = histValues(index)/25;
    index = index + 1;
end
subplot(3,2,2);
bar(probability);
title('PDF Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');
% disp(probability);

%cdf
cdf = zeros(1,8);
index = 1;
cdf(index) = probability(index);
index = index + 1;
for i=2:8
    cdf(index) = probability(index) + cdf(index-1);
    index = index + 1;
end
subplot(3,2,3);
bar(cdf);
title('CDF Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');

% %GL
gl = round(cdf*(L-1));

subplot(3,2,4);
bar(gl);
title('GL Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');
%fcount
fcount = zeros(1,L);
for i=1:L
    for k=0:L-1
        if gl(i)==k
            fcount(gl(i)+1)=fcount(gl(i)+1)+count(gl(i));
        end
    end
end
