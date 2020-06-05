/*
 * Program to find gcd of two numbers
 */
#include <stdio.h>

int main()
{
  // variable declaration
  int a, b;
  int gcd;
  // input
  printf("Enter two no to find gcd");
  scanf("%d %d",&a, &b);
  
  // process
  while(b % a != 0)
    {
      if (b > a)
        {
          b = b % a;
        }
      else
        {
          int c = a;
          a = b;
          b = c;
        }
    }
  // output
  printf("The gcd is %d", a);
  return 0;
}
