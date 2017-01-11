clear all;
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

o(:, :, 1) = o1;
o(:, :, 2) = o2;
o(:, :, 3) = o3;
o(:, :, 4) = o4;
%% b
c = [[-2 2]
    [6 12]
    [5 -3]
    [-5 7]]';

c1 = 	[[1.4 0.4]
		[0.3 -2.4]	
		[1.2 0.8]		
		[1.2 -1.4]]';
		
c3 = 	[[11.2 0.5]	
		[9.8 -5]		
		[11	-1.4]	
		[8.2 1.7]]';
    
distance = zeros(4, 5, 4);
index = zeros(4,1);
minValues = zeros(4,1);
for k = 1:4
    for i = 1:4
        for j = 1:5
            distance(i, j, k) = LNorm(2, c(:,k), o(:, j, i));
        end
    end
    [minValues(k), index(k)] = min(min(distance(:,:,k)'));
end
%% c
index = zeros(161, 161);
minValues = zeros(161, 161);
[X,Y] = meshgrid(-15:0.25:25,-15:0.25:25);
for i = 1:161
    for j = 1:161
        distance = zeros(4, 5);
        index = zeros(4,1);
        minValues = zeros(4,1);
        for k = 1:4
            for l = 1:5
                distance(k, l) = LNorm(2, [X(i,j); Y(i,j)], o(:, k, l));
            end
        end
        [minValues(i,j), index(i,j)] = min(min(distance(:,:)'));
    end
end



