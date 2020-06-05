/**
 *
 * Sujit Maharjan
 * IOE Pulchowk
 * 070bex443
 *
 * RK 4 method for 2nd order differential equation.
 * lab 5
 *
 */
#include <stdio.h>
#include <math.h>
#define f(x,y,z) (z)
#define f2(x,y,z) (x*x*x-y)
int main()
{
    // declaration of variable
    float x0, y0, z0, s, h, xn;
    // taking input
    printf("Enter the initial value of x0");
    scanf("%f",&x0);
    printf("Enter the initial value of y0");
    scanf("%f",&y0);
    printf("Enter the initial value of derivative of y at x0 z0");
    scanf("%f",&z0);
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
    float x=x0, y=y0, z=z0;
    // iteration step
    int i;
    for (i=0; i < s; i++)
    {
        printf("%f %f\n",x,y);
        float k,k1,k2,k3,k4,l,l1,l2,l3,l4;
        k1 = h*f(x,y,z);
        l1 = h*f2(x,y,z);
        k2 = h*f(x+h/2,y+k1/2,z+l1/2);
        l2 = h*f2(x+h/2,y+k1/2,z+l1/2);
        k3 = h*f(x+h/2,y+k2/2,z+l2/2);
        l3 = h*f2(x+h/2,y+k2/2,z+l2/2);
        k4 = h*f(x+h,y+k3,z+l3/2);
        l4 = h*f2(x+h,y+k3,z+l3/2);
        k=(k1+2*k2+2*k3+k4)/6;
        l=(l1+2*l2+2*l3+l4)/6;
        y += k;
        x += h;
        z += l;
    }
    printf("The value of y(%f) is %f",x,y);
    return 0;
}
