% a = [1 2 3 4 5;
%     6 7 8 9 10;
%     11 12 13 14 15;
%     16 17 18 19 20;
%     21 22 23 24 25];

% va = a(:,end:-1:1);
% 
% ha = a(end:-1:1, :);

a = imread('cameraman.tif');
subplot(3, 1, 1);
imshow(a);
title('Cameraman');

hf = a(end:-1:1,:);
subplot(3,1,2);
imshow(hf);
title('Horizontal cameraman');

vf = a(:, end:-1:1);
subplot(3,1,3);
imshow(vf);
title('Vertical cameraman');
