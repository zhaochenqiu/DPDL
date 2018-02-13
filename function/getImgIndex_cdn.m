function re_idx = getImgIndex_cdn(gt_pa, gt_ft)

[filename fullname] = loadFiles_plus(gt_pa, gt_ft);

frames = max(size(fullname));

re_idx = [];

for i = 1:frames
    im = imread(fullname{i});

    index = (im == 0 | im == 255);
    value = sum(sum(index));

    if value ~= 0
        re_idx = [re_idx i];
    end
end
