function re_idx = getSqFrames(gt_pa, gt_ft, sqnum,  peak_border)

if nargin == 3
    peak_border = 10;
end

[gt_fn gt_ffn] = loadFiles_plus(gt_pa, gt_ft);

frames = max(size(gt_fn));
matrix = zeros(frames,2);

for i = 1:frames
    fullname = gt_ffn{i};

    im = double(imread(fullname));

    index_fg = im == 255;
    index_bk = im == 0;

    matrix(i,1) = sum(sum(index_fg));
    matrix(i,2) = sum(sum(index_bk));
end

list = sum(matrix,2);
pos_sq = find(list ~= 0);

[row_t column_t] = size(pos_sq);
index = linspace(1,max(size(pos_sq)),min([sqnum max(size(pos_sq))]) );
% index = linspace(1,max(size(pos_sq)),min([sqnum max(size(pos_sq))]) + 2);
% index = index(2:end - 1);

index = round(index - 0.5);
pos_sq = pos_sq(index);

re_idx = pos_sq;

