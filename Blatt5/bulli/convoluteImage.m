function [ result ] = convoluteImage( image, kernel, repeat )
    if ~exist('repeat', 'var') repeat = 1; end;

for loop = 1:repeat    
    [N, M] = size(image);
    [n, m] = size(kernel);

    image = padarray(image, [n-1, m-1]);
    result = zeros(N+n-1, M+m-1);

    for j = 1:N+n-1
       for k = 1:M+m-1
           for mu = 0:n-1
              for ni = 0:m-1
                result(j,k) = result(j,k) + image(j+mu, k+ni) * kernel(mu+1, ni+1);
              end
           end
       end
    end

    image = result;
end

end

