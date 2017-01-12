function [ phi ] = SquaredPhi( c )
phi = [1; c; c(1)^2; c(1)*c(2); c(2)^2];
end