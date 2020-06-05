/**
 * Sujit Maharjan
 * 070BEX443
 *
 * lab 6
 * Numerical Integration
 * Simpson 5/3rd
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
    if (n % 3 != 0)
    {
        n += (3-n%3);
    }
    int i=0;
    h = (b-a)/n;
    float area=f(a)+f(a+n*h);
    for(i=1;i<n;i++)
    {
        switch(i%3)
        {
        case 1:
        case 2:
            area += 3*f(a+i*h);
            break;
        case 0:
            area += 2*f(a+i*h);
            break;
        }
    }
    area *= 3*h/8;
    printf("Integration is %f",area);
    return 0;
}
