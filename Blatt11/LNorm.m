function [ distance ] = LNorm( norm, c, ci )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

sum = 0;
for i = 1:size(c,1)
    sum = sum + abs(c(i) - ci(i))^norm;
end
sum = sum^(1/norm);
distance = sum;
end

