#include "mex.h"
#include "matrix.h"
#include "matlab_math.h"

void mexFunction(int nlhs,mxArray* plhs[],int nrhs,const mxArray* prhs[])
{
    const mwSize* dims = NULL;

    int row_bl      = 0;
    int column_bl   = 0;
    int byte_bl     = 0;
    int frames_bl   = 0;
    int len         = 0;

    int mark        = 0;
    int lb          = -1;


    double* block_im    = NULL;
    double* data        = NULL;
    double* labimg      = NULL;
    double* curimg      = NULL;

    double* im          = NULL;

    dims = mxGetDimensions(prhs[5]);

    row_bl      = dims[0];
    column_bl   = dims[1];
    byte_bl     = dims[2];
    frames_bl   = dims[3];
    len         = dims[4];

    row_im      = dims[5];
    column_im   = dims[6];
    byte_im     = dims[7];
    sqrtlen     = dims[8];

    dims = mxGetDimensions(prhs[6]);

    mark = dims[0];


    block_im    = (double*)mxGetData(prhs[0]);
    data        = (double*)mxGetData(prhs[1]);
    labimg      = (double*)mxGetData(prhs[2]);
    curimg      = (double*)mxGetData(prhs[3]);

    im          = (double*)mxGetData(prhs[4]);

    count = 1;





    for (posr = len; posr != row_bl - len - 1;posr ++)
    {
        for (posc = len; posc != column_bl - len - 1;posc ++)
        {
            index = IMG_INDEX(posr,posc,0,row_bl,column_bl,1);
            lb = labimg[index];

            for (i = posr - len;i != posr + len + 1;i ++)
            {
                for (j = posc - len;j != posc + len + 1;j ++)
                {
                    for (m = 0;m != byte_bl;m ++)
                    {
                        for (n = 0;n != frames_bl;n ++)
                        {
                            index_bl = IMG_INDEX_4D(i,j,m,n,(len*len + 1),(len*len + 1),byte_bl,frames_bl);

                            temp = (int)frames_bl/9;
                            temp2 = frames_bl - temp*9;

                            index_da = IMG_INDEX_4D(temp,temp2,m,i*row_bl + j);

                            data[index_da] = block_im[index_bl];
                        }
                    }
                }
            }
        }
    }
}
