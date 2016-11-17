function [ outputImg ] = rankoperation( hFunction, image )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
for i = 4:508 % ignore corners
    for j = 4:508
        for k = 1:3
        temp = image(i-3:i+3,j-3:j+3, k);
        temp = reshape(temp,1,[]);
        temp = sort(temp);
        h = feval(hFunction,temp);
        outputImg(i-3:i+3,j-3:j+3,k) = h;
        end
    end
end


end

