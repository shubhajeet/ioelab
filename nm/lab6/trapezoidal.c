/**
 * Sujit Maharjan
 * 070BEX443
 *
 * lab 6
 * Numerical Integration
 * Trapezoidal method
 */
#include <stdio.h>
#include <math.h>
#define f(x) (sin(x))
int main()
{
    // data declaration
    float a, b, h;
    int n;
    // data input
    printf("Enter the the initial and final value of integration");
    scanf("%f %f",&a,&b);
    printf("Enter no of intervals");
    scanf("%d",&n);
    // input checking
    if (n % 2 == 0)
    {

    }
    int i=0;
    h = (b-a)/n;
    float area=f(a)+f(a+n*h);
    for(i=1;i<n;i++)
    {
        area += 2*f(a+i*h);
    }
    area *= h/2;
    printf("Integration is %f",area);
    return 0;
}
