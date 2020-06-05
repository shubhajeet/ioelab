/*****
 * Sujit Maharjan
 * IOE Pulchowk
 * 070BEX 443
 *
 * Numerical Method
 * lab 2
 *
 * Solution of system of linear algebraic equation
 * 1. Gauss Jordan Method
 *
 */
#include <stdio.h>
#include <math.h>
#define SUCESS 0

int main()
{
    // declaration of variable
    int n;
    // taking input
    printf("Enter the no of variable in the linear equation");
    scanf("%i",&n);
    // declaration of matrix
    float a[n][n+1];
    // input of matrix
    int x;
    for (x = 0; x < n; x++)
    {
        printf("Enter coefficient of augmented matrix of equation %i\n",x);
        int y;
        for (y = 0; y < (n+1); y++)
        {
              scanf("%f",&a[x][y]);
              if (x==y & a[x][y]==0)
              {
                  printf("pivot element cant be 0\n");
                  return -2;
              }
        }
    }
    // Gauss Jordan logic

    // elimination of non-pivot element
    // loop for each column;
    int j;
    for (j=0; j<n; j++) // a[j][j] pivot element
    {
        // loop for each row
        int i;
        for (i= 0; i < n; i++) // a[i][j] non pivot element if i is not j
        {
            // check if it is pivot element
            if (!(i==j))
            {
                // perform Row operation
                if (a[j][j] == 0)
                {
                    printf("Pivot element found to be 0");
                    return -3;
                }
                int k;
                float factor = a[i][j]/a[j][j];
                for (k=j; k < (n+1); k++)
                {

                    a[i][k] -= (factor * a[j][k]);
                }
            }
        }
    }
    // calculation of value of x
    float val[n];
    int i;
    for (i=0; i< n; i++)
    {
        val[i] = a[i][n]/a[i][i];
        printf("The value of x%i is %f\n",i,val[i]);
    }
    return SUCESS;
}
