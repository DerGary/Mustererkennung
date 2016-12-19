function [merkmale, A] = findeMerkmale(input, methode)

if methode == 1    % PCA, Squared distance all to all
    f_gesamt = [];
    for i=1:size(input,3)
        f_gesamt = [f_gesamt input(:,:,i)];
    end
    N = length(f_gesamt);
    m = sum(f_gesamt,2)/N;
    R = [0,0;0,0];
    for i = 1:N
        f_new = f_gesamt(:,i) * f_gesamt(:,i)';
        R = R + f_new;
    end

    R = R/N;
    Q = R - m*m';
    
    %[V1,E1] = eigs(Q1,1);
    %A = V1(:,1)';
    [V, E] = eig(Q);
    [E, Indizes] = sort(diag(E),'descend');
    
    A_temp = V(:,Indizes');
    A = A_temp(:,1)';
    
    c = [];
    for(i = 1:size(input,3))
    c(:,:,i) = A * input(:,:,i); 
    end
 
    merkmale = c;   % return
end

if methode == 2    % Squared distance one to all
    f_gesamt = input;
    
    numberOfClasses = size(input,3);
    
    N = zeros(1,numberOfClasses);
    m = zeros(2,1,numberOfClasses);
    
    R = zeros(2,2,numberOfClasses);
    for i = 1:numberOfClasses
        N(i)= length(f_gesamt(:,:,i));
        m(:,i) = sum(f_gesamt(:,:,i),2)/N(i);
        R(:,:,i) = zeros(2,2);
    end

    for i = 1:numberOfClasses
        for k = 1:N(i)
            f_temp = f_gesamt(:,:,i);
            f_new = f_temp(:,k) * f_temp(:,k)';
            R(:,:,i) = R(:,:,i) + f_new;
        end
        R(:,:,i) = R(:,:,i) / N(i);
    end
    
    Q = zeros(2,2);
    C = zeros(2,2);
    
    K = (1/numberOfClasses)* sum(R,numberOfClasses);
    B = (1/(numberOfClasses*(numberOfClasses-1)));
    for k = 2:numberOfClasses
        for l = 1:(k-1)
            C = C + (m(:,:,k)*m(:,:,l)' + m(:,:,l)*m(:,:,k)');
        end    
    end
    
    Q = K - B * C;
    
    %[V,E] = eigs(Q,1);
    %A = V(:,1)';
    [V, E] = eig(Q);
    [E, Indizes] = sort(diag(E),'descend');
    
    A_temp = V(:,Indizes');
    A = A_temp(:,1)';

    c = [];
    
    for(i = 1:numberOfClasses)
    c(:,:,i) = A * input(:,:,i); 
    end
 
    merkmale = c;   % return
end

if methode == 3    % Squared distance in one class
    f_gesamt = input;
    
    numberOfClasses = size(input,3);
    
    N = zeros(1,numberOfClasses);
    m = zeros(2,1,numberOfClasses);
    
    R = zeros(2,2,numberOfClasses);
    for i = 1:numberOfClasses
        N(i)= length(f_gesamt(:,:,i));
        m(:,i) = sum(f_gesamt(:,:,i),2)/N(i);
        R(:,:,i) = zeros(2,2);
    end

    for i = 1:length(N)
        for k = 1:N(i)
            f_temp = f_gesamt(:,:,i);
            f_new = f_temp(:,k) * f_temp(:,k)';
            R(:,:,i) = R(:,:,i) + f_new;
        end
        R(:,:,i) = R(:,:,i) / N(i);
    end
    
    Q = zeros(2,2);
    
    for k = 1:numberOfClasses
        Q = Q + (R(:,:,k) - m(:,k)*m(:,k)');
    end
    
    Q = Q/numberOfClasses;
        
    %[V,E] = eigs(Q,1,'sm');
    %A = V(:,1)';
    
    [V, E] = eig(Q);
    [E, Indizes] = sort(diag(E),'ascend');
    
    A_temp = V(:,Indizes');
    A = A_temp(:,1)';

    c = [];
    
    for(i = 1:numberOfClasses)
    c(:,:,i) = A * input(:,:,i); 
    end
 
    merkmale = c;   % return
end
end