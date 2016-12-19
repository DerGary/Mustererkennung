%% a & b
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

%% c
mu = mean(trainingImages);
trainingImages = trainingImages - repmat(mu,size(trainingImages,1),1);
testImages = testImages - repmat(mu,size(testImages,1),1);

%% d
trainingImages = trainingImages';
for i = 1:size(trainingImages, 2);
    f(:,mod(i-1,24)+1,trainingIndizes(i)) = trainingImages(:,i);
end

n = 3;
[merkmale, A] = findeMerkmale(f, 1, n);
%%
hold on;
markers = ['o' 'x' '*'];
colors = [
[1,0,1]
[1,1,0]
[0,1,1]
[1,0,0]
[0,1,0]
[0,0,1]
[0,0,0]
];
k = 0;
for i= 1:20
    if mod(i-1,7)+1 == 1
        k = k+1;
    end
    %color = [rand() rand() rand()];
    for j=1:24
        if n == 2
            x = merkmale(1,j,i);
            y = merkmale(2,j,i);
            scatter(x,y, [], colors(mod(i-1, 7)+1,:),markers(k));
        elseif n == 3
            x = merkmale(1,j,i);
            y = merkmale(2,j,i);
            z = merkmale(3,j,i);
            scatter3(x,y,z, [], colors(mod(i-1, 7)+1,:),markers(k));
        end
    end
end

hold off;

%% g
merkmaleTest = A * testImages'; 