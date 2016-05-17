#!/usr/bin/env ruby

Dir.chdir(File.expand_path(File.dirname(__FILE__)))

compile = {
  crystal: 'crystal build crystal-test.cr',
  c: 'llvm-gcc c-test.c -o c-test'
}

tests = Dir["*-test.*"]

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
  puts "#{entry.ljust(20)}: %.3fs" % duration
end
