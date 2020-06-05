/*******
 *
 * Sujit Maharjan
 * 070BEX443
 *
 * lab 8
 * Curve fitting
 *******/
#include <stdio.h>
int main()
{
    // data declaration
    int n;
    printf("Enter no of datas");
    scanf("%d",&n);
    float y[n], x[n];
    // data input
    int i;
    for (i=0; i<n;i++)
    {
        printf("(xi,yi)");
        scanf("%f %f",&x[i],&y[i]);
    }
    // calculation of sum
    float a[3][4];

    // initializing to zero
    for(i=0;i<3;i++)
    {
        int j;
        for(j=0;j<4;j++)
        {
            a[i][j]=0;
        }
    }
    // matrix coefficient declaration
    a[2][2] = n;
    for(i=0;i<n;i++)
    {
        a[1][2] += x[i];
        a[0][2] += a[1][2] * x[i];
        a[0][1] += a[0][2]*x[i];
        a[0][0] += a[0][1]*x[i];
        a[2][3] += y[i];
        a[1][3] += x[i]*y[i];
        a[0][3] += a[1][3]*x[i];
    }
    a[1][0] = a[0][1];
    a[1][1] = a[2][0];
    a[0][2] = a[1][1];
    a[1][2] = a[2][1];
    // Gauss Jordan
    int j;
    for(j=0;j<3;j++)
    {
        for(i=0;i<3;i++)
        {
            if(i!=j)
            {
                if(a[j][j]!=0)
                {
                    float factor=a[i][j]/a[j][j];
                    int k;
                    for(k=0;k<4;k++)
                    {
                        a[i][k]-=factor*a[j][k];
                    }
                }
                else
                {
                    printf("pivot element found to be zero");
                    return -2;
                }
            }
        }
    }
    for(i=0;i<3;i++)
    {
        a[i][3]/=a[i][i];
        a[i][i]=1;
    }
    printf("%fx^2+%fx+%f=f(x)",a[0][3],a[1][3],a[2][3]);
    return 0;
}
