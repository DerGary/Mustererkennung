clear;
load('data.mat');
%% a)
p1 = [ones(1, size(k1, 2));k1]
p2 = [ones(1, size(k2, 2));k2]
p3 = [ones(1, size(k3, 2));k3]
p4 = [ones(1, size(k4, 2));k4]

%% b)
d = [
    repmat([1 0 0 0], size(k1, 2), 1)
    repmat([0 1 0 0], size(k2, 2), 1)
    repmat([0 0 1 0], size(k3, 2), 1)
    repmat([0 0 0 1], size(k4, 2), 1)
]';

p = [p1 p2 p3 p4];

%% c1)
A = (d/p)';

%% c2)
E1 = p*p' / size(p, 2);
E2 = p*d' / size(p, 2);
A = inv(E1) * E2;

error = (d-A'*p).^2;

%% d)
c = [
     1  1  1  1
    -2  6  5 -5
     2 12 -3  7
];

d_c = A' * c;

[v, i] = max(d_c); i

%% e)
mid = [4.5, 4.5];
x = mid(1)-15:0.25:mid(1)+15;
y = mid(2)-15:0.25:mid(2)+15;

[X, Y] = meshgrid(x, y);
c = [
    ones(1, length(x)*length(y))
    X(:)'
    Y(:)'
];

d_c = A' * c;
[V, I] = max(d_c);

figure(1)
scatter(X(:), Y(:), 100, I(:), 's', 'fill');
xlabel('c_1');
ylabel('c_2');

axis square

figure(2)
surf(x, y, reshape(d_c(1,:), length(x), length(y)), 'FaceColor', 'r', 'EdgeColor', 'None');
hold on
surf(x, y, reshape(d_c(2,:), length(x), length(y)), 'FaceColor', 'g', 'EdgeColor', 'None');
surf(x, y, reshape(d_c(3,:), length(x), length(y)), 'FaceColor', 'b', 'EdgeColor', 'None');
surf(x, y, reshape(d_c(4,:), length(x), length(y)), 'FaceColor', 'm', 'EdgeColor', 'None');

scatter3(k1(1,:), k1(2,:), max(A'*p1), 'bo', 'filled');
scatter3(k2(1,:), k2(2,:), max(A'*p2), 'ko', 'filled');
scatter3(k3(1,:), k3(2,:), max(A'*p3), 'mo', 'filled');
scatter3(k4(1,:), k4(2,:), max(A'*p4), 'wo', 'filled');

xlabel('c_1');
ylabel('c_2');

axis square
hold off