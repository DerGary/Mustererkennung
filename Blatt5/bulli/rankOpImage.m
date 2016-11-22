function [ result ] = rankOpImage( image, NHOOD, rankOp )

    [N, M] = size(image);
    result = zeros(size(image));
            
    NhoodHalf   = (NHOOD-1)/2;
    NhoodSquare = NHOOD^2;
    
    %R = zeros(1, NhoodSquare);
    
    for i = 1:N
       for j = 1:M
           sub = image(max(1, i-NhoodHalf):min(N, i+NhoodHalf), ...
                       max(1, j-NhoodHalf):min(M, j+NhoodHalf));
                                
           x = sort(sub(:))';
           % fill R with zeros
           %R(1:NhoodSquare-length(x)) = 0;
           %R(NhoodSquare-length(x)+1:end) = x;
           result(i,j) = rankOp(x);
       end
    end         
end

