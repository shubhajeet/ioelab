/*
 * Program to find factorial of a number
 */
#include <stdio.h>

int main()
{
  // variable declaration
  int no;
  int fact = 1;
  // input
  printf("Enter no to find factorial");
  scanf("%d",&no);
  
  // process
  for (int i= no; i >  1; i--)
    {
      fact *= i;
    }
  // output
  printf("The factorial is %d",fact);
  return 0;
}
