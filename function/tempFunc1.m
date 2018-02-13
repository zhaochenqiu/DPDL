function [fgimg trimg re_imdb Re Pr Fm] = tempFunc1(varargin)


[fgimg trimg re_imdb] = tempFunc(varargin{:});

fgimg(fgimg == 1) = 0;
trimg(trimg == 1) = 0;


[TP FP FN TN] = evalution_entry(fgimg,trimg);


Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);
