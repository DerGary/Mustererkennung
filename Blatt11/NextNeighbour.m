function [ classIndex ] = NextNeighbour( norm, features, trainingsFeatures )
    %index1 = count of classes e.g. 20
    %index2 = count of stichprobe e.g 24
    %index3 = feature dimension e.g. 2
    NumberOfClasses = size(trainingsFeatures, 1);
    NumberOfSamples = size(trainingsFeatures, 2);
    %NumberOfFeatures = size(trainingsFeatures, 3);
    distance = zeros(NumberOfClasses, NumberOfSamples);
    for k = 1:NumberOfClasses
        for l = 1:NumberOfSamples
            distance(k, l) = LNorm(norm, features, trainingsFeatures(k, l, :));
        end
    end
    [~, classIndex] = min(min(distance(:,:)'));
end

