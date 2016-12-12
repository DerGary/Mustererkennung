% Klasse 1
f1 = [2,2;2.1,2.1;2.05,2.05;1.95,2.05;1.9,1.9]';
% Klasse 2
f2 = [4,6.5;3.8,6.1;4.2,5.9;4.1,6.3;4.1,6.0]';
% Klasse 3
f3 = [2,6.2;1.8,6.1;2.2,5.8;2.1,6.1;2.0,6.1]';

f = [];
f(:,:,1) = f1;
f(:,:,2) = f2;
f(:,:,3) = f3;

markers = ['o' 'x' '*'];
colors = ['r' 'm' 'b'];

%% Plot A1
subplot(2,1,1);
plot(f1(1,:),f1(2,:),markers(1), 'Color',colors(1));
hold on;
plot(f2(1,:),f2(2,:),markers(2), 'Color',colors(2));
hold on;
plot(f3(1,:),f3(2,:),markers(3), 'Color',colors(3));
title('Aufgabe 1');
x = linspace(-8, 14);
xlim([-8,14]);
ylim([0,7]);
%axis equal;
%% ---Aufgabe 2---%
[c, A] = findeMerkmale(f,1);
subplot(2,1,2);
for i = 1:size(f,3)
    plot(c(:,:,i), ones(1,length(c))*2,markers(i),'Color',colors(i));
    hold on;
 end
 %hold off;
 title('be 2');
 
 subplot(2,1,1);
 plot(x+3, (A(2)/A(1))*x + 4);
 %% ---Aufgabe 3---%
 [c, A] = findeMerkmale(f,2);
subplot(2,1,2);
for i = 1:size(f,3)
    plot(c(:,:,i), ones(1,length(c))*3,markers(i),'Color',colors(i));
    hold on;
 end
 %hold off;
 title('Aufgabe 3');
 
 subplot(2,1,1);
 plot(x + 3, (A(2)/A(1))*x + 4);
 %% ---Aufgabe 4---%
 [c, A] = findeMerkmale(f,3);
subplot(2,1,2);
for i = 1:size(f,3)
    plot(c(:,:,i), ones(1,length(c))*4,markers(i),'Color',colors(i));
    hold on;
 end
 %hold off;
 title('Merkmale');
 ylim([1.5, 4.5]);
 legend('c_1','c_2','c_3','Location','Southeast');
 
  subplot(2,1,1);
 plot(x + 3, (A(2)/A(1))*x + 4);
 legend('f_1','f_2','f_3','A1','A2','A3','Location','Southeast');

 hold off;
 
 