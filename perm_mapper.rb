#!/usr/bin/ruby
# Script to re-map permissions of directories and files based on current permissions.

def currentPermissions(file)
	file.stat.mode.to_s(8).chars.last(3)
end

filename=ARGV[0]
file=File.open(filename)
puts currentPermissions(file)
