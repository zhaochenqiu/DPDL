#ifndef IMG_INDEX
#define IMG_INDEX(posr,posc,posb,row,column,byte) posr + posc*row + posb*column*row
#endif

#ifndef IMG_INDEX_4D
#define IMG_INDEX_4D(posr,posc,posb,posf,row,column,byte,frame) posr + posc*row + posb*column*row + posf*row*column*frame
#endif


#ifndef MATRIX_INDEX
#define MATRIX_INDEX(posr,posc,row,column) posr + posc*row
#endif

#ifndef ABS
#define ABS(x) ( ( (x) < 0 )? -(x) : (x) )
#endif

#ifndef MAX
#define MAX(x,y) (((x) > (y)) ? (x) : (y))
#endif

#ifndef MIN
#define MIN(x,y) (((x) < (y)) ? (x) : (y))
#endif


