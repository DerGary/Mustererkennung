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