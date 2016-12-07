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

colors = rand(3,size(f,3));

%% Plot A1
subplot(2,2,1);
plot(f1(1,:),f1(2,:),'o','Color',colors(:,1));
hold on;
plot(f2(1,:),f2(2,:),'o','Color',colors(:,2));
hold on;
plot(f3(1,:),f3(2,:),'o','Color',colors(:,3));
legend('f_1','f_2','f_3','Location','Southeast');
title('Aufgabe 1');
hold off

%% ---Aufgabe 2---%
c = findeMerkmale(f,1);
subplot(2,2,2);
for i = 1:size(f,3)
    plot(c(:,:,i),'o','Color',colors(:,i));
    hold on;
 end
 hold off;
 title('Aufgabe 1');
 
 %% ---Aufgabe 3---%
 c = findeMerkmale(f,2);
subplot(2,2,3);
for i = 1:size(f,3)
    plot(c(:,:,i),'o','Color',colors(:,i));
    hold on;
 end
 hold off;
 title('Aufgabe 2');
 
 %% ---Aufgabe 3---%
 c = findeMerkmale(f,3);
subplot(2,2,4);
for i = 1:size(f,3)
    plot(c(:,:,i),'o','Color',colors(:,i));
    hold on;
 end
 hold off;
 title('Aufgabe 3');
 
 
 