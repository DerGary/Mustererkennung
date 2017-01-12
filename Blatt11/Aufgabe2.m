clear all;
trainingIndex = 1;
testIndex = 1;
for i = 1:20
    for j = 0:71
        img = double(imread(sprintf('C:/Users/Stefan/Desktop/coil-20-proc/obj%d__%d.png', i, j)))/255;
        columnImg = img(:);
        
        images(j+1, :) = columnImg;
    end
    randomVector = randperm(72);
    randomVectorTrainingData = randomVector(1:24);
    randomVectorTestData = randomVector(25:72);
    for j = randomVectorTrainingData
        trainingImages(trainingIndex,:) = images(j, :);
        trainingIndizes(trainingIndex) = i;
        trainingIndex = trainingIndex+1;
    end
    for j = randomVectorTestData
        testImages(testIndex,:) = images(j, :);
        testIndizes(testIndex) = i;
        testIndex = testIndex+1;
    end
end

mu = mean(trainingImages);
trainingImages = trainingImages - repmat(mu,size(trainingImages,1),1);
testImages = testImages - repmat(mu,size(testImages,1),1);

trainingImages = trainingImages';
testImages = testImages';
for i = 1:size(trainingImages, 2);
    f(:,mod(i-1,24)+1,trainingIndizes(i)) = trainingImages(:,i);
end
%%


wrong = zeros(20,1);
for n = 1:20
    [trainingsFeatures, A] = findeMerkmale(f, 1, n);

    c = A*testImages;
    trainingsFeatures = permute(trainingsFeatures, [3 2 1]);

    for i = 1: size(c,2)
        classNumber = NextNeighbour(2, c(:, i), trainingsFeatures);
        realClassNumber = testIndizes(i);
        if classNumber == realClassNumber
        else
            wrong(n) = wrong(n)+1;
        end
    end
    n
    procentRight = 1-(wrong(n)/960)
    procentRight
end

%% 

procentRight = 1-(wrong/960)
[bestProcent, index] = max(procentRight)

plot(1:n, procentRight);
line([index index],get(gca,'YLim'),'Color',[1 0 0])