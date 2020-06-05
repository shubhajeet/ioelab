/**
 *
 * Sujit Maharjan
 * IOE Pulchowk
 * 070bex443
 *
 * Numerical Method
 * lab 3
 * Newton Method
 */
#include <stdio.h>
#include <math.h>
#define STEP 1000
#define SUCCESS 0
#define epsilon 0.000001

float f(float x)
{
    return x*sin(x)+cos(x);
    // return x*x+x+41;
        //return x - 3 * cos(x);
    // return x*x-2*x+1;
}
float f1(float x) {
    return (f(x+epsilon)-f(x))/epsilon ;
}
int main()
{
    // data declaration
    float err;
    float x;
    // input
    printf("Enter initial point");
    scanf("%f",&x);
    printf("Enter error tolerance");
    scanf("%f",&err);
    // input checking
    if (err == 0.0)
    {
        printf("Error tolerance must be greater than 0");
        return -2;
    }
    // newton Method
    int itr=0;
    while( fabsf(f(x)) > err)
    {
        printf("%f f(x) %f and derivate is %f\n",x,f(x),f1(x));
        if( f1(x)== 0.0)
        {
            printf("root of required precision could not be found\n");
            break;
        }
        x -= f(x)/f1(x);
        itr++;
        if (itr==STEP)
        {
            printf("Could not find answer in %i iteration",STEP);
            break;
        }
    }
    printf("The required root of the equation is %f at which f(x) is %f",x,f(x));
    return SUCCESS;
}
