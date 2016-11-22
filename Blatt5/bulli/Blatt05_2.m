close all;

lena = double(rgb2gray(imread('Lenna_original.png')))/255;
figure('Name', 'Orginal');
imshow(lena);

%% Erosion
%result = rankOpImage(lena, 7, @(R) R(1) );
%result2 = imerode(lena, strel('square', 7));

%% Dilatation
%result = rankOpImage(lena, 7, @(R) R(end) );
% result2 = imdilate(lena, strel('square', 7));

%% Konturextraktion
%result = rankOpImage(lena, 7, @(R) R(end)-R(1) );

%% Median
result = rankOpImage(lena, 7, @(R) median(R) );
result2 = medfilt2(lena, [7 7]);

%% Close
%result = rankOpImage(lena, 7, @(R) R(end) );
%result = rankOpImage(result, 7, @(R) R(1) );
%result2 = imdilate(lena, strel('square', 7));
%result2 = imerode(result2, strel('square', 7));

%% Open
%result = rankOpImage(lena, 7, @(R) R(1) );
%result = rankOpImage(result, 7, @(R) R(end) );
%result2 = imerode(lena, strel('square', 7));
%result2 = imdilate(result2, strel('square', 7));

%% Display
figure('Name', 'Custom');
imshow(result);

figure('Name', 'Matlab');
imshow(result2);

figure('Name', 'Diff');
diff = result-result2;
imshow(abs(diff));
