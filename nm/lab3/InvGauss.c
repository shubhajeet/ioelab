/*****
 * Sujit Maharjan
 * IOE Pulchowk
 * 070BEX 443
 *
 * Numerical Method
 * lab 2
 *
 * Solution of system of linear algebraic equation
 * 3. Inverse of Matrix via Gauss Jordan Method
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
    printf("Enter the order of matrix");
    scanf("%i",&n);
    // declaration of matrix
    float a[n][2*n];
    // input of matrix
    int x;
    for (x = 0; x < n; x++)
    {
        int y;
        for (y = 0; y < n; y++)
        {
              scanf("%f",&a[x][y]);

        }
        // initialization of identity matrix
        for (y = 0; y < n; y++) {
            if ( x==y)
                a[x][n+y]=1;
            else
                a[x][n+y]=0;
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
                for (k=j; k < 2*n; k++)
                {
                    a[i][k] -= (factor * a[j][k]);
                }
            }
        }
    }
    // dividing by pivot element
    int i;
    for (i = 0; i < n; i++) {
        // dividing by pivot element
        int k;
        for (k = 0; k < n; k++) {
            a[i][n+k] /= a[i][i];
        }
        // self-dividing pivot element
        a[i][i] = 1;
    }

    // displaying of matrix
    for (x=0; x< n; x++)
    {
        int y;
        for (y = 0; y < n; y++) {
            printf("%f \t",a[x][n+y]);
        }
        printf("\n");
    }
    return SUCESS;
}
