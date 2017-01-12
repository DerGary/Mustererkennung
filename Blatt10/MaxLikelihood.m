function [ mu, eps ] = MaxLikelihood( c )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N = size(c, 2);
mu = mean(c, 2);
eps = zeros(2, 2);
for i = 1: N
    temp = (c(:, i) - mu);
    eps = eps + temp*temp';
end
eps = (1/N)*eps;
end

