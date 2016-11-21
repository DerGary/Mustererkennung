close all;

lena = double(rgb2gray(imread('Lenna_original.png')))/255;
figure('Name', 'Orginal');
imshow(lena);

result = rankOpImage(lena, 7, @(R) R(1) );
result = rankOpImage(result, 7, @(R) R(49) );
figure('Name', 'Custom');
imshow(result);


figure('Name', 'Matlab');
%result2 = imerode(lena, strel('square', 7));
result2 = imdilate(lena, strel('square', 7));
imshow(result2);

figure('Name', 'Diff');
diff = result-result2;
imshow(abs(result-result2));

x = [ 0 0 0 0 0 0
      0 0 0 0 0 0
      0 0 1 1 0 0
      0 0 1 1 0 0
      0 0 0 0 0 0
      0 0 0 0 0 0
];