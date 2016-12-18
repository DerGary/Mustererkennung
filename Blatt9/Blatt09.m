%% a) init and read
tic;
ObjCount = 20; % Number of objects
CS = 72; % Class size
N = ObjCount*CS; % Total image count
trainSize = floor(CS/3);

images = zeros(128*128, N);
imageCls = zeros(1, N);
for objNum = 1:ObjCount 
    for frame = 1:CS
        filname = sprintf('coil-20/coil-20-proc/obj%d__%d.png', objNum, frame-1);
        img = double(imread(filname))/255;
        
        images  (:, (objNum-1)*CS + frame) = img(:);
        imageCls(:, (objNum-1)*CS + frame) = objNum;
    end;
end;
toc;

%% b) Seperate Train and Test data
trainData    = [];
trainClasses = [];
testData     = [];
testClasses  = [];

for objNum = 1:ObjCount
    indexList = (objNum-1)*CS + randperm(CS);

    trainData = [trainData  images(:, indexList(1:CS/3))     ];
    testData  = [testData   images(:, indexList(1+CS/3:end)) ];
    
    trainClasses = [trainClasses  imageCls(1, indexList(1:CS/3))     ];
    testClasses  = [testClasses   imageCls(1, indexList(1+CS/3:end)) ];
end;

%% c) Normalize
meanValue = mean(trainData, 2);
figure(1);
imshow(reshape(meanValue, 128, 128));
title('\mu');

normTrainData = trainData - repmat(meanValue, 1, N/3);

%% d) Eigenvalues
R = normTrainData*normTrainData' / size(normTrainData, 2);
m = mean(normTrainData, 2);

Q1 = R - m*m';

%% e) Transformation matrix
n = 3; % Merkmal dim

tic;
[V, D] = eigs(Q1, n);
A = V';
toc;

figure(2);
for i = 1:n
    subplot(4, 5, i);
    imshow(normalizeColors(reshape(A(i,:), 128, 128)));
    title(sprintf('e_%d', i));
end;

%% f) Merkmale
classMarker = { 'x' 'o' '+' 'd' 's' };

C = A * normTrainData;

figure(3);
colormap hsv;
for i = 0:ObjCount-1
    range = 1 + i*trainSize:(i+1)*trainSize; 
    color = ones(1,trainSize)*(i+1);
    marker = classMarker{mod(i, 5) + 1};
    
    if n == 2
        scatter(C(1,range), C(2,range), [], color, marker);
        axis square; xlabel('c_1'); ylabel('c_2');
    elseif n == 3
        scatter3(C(1,range), C(2,range), C(3,range), [], color, marker);
        axis square; xlabel('c_1'); ylabel('c_2'); zlabel('c_3');
    end;
    hold on
    title('Merkmalsraum');
end;
hold off

