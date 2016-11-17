function [ outputImg ] = ImageConvLong( image, g )

sizeX = size(image,1);
sizeY = size(image,2);

% 2D convolutioin of each Array in the image (RGB) and the conv matrix
w1 = conv2(image(:,:,1),g);
w2 = conv2(image(:,:,2),g);
w3 = conv2(image(:,:,3),g);
% -> conv2 makes problems with uint8 values, used imfilter instead

% Conv2 makes each dimension bigger, we just use the original size
image(:,:,1) = w1(2:sizeX + 1,2:sizeY + 1);
image(:,:,2) = w2(2:sizeX + 1,2:sizeY + 1);
image(:,:,3) = w3(2:sizeX + 1,2:sizeY + 1);

outputImg = image;
end

