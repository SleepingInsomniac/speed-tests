#!/usr/bin/env ruby

def factorial(n)
  if n == 0
    1.0
  else
    n * factorial(n - 1)
  end
end

puts factorial(100.0)
