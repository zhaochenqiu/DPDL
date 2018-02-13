function re_img = createRectData(line,value)

if nargin == 1
    value = line(end,:);
end


re_img = zeros(28,28,3) - 1;

for i = 1:3
    re_img(11:18,11:18,i) = value(i) + re_img(11:18,11:18,i) + 1;
end

count = 1;

for i = 1:28
    for j = 1:28

        if re_img(i,j,1) == -1
            for n = 1:3
                re_img(i,j,n) = line(count,n);
            end
            
            count = count + 1;
        end

    end
end
