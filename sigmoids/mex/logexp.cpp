#include <math.h>
#include <matrix.h>
#include <mex.h>

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    /* declare variables */
    double *x, *y;
    double gain, slope, threshold;
    int m, n, i, j;

    /* check inputs */
    if(nrhs < 1)
        mexErrMsgTxt("Need at least one input.");

    if(nrhs < 4)
        threshold = 0.0;
    else if(mxIsDouble(prhs[3]))
        threshold = mxGetScalar(prhs[3]);
    else
        mexErrMsgTxt("Threshold is not a double.");

    if(nrhs < 3)
        slope = 1.0;
    else if(mxIsDouble(prhs[2]))
        slope = mxGetScalar(prhs[2]);
    else
        mexErrMsgTxt("Slope is not a double.");

    if(nrhs < 2)
        gain = 1.0;
    else if(mxIsDouble(prhs[1]))
        gain = mxGetScalar(prhs[1]);
    else
        mexErrMsgTxt("Gain is not a double.");

    /* get input */
    x = mxGetPr(prhs[0]);
    m = mxGetM(prhs[0]);
    n = mxGetN(prhs[0]);

    /* create output */
    plhs[0] = mxCreateDoubleMatrix(m, n, mxREAL);
    y = mxGetPr(plhs[0]);

    /* do the computation */
    for(i = 0; i < n; i++)
    {
        for(j = 0; j < m; j++)
        {
            y[i+j*m] = gain*log(1+exp(slope*(x[i+j*m] - threshold)));
        }
    }
}
