function [ a, error, prediction ] = customLPC( f, n, predictions )
    f = flip(f');
    for i = 1 : length(f)-(n)
        F(i,:) = f(i+1:i+n);
    end
    a = F\f(1:end-n)';
    estimates = F*a;
    error = mean(abs(f(1:end-n)-estimates'));
    
    predictedf = f;
    for i = 1: predictions
        predictedf = [predictedf(1:n)*a predictedf];
    end
    prediction = flip(predictedf);
end

