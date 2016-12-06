%%---Augabe1---%
% Klasse 1
f1 = [2,2;2.1,2.1;2.05,2.05;1.95,2.05;1.9,1.9]';
% Klasse 2
f2 = [4,6.5;3.8,6.1;4.2,5.9;4.1,6.3;4.1,6.0]';
% Klasse 3
f3 = [2,6.2;1.8,6.1;2.2,5.8;2.1,6.1;2.0,6.1]';

f_gesamt = [f1 f2 f3]

%% Plot A1
subplot(2,2,1);
plot(f1(1,:),f1(2,:),'o','Color',[0,1.0,0.0]);
hold on;
plot(f2(1,:),f2(2,:),'o','Color',[1,0.0,0.0]);
hold on;
plot(f3(1,:),f3(2,:),'o','Color',[0,0.0,1.0]);
legend('f_1','f_2','f_3','Location','Southeast');
title('Aufgabe 1');
hold off
%% ---Aufgabe2---%
N = length(f_gesamt);
m = sum(f_gesamt,2)/N;
R = [0,0;0,0];
for i = 1:N
    f_new = f_gesamt(:,i) * f_gesamt(:,i)';
    R = R + f_new;
end

R = R/N;
Q1 = R - m*m';
[V1,E1] = eigs(Q1,1);
%A1 = V1(:,1)';
A1 = [1;1]';

c = A1*f_gesamt;
c11 = A1*f1;
c12 = A1*f2;
c13 = A1*f3;
subplot(2,2,2);
plot(c11,'o','Color',[0,1.0,0.0]);
hold on;
plot(c12,'o','Color',[1,0.0,0.0]);
hold on;
plot(c13,'o','Color',[0,0.0,1.0]);
hold off;
title('Aufgabe 2');
legend('\Omega_1','\Omega_2','\Omega_3');

%% ---Aufgabe3---%
N1 = length(f1);
N2 = length(f2);
N3 = length(f3);

m1 = sum(f1,2)/N;
m2 = sum(f2,2)/N;
m3 = sum(f3,2)/N;

R1 = [0,0;0,0];
R2 = [0,0;0,0];
R3 = [0,0;0,0];

for i = 1:N1
    f_new = f1(:,i) * f1(:,i)';
    R1 = R1 + f_new;
end

for i = 1:N2
    f_new = f2(:,i) * f2(:,i)';
    R2 = R2 + f_new;
end

for i = 1:N3
    f_new = f3(:,i) * f3(:,i)';
    R3 = R3 + f_new;
end

R1 = R1/N1;
R2 = R2/N2;
R3 = R3/N3;

X = R1 + R2 + R3;
C = ((m2*m1' + m1*m2')+(m3*m2'+m2*m3'));
Q2 = (1/3) * X - (1/(3*(3-1))) * C;

[V2,E2] = eigs(Q2,1);
A2 = V2(:,1)';

c21 = A2*f1;
c22 = A2*f2;
c23 = A2*f3;

subplot(2,2,3);
plot(c21,'o','Color',[0,1.0,0.0]);
hold on;
plot(c22,'o','Color',[1,0.0,0.0]);
hold on;
plot(c23,'o','Color',[0,0.0,1.0]);
hold off;
title('Aufgabe 3');
legend('\Omega_1','\Omega_2','\Omega_3');
%% ---Aufgabe4---%

Q_1 = R1 - m1*m1';
Q_2 = R2 - m2*m2';
Q_3 = R3 - m3*m3';

Q3 = (1/3)*(Q_1 + Q_2 + Q_3);
[V3,E3] = eigs(Q3,1);
A3 = V3(:,1)';

c31 = A3*f1;
c32 = A3*f2;
c33 = A3*f3;

subplot(2,2,4);
plot(c31,'o','Color',[0,1.0,0.0]);
hold on;
plot(c32,'o','Color',[1,0.0,0.0]);
hold on;
plot(c33,'o','Color',[0,0.0,1.0]);
hold off;
title('Aufgabe 4');
legend('\Omega_1','\Omega_2','\Omega_3');
