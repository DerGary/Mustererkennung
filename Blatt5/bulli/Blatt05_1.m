close all;

lena = double(rgb2gray(imread('Lenna_original.png')))/255;
figure('Name', 'Orginal');
imshow(lena);


% Mittelwertfilter
g1 = (1/9) * ones(3); 
g2 = (1/25) * ones(5);

% Gausfilter
g3 = (1/16) * [ 1 2 1
                2 4 2
                1 2 1 ];
            
% Tiefpass-Filter
g4 = (1/16) * [ 1 2 1
                2 4 2
                1 2 1 ];
% Hochpass-Filter
g5 = [  1 -2  1
       -2  5 -2
        1 -2  1 ];
                
% Sobel
gsx = [ 1 0 -1            
        2 0 -2
        1 0 -1];
gsy = gsx';
            
gm = fspecial('motion', 30, 45);


g = g5;
            

result = convoluteImage(lena, g, 1);

figure('Name', 'Custom');
imshow(result);

figure('Name', 'Matlab');
result2 = conv2(lena, g);
imshow(result2);

figure('Name', 'Diff');
diff = result-result2;
imshow(abs(result-result2));