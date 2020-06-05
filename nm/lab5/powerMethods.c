/**
 * Sujit Maharjan
 * IOE Pulchowk
 * 070BEX43
 *
 * lab 5
 *
 * Power Method to find eigen vector
 * Short file
 */
#include <stdio.h>
#include <math.h>
int main()
{
    // data initialization
    int n;
    printf("Enter order of matrix");
    scanf("%d",&n);
    // data declaration
    float a[n][n], x[n], z[n], tol, eigen;
    // data input and initialization
    printf("Enter matrix\n");
    int i;
    for(i = 0; i<n ; i++)
    {
        int j;
        for(j=0; j<n; j++)
        {
            scanf("%f",&a[i][j]);
        }
        x[i]=1;
    }
    printf("Enter tolerance value");
    scanf("%f",&tol);
    // checking of input
    if(tol==0.00)
    {
        printf("tolerance must not be 0");
        return -1;
    }
    // declaration of flag
    int flag;
    do
    {
        eigen = 0; // initialization to smallest absolute value possible
        // multiplication of matrix and vector
        for(i=0; i<n;i++) // no or rows of output vector
        {
            z[i]=0; // matrix initialization to additive identity
            int k;
            for(k=0; k<n; k++)
            {
                z[i]+=a[i][k]*x[k];
            }
            // detecting largest eigen value
            if(eigen < fabs(z[i]))
            {
                eigen=fabs(z[i]);
            }
        }
        flag=1; // setting to and identity
        // dividing by the eigen value
        for (i = 0; i< n; i++)
        {
            z[i] /= eigen;
            // testing for equality of x and z
            flag &= (fabs(z[i]-x[i]) <= tol);
            // equating x and z for next iterative calculation
            x[i]=z[i];
        }
    }
    while(!flag);
    // displaying eigen value
    printf("The maximum eigen value is %f \n",eigen);
    // displaying eigen vector
    printf("The eigen vector\n");
    for(i=0;i<n;i++)
    {
        printf("%f\n",x[i]);
    }
    return 0;
}
