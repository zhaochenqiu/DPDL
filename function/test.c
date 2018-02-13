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
}
