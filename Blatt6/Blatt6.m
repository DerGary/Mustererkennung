%---Aufgabe1---%
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

%---Aufgabe2b/c---%
%A = [3 4;-2 3;5 -7];   %b
A = [1 3;5 2;4 -3];     %c
b = [31; -7.5; -15.2];

[U,S,V]=svd(A,0);

xSVD= V*((U'*b)./diag(S)) % x = A^+ * b mit A^+ = V Sigma^+ U'
xNormal= A\b

K = cond(A)     % die numerische Lösung variiert um die k letzten Stellen von der exakten Lösung
                % k = sigmaMax(A)/sigmaMin(A)





