/**
 *
 * Sujit Maharjan
 * IOE Pulchowk
 * 070bex443
 *
 * Numerical Method
 * lab 4
 * Falsi Method
 */
#include <stdio.h>
#include <math.h>
#define STEP 1000
#define SUCCESS 0

float f(float x)
{
    return x*x*x/-3*x+11;
}
int main()
{
    // data declaration
    float err;
    float x;
    float a, b;
    // input
    printf("Enter two initial point");
    scanf("%f %f",&a, &b);
    printf("Enter error tolerance");
    scanf("%f",&err);
    // input checking
    float f_a = f(a);
    float f_b = f(b);
    float f_x = f(x);
    if (f_a*f_b > 0)
    {
        printf("range does not satisfy does not lie in positive to negative range");
        return -1;
    }
    else if(f_a == 0)
    {
        // exact root
        printf("the root of the equation is %f",a);
        return SUCCESS;
    }
    else if(f_b == 0)
    {
        // exact root
        printf("the root of the equation is %f",b);
        return SUCCESS;
    }

    // falsi Method
    do
    {
        printf("%f %f at which %f %f \n",a,b,f_a,f_b);
        if (f_a == f_b)
        {
            printf("The solution does not exist");
            return -2;
        }
        x = (a*f_b-b*f_a)/(f_b-f_a);
        f_x = f(x);
        printf("x is %f at f(x) %f",x,f_x);
        if (f_x * f_a < 0)
        {
            b = x;
            f_b = f_x;
        }
        else if(f_x * f_b < 0)
        {
            a = x;
            f_a = f_x;
        }

    }
    while( fabsf(f_x) > err);
    printf("The required root of the equation is %f at which f(x) is %f",x,f_x);
    return SUCCESS;
}
