L = [1 0 0 0; 1 1 0 0; 2 0 1 0; 2 1 1 1];
R = [2 0 1 0; 0 4 -1 -1; 0 0 4 1; 0 0 0 2];
P = [1 0 0 0; 0 0 1 0; 0 1 0 0; 0 0 0 1];
A = inv(P)*L*R

[l,r,p] = lu(A);
a = inv(p)*l*r

proof = A/a

%% 1c

A = [2 1 0; 1 3 0; 0 0 4];

% Cholesky Zerlegung:
% R = chol(A);
% proof = (R'*R)/A

% Eigenwerte:
eig(A)


%% 1d

A = [5 -2 -1; -2 8 -3; -1 -3 7];
l = chol(A, 'lower')

%% 1e

A = [5 -2 -1; -2 8 -3; -1 -3 7];
[Q,R] = qr(A)

%% 2c

A = [2 1 1; 2 3 4; -1 -1 -2];
[V, D] = eig(A)