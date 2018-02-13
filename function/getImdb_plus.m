function re_imdb = getImdb_plus(im_pa,im_ft,tr_pa,tr_ft,maxdis,curindex,num,len,mode)

if nargin == 8
    mode = 'test';
end

[im_fs temp] = loadData_files(im_pa,im_ft);
[tr_fs temp] = loadData_files(tr_pa,tr_ft);



im = imread([im_pa '\' im_fs{1}]);

[row_im column_im byte_im] = size(im);

%{
maxlen = max(size(im));
rate = maxdis/maxlen;



[row_t column_t byte_t] = size(im);
row_t       = round(row_t*rate);
column_t    = round(column_t*rate);

im = imresize(im,[row_t column_t]);
%}

im = scaleImage_byWidth(im,maxdis);

[row_im column_im byte_im] = size(im);


data = zeros(row_im,column_im,byte_im,num,'uint8');

count = 1;



index = round(linspace(1,curindex - 1,num));

for i = 1:max(size(index))
    fprintf(1, 'Reading file %d: %s\r', i, im_fs{index(i)});
    
    im = imread([im_pa '\' im_fs{index(i)}]);

    %{
    [row_t column_t byte_t] = size(im);
    row_t       = round(row_t*rate);
    column_t    = round(column_t*rate);

    im = imresize(im,[row_t column_t]);
    %}
    im = scaleImage_byWidth(im,maxdis);

    data(:,:,:,count) = im;

    count = count + 1;
end


labimg = double(imread([tr_pa '/' tr_fs{curindex}]));
%{
[row_t column_t byte_t] = size(labimg);
row_t       = round(row_t*rate);
column_t    = round(column_t*rate);

labimg = imresize(labimg,[row_t column_t]);
%}
labimg = scaleImage_byWidth(labimg,maxdis);

% displayMatrixImage(1,1,1,labimg)

%input('pause in the ')


curimg = double(imread([im_pa '/' im_fs{curindex}]));
%{
[row_t column_t byte_t] = size(curimg);
row_t       = round(row_t*rate);
column_t    = round(column_t*rate);

curimg = imresize(curimg,[row_t column_t]);
%}
curimg = scaleImage_byWidth(curimg,maxdis);

[row_im column_im byte_im] = size(curimg);



block_im = single(data);


block_im = padarray(block_im,[len,len],'symmetric');
curimg = padarray(curimg,[len,len],'symmetric');
labimg = padarray(labimg,[len,len],'symmetric');


clear data;



im = createData_plus(block_im,round(row_im/2),round(column_im/2),len);

[row_t column_t byte_t] = size(im);


if strcmp(mode,'test') == 1
    templen = row_im*column_im;
    data = zeros(row_t,column_t,byte_t,row_im*column_im,'single');
    labs = zeros(1,row_im*column_im) + 1;
end

if strcmp(mode,'train') == 1
    templen = row_im*column_im;
    templen = round(templen/100 - 0.5)*100;

    data = zeros(row_t,column_t,byte_t,templen,'single');
    labs = zeros(1,templen) + 1;
end


count = 1;


[row_bl column_bl byte_bl frames_bl] = size(block_im);


for posr = 1 + len:row_bl - len
    for posc = 1 + len:column_bl - len
        im = createData_plus(block_im,posr,posc,len);
        lb = labimg(posr,posc);


        if  strcmp(mode,'test') == 1

            if lb == 0
                lb = 1;
            end

            value = curimg(posr,posc,:);
            
            for n = 1:byte_im
                im(:,:,n) = im(:,:,n) - value(n);
            end

%            data(:,:,:,index(count)) = im;
%            labs(index(count)) = lb;
            data(:,:,:,count) = im;
            labs(count) = lb;


            count = count + 1;
        elseif strcmp(mode,'train') == 1

            if lb == 0 | lb == 255
                if lb == 0
                    lb = 1;
                end

                value = curimg(posr,posc,:);
                
                for n = 1:byte_im
                    im(:,:,n) = im(:,:,n) - value(n);
                end

%                data(:,:,:,index(count)) = im;
%                labs(index(count)) = lb;
                data(:,:,:,count) = im;
                labs(count) = lb;

                count = count + 1;

                if count > templen
                    break;
                    break;
                    break;
                end
            end
        else
        end

    end

    fprintf(1, 'process of create imdb %d, \t %.2f%% \n',count, (count/(row_im*column_im))*100  );
end

count = count - 1;

count = round(count/100 - 0.5)*100;

oldlab = labs;

if strcmp(mode,'train') == 1
    data = data(:,:,:,1:count);
    labs = labs(1:count);

    index = single(randperm(count));

    data = data(:,:,:,index);
    labs = labs(index);
else
    index = single(randperm(row_im*column_im));

    data = data(:,:,:,index);
    labs = labs(index);
end


line = 1:max(size(index));

matrix = [line' index'];
index = sortrows(matrix,2);
index = index(:,1);


re_imdb.images.data     = data;
re_imdb.images.labels   = labs;
re_imdb.images.imgsize  = [row_im column_im byte_im];
re_imdb.images.index    = index;
re_imdb.images.set      = zeros(1,templen,'single') + 1;
re_imdb.images.data_mean = mean(data,4);

re_imdb.meta.sets       = {'train' 'Val' 'test'};
re_imdb.meta.classes    = {'0' '1'};

