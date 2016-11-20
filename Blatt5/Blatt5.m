g1 = (1/9) * ones(3);
g2 = (1/16) * [1,2,1;2,4,2;1,2,1];
gsx = [1,0,-1;2,0,-2;1,0,-1];
gsy = [1,2,1;0,0,0;-1,-2,-1];

%---A1---%

outputImg = ImageConv(imread('lena.png'),g1);
imwrite(outputImg,'outputs/lena_output_g1.png')

outputImg = ImageConv(imread('lena.png'),g2);
imwrite(outputImg,'outputs/lena_output_g2.png')

outputImg = ImageConv(imread('lena.png'),gsx);
imwrite(outputImg,'outputs/lena_output_gsx.png')

outputImg = ImageConv(imread('lena.png'),gsy);
imwrite(outputImg,'outputs/lena_output_gsy.png')

%---A2VonHand---%

outputImg= rankoperation('Erosionsfilter', imread('lena.png'));
imwrite(outputImg,'outputs/lena_rank_erosion.png')

outputImg= rankoperation('Dilatationsfilter', imread('lena.png'));
imwrite(outputImg,'outputs/lena_rank_dilatation.png')

outputImg= rankoperation('Medianfilter', imread('lena.png'));
imwrite(outputImg,'outputs/lena_rank_median.png')

outputImg= rankoperation('Kantenfilter', imread('lena.png'));
imwrite(outputImg,'outputs/lena_rank_kanten.png')

%÷ffnung
outputImg= rankoperation('Dilatationsfilter', imread('outputs/lena_rank_erosion.png'));
imwrite(outputImg,'outputs/lena_rank_open.png')

%Schlieﬂung
outputImg= rankoperation('Erosionsfilter', imread('outputs/lena_rank_dilatation.png'));
imwrite(outputImg,'outputs/lena_rank_close.png')

%---A2IM---%

outputImg= rankoperationIm('imerode', imread('lena.png'));
imwrite(outputImg,'outputs/lenna_rankIm_erosion.png')

outputImg= rankoperationIm('imdilate', imread('lena.png'));
imwrite(outputImg,'outputs/lenna_rankIm_dilatation.png')

outputImg= medfilt2(imread('lena.png'),[7 7]);
imwrite(outputImg,'outputs/lenna_rankIm_median.png')

%÷ffnung
outputImg= rankoperationIm('imopen', imread('lena.png'));
imwrite(outputImg,'outputs/lenna_rankIm_open.png')

%Schlieﬂung
outputImg= rankoperationIm('imclose', imread('lena.png'));
imwrite(outputImg,'outputs/lenna_rankIm_close.png')