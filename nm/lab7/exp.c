/*********
 * Sujit Maharjan
 * 070BEX443
 *
 * Numerical Methods
 * linear regression
 * curve fitting
 */
#include <stdio.h>
#include <math.h>
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
    float sumx = 0, sumY = 0, sumxY = 0, sumx2 = 0;
    for(i=0;i<n;i++)
    {
        sumx += x[i];
        sumY += log(y[i]);
        sumxY += x[i]*log(y[i]);
        sumx2 += x[i]*x[i];
    }
    // solving equation by cross multiplication
    float b = (sumxY*n-sumY*sumx)/(sumx2*n-sumx*sumx);
    float A = (sumx2*sumY-sumx*sumxY)/(sumx2*n-sumx*sumx);
    float a = exp(A);
    printf ("The required equation is y=%fe^%fx",a,b);
    return 0;

}
