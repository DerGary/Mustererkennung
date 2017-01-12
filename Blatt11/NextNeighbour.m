function [ classIndex ] = NextNeighbour( norm, features, trainingsFeatures )
    %index1 = class z.b. 20
    %index2 = count of stichprobe z.B. 24
    %index3 = dimension of merkmale z.B. 2
    NumberOfClasses = size(trainingsFeatures, 1);
    NumberOfSamples = size(trainingsFeatures, 2);
    %NumberOfFeatures = size(trainingsFeatures, 3);
    distance2 = zeros(NumberOfClasses, NumberOfSamples);
    for k = 1:NumberOfClasses
        for l = 1:NumberOfSamples
            distance2(k, l) = LNorm(norm, features, trainingsFeatures(k, l, :));
        end
    end
    [~, classIndex] = min(min(distance2(:,:)'));
end

