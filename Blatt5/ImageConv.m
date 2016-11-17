function [ outputImg ] = ImageConv( image, G )

i = imfilter(image,G);

outputImg = i;

end

