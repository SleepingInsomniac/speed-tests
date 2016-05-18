#!/usr/bin/env crystal

def factorial(n : Float64)
  if n == 0
    1
  else
    n * factorial(n-1)
  end
end

puts factorial(100_f64)
