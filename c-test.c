#include <stdio.h>

double factorial(double n) {
  if (n == 1.0) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

int main(void) {
  printf("%f\n", factorial(100));
  return 0;
}
