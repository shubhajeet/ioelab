/**
 * Sujit Maharjan
 * 070BEX443
 *
 * lab 6
 * Numerical Integration
 * Simpson 1/3rd
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
    // input c1hecking
    if (n % 2 != 0)
    {
        n+=1;
    }
    int i=0;
    h = (b-a)/n;
    float area=f(a)+f(a+n*h);
    for(i=1;i<n;i++)
    {
        switch(i%2)
        {
        case 1:
            area += 4*f(a+i*h);
            break;
        case 0:
            area += 2*f(a+i*h);
            break;
        }
    }
    area *= h/3;
    printf("Integration is %f",area);
    return 0;
}
