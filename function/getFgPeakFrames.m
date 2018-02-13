function re_idx = getFgPeakFrames(gt_pa, gt_ft, fgnum,  peak_border)

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

hist = matrix(:,1);
hist = hist';



fgcolor = [100 101 140];


color = [255 0 0
		180 180 180
		0 0 255
		240 70 240];

mark = findPeak_plus(hist, peak_border);
[scale histimg_fg] = histogram2image_plus(hist, fgcolor, mark, color);

indexlist_fg = histimg_fg(end,:,1);

pos_fg = find(indexlist_fg == 255);

[row_t column_t] = size(pos_fg);
index = linspace(1,max(size(pos_fg)),min([fgnum max(size(pos_fg))]));
% index = linspace(1,max(size(pos_fg)),min([fgnum max(size(pos_fg))]) + 2);
% index = index(2:end - 1);

index = round(index - 0.5);
pos_fg = pos_fg(index);

re_idx = pos_fg';

