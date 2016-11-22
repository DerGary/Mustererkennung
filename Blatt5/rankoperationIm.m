function [ outputImg ] = rankoperationIm( rankOp, image )
se = strel('rectangle',[7 7]);
outputImg = feval(rankOp,image,se);
end

