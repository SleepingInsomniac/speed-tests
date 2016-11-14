#!/usr/bin/env ruby

Dir.chdir(File.expand_path(File.dirname(__FILE__)))

compile = {
  crystal: 'crystal build crystal-test.cr --release',
  c:       'llvm-gcc c-test.c -o c-test',
  swift:   'swiftc swift-test.swift -o swift-test -assert-config Release',
  rust:    'rustc rust-test.rs -o rust-test',
  go:      'go build go-test.go'
}

versions = {
  crystal: 'crystal --version',
  c: 'llvm-gcc --version',
  swift: 'swiftc --version',
  rust: 'rustc --version',
  go: 'go version',
  js: 'node --version',
  php: 'php --version',
  lua: 'lua -v',
  ruby: 'ruby --version'
}

tests = Dir["*-test.*"]
times = Hash.new

tests.each do |entry|
  language_base = entry.split('-').shift.to_sym

  if compile.include?(language_base)
    system(compile[language_base])
    entry = "#{language_base}-test"
  end
  
  if versions.include?(language_base)
    puts "---- #{language_base}"
    system(versions[language_base])
  end
  
  system("chmod +x #{entry}")
  
  start = Time.now
  `./#{entry}`
  duration = Time.now - start
  $?.success? ? times[entry.to_sym] = duration : times[entry.to_sym] = 'Failed'
end
puts # new line

times = times.sort_by { |key,val| val }.to_h

times.each do |lang, time|
  puts "#{lang.to_s.ljust(20)}: %.3fms" % (time * 1000)
end
