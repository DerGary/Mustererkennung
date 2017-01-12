o1 = [
    [1 0]
    [0 -2]
    [1 1]
    [1 -1]
    [-4 0]]';
o2 = [
    [10 8]
    [13 9]
    [9 12]
    [10 10]
    [5 15]]';
o3 = [
    [11 0]
    [10 -5]
    [11 -1]
    [8 1]
    [6 -6]]';
o4 = [
    [0 8]
    [1 9]
    [-1 11]
    [0 10]
    [-7 10]]';
%% 1a
[mu(:,1), eps(:, :, 1)] = MaxLikelihood(o1);
[mu(:,2), eps(:, :, 2)] = MaxLikelihood(o2);
[mu(:,3), eps(:, :, 3)] = MaxLikelihood(o3);
[mu(:,4), eps(:, :, 4)] = MaxLikelihood(o4);

%% 1b
c = [[-2 2]
    [6 12]
    [5 -3]
    [-5 7]]';
class = zeros(4,1);
for i = 1: size(c, 2)
    class(i) = NormalDistributionClassifier(c(:,i), mu, eps);
end

%% 1c
index = zeros(161, 161);
[X,Y] = meshgrid(-15:0.25:25,-15:0.25:25);
for i = 1:161
    for j = 1:161
        index(i,j) = NormalDistributionClassifier([X(i,j); Y(i,j)], mu, eps);
    end
end
scatter(X(:), Y(:), 100, index(:), 's', 'fill');
hold on;
scatter(o1(1,:), o1(2,:), 100, 'red', 's', 'fill');
scatter(o2(1,:), o2(2,:), 100, 'red', 's', 'fill');
scatter(o3(1,:), o3(2,:), 100, 'red', 's', 'fill');
scatter(o4(1,:), o4(2,:), 100, 'red', 's', 'fill');
hold off;

%% 2a
sampleData = [o1 o2 o3 o4];
phi = zeros(3, size(sampleData,2));
for dataIndex = 1:size(sampleData, 2)
    phi(:, dataIndex) = LinearPhi(sampleData(:, dataIndex));
end

%% 2b
delta = zeros(4, size(sampleData,2));
for dataIndex = 1:size(sampleData, 2)
    delta(:, dataIndex) = SeparatorFunction(sampleData(:, dataIndex));
end

%% 2c
N = size(sampleData, 2);
E1 = zeros(3,3);
for i = 1:N
    E1 = E1 + phi(:, i)*phi(:, i)';
end
E1 = E1/N;
E2 = zeros(3,4);
for i = 1:N
    E2 = E2 + phi(:, i)*delta(:, i)';
end
E2 = E2/N;

A = E1\E2; % inv(E1)*E2;

%% 2d

c = [[-2 2]
    [6 12]
    [5 -3]
    [-5 7]]';

for i = 1: size(c, 2)
    d(:,i) = A'*LinearPhi(c(:,i));
end
[~, i] = max(d)

%% 2e
index = zeros(161, 161);
[X,Y] = meshgrid(-15:0.25:25,-15:0.25:25);
for i = 1:161
    for j = 1:161
        [~, index(i,j)] = max(A'*LinearPhi([X(i,j); Y(i,j)]));
    end
end
scatter(X(:), Y(:), 100, index(:), 's', 'fill');
hold on;
scatter(o1(1,:), o1(2,:), 100, 'red', 's', 'fill');
scatter(o2(1,:), o2(2,:), 100, 'red', 's', 'fill');
scatter(o3(1,:), o3(2,:), 100, 'red', 's', 'fill');
scatter(o4(1,:), o4(2,:), 100, 'red', 's', 'fill');
hold off;

%% 3a
sampleData = [o1 o2 o3 o4];
phi = zeros(6, size(sampleData,2));
for dataIndex = 1:size(sampleData, 2)
    phi(:, dataIndex) = SquaredPhi(sampleData(:, dataIndex));
end

%% 3b
delta = zeros(4, size(sampleData,2));
for dataIndex = 1:size(sampleData, 2)
    delta(:, dataIndex) = SeparatorFunction(sampleData(:, dataIndex));
end

%% 3c
N = size(sampleData, 2);
E1 = zeros(6,6);
for i = 1:N
    E1 = E1 + phi(:, i)*phi(:, i)';
end
E1 = E1/N;
E2 = zeros(6,4);
for i = 1:N
    E2 = E2 + phi(:, i)*delta(:, i)';
end
E2 = E2/N;

A = E1\E2; % inv(E1)*E2;

%% 3d

c = [[-2 2]
    [6 12]
    [5 -3]
    [-5 7]]';

for i = 1: size(c, 2)
    d(:,i) = A'*SquaredPhi(c(:,i));
end
[~, i] = max(d)

%% 3e
index = zeros(161, 161);
[X,Y] = meshgrid(-15:0.25:25,-15:0.25:25);
for i = 1:161
    for j = 1:161
        [~, index(i,j)] = max(A'*SquaredPhi([X(i,j); Y(i,j)]));
    end
end
scatter(X(:), Y(:), 100, index(:), 's', 'fill');
hold on;
scatter(o1(1,:), o1(2,:), 100, 'red', 's', 'fill');
scatter(o2(1,:), o2(2,:), 100, 'red', 's', 'fill');
scatter(o3(1,:), o3(2,:), 100, 'red', 's', 'fill');
scatter(o4(1,:), o4(2,:), 100, 'red', 's', 'fill');
hold off;