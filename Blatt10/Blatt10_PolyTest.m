k1 = [
    0.8624    3.1209    6.0744    8.8541   13.1974   20.1466   29.1807   37.5198   91.0292  115.8728  135.3308  140.1953  145.4072  150.9666  152.1828  156.1786  158.7846  159.5007
   15.8197   59.0984   87.0765   96.6940  103.2514  107.4044  111.3388  113.0874  114.3989  114.6175  110.4645  106.9672  101.7213   95.3825   89.2623   67.1858   36.1475   29.1530
];

k2 = [
   44.9013   45.3377   47.0751   48.9861   54.8930   60.2787  114.1355  141.9326  166.7762  187.6240  196.6581  200.8277  206.2133  206.7345  206.7396  206.8608  206.9083  206.9345
   91.6120   48.1148   31.2842   21.4481   13.5792    9.2077    0.4645    0.6831    1.1202    2.2131    4.6175   11.8306   27.3497   30.4098   38.0601   52.7049   63.6339   91.3934
];

figure;
plot(k1(1,:), k1(2,:));
hold on;
plot(k2(1,:), k2(2,:));
hold off;
legend('k_1', 'k_2');

%% NV
N = size(k1, 2);
m1 = mean(k1, 2);
m2 = mean(k2, 2);

S1 = cov(k1')*(N-1)/N;
S2 = cov(k2')*(N-1)/N;

% plot
mid = mean([m1, m2], 2);
x = mid(1)-200:1:mid(1)+200;
y = mid(2)-200:1:mid(2)+200;

[X, Y] = meshgrid(x, y);
F = mvnpdf([X(:), Y(:)], m1', S1);
F = F + mvnpdf([X(:), Y(:)], m2', S2);
F = reshape(F,length(x),length(y));

figure
surf(x, y, F, 'EdgeColor', 'None');
shading interp
hold on
axis square

plot3(k1(1,:), k1(2,:), mvnpdf(k1', m1', S1), 'ro');
plot3(k2(1,:), k2(2,:), mvnpdf(k2', m2', S2), 'ko');

xlabel('c_1');
ylabel('c_2');


%% linear Polyklassifikator
p1 = [ones(1, size(k1, 2));k1];
p2 = [ones(1, size(k2, 2));k2];
p = [p1 p2];

d = [
    repmat([1 0], size(k1, 2), 1)
    repmat([0 1], size(k2, 2), 1)
]';

E1 = p*p' / size(p, 2);
E2 = p*d' / size(p, 2);
A = inv(E1) * E2;

error = (d-A'*p).^2;

% plot
mid = [130 60];
x = mid(1)-150:1:mid(1)+150;
y = mid(2)-150:1:mid(2)+150;

[X, Y] = meshgrid(x, y);
c = [
    ones(1, length(x)*length(y))
    X(:)'
    Y(:)'
];

d_c = A' * c;
[V, I] = max(d_c);

figure;
scatter(X(:), Y(:), 100, I(:), 's', 'fill');
xlabel('c_1');
ylabel('c_2');

axis square

figure;
surf(x, y, reshape(d_c(1,:), length(x), length(y)), 'FaceColor', 'r', 'EdgeColor', 'None');
hold on
surf(x, y, reshape(d_c(2,:), length(x), length(y)), 'FaceColor', 'b', 'EdgeColor', 'None');

scatter3(k1(1,:), k1(2,:), max(A'*p1), 'bo', 'filled');
scatter3(k2(1,:), k2(2,:), max(A'*p2), 'ko', 'filled');

xlabel('c_1');
ylabel('c_2');

axis square
hold off


%% quad. Polyklassifikator
p1 = [ones(1, size(k1, 2)); k1; k1(1,:).*k1(1,:); k1(1,:).*k1(2,:); k1(2,:).*k1(2,:)];
p2 = [ones(1, size(k2, 2)); k2; k2(1,:).*k2(1,:); k2(1,:).*k2(2,:); k2(2,:).*k2(2,:)];
p  = [p1 p2];

d = [
    repmat([1 0], size(k1, 2), 1)
    repmat([0 1], size(k2, 2), 1)
]';

E1 = p*p' / size(p, 2);
E2 = p*d' / size(p, 2);
A = inv(E1) * E2;

% plot 
mid = [130 60];
x = mid(1)-150:1:mid(1)+150;
y = mid(2)-150:1:mid(2)+150;

[X, Y] = meshgrid(x, y);
c = [
    X(:)'
    Y(:)'
];
c = [ones(1, size(c, 2)); c; c(1,:).*c(1,:); c(1,:).*c(2,:); c(2,:).*c(2,:)];

d_c = A' * c;
[V, I] = max(d_c);

figure
scatter(X(:), Y(:), 100, I(:), 's', 'fill');
xlabel('c_1');
ylabel('c_2');

axis square

figure
surf(x, y, reshape(d_c(1,:), length(x), length(y)), 'FaceColor', 'r', 'EdgeColor', 'None');
hold on
surf(x, y, reshape(d_c(2,:), length(x), length(y)), 'FaceColor', 'b', 'EdgeColor', 'None');

scatter3(k1(1,:), k1(2,:), max(A'*p1), 'bo', 'filled');
scatter3(k2(1,:), k2(2,:), max(A'*p2), 'ko', 'filled');

xlabel('c_1');
ylabel('c_2');

axis square
hold off

%% cubic Polyklassifikator
p1 = [ones(1, size(k1, 2)); k1; k1(1,:).*k1(2,:); k1(1,:).^2; k1(2,:).^2; k1(1,:).^3; k1(2,:).^3; k1(1,:).*k1(2,:).^2; k1(2,:).*k1(1,:).^2; ];
p2 = [ones(1, size(k2, 2)); k2; k2(1,:).*k2(2,:); k2(1,:).^2; k2(2,:).^2; k2(1,:).^3; k2(2,:).^3; k2(1,:).*k2(2,:).^2; k2(2,:).*k2(1,:).^2; ];
p  = [p1 p2];

d = [
    repmat([1 0], size(k1, 2), 1)
    repmat([0 1], size(k2, 2), 1)
]';

E1 = p*p' / size(p, 2);
E2 = p*d' / size(p, 2);
A = inv(E1) * E2;

% plot 
mid = [130 60];
x = mid(1)-150:2:mid(1)+150;
y = mid(2)-150:2:mid(2)+150;

[X, Y] = meshgrid(x, y);
c = [
    X(:)'
    Y(:)'
];
c = [ones(1, size(c, 2)); c; c(1,:).*c(2,:); c(1,:).^2; c(2,:).^2; c(1,:).^3; c(2,:).^3; c(1,:).*c(2,:).^2; c(2,:).*c(1,:).^2; ];

d_c = A' * c;
[V, I] = max(d_c);

figure
scatter(X(:), Y(:), 100, I(:), 's', 'fill');
xlabel('c_1');
ylabel('c_2');

axis square

figure
surf(x, y, reshape(d_c(1,:), length(x), length(y)), 'FaceColor', 'r', 'EdgeColor', 'None');
hold on
surf(x, y, reshape(d_c(2,:), length(x), length(y)), 'FaceColor', 'b', 'EdgeColor', 'None');

scatter3(k1(1,:), k1(2,:), max(A'*p1), 'bo', 'filled');
scatter3(k2(1,:), k2(2,:), max(A'*p2), 'ko', 'filled');

xlabel('c_1');
ylabel('c_2');

axis square
hold off
