g1 = (1/9) * ones(3);
g2 = (1/16) * [1,2,1;2,4,2;1,2,1];
gsx = [1,0,-1;2,0,-2;1,0,-1];
gsy = [1,2,1;0,0,0;-1,-2,-1];

%---A1---%
%{
outputImg = ImageConv(imread('lenna_original.png'),g1);
imwrite(outputImg,'outputs/lenna_output_g1.png')

outputImg = ImageConv(imread('lenna_original.png'),g2);
imwrite(outputImg,'outputs/lenna_output_g2.png')

outputImg = ImageConv(imread('lenna_original.png'),gsx);
imwrite(outputImg,'outputs/lenna_output_gsx.png')

outputImg = ImageConv(imread('lenna_original.png'),gsy);
imwrite(outputImg,'outputs/lenna_output_gsy.png')

%---A2VonHand---%

outputImg= rankoperation('Erosionsfilter', imread('lenna_original.png'));
imwrite(outputImg,'outputs/lenna_rank_erosion.png')

outputImg= rankoperation('Dilatationsfilter', imread('lenna_original.png'));
imwrite(outputImg,'outputs/lenna_rank_dilatation.png')

outputImg= rankoperation('Medianfilter', imread('lenna_original.png'));
imwrite(outputImg,'outputs/lenna_rank_median.png')

outputImg= rankoperation('Kantenfilter', imread('lenna_original.png'));
imwrite(outputImg,'outputs/lenna_rank_kanten.png')

%÷ffnung
outputImg= rankoperation('Dilatationsfilter', imread('outputs/lenna_output_erosion.png'));
imwrite(outputImg,'outputs/lenna_rank_open.png')

%Schlieﬂung
outputImg= rankoperation('Erosionsfilter', imread('outputs/lenna_output_dilatation.png'));
imwrite(outputImg,'outputs/lenna_rank_close.png')
%}

%---A2IM---%
outputImg= rankoperationIm('imerode', imread('lenna_original.png'));
imwrite(outputImg,'outputs/lenna_rankIm_erosion.png')

outputImg= rankoperationIm('imdilate', imread('lenna_original.png'));
imwrite(outputImg,'outputs/lenna_rankIm_dilatation.png')

%outputImg= medfilt2(imread('lenna_original.png'),[7 7]);
%imwrite(outputImg,'outputs/lenna_rankIm_median.png')

%÷ffnung
outputImg= rankoperationIm('imopen', imread('lenna_original.png'));
imwrite(outputImg,'outputs/lenna_rankIm_open.png')

%Schlieﬂung
outputImg= rankoperationIm('imclose', imread('lenna_original.png'));
imwrite(outputImg,'outputs/lenna_rankIm_close.png')
