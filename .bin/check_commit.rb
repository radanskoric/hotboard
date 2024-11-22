#!/usr/bin/env ruby

require_relative "run"

puts "Checking: #{run("git show -s --format=%s HEAD")}"

if File.exist?("bin/rails")
  print "Testing ... "
  if run("bin/rails test && bin/rails test:system")
    puts "ok"
  else
    exit false
  end
end
