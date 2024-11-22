#!/usr/bin/env ruby
require_relative "run"

current_branch = `git rev-parse --abbrev-ref HEAD`.strip
commits = `git log --format="%h|%s"`.split("\n")

commits.reverse.each do |commit_line|
  sha, title = commit_line.split('|')
  run("git checkout #{sha} --quiet")
  puts "Preparing #{sha}: #{title}"

  if match = title.match(/\[([a-z0-9\-]+)\]/)
    run("git tag -f #{match[1]}")
  end
end

# Return to original branch when done
run("git checkout #{current_branch} --quiet")
puts "Back to #{current_branch}"
