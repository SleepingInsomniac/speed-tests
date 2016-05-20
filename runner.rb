#!/usr/bin/env ruby

Dir.chdir(File.expand_path(File.dirname(__FILE__)))

compile = {
  crystal: 'crystal build crystal-test.cr --release',
  c: 'llvm-gcc c-test.c -o c-test',
  swift: 'swiftc swift-test.swift -o swift-test -assert-config Release'
}

tests = Dir["*-test.*"]
times = Hash.new

tests.each do |entry|
  language_base = entry.split('-').shift.to_sym

  if compile.include?(language_base)
    system(compile[language_base])
    entry = "#{language_base}-test"
  end
  
  system("chmod +x #{entry}")
  
  start = Time.now
  `./#{entry}`
  duration = Time.now - start
  times[entry.to_sym] = duration
  print "."
end
puts # new line

times = times.sort_by { |key,val| val }.to_h

times.each do |lang, time|
  puts "#{lang.to_s.ljust(20)}: %.3fms" % (time * 1000)
end
