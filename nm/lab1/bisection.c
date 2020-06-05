/*****
 * Sujit Maharjan
 * IOE Pulchowk
 * 070BEX 443
 *
 * Numerical Method
 * lab 1
 * Bisection Method
 */

#include <stdio.h>
#include <math.h>
//#define f(x) ( (x-3)*(x+4)*(x-6) ) // polynomial
//#define f(x) ( x*x*x - 3*x + 11 ) // polynomial cubic
#define f(x) ( x*sinf(x) + cosf(x) ) // transcendental
int main()
{
    // data declaration
    float a, b, x;
    float err;
    // input operation
    printf("Enter closed interval (a,b) ");
    scanf("%f %f",&a,&b);
    printf("Enter error tolerance ");
    scanf("%f",&err);
    // data required for the calculation
    float f_a, f_b, f_x;
    f_a = f(a);
    f_b = f(b);
    // checking input satifies intermediate value theorem
    if ((f_a*f_b) >= 0)
    {
        printf("Given interval does not satifies intermediate value theorem");
        return -1;
    }
    else if (err == 0.0)
    {
        printf("Error tolerance must be greater than 0");
        return -2;
    }
    do
    {
        x = (a+b)/2.0;
        f_x = f(x);
        if ((f_a*f_x) < 0) // interval (a,x) satisfies intermediate value theorem
        {
            b = x;
            f_b = f_x;
        }
        else if((f_b*f_x) < 0)// interval (x,b) satisfies intermediate value theorem
        {
            a = x;
            f_a = f_x;
        }
        else
        {
            // f_x is 0 which is the best answer
            break;
        }
        // printf("%f %f",x,f_x);
    }
    while(fabsf(f_x) > err); // loop until we get answer of required precision
    printf("The required solution is %f at which its value is %f",x,f_x);
    return 0;
}
