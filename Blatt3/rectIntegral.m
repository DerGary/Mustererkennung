function [ result ] = rectIntegral( x, y )
    result = 0;
    len = length(x);
    x_min = x(1) - (x(2) - x(1))/2;
for i = 1:len-1
    x_max = mean(x(i:i+1));
    result = result + y(i) * (x_max - x_min);
    x_min = x_max;
end
    result = result + y(len) * (x(len) - x(len-1));
end

