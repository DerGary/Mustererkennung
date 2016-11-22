function [ outputImg ] = ImageConvLong( image, g )

sizeX = size(image,1);
sizeY = size(image,2);
image = double(image)/255;
% 2D convolutioin of grayscale values
w = conv2(image(:,:,1),g);

% -> conv2 makes problems with uint8 values, used imfilter instead

% Conv2 makes each dimension bigger, we just use the original size
image(:,:) = w(2:sizeX + 1,2:sizeY + 1);

outputImg = image;
end

