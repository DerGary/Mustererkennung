function [ outputImg ] = rankoperationIm( rankOp, image )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
se = strel('rectangle',[7 7]);
outputImg = feval(rankOp,image,se);
end

