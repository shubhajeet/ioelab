/**
 * Sujit Maharjan
 * IOE Pulchowk
 * 070BEX43
 *
 * lab 5
 *
 * Power Method to find eigen vector
 */
#include <stdio.h>
#include <math.h>
int main()
{
    // data initialization
    int n;
    printf("Enter order of matrix");
    scanf("%d",&n);
    // matrix initialization
    float a[n][n];
    printf("Enter matrix\n");
    int i;
    for(i = 0; i<n ; i++)
    {
        int j;
        for(j=0; j<n; j++)
        {
            scanf("%f",&a[i][j]);
        }
    }
    // vector declaration and initialization
    float x[n][1];
    x[0][0]=1;
    for (i = 1; i < n; i++)
    {
        x[i][0]=0;
    }
    float tol;
    printf("Enter tolerance value");
    scanf("%f",&tol);
    // checking of input
    if(tol==0.00)
    {
        printf("tolerance must not be 0");
        return -1;
    }
    // declaration of Z
    float z[n][1];
    // declaration of flag
    float eigen = 0;
    int flag;
    do
    {
        // matrix initialization
        int k=0;
        for(k=0; k<n; k++)
        {
            z[k][0]=0;
        }
        // multiplication
        for(i=0; i<n;i++) // output matrix ko row
        {
            int j;
            for(j=0; j<1; j++)// output matrix ko column
            {
                for(k=0; k<n; k++)
                {
                    z[i][j]+=a[i][k]*x[k][j];
                }
            }
        }
        // detecting largest eigen value
        eigen = 0;
        for (k = 0; k< n; k++)
        {
            if(eigen < fabs(z[k][0]))
            {
                eigen=fabs(z[k][0]);
            }
        }
        // dividing by the eigen value
        for (k = 0; k< n; k++)
        {
            z[k][0]/=(float) eigen;
        }
        // testing for equality of x and z
        flag = 0;
        for(k=0;k<n;k++)
        {
            if(fabs(z[k][0]-x[k][0])>tol)
            {
                flag=1;
                break;
            }
        }
       // Z = X
        for(k=0; k< n; k++)
        {
            x[k][0]=z[k][0];
        }
    }
    while(flag==1);
    // displaying eigen value
    printf("The maximum eigen value is %f",eigen);
    // displaying eigen vector
    printf("The eigen vector\n");
    int k;
    for(k=0;k<n;k++)
    {
        printf("%f\n",x[k][0]);
    }
    return 0;
}
