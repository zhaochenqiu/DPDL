function re_im = createData_byPos(block_im,posr,posc);

line = block_im(posr,posc,:,:);
line = squeeze(line);
line = line';


re_im = createRectData_sub(line);

