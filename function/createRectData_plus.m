function re_img = createRectData_plus(line,len_all,len_mid)

value = line(end,:);


re_img = zeros(len_all,len_all,3) - 1;


posl = len_all/2 - len_mid/2 + 1;
posr = posl + len_mid - 1;

for i = 1:3
    re_img(posl:posr,posl:posr,i) = value(i) + re_img(posl:posr,posl:posr,i) + 1;
end


count = 1;

for i = 1:len_all
    for j = 1:len_all

        if re_img(i,j,1) == -1
            for n = 1:3
                re_img(i,j,n) = line(count,n);
            end
            
            count = count + 1;
        end

    end
end
