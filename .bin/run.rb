require "open3"

def run(command)
  stdout, stderr, status = Open3.capture3(command)

  if status.success?
    stdout
  else
    puts "Error executing command: #{command}"
    puts "Output: #{stdout}"
    puts "Error: #{stderr}" if stderr
    puts "Exit Status: #{status.exitstatus}"
    nil
  end
end
