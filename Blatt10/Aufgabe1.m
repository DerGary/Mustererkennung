clear;
load('data.mat');
N = 5;

%% a)
m1 = mean(k1, 2);
m2 = mean(k2, 2);
m3 = mean(k3, 2);
m4 = mean(k4, 2);

S1 = cov(k1')*(N-1)/N;
S2 = cov(k2')*(N-1)/N;
S3 = cov(k3')*(N-1)/N;
S4 = cov(k4')*(N-1)/N;

%% visual
mid = mean([m1, m2, m3, m4], 2);
x = mid(1)-15:0.1:mid(1)+15;
y = mid(2)-15:0.1:mid(2)+15;

[X, Y] = meshgrid(x, y);
F = mvnpdf([X(:), Y(:)], m1', S1);
F = F + mvnpdf([X(:), Y(:)], m2', S2);
F = F + mvnpdf([X(:), Y(:)], m3', S3);
F = F + mvnpdf([X(:), Y(:)], m4', S4);
F = reshape(F,length(x),length(y));

surf(x, y, F, 'EdgeColor', 'None');
shading interp
hold on
axis square

plot3(k1(1,:), k1(2,:), mvnpdf(k1', m1', S1), 'ro');
plot3(k2(1,:), k2(2,:), mvnpdf(k2', m2', S2), 'ko');
plot3(k3(1,:), k3(2,:), mvnpdf(k3', m3', S3), 'wo');
plot3(k4(1,:), k4(2,:), mvnpdf(k4', m4', S4), 'mo');

xlabel('c_1');
ylabel('c_2');

%% b)
c = [[-2 2]
    [6 12]
    [5 -3]
    [-5 7]];

mvnpdf(c, m1', S1)
mvnpdf(c, m2', S2)
mvnpdf(c, m3', S3)
mvnpdf(c, m4', S4)

%% c)
mid = mean([m1, m2, m3, m4], 2);
x = mid(1)-15:0.25:mid(1)+15;
y = mid(2)-15:0.25:mid(2)+15;

[X, Y] = meshgrid(x, y);
F1 = reshape(mvnpdf([X(:), Y(:)], m1', S1),length(x), length(y));
F2 = reshape(mvnpdf([X(:), Y(:)], m2', S2),length(x), length(y));
F3 = reshape(mvnpdf([X(:), Y(:)], m3', S3),length(x), length(y));
F4 = reshape(mvnpdf([X(:), Y(:)], m4', S4),length(x), length(y));
F = cat(3, F1, F2, F3, F4);
[V, I] = max(F, [], 3);

scatter(X(:), Y(:), 100, I(:), 's', 'fill');
