function re_imdb = getListRPoTP(im_pa, im_ft, gt_pa, gt_ft, pos_list, block_len, mode)

if nargin == 6
    mode = 'mask';
end

num = max(size(pos_list));

imdb_set = {};

for i = 1:num
    imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, pos_list(i), block_len, mode);

    imdb_set = {imdb_set{:}, imdb};
end

re_imdb = mixImdb(imdb_set{:});
