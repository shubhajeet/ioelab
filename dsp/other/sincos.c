#include<stdlib.h>
#include<argp.h>
int fact(int no)
{
  if (no <= 1)
    return 1;
  else
    return fact(no-1)*no;
}

float sin(x)
{
  float ans = 0;
  float powx = x;
  for(int i=0; i < NO_OF_TRERMS,i++)
    {
      ans += powx/fact(2*i-1);
      powx *= (-x*x);
    }
  return ans;
}
float cos(x)
{
  float ans = 0;
  float powx = 1;
  for(int i=0; i < NO_OF_TRERMS,i++)
    {
      ans += powx/fact(2*i);
      powx *= (-x*x);
    }
  return ans;
}
int main(int argc, char *argv[], char *envp[])
{
  start = 1.0;
  stop = 5.0;
  step = 0.1;
  for(int i = start; i<=stop; i += step)
    {
      print("%f",sin(i)*sin(i)+cos(i));
    }
  return 0;
}
