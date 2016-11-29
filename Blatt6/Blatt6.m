%% ---Aufgabe1--- %%
A = [6 9; 9 7];
%A = [1 2;2 0;0 1;1 1];
%A = [1 2 1;2 0 1;0 1 0;1 1 3];
[m,n] = size(A);
%1
B = transpose(A)*A;
%2
[Eigenvektoren, Eigenwerte] = eig(B);
[Eigenwerte, Indizes] = sort(diag(Eigenwerte),'descend');
%3
V = Eigenvektoren(:,Indizes');
%4
S = zeros(m,n);
S(logical(eye(size(S)))) = sqrt(Eigenwerte);
%5
U = A*V/S;
%6
A
AErg = U*S*V'

%% ---Aufgabe2b--- %%
A = [ 3 4;-2 3;5 -7];   %b
b = [  31
      -7.5
      -15.2 ];

[U,S,V]=svd(A,0);

xSVD= V/S*U'*b % x = A^+ * b mit A^+ = V Sigma^+ U'
xNormal= A\b

K = cond(A)     % die numerische Lösung variiert um die k letzten Stellen von der exakten Lösung
                % k = sigmaMax(A)/sigmaMin(A)

% ---Aufgabe2c--- % 
A = [
    1  3
    5  2
    4 -3
];

b = [
    3.9
    7.3
    1
];

[U,S,V]=svd(A,0);

xSVD= V/S*U'*b
xNormal= A\b


%% Aufgabe 2 d %% 
b = [ -2.1
      -0.9
      -0.6
       0.6
       0.9 ];
   
t = [ 1 3 4 6 7 ]';

gamma = 0;

A = [ ones(size(b))  t-gamma];

x = A\b  % pseudo inv
g = @(t) x(1) + x(2)*(t-gamma);

plot(t, b, 'o');
hold on
plot(t, g(t));
hold off
