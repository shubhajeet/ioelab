/*****
 *
 * Sujit Maharjan
 * 070BEX443
 *
 * lab 8
 * langrages
 *
 *****/
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
    float xn;
    printf("Enter the point at which value of y need to be found");
    scanf("%f",&xn);
    // applying lagranges formula
    float yn = 0; // additive identity
    for(i=0;i<n;i++)
    {
        int j;
        float p=y[i]; // multicative identity
        for(j=0;j<n;j++)
        {
            if(i!=j)
                p *= (xn-x[j])/(x[i]-x[j]);
        }
        yn+=p;
    }
    printf("The value of function at %f is %f",xn,yn);
    return 0;
}
