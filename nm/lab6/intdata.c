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
    int r = n % 3;
    int i=0;
    h = (b-a)/n;
    float y[n+1];
    for(i=0;i<(n+1);i++)
    {
        printf("Value of function at %f",a+i*h);
        scanf("%f",&y[i]);
    }
    float area=y[0];
    for(i=1;i<(n-r);i++)
    {
        switch(i%3)
        {
        case 1:
        case 2:
            area += 3*y[i];
            break;
        case 0:
            area += 2*y[i];
            break;
        }
    }
    area +=y[i];
    area *= 3*h/8;
    if(r==1)
    {
        area += h/2*(y[i]+y[n]);
    }
    else
    {
        area += h/3*(y[i]+2*y[i+1]+y[n]);
    }

    printf("Integration is %f",area);
    return 0;
}
