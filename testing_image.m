img = imread("arman-dp-snap.png");
hflip=img(:,end:-1:1);
imshow(hflip, "Horizontal flipped image");