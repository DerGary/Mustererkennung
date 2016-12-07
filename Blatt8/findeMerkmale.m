function merkmale = findeMerkmale(input, methode)

if methode == 1    % PCA, Squared distance all to
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
    Q1 = R - m*m';
    [V1,E1] = eigs(Q1,1);
    A1 = V1(:,1)';
    
    c = [];
    for(i = 1:size(input,3))
    c(:,:,i) = A1 * input(:,:,i); 
    hold on;
    end
 
    merkmale = c;   % return
end

if methode == 2    % Squared distance one to all
    f_gesamt = input;
    
    dim = size(input,3);
    
    N = zeros(1,dim);
    m = zeros(2,1,dim);
    
    R = zeros(2,2,dim);
    for i = 1:dim
        N(i)= length(f_gesamt(:,:,i));
        m(:,i) = sum(f_gesamt(:,:,i),2)/N(i);
        R(:,:,i) = zeros(2,2);
    end

    for i = 1:length(N)
        for k = 1:N(i)
            f_temp = f_gesamt(:,:,i)
            f_new = f_temp(:,k) * f_temp(:,k)';
            R(:,:,i) = R(:,:,i) + f_new;
        end
        R(:,:,i) = R(:,:,i) / N(i);
    end
    
    Q = zeros(2,2);
    C = zeros(2,2);
    
    syms l k
    A = (1/dim)* sum(R,3);
    B = (1/(dim*(dim-1)));
    for k = 2:dim
        for l = 1:(dim-1)
            C = C + (m(:,:,k)*m(:,:,l)' + m(:,:,l)*m(:,:,k)')
        end    
    end
    
    Q = A - B * C;
    
    [V,E] = eigs(Q,1);
    A = V(:,1)';

    c = [];
    
    for(i = 1:dim)
    c(:,:,i) = A * input(:,:,i); 
    hold on;
    end
 
    merkmale = c;   % return
end

if methode == 3    % Squared distance in one class
    f_gesamt = input;
    
    dim = size(input,3);
    
    N = zeros(1,dim);
    m = zeros(2,1,dim);
    
    R = zeros(2,2,dim);
    for i = 1:dim
        N(i)= length(f_gesamt(:,:,i));
        m(:,i) = sum(f_gesamt(:,:,i),2)/N(i);
        R(:,:,i) = zeros(2,2);
    end

    for i = 1:length(N)
        for k = 1:N(i)
            f_temp = f_gesamt(:,:,i)
            f_new = f_temp(:,k) * f_temp(:,k)';
            R(:,:,i) = R(:,:,i) + f_new;
        end
        R(:,:,i) = R(:,:,i) / N(i);
    end
    
    Q = zeros(2,2);
    
    for k = 1:dim
        Q = Q + (R(:,:,k) + m(:,k)*m(:,k)');
    end
    
    Q = Q/dim;
        
    [V,E] = eigs(Q,1);
    A = V(:,1)';

    c = [];
    
    for(i = 1:dim)
    c(:,:,i) = A * input(:,:,i); 
    hold on;
    end
 
    merkmale = c;   % return
end
end