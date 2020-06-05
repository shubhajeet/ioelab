/*
 * Program to find nth fibonacis number
 */
#include <stdio.h>

int main()
{
  // variable declaration
  int no;
  int a = 1, b = 1, c;
  // input
  printf("Enter value of n");
  scanf("%d",&no);
  
  // process
  for (int i= no; i >  1; i--)
    {
      c = a + b;
      a = b;
      b = c;
    }
  // output
  printf("The factorial is %d",a);
  return 0;
}
