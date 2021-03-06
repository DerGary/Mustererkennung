function [ outputImg ] = rankoperation( hFunction, image )
    output = zeros(size(image));
    image = double(image)/255;
    for i = 4:(size(image,1)-3) % ignore corners
        for j = 4:(size(image,2)-3)
            temp = image(i-3:i+3,j-3:j+3);
            temp = reshape(temp,1,[]);
            temp = sort(temp);
            h = feval(hFunction,temp);
            output(i,j) = h;
        end
    end
    outputImg = output;
end

