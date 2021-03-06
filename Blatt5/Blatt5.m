g1 = (1/9) * ones(3);
g2 = (1/16) * [1,2,1;2,4,2;1,2,1];
gsx = [1,0,-1;2,0,-2;1,0,-1];
gsy = [1,2,1;0,0,0;-1,-2,-1];

%---A1VonHand---%

outputImg1 = ImageConvLong(imread('lena.png'),g1);
imwrite(outputImg1,'outputs/lena_outputHandmade_g1.png')

outputImg2 = ImageConvLong(imread('lena.png'),g2);
imwrite(outputImg2,'outputs/lena_outputHandmade_g2.png')

outputImg3 = ImageConvLong(imread('lena.png'),gsx);
imwrite(outputImg3,'outputs/lena_outputHandmade_gsx.png')

outputImg4 = ImageConvLong(imread('lena.png'),gsy);
imwrite(outputImg4,'outputs/lena_outputHandmade_gsy.png')

%---A1Im---%

outputImg5 = ImageConv(imread('lena.png'),g1);
imwrite(outputImg5,'outputs/lena_output_g1.png')

outputImg6 = ImageConv(imread('lena.png'),g2);
imwrite(outputImg6,'outputs/lena_output_g2.png')

outputImg7 = ImageConv(imread('lena.png'),gsx);
imwrite(outputImg7,'outputs/lena_output_gsx.png')

outputImg8 = ImageConv(imread('lena.png'),gsy);
imwrite(outputImg8,'outputs/lena_output_gsy.png')

%---DifferenzbilderA1---%

diff = abs(outputImg1 - outputImg5);
imwrite(diff,'outputs/diff_g1.png')

diff = abs(outputImg2 - outputImg6);
imwrite(diff,'outputs/diff_g2.png')

diff = abs(outputImg3 - outputImg7);
imwrite(diff,'outputs/diff_gsx.png')

diff = abs(outputImg4 - outputImg8);
imwrite(diff,'outputs/diff_gsy.png')

%---A2VonHand---%

outputImg1= rankoperation('Erosionsfilter', imread('lena.png'));
imwrite(outputImg1,'outputs/lena_rank_erosion.png')

outputImg2= rankoperation('Dilatationsfilter', imread('lena.png'));
imwrite(outputImg2,'outputs/lena_rank_dilatation.png')

outputImg3= rankoperation('Medianfilter', imread('lena.png'));
imwrite(outputImg3,'outputs/lena_rank_median.png')

outputImg4= rankoperation('Kantenfilter', imread('lena.png'));
imwrite(outputImg4,'outputs/lena_rank_kanten.png')

%�ffnung
outputImg5= rankoperation('Dilatationsfilter', imread('outputs/lena_rank_erosion.png'));
imwrite(outputImg5,'outputs/lena_rank_open.png')

%Schlie�ung
outputImg6= rankoperation('Erosionsfilter', imread('outputs/lena_rank_dilatation.png'));
imwrite(outputImg6,'outputs/lena_rank_close.png')

%---A2IM---%

outputImg7= rankoperationIm('imerode', imread('lena.png'));
imwrite(outputImg7,'outputs/lenna_rankIm_erosion.png')

outputImg8= rankoperationIm('imdilate', imread('lena.png'));
imwrite(outputImg8,'outputs/lenna_rankIm_dilatation.png')

outputImg9= medfilt2(double(imread('lena.png'))/255,[7 7]);
imwrite(outputImg9,'outputs/lenna_rankIm_median.png')

%�ffnung
outputImg10= rankoperationIm('imopen', imread('lena.png'));
imwrite(outputImg10,'outputs/lenna_rankIm_open.png')

%Schlie�ung
outputImg11= rankoperationIm('imclose', imread('lena.png'));
imwrite(outputImg11,'outputs/lenna_rankIm_close.png')

%---DifferenzbilderA2---%

diff = abs(outputImg1 - outputImg7);
imwrite(diff,'outputs/diff_erosion.png')

diff = abs(outputImg2 - outputImg8);
imwrite(diff,'outputs/diff_dilatation.png')

diff = abs(outputImg3 - outputImg9);
imwrite(diff,'outputs/diff_median.png')

diff = abs(outputImg5 - outputImg10);
imwrite(diff,'outputs/diff_open.png')

diff = abs(outputImg6 - outputImg11);
imwrite(diff,'outputs/diff_close.png')