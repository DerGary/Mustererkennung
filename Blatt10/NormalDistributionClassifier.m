function [ class, max ] = NormalDistributionClassifier( c, mu, eps )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    max = 0;
    class = 0;
    for i = 1:length(mu)
        y = mvnpdf(c, mu(:, i), eps(:, :, i));
        if y > max
            max = y;
            class = i;
        end
    end
end

