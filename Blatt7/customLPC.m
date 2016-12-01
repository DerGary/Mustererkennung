function [ a, error, prediction ] = customLPC( f, n, predictions )
    f = f';
    for i = 1 : length(f)-(n)
        F(i,:) = f(i:i+(n-1));
    end
    a = F\f(1,n+1:end)';
    estimates = F*a;
    error = mean(abs(f(n+1:end)-estimates'));
    
    predictedf = f;
    for i = 1: predictions
        predictedf = [predictedf predictedf(end-(n-1):end)*a];
    end
    prediction = predictedf;
end

