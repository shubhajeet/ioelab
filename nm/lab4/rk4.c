/**
 *
 * Sujit Maharjan
 * IOE Pulchowk
 * 070bex443
 *
 * RK 4 method
 * lab 4
 *
 */
#include <stdio.h>
#include <math.h>
#define f(x,y) ( (x*x+y*y))
int main()
{
    // declaration of variable
    float x0, y0, s, h, xn;
    // taking input
    printf("Enter the initial value of x0");
    scanf("%f",&x0);
    printf("Enter the initial value of y0");
    scanf("%f",&y0);
    printf("step size h");
    scanf("%f",&h);
    printf("Final point xn");
    scanf("%f",&xn);
    // input checking
    if (h == 0.00 )
    {
        printf("step size cannot be zero");
        return -1;
    }
    // changing step size to negative if final point is less than initial point
    h = (xn>x0)?h:-h;
    // calculating the no of iteration step required
    s = (xn-x0)/h;
    // initial value
    float x=x0, y=y0;
    // iteration step
    int i;
    for (i=0; i < s; i++)
    {
        printf("%f %f\n",x,y);
        float k,k1,k2,k3,k4;
        k1 = h*f(x,y);
        k2 = h*f(x+h/2,y+k1/2);
        k3 = h*f(x+h/2,y+k2/2);
        k4 = h*f(x+h,y+k3);
        k=(k1+2*k2+2*k3+k4)/6;
        y += k;
        x += h;
    }
    printf("The value of y(%f) is %f",x,y);
    return 0;
}
