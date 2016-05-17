#!/usr/bin/env crystal

# defines a factorial function
def factorial(n : Float64)
  if n == 0
    1
  else
  	n * factorial(n-1)
  end
end

puts factorial(100_f64)