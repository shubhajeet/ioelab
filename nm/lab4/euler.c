/**
 *
 * Sujit Maharjan
 * IOE Pulchowk
 * 070bex443
 *
 * Euler Method
 * lab 4
 *
 */
#include <stdio.h>
#include <math.h>
#define f(x,y) (sin(x)+sin(y))
int main()
{
    // declaration of variable
    float x0, y0, s, h, xn;
    // taking input
    printf("Enter the initial value of xo");
    scanf("%f",&x0);
    printf("Enter the initial value of yo");
    scanf("%f",&y0);
    printf("steps size h");
    scanf("%f",&h);
    printf("Final point xn");
    scanf("%f",&xn);
    // input checking
    if (h == 0.00 )
    {
        printf("step size cannot be zero");
        return -1;
    }
    // changing step size to negative if final point is less than initiala point
    h = (xn>x0)?h:-h;
    // calculating the iteration step required
    s = (xn-x0)/h;
    // initial value
    float x=x0, y=y0;
    // iteration step
    int i;
    for (i=0; i< s; i++)
    {
        printf("%f %f\n",x,y);
        y += f(x,y)*h;
        x += h;
    }
    printf("The value of y(%f) is %f",xn,y);
    return 0;
}
