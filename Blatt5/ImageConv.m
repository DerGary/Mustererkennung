function [ outputImg ] = ImageConv( image, G )
image = double(image)/255;
i = imfilter(image,G);

outputImg = i;

end

