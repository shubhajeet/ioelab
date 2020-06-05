/**
 *
 * Sujit Maharjan
 * IOE Pulchowk
 * 070bex443
 *
 * Numerical Method
 * lab 3
 * Secant Method
 */
#include <stdio.h>
#include <math.h>
#define SUCCESS 0

float f(float x)
{
    return (x*sin(x)+cos(x));
}

int main()
{

    // data declaration
    float err;
    float x, xp;
    // input
    printf("Enter two initial point");
    scanf("%f %f",&xp, &x);
    printf("Enter error tolerance");
    scanf("%f",&err);
    // input checking
    if(err==0.0)
    {
        printf("error tolerance should not be zero");
        return -2;
    }
    // secant Method
    while( fabsf(f(x)) > err)
    {
        float tmp = x;
        printf("present element %f previous element %f\n",x,xp);
        if(f(xp) == f(x))
        {
            printf("root could not be found");
            break;
        }
        x = (xp * f(x)- x * f(xp))/(f(x)-f(xp));
        xp = tmp;
    }
    printf("The required root of the equation is %f at which f(x) is %f",x,f(x));
    return SUCCESS;
}
