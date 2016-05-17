#include <stdio.h>

double factorial(double n) {
  int c;
  double result = 1;
 
  for (c = 1; c <= n; c++)
    result = result * c;
 
  return result;
}

int main(void) {
  printf("%f\n", factorial(100));
  return 0;
}
