H = hadamard(8);
%H = (1/sqrt(8))*H;
% Klasse \omega_1
o1f1 = [4,3,3,3,2,3,3,3]';
o1f2 = [3,3,2,3,3,2,3,3]';

% Klasse \omega_2
o2f1 = [4,-3,-3,3,2,-3,-3,3]';
o2f2 = [3,-4,-3,2,2,-2,-4,2]';

% Klasse \omega_3
o3f1 = [-4,-3,-3,3,-2,-3,-3,3]';
o3f2 = [-3,-3,-4,3,-3,-4,-2,3]';

% a
% Klasse \omega_1
o1c1 = H*o1f1;
o1c2 = H*o1f2;

% Klasse \omega_2
o2c1 = H*o2f1;
o2c2 = H*o2f2;

% Klasse \omega_3
o3c1 = H*o3f1;
o3c2 = H*o3f2;

%% b
H2(1,:) = H(1,:);
H2(2,:) = H(4,:);

% Klasse \omega_1
o1c1 = H2*o1f1;
o1c2 = H2*o1f2;

% Klasse \omega_2
o2c1 = H2*o2f1;
o2c2 = H2*o2f2;

% Klasse \omega_3
o3c1 = H2*o3f1;
o3c2 = H2*o3f2;

%% Aufgabe 2a

f_1 = [1,2,3,2,3,4,3,4,5,4,5,6,5,6,7,6,7,8,7,8,9,8,9,10,9,10,11]';
f_2 = [1.0,2.1,3.0,1.9,3.1,4,3,4.1,4.9,4.1,5.1,6,4.9,6.1,7.0,6.1,6.8,8,7.2,8,9.1,7.9,9,10.1]';
f_3 = [4,2,7,13,9,4,7,8,2,5,0,1,2,3]';
plot(f_1);
hold on;
plot(f_2);
plot(f_3);
legend('f_1','f_2','f_3');
legend('Location', 'southeast');
hold off;

%% 2b
clear
f_1 = [1,2,3,2,3,4,3,4,5,4,5,6,5,6,7,6,7,8,7,8,9,8,9,10,9,10,11]';
f_2 = [1.0,2.1,3.0,1.9,3.1,4,3,4.1,4.9,4.1,5.1,6,4.9,6.1,7.0,6.1,6.8,8,7.2,8,9.1,7.9,9,10.1]';
f_3 = [4,2,7,13,9,4,7,8,2,5,0,1,2,3]';
f = 1:27;
f = f';
n = 3;
predictions = 20;

[a_1, error_1, prediction_1] = customLPC(f_1, n, predictions);
[a_2, error_2, prediction_2] = customLPC(f_2, n, predictions);
[a_3, error_3, prediction_3] = customLPC(f_3, n, predictions);

c_1 = [a_1; error_1];
c_2 = [a_2; error_2];
c_3 = [a_3; error_3];

subplot(2,3,1);
plot(prediction_1);
hold on;
plot(f_1);
plot(prediction_1,'o');
legend('estimates','f_1', 'data points');
legend('Location', 'southeast');
hold off;

subplot(2,3,2);
plot(prediction_2);
hold on;
plot(f_2);
plot(prediction_2,'o');
legend('estimates','f_2','data points');
legend('Location', 'southeast');
hold off;

subplot(2,3,3);
plot(prediction_3);
hold on;
plot(f_3);
plot(prediction_3,'o');
legend('estimates','f_3','data points');
legend('Location', 'southeast');
hold off;

% Aufgabe 2c
f_1 = [1,2,3,2,3,4,3,4,5,4,5,6,5,6,7,6,7,8,7,8,9,8,9,10,9,10,11]';
f_2 = [1.0,2.1,3.0,1.9,3.1,4,3,4.1,4.9,4.1,5.1,6,4.9,6.1,7.0,6.1,6.8,8,7.2,8,9.1,7.9,9,10.1]';
f_3 = [4,2,7,13,9,4,7,8,2,5,0,1,2,3]';
n = 4;
predictions = 20;

[a_1, error_1, prediction_1] = customLPC(f_1, n, predictions);
[a_2, error_2, prediction_2] = customLPC(f_2, n, predictions);
[a_3, error_3, prediction_3] = customLPC(f_3, n, predictions);

c_1 = [a_1; error_1];
c_2 = [a_2; error_2];
c_3 = [a_3; error_3];

subplot(2,3,4);
plot(prediction_1);
hold on;
plot(f_1);
plot(prediction_1,'o');
legend('estimates','f_1','data points');
legend('Location', 'southeast');
hold off;

subplot(2,3,5);
plot(prediction_2);
hold on;
plot(f_2);
plot(prediction_2,'o');
legend('estimates','f_2','data points');
legend('Location', 'southeast');
hold off;

subplot(2,3,6);
plot(prediction_3);
hold on;
plot(f_3);
plot(prediction_3,'o');
legend('estimates','f_3','data points');
legend('Location', 'southeast');
hold off;