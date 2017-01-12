function [ d ] = SeparatorFunction( c )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
mu = [-0.200000000000000,9.40000000000000,9.20000000000000,-1.40000000000000;-0.400000000000000,10.8000000000000,-2.20000000000000,9.60000000000000];

eps(:,:,1) =[
    3.7600   -0.0800
   -0.0800    1.0400
];

eps(:,:,2) = [
    6.6400   -5.5200
   -5.5200    6.1600
];

eps(:,:,3) = [
    3.7600    2.4400
    2.4400    7.7600
];

eps(:,:,4) = [
    8.2400   -0.9600
   -0.9600    1.0400
];

[class, ~] = NormalDistributionClassifier(c, mu, eps);

d = zeros(4, 1);
d(class) = 1;
end

