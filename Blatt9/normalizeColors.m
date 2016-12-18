function [ outImg ] = normalizeColors( inImg )

if min(inImg(:)) < 0
    outImg = inImg/max(abs(inImg(:)))*0.5+0.5;
else
    outImg = inImg/max(inImg(:));
end

end

