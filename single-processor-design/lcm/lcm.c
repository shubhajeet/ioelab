/*
 * Program to find lcm of two numbers
 */
#include <stdio.h>

int main()
{
  // variable declaration
  int a, b;
  int lcm;
  // input
  printf("Enter two nos to find lcm of");
  scanf("%d %d",&a, &b);
  lcm = a;
  // process
  while(lcm % b != 0)
    {
      lcm += a;
    }
  // output
  printf("The lcm of two number is %d",lcm);
  return 0;
}
