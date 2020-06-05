/*********
 * Sujit Maharjan
 * 070BEX443
 *
 * Numerical Methods
 * linear regression
 * curve fitting
 */
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
    float sumx = 0, sumy = 0, sumxy = 0, sumx2 = 0;
    for(i=0;i<n;i++)
    {
        sumx += x[i];
        sumy += y[i];
        sumxy += x[i]*y[i];
        sumx2 += x[i]*x[i];
    }
    // solving equation by cross multiplication
    float a = (sumxy*n-sumy*sumx)/(sumx2*n-sumx*sumx);
    float b = (sumx2*sumy-sumx*sumxy)/(sumx2*n-sumx*sumx);
    printf ("The required equation is y=%fx+%f",a,b);
    return 0;

}
