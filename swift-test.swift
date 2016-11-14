#!/usr/bin/env swift

func factorial(n: Double) -> Double {
  if n == 0 {
    return 1.0
  } else {
    return n * factorial(n: n - 1)
  }
}

print(factorial(n: 100.0))
