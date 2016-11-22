function [ outputImg ] = rankoperationIm( rankOp, image )
image = double(image)/255;
se = strel('rectangle',[7 7]);
outputImg = feval(rankOp,image,se);
end

